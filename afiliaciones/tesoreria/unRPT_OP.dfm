object unQrp_OP: TunQrp_OP
  Left = 0
  Top = 10
  Caption = 'unQrp_OP'
  ClientHeight = 878
  ClientWidth = 1444
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
    Left = 68
    Top = 16
    Width = 1224
    Height = 1584
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
    Zoom = 150
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbTitulo: TQRBand
      Left = 28
      Top = 28
      Width = 1167
      Height = 626
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1104.194444444444000000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape10: TQRShape
        Left = 1
        Top = 561
        Width = 1167
        Height = 10
        Size.Values = (
          17.638888888888890000
          1.763888888888889000
          989.541666666666700000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 1
        Top = 418
        Width = 1167
        Height = 10
        Size.Values = (
          17.638888888888890000
          1.763888888888889000
          737.305555555555600000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrdOP: TQRDBText
        Left = 338
        Top = 24
        Width = 420
        Height = 39
        Size.Values = (
          68.791666666666670000
          596.194444444444400000
          42.333333333333330000
          740.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'OP'
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
        Left = 12
        Top = 440
        Width = 83
        Height = 26
        Size.Values = (
          45.861111111111110000
          21.166666666666670000
          776.111111111111100000
          146.402777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Cheque'
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
        Left = 172
        Top = 440
        Width = 126
        Height = 26
        Size.Values = (
          45.861111111111110000
          303.388888888888900000
          776.111111111111100000
          222.250000000000000000)
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
        Left = 538
        Top = 440
        Width = 92
        Height = 26
        Size.Values = (
          45.861111111111110000
          948.972222222222200000
          776.111111111111100000
          162.277777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descripci'#243'n'
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
        Left = 1009
        Top = 440
        Width = 138
        Height = 26
        Size.Values = (
          45.861111111111110000
          1779.763888888889000000
          776.111111111111100000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Importe Aplicado'
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
      object qrdNroCheque: TQRDBText
        Left = 9
        Top = 492
        Width = 129
        Height = 27
        Size.Values = (
          47.625000000000000000
          15.875000000000000000
          867.833333333333300000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'CHEQUEREEMP'
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
        Left = 172
        Top = 492
        Width = 126
        Height = 27
        Size.Values = (
          47.625000000000000000
          303.388888888888900000
          867.833333333333300000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'FECHA_CHEQUE'
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
        Left = 487
        Top = 492
        Width = 482
        Height = 27
        Size.Values = (
          47.625000000000000000
          859.013888888888900000
          867.833333333333300000
          850.194444444444400000)
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
      object qrdImporteApli: TQRDBText
        Left = 2343
        Top = 459
        Width = 72
        Height = 26
        Size.Values = (
          45.861111111111110000
          4132.791666666667000000
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
      object qrlMedioPago: TQRLabel
        Left = 9
        Top = 580
        Width = 111
        Height = 26
        Size.Values = (
          45.861111111111110000
          15.875000000000000000
          1023.055555555556000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Medio de Pago'
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
      object qrlBanco: TQRLabel
        Left = 183
        Top = 580
        Width = 48
        Height = 26
        Size.Values = (
          45.861111111111110000
          322.791666666666700000
          1023.055555555556000000
          84.666666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Banco'
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
      object qrlCta: TQRLabel
        Left = 562
        Top = 580
        Width = 80
        Height = 26
        Size.Values = (
          45.861111111111110000
          991.305555555555600000
          1023.055555555556000000
          141.111111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Cuenta'
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
      object qrlFechaVto: TQRLabel
        Left = 860
        Top = 580
        Width = 122
        Height = 26
        Size.Values = (
          45.861111111111110000
          1516.944444444444000000
          1023.055555555556000000
          215.194444444444400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha Vto.'
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
      object qrlImportePago: TQRLabel
        Left = 1009
        Top = 579
        Width = 138
        Height = 26
        Size.Values = (
          45.861111111111110000
          1779.763888888889000000
          1021.291666666667000000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Importe Pago'
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
      object qrlOrdenPago: TQRLabel
        Left = 1
        Top = 24
        Width = 332
        Height = 39
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
      object QRDBText1: TQRDBText
        Left = 990
        Top = 492
        Width = 165
        Height = 27
        Size.Values = (
          47.625000000000000000
          1746.250000000000000000
          867.833333333333300000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'MONTOREEMP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Mask = '0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Left = 714
        Top = 580
        Width = 83
        Height = 26
        Size.Values = (
          45.861111111111110000
          1259.416666666667000000
          1023.055555555556000000
          146.402777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' Cheque'
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
      object qrlFechaEmision: TQRLabel
        Left = 618
        Top = 301
        Width = 180
        Height = 26
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          530.930555555555600000
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
        Left = 801
        Top = 301
        Width = 90
        Height = 26
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          530.930555555555600000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'FECHA_OP'
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
        Left = 158
        Top = 242
        Width = 129
        Height = 26
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          426.861111111111100000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqProveedor
        DataField = 'VENDOR_NAME'
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
        Left = 158
        Top = 272
        Width = 138
        Height = 26
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          479.777777777777800000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqProveedor
        DataField = 'ADDRESS_LINE1'
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
        Left = 158
        Top = 301
        Width = 138
        Height = 26
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          530.930555555555600000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqProveedor
        DataField = 'ADDRESS_LINE2'
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
        Left = 158
        Top = 329
        Width = 42
        Height = 26
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          580.319444444444400000
          74.083333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqProveedor
        DataField = 'CITY'
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
        Left = 158
        Top = 356
        Width = 56
        Height = 26
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          627.944444444444400000
          98.777777777777780000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqProveedor
        DataField = 'STATE'
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
        Left = 158
        Top = 387
        Width = 30
        Height = 26
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          682.625000000000000000
          52.916666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqProveedor
        DataField = 'ZIP'
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
        Left = 801
        Top = 214
        Width = 363
        Height = 26
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          377.472222222222200000
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
        Left = 312
        Top = 440
        Width = 163
        Height = 26
        Size.Values = (
          45.861111111111110000
          550.333333333333300000
          776.111111111111100000
          287.513888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Orden de Pago'
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
      object QRDBText7: TQRDBText
        Left = 312
        Top = 492
        Width = 163
        Height = 27
        Size.Values = (
          47.625000000000000000
          550.333333333333300000
          867.833333333333300000
          287.513888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'OPAGO'
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
      object QRLabel4: TQRLabel
        Left = 0
        Top = 214
        Width = 132
        Height = 26
        Size.Values = (
          45.861111111111110000
          0.000000000000000000
          377.472222222222200000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Buenos Aires,'
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
        Left = 21
        Top = 242
        Width = 132
        Height = 26
        Size.Values = (
          45.861111111111110000
          37.041666666666670000
          426.861111111111100000
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
        Left = 21
        Top = 272
        Width = 132
        Height = 26
        Size.Values = (
          45.861111111111110000
          37.041666666666670000
          479.777777777777800000
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
        Left = 21
        Top = 387
        Width = 132
        Height = 26
        Size.Values = (
          45.861111111111110000
          37.041666666666670000
          682.625000000000000000
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
        Left = 618
        Top = 242
        Width = 180
        Height = 26
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          426.861111111111100000
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
        Left = 801
        Top = 272
        Width = 363
        Height = 26
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          479.777777777777800000
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
        Left = 618
        Top = 329
        Width = 180
        Height = 26
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          580.319444444444400000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Moneda:'
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
        Top = 69
        Width = 138
        Height = 28
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
        Left = 143
        Top = 69
        Width = 617
        Height = 82
        Size.Values = (
          144.638888888888900000
          252.236111111111100000
          121.708333333333300000
          1088.319444444444000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
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
        Left = 801
        Top = 242
        Width = 363
        Height = 26
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          426.861111111111100000
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
        Left = 618
        Top = 214
        Width = 180
        Height = 26
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          377.472222222222200000
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
        Left = 618
        Top = 272
        Width = 180
        Height = 26
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          479.777777777777800000
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
      object QRLabel19: TQRLabel
        Left = 801
        Top = 329
        Width = 363
        Height = 26
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          580.319444444444400000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PES'
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
      object QRShape13: TQRShape
        Left = 1
        Top = 474
        Width = 1167
        Height = 10
        Size.Values = (
          17.638888888888890000
          1.763888888888889000
          836.083333333333300000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 1
        Top = 615
        Width = 1167
        Height = 10
        Size.Values = (
          17.638888888888890000
          1.763888888888889000
          1084.791666666667000000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qriLogo: TQRImage
        Left = 919
        Top = 6
        Width = 244
        Height = 96
        Size.Values = (
          169.333333333333300000
          1621.895833333333000000
          10.583333333333330000
          431.270833333333300000)
        XLColumn = 0
        Stretch = True
      end
      object qrlCodBarrasST: TQRLabel
        Left = 963
        Top = 108
        Width = 200
        Height = 31
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
        Left = 963
        Top = 139
        Width = 200
        Height = 23
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
        Left = 963
        Top = 162
        Width = 200
        Height = 23
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
        Left = 963
        Top = 185
        Width = 200
        Height = 23
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
      Left = 28
      Top = 654
      Width = 1167
      Height = 42
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qrdMedioPago: TQRDBText
        Left = 9
        Top = 12
        Width = 168
        Height = 26
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          21.166666666666670000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'DESCRIPTION'
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
      object qrdBanco: TQRDBText
        Left = 184
        Top = 12
        Width = 374
        Height = 26
        Size.Values = (
          44.979166666666670000
          325.437500000000000000
          21.166666666666670000
          658.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'BANK_NAME'
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
      object qrdNroCuenta: TQRDBText
        Left = 562
        Top = 12
        Width = 144
        Height = 26
        Size.Values = (
          44.979166666666670000
          992.187500000000000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'BANK_ACCOUNT_NUM'
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
      object qrdFechaVto: TQRDBText
        Left = 860
        Top = 12
        Width = 122
        Height = 26
        Size.Values = (
          44.979166666666670000
          1516.062500000000000000
          21.166666666666670000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'FECHA_OP'
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
      object qrdMontoPago: TQRDBText
        Left = 990
        Top = 12
        Width = 165
        Height = 26
        Size.Values = (
          44.979166666666670000
          1746.250000000000000000
          21.166666666666670000
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
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 714
        Top = 12
        Width = 135
        Height = 26
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'CHEQUE'
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
    object QRBSubTotal: TQRBand
      Left = 28
      Top = 696
      Width = 1167
      Height = 62
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        109.361111111111100000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel1: TQRLabel
        Left = 782
        Top = 32
        Width = 116
        Height = 26
        Size.Values = (
          44.979166666666670000
          1378.479166666667000000
          55.562500000000000000
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
        Left = 912
        Top = 32
        Width = 243
        Height = 26
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          55.562500000000000000
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
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(sdqOrdenPago.MONTO)'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    object QRBand1: TQRBand
      Left = 28
      Top = 758
      Width = 1167
      Height = 658
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1160.638888888889000000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrlConfecciono: TQRLabel
        Left = 3
        Top = 90
        Width = 321
        Height = 26
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          158.750000000000000000
          566.208333333333300000)
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
      object qrlRecibio: TQRLabel
        Left = 343
        Top = 134
        Width = 210
        Height = 26
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
        Left = 616
        Top = 135
        Width = 210
        Height = 26
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
        Left = 883
        Top = 135
        Width = 210
        Height = 26
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
        Left = 57
        Top = 117
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          100.541666666666700000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 343
        Top = 117
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          605.895833333333300000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 616
        Top = 117
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          1087.437500000000000000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 883
        Top = 117
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          1558.395833333333000000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 465
        Top = 357
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          820.208333333333300000
          629.708333333333300000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlRecibido: TQRLabel
        Left = 465
        Top = 375
        Width = 210
        Height = 26
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
        Left = 883
        Top = 381
        Width = 210
        Height = 26
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
        Left = 883
        Top = 363
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          1558.395833333333000000
          640.291666666666700000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 57
        Top = 357
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          100.541666666666700000
          629.708333333333300000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 57
        Top = 375
        Width = 210
        Height = 26
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
        Left = 465
        Top = 525
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          820.208333333333300000
          926.041666666666700000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 465
        Top = 543
        Width = 210
        Height = 26
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
        Left = 883
        Top = 549
        Width = 210
        Height = 26
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
        Left = 883
        Top = 531
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          1558.395833333333000000
          936.625000000000000000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 57
        Top = 525
        Width = 210
        Height = 10
        Size.Values = (
          18.520833333333330000
          100.541666666666700000
          926.041666666666700000
          370.416666666666700000)
        XLColumn = 0
        Pen.Width = 7
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 57
        Top = 543
        Width = 210
        Height = 26
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
        Left = 57
        Top = 134
        Width = 210
        Height = 26
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
        Left = 6
        Top = 598
        Width = 1160
        Height = 35
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
        Left = 22
        Top = 199
        Width = 1133
        Height = 68
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
        Left = 6
        Top = 634
        Width = 1160
        Height = 21
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
    end
  end
  object sdqOrdenPago: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT CH.CE_ID CHECK_ID, CH.CE_ORDENPAGO OP, CH.CE_FECHAOP FECH' +
        'A_OP,'
      
        '       CH.CE_BENEFICIARIO BENEFICIARIO, RE.CE_NUMERO CHEQUEREEMP' +
        ', RE.CE_FECHACHEQUE FECHA_CHEQUE,'
      
        '       '#39'IMPUTACION'#39', '#39'REEMPLAZO DE CHEQUE'#39' DESCRIPCION, RE.CE_MO' +
        'NTO MONTOREEMP,'
      
        '       CH.CE_METODOPAGO DESCRIPTION, BA.BA_NOMBRE BANK_NAME, CTA' +
        '.CB_NUMERO BANK_ACCOUNT_NUM,'
      
        '       CH.CE_NUMERO CHEQUE, CH.CE_MONTO MONTO, RE.CE_ORDENPAGO O' +
        'PAGO'
      
        '  FROM RCE_CHEQUEEMITIDO CH, RCE_CHEQUEEMITIDO RE, ZCB_CUENTABAN' +
        'CARIA CTA, ZBA_BANCO BA'
      ' WHERE CH.CE_IDCHEQUEREEMP = RE.CE_ID'
      '   AND CH.CE_IDCUENTABANCARIA = CTA.CB_ID'
      '   AND CTA.CB_IDBANCO=BA.BA_ID'
      '   AND CH.CE_ORDENPAGO = :nOP'
      ''
      ''
      '')
    Left = 11
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'nOP'
        ParamType = ptInput
        Value = '100080'
      end>
  end
  object sdqProveedor: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      
        'SELECT PV.VENDOR_NAME, PVS.ADDRESS_LINE1, ADDRESS_LINE2, CITY, S' +
        'TATE, ZIP'
      '  FROM PO_VENDORS PV, PO_VENDOR_SITES_ALL PVS'
      ' WHERE PVS.VENDOR_ID = PV.VENDOR_ID'
      '   AND PVS.VENDOR_SITE_ID = :nVendorSite')
    Left = 39
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nVendorSite'
        ParamType = ptInput
      end>
  end
end
