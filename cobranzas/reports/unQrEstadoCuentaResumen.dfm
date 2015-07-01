object frmEstadoCuentaResumen: TfrmEstadoCuentaResumen
  Left = 0
  Top = 0
  Caption = 'frmEstadoCuentaResumen'
  ClientHeight = 756
  ClientWidth = 1282
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrEstadoCuentaResumen: TQuickRep
    Left = 0
    Top = 0
    Width = 1056
    Height = 816
    IDReport = 0
    BeforePrint = qrEstadoCuentaResumenBeforePrint
    DataSet = qAux
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
    Page.Orientation = poLandscape
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      2794.000000000000000000
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
    ReportTitle = 'Estado de Cuenta - Resumen'
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 38
      Top = 305
      Width = 980
      Height = 13
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        34.395833333333330000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText12: TQRDBText
        Left = 2
        Top = -1
        Width = 35
        Height = 14
        Size.Values = (
          37.041666666666670000
          5.291666666666667000
          -2.645833333333333000
          92.604166666666680000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clNone
        DataSet = qAux
        DataField = 'PERIODO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qPeriodoPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText13: TQRDBText
        Left = 88
        Top = -2
        Width = 80
        Height = 13
        Size.Values = (
          34.395833333333340000
          232.833333333333400000
          -5.291666666666667000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'FIJA_VARIABLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText14: TQRDBText
        Left = 200
        Top = -1
        Width = 42
        Height = 14
        Size.Values = (
          37.041666666666700000
          529.166666666667000000
          -2.645833333333330000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'EMPLEADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText15: TQRDBText
        Left = 244
        Top = -1
        Width = 60
        Height = 14
        Size.Values = (
          37.041666666666700000
          645.583333333333000000
          -2.645833333333330000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'MASA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = FormatMonto
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText16: TQRDBText
        Left = 500
        Top = -1
        Width = 65
        Height = 14
        Size.Values = (
          37.041666666666700000
          1322.916666666670000000
          -2.645833333333330000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'PAGOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRDBText16Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText17: TQRDBText
        Left = 372
        Top = -1
        Width = 64
        Height = 14
        Size.Values = (
          37.041666666666700000
          984.250000000000000000
          -2.645833333333330000
          169.333333333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'FONDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRDBText17Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText18: TQRDBText
        Left = 567
        Top = -1
        Width = 79
        Height = 14
        Size.Values = (
          37.041666666666700000
          1500.187500000000000000
          -2.645833333333330000
          209.020833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'DEUDA_TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrdbDeudaPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText19: TQRDBText
        Left = 769
        Top = -1
        Width = 67
        Height = 14
        Size.Values = (
          37.041666666666700000
          2034.645833333330000000
          -2.645833333333330000
          177.270833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'INTERES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrdbInteresPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText20: TQRDBText
        Left = 647
        Top = -1
        Width = 59
        Height = 14
        Size.Values = (
          37.041666666666700000
          1711.854166666670000000
          -2.645833333333330000
          156.104166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'MONTOREFINANCIADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrMontoRefinancPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText21: TQRDBText
        Left = 838
        Top = -1
        Width = 67
        Height = 14
        Size.Values = (
          37.041666666666700000
          2217.208333333330000000
          -2.645833333333330000
          177.270833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'DEUDA_CONSOLIDADA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrdbDeudaConsolidadaPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText1: TQRDBText
        Left = 39
        Top = -1
        Width = 48
        Height = 14
        Size.Values = (
          37.041666666666670000
          103.187500000000000000
          -2.645833333333333000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'VENCIMIENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText2: TQRDBText
        Left = 306
        Top = -1
        Width = 64
        Height = 14
        Size.Values = (
          37.041666666666700000
          809.625000000000000000
          -2.645833333333330000
          169.333333333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'CUOTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRDBText2Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText3: TQRDBText
        Left = 169
        Top = -1
        Width = 29
        Height = 14
        Size.Values = (
          37.041666666666700000
          447.145833333333000000
          -2.645833333333330000
          76.729166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'DDJJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 907
        Top = -1
        Width = 21
        Height = 14
        Size.Values = (
          37.041666666666700000
          2399.770833333330000000
          -2.645833333333330000
          55.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'REF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdbReg: TQRDBText
        Left = 935
        Top = -1
        Width = 40
        Height = 14
        Size.Values = (
          37.041666666666670000
          2473.854166666667000000
          -2.645833333333333000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'CODREG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText5: TQRDBText
        Left = 708
        Top = -1
        Width = 59
        Height = 14
        Size.Values = (
          37.041666666666700000
          1873.250000000000000000
          -2.645833333333330000
          156.104166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'IMPORTERECLAMOAFIP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrImporteReclamoAFIPPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText7: TQRDBText
        Left = 438
        Top = -1
        Width = 60
        Height = 14
        Size.Values = (
          37.041666666666700000
          1158.875000000000000000
          -2.645833333333330000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qAux
        DataField = 'INTERES_OTROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRDBText7Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 38
      Width = 980
      Height = 267
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        706.437500000000000000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape14: TQRShape
        Left = 0
        Top = 69
        Width = 980
        Height = 139
        Size.Values = (
          366.636904761904800000
          0.000000000000000000
          181.428571428571400000
          2592.916666666667000000)
        XLColumn = 0
        Pen.Width = 4
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 497
        Top = 176
        Width = 481
        Height = 30
        Frame.Color = clGray
        Size.Values = (
          79.375000000000000000
          1315.861111111111000000
          465.666666666666700000
          1273.527777777778000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel38: TQRLabel
        Left = 499
        Top = 177
        Width = 479
        Height = 14
        Size.Values = (
          37.041666666666670000
          1319.388888888889000000
          469.194444444444400000
          1266.472222222222000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 
          'R=Refinanciado / Q=Conc. o Quiebra / A=Reclamado AFIP / Z=Cheque' +
          ' Rechazado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRShape31: TQRShape
        Left = 1
        Top = 176
        Width = 491
        Height = 16
        Frame.Color = clGray
        Size.Values = (
          41.577380952380950000
          3.779761904761905000
          464.910714285714300000
          1300.238095238095000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 1
        Top = 190
        Width = 491
        Height = 16
        Frame.Color = clGray
        Size.Values = (
          41.577380952380950000
          3.779761904761905000
          502.708333333333400000
          1300.238095238095000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 633
        Top = 70
        Width = 346
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          1674.434523809524000000
          185.208333333333300000
          914.702380952381100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 633
        Top = 83
        Width = 346
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          1674.434523809524000000
          219.226190476190500000
          914.702380952381100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 497
        Top = 160
        Width = 481
        Height = 16
        Frame.Color = clGray
        Size.Values = (
          42.333333333333330000
          1315.861111111111000000
          423.333333333333300000
          1273.527777777778000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 871
        Top = 123
        Width = 109
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          2305.654761904762000000
          325.059523809523800000
          287.261904761904800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 751
        Top = 123
        Width = 120
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          1988.154761904762000000
          325.059523809523800000
          317.500000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 633
        Top = 123
        Width = 119
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          1674.434523809524000000
          325.059523809523800000
          313.720238095238100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 564
        Top = 123
        Width = 69
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          1493.005952380953000000
          325.059523809523800000
          181.428571428571400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 497
        Top = 123
        Width = 69
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          1315.357142857143000000
          325.059523809523800000
          181.428571428571400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 554
        Top = 83
        Width = 79
        Height = 26
        Frame.Color = clGray
        Size.Values = (
          68.035714285714290000
          1466.547619047619000000
          219.226190476190500000
          207.886904761904800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 497
        Top = 83
        Width = 59
        Height = 26
        Size.Values = (
          68.035714285714290000
          1315.357142857143000000
          219.226190476190500000
          154.970238095238100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 554
        Top = 70
        Width = 79
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          1466.547619047619000000
          185.208333333333300000
          207.886904761904800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 497
        Top = 70
        Width = 59
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          1315.357142857143000000
          185.208333333333300000
          154.970238095238100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 0
        Top = 240
        Width = 980
        Height = 26
        Size.Values = (
          68.035714285714290000
          0.000000000000000000
          635.000000000000000000
          2592.916666666667000000)
        XLColumn = 0
        Brush.Color = clSilver
        Pen.Width = 4
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrMotivoBaja: TQRLabel
        Left = 504
        Top = 161
        Width = 469
        Height = 14
        Size.Values = (
          37.041666666666670000
          1333.500000000000000000
          426.861111111111100000
          1240.013888888889000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrMotivoBaja'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRShape29: TQRShape
        Left = 1
        Top = 147
        Width = 491
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          3.779761904761905000
          389.315476190476300000
          1300.238095238095000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 1
        Top = 160
        Width = 491
        Height = 16
        Frame.Color = clGray
        Size.Values = (
          42.333333333333330000
          3.527777777777778000
          423.333333333333300000
          1299.986111111111000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 1
        Top = 70
        Width = 491
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          3.779761904761905000
          185.208333333333300000
          1300.238095238095000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 1
        Top = 83
        Width = 491
        Height = 66
        Frame.Color = clGray
        Size.Values = (
          173.869047619047600000
          3.779761904761905000
          219.226190476190500000
          1300.238095238095000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 9
        Top = 70
        Width = 85
        Height = 12
        Size.Values = (
          31.750000000000000000
          23.812500000000000000
          185.208333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'Datos del Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrTipoReporte: TQRLabel
        Left = 2
        Top = 38
        Width = 287
        Height = 23
        Size.Values = (
          60.854166666666670000
          5.291666666666667000
          100.541666666666700000
          759.354166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Estado de Cuenta - Resumen'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRShape12: TQRShape
        Left = 1
        Top = 130
        Width = 489
        Height = 1
        Size.Values = (
          3.779761904761905000
          3.779761904761905000
          343.958333333333400000
          1292.678571428571000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 640
        Top = 70
        Width = 336
        Height = 12
        Size.Values = (
          31.750000000000000000
          1693.333333333333000000
          185.208333333333300000
          889.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Entidad / Vendedor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Left = 507
        Top = 70
        Width = 45
        Height = 12
        Size.Values = (
          31.750000000000000000
          1341.437500000000000000
          185.208333333333300000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'Contrato'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 569
        Top = 70
        Width = 43
        Height = 12
        Size.Values = (
          31.750000000000000000
          1505.479166666667000000
          185.208333333333300000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'N'#186' CUIT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel29: TQRLabel
        Left = 3
        Top = 147
        Width = 324
        Height = 12
        Size.Values = (
          31.750000000000000000
          7.937500000000000000
          388.937500000000000000
          857.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Estado de la Empresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrNombre: TQRLabel
        Left = 2
        Top = 86
        Width = 48
        Height = 18
        Size.Values = (
          47.625000000000000000
          5.291666666666667000
          227.541666666666700000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrNombre'
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
      object qrDomicilio: TQRLabel
        Left = 3
        Top = 101
        Width = 487
        Height = 14
        Size.Values = (
          37.797619047619050000
          7.559523809523811000
          268.363095238095300000
          1288.898809523810000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrDomicilio'
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
      object qrContrato: TQRLabel
        Left = 501
        Top = 87
        Width = 51
        Height = 17
        Size.Values = (
          45.357142857142850000
          1326.696428571429000000
          230.565476190476200000
          136.071428571428600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrContrato'
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
      object qrCuit: TQRLabel
        Left = 554
        Top = 87
        Width = 77
        Height = 17
        Size.Values = (
          45.357142857142850000
          1466.547619047619000000
          230.565476190476200000
          204.107142857142800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrCuit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = CUITPrint
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrActividad: TQRLabel
        Left = 3
        Top = 131
        Width = 487
        Height = 14
        Size.Values = (
          37.797619047619050000
          7.559523809523811000
          347.738095238095200000
          1288.898809523810000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrActividad'
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
      object qrEstado: TQRLabel
        Left = 3
        Top = 161
        Width = 324
        Height = 14
        Size.Values = (
          37.797619047619050000
          7.559523809523811000
          427.113095238095300000
          858.005952380952400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrEstado'
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
      object qrVigenciaDesde: TQRLabel
        Left = 499
        Top = 127
        Width = 67
        Height = 17
        Size.Values = (
          45.357142857142850000
          1319.136904761905000000
          336.398809523809600000
          177.648809523809500000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrVigenciaDesde'
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
      object qrVigenciaHasta: TQRLabel
        Left = 566
        Top = 127
        Width = 66
        Height = 17
        Size.Values = (
          45.357142857142850000
          1496.785714285715000000
          336.398809523809600000
          173.869047619047600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrVigenciaHasta'
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
      object qrConcurso: TQRLabel
        Left = 636
        Top = 127
        Width = 114
        Height = 17
        Size.Values = (
          45.357142857142850000
          1681.994047619048000000
          336.398809523809600000
          302.380952380952400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrConcurso'
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
      object qrQuiebra: TQRLabel
        Left = 751
        Top = 127
        Width = 120
        Height = 17
        Size.Values = (
          45.357142857142850000
          1988.154761904762000000
          336.398809523809600000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrQuiebra'
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
      object qrSumaFija: TQRLabel
        Left = 871
        Top = 127
        Width = 101
        Height = 17
        Size.Values = (
          45.357142857142850000
          2305.654761904762000000
          336.398809523809600000
          268.363095238095300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrSumaFija'
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
      object QRLabel22: TQRLabel
        Left = 500
        Top = 241
        Width = 66
        Height = 14
        Size.Values = (
          37.797619047619050000
          1322.916666666667000000
          638.779761904762000000
          173.869047619047600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Pagos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel23: TQRLabel
        Left = 371
        Top = 241
        Width = 64
        Height = 14
        Size.Values = (
          37.797619047619050000
          982.738095238095400000
          638.779761904762000000
          170.089285714285700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fondo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel24: TQRLabel
        Left = 567
        Top = 241
        Width = 79
        Height = 14
        Size.Values = (
          37.797619047619050000
          1500.565476190476000000
          638.779761904762000000
          207.886904761904800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Saldo Nominal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel30: TQRLabel
        Left = 769
        Top = 241
        Width = 67
        Height = 14
        Size.Values = (
          37.797619047619050000
          2033.511904761905000000
          638.779761904762000000
          177.648809523809500000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Int. Mora'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Left = 647
        Top = 241
        Width = 59
        Height = 14
        Size.Values = (
          37.797619047619050000
          1712.232142857143000000
          638.779761904762000000
          154.970238095238100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Refinanc.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel31: TQRLabel
        Left = 839
        Top = 241
        Width = 67
        Height = 14
        Size.Values = (
          37.797619047619050000
          2218.720238095238000000
          638.779761904762000000
          177.648809523809500000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'S. Consolid.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel3: TQRLabel
        Left = 89
        Top = 241
        Width = 80
        Height = 14
        Size.Values = (
          37.797619047619050000
          234.345238095238100000
          638.779761904762000000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Tarifa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel1: TQRLabel
        Left = 200
        Top = 241
        Width = 41
        Height = 14
        Size.Values = (
          37.797619047619050000
          529.166666666666800000
          638.779761904762000000
          109.613095238095200000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Empl.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel2: TQRLabel
        Left = 244
        Top = 241
        Width = 60
        Height = 14
        Size.Values = (
          37.797619047619050000
          646.339285714285700000
          638.779761904762000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'M. Salarial'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 1
        Top = 241
        Width = 36
        Height = 14
        Size.Values = (
          37.797619047619050000
          3.779761904761905000
          638.779761904762000000
          94.494047619047620000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Per.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel5: TQRLabel
        Left = 769
        Top = 253
        Width = 8
        Height = 12
        Size.Values = (
          31.750000000000000000
          2034.645833333333000000
          669.395833333333300000
          21.166666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'al'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        OnPrint = QRLabel5Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object qrlEntidades: TQRLabel
        Left = 641
        Top = 84
        Width = 334
        Height = 14
        Size.Values = (
          37.797619047619050000
          1697.113095238095000000
          223.005952380952400000
          884.464285714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlEntidades'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlVendedores: TQRLabel
        Left = 641
        Top = 94
        Width = 334
        Height = 14
        Size.Values = (
          37.797619047619050000
          1697.113095238095000000
          249.464285714285700000
          884.464285714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'S + R CONSULTORES S.A.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRShape28: TQRShape
        Left = 497
        Top = 109
        Width = 136
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          1315.357142857143000000
          287.261904761904800000
          359.077380952381000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 633
        Top = 109
        Width = 119
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          1674.434523809524000000
          287.261904761904800000
          313.720238095238100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 511
        Top = 110
        Width = 111
        Height = 12
        Size.Values = (
          31.750000000000000000
          1352.020833333333000000
          291.041666666666700000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vigencia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 636
        Top = 110
        Width = 113
        Height = 12
        Size.Values = (
          31.750000000000000000
          1682.750000000000000000
          291.041666666666700000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Concurso'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape26: TQRShape
        Left = 751
        Top = 109
        Width = 120
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          1988.154761904762000000
          287.261904761904800000
          317.500000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 871
        Top = 109
        Width = 109
        Height = 14
        Frame.Color = clGray
        Size.Values = (
          37.797619047619050000
          2305.654761904762000000
          287.261904761904800000
          287.261904761904800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 754
        Top = 110
        Width = 114
        Height = 12
        Size.Values = (
          31.750000000000000000
          1994.958333333334000000
          291.041666666666700000
          301.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Quiebra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel20: TQRLabel
        Left = 876
        Top = 110
        Width = 99
        Height = 12
        Size.Values = (
          31.750000000000000000
          2317.750000000000000000
          291.041666666666700000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = ' S.Fija / Variable'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape19: TQRShape
        Left = 497
        Top = 147
        Width = 481
        Height = 13
        Frame.Color = clGray
        Size.Values = (
          34.017857142857150000
          1315.357142857143000000
          389.315476190476300000
          1273.779761904762000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Left = 503
        Top = 149
        Width = 471
        Height = 12
        Size.Values = (
          31.750000000000000000
          1330.854166666667000000
          394.229166666666700000
          1246.187500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '         Fecha y Motivo de Baja'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlRenglon1: TQRLabel
        Left = 5
        Top = 209
        Width = 968
        Height = 17
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          552.979166666666700000
          2561.166666666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlRenglon1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlGestorNombre: TQRLabel
        Left = 3
        Top = 191
        Width = 161
        Height = 14
        Size.Values = (
          37.797619047619050000
          7.559523809523811000
          506.488095238095200000
          427.113095238095300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlGestorNombre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel25: TQRLabel
        Left = 3
        Top = 177
        Width = 161
        Height = 12
        Size.Values = (
          31.750000000000000000
          7.937500000000000000
          468.312500000000100000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Gestor de Cuenta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel27: TQRLabel
        Left = 306
        Top = 241
        Width = 64
        Height = 14
        Size.Values = (
          37.797619047619050000
          808.869047619047700000
          638.779761904762000000
          170.089285714285700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cuota'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel32: TQRLabel
        Left = 169
        Top = 241
        Width = 29
        Height = 14
        Size.Values = (
          37.797619047619050000
          446.011904761904800000
          638.779761904762000000
          75.595238095238110000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'DDJJ'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel33: TQRLabel
        Left = 907
        Top = 241
        Width = 21
        Height = 14
        Size.Values = (
          37.797619047619050000
          2400.148809523810000000
          638.779761904762000000
          56.696428571428570000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Ref.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel14: TQRLabel
        Left = 40
        Top = 241
        Width = 47
        Height = 14
        Size.Values = (
          37.797619047619050000
          105.833333333333400000
          638.779761904762000000
          124.732142857142800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencim.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrTitReg: TQRLabel
        Left = 935
        Top = 241
        Width = 40
        Height = 14
        Size.Values = (
          37.041666666666670000
          2473.854166666667000000
          637.645833333333300000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'R'#233'g.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel39: TQRLabel
        Left = 166
        Top = 177
        Width = 161
        Height = 12
        Size.Values = (
          31.750000000000000000
          439.208333333333400000
          468.312500000000100000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Ejecutivo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel40: TQRLabel
        Left = 329
        Top = 177
        Width = 161
        Height = 12
        Size.Values = (
          31.750000000000000000
          871.361111111111100000
          469.194444444444400000
          426.861111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Estudio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlEjecutivoNombre: TQRLabel
        Left = 166
        Top = 191
        Width = 161
        Height = 14
        Size.Values = (
          37.797619047619050000
          438.452380952381000000
          506.488095238095200000
          427.113095238095300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlEjecutivoNombre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlEstudioNombre: TQRLabel
        Left = 329
        Top = 191
        Width = 161
        Height = 14
        Size.Values = (
          37.797619047619050000
          869.345238095238100000
          506.488095238095200000
          427.113095238095300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlEstudioNombre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrTelefono: TQRLabel
        Left = 3
        Top = 116
        Width = 487
        Height = 14
        Size.Values = (
          37.797619047619050000
          7.559523809523811000
          306.160714285714300000
          1288.898809523810000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrTelefono'
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
      object QRLabel35: TQRLabel
        Left = 709
        Top = 241
        Width = 59
        Height = 14
        Size.Values = (
          37.797619047619050000
          1874.761904761905000000
          638.779761904762000000
          154.970238095238100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Recl. AFIP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel43: TQRLabel
        Left = 439
        Top = 241
        Width = 60
        Height = 12
        Size.Values = (
          31.750000000000000000
          1161.520833333333000000
          637.645833333333400000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Otros'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel42: TQRLabel
        Left = 439
        Top = 251
        Width = 60
        Height = 12
        Size.Values = (
          31.750000000000000000
          1161.520833333333000000
          664.104166666666800000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Conceptos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel45: TQRLabel
        Left = 329
        Top = 147
        Width = 161
        Height = 12
        Size.Values = (
          31.750000000000000000
          870.479166666666800000
          388.937500000000000000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Atenci'#243'n Comercial'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlAtencionComercial: TQRLabel
        Left = 329
        Top = 161
        Width = 161
        Height = 14
        Size.Values = (
          37.041666666666670000
          869.597222222222200000
          426.861111111111100000
          426.861111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlAtencionComercial'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qriLogo: TQRImage
        Left = 816
        Top = 2
        Width = 163
        Height = 64
        Size.Values = (
          169.333333333333300000
          2159.000000000000000000
          5.291666666666667000
          431.270833333333400000)
        XLColumn = 0
        Stretch = True
      end
      object QRLabel46: TQRLabel
        Left = 499
        Top = 192
        Width = 479
        Height = 14
        Size.Values = (
          37.041666666666670000
          1320.270833333333000000
          508.000000000000000000
          1267.354166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'X=Topeo M'#225'ximo / N=Topeo M'#237'nimo / T=Topeo M'#237'nimo y M'#225'ximo '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 378
      Width = 980
      Height = 34
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel18: TQRLabel
        Left = 787
        Top = 4
        Width = 30
        Height = 12
        Size.Values = (
          31.750000000000000000
          2082.270833333333000000
          10.583333333333330000
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
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRShape13: TQRShape
        Left = 0
        Top = -1
        Width = 979
        Height = 7
        Size.Values = (
          17.638888888888890000
          0.000000000000000000
          -3.527777777777778000
          2589.388888888889000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 818
        Top = 4
        Width = 133
        Height = 11
        Size.Values = (
          29.986111111111110000
          2164.291666666667000000
          10.583333333333330000
          351.013888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Usuario:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel19Print
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRSysData2: TQRSysData
        Left = 954
        Top = 4
        Width = 23
        Height = 11
        Size.Values = (
          29.104166666666670000
          2524.125000000000000000
          10.583333333333330000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        FontSize = 6
      end
      object QRLabel16: TQRLabel
        Left = 9
        Top = 4
        Width = 26
        Height = 12
        Size.Values = (
          31.750000000000000000
          23.812500000000000000
          10.583333333333330000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRSysData1: TQRSysData
        Left = 40
        Top = 4
        Width = 10
        Height = 12
        Size.Values = (
          31.750000000000000000
          105.833333333333300000
          10.583333333333330000
          26.458333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        FontSize = 6
      end
      object QRLabel47: TQRLabel
        Left = 162
        Top = 4
        Width = 511
        Height = 12
        Size.Values = (
          31.750000000000000000
          428.625000000000000000
          10.583333333333330000
          1352.020833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'DDJJ "NO": Estos periodos no tienen Declaraci'#243'n Jurada presentad' +
          'a y/o procesada. Por favor comun'#237'quese v'#237'a mail a emision@provar' +
          't.com.ar'
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
    end
    object QRBand5: TQRBand
      Left = 38
      Top = 318
      Width = 980
      Height = 60
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        158.750000000000000000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel41: TQRLabel
        Left = 708
        Top = 3
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666700000
          1873.250000000000000000
          7.937500000000000000
          156.104166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotReclamoAfip'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrTotReclamoAFIPPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel34: TQRLabel
        Left = 567
        Top = 3
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666700000
          1500.187500000000000000
          7.937500000000000000
          209.020833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotNominal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel34Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel36: TQRLabel
        Left = 838
        Top = 3
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666700000
          2217.208333333330000000
          7.937500000000000000
          177.270833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotDeuda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel36Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel37: TQRLabel
        Left = 244
        Top = 3
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666700000
          645.583333333333000000
          7.937500000000000000
          148.166666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTALES:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrTotRefinanc: TQRLabel
        Left = 647
        Top = 3
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666700000
          1711.854166666670000000
          7.937500000000000000
          156.104166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotReFinanc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = qrTotRefinancPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel15: TQRLabel
        Left = 500
        Top = 3
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1322.916666666670000000
          7.937500000000000000
          171.979166666667000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotPagos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel15Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel17: TQRLabel
        Left = 306
        Top = 3
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666700000
          809.625000000000000000
          7.937500000000000000
          169.333333333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotDevengado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel17Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel21: TQRLabel
        Left = 769
        Top = 3
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666700000
          2034.645833333330000000
          7.937500000000000000
          177.270833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotMora'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel21Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape34: TQRShape
        Left = 306
        Top = 2
        Width = 64
        Height = 1
        Size.Values = (
          2.645833333333330000
          809.625000000000000000
          5.291666666666670000
          169.333333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 500
        Top = 2
        Height = 1
        Size.Values = (
          2.645833333333330000
          1322.916666666670000000
          5.291666666666670000
          171.979166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 567
        Top = 2
        Width = 79
        Height = 1
        Size.Values = (
          2.645833333333330000
          1500.187500000000000000
          5.291666666666670000
          209.020833333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 648
        Top = 2
        Width = 67
        Height = 1
        Size.Values = (
          2.645833333333330000
          1714.500000000000000000
          5.291666666666670000
          177.270833333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 717
        Top = 2
        Width = 59
        Height = 1
        Size.Values = (
          2.645833333333330000
          1897.062500000000000000
          5.291666666666670000
          156.104166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel28: TQRLabel
        Left = 372
        Top = 3
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666700000
          984.250000000000000000
          7.937500000000000000
          169.333333333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotFondo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel28Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape2: TQRShape
        Left = 438
        Top = 2
        Width = 60
        Height = 1
        Size.Values = (
          2.645833333333330000
          1158.875000000000000000
          5.291666666666670000
          158.750000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 372
        Top = 2
        Width = 64
        Height = 1
        Size.Values = (
          2.645833333333330000
          984.250000000000000000
          5.291666666666670000
          169.333333333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 838
        Top = 2
        Width = 67
        Height = 1
        Size.Values = (
          2.645833333333330000
          2217.208333333330000000
          5.291666666666670000
          177.270833333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel44: TQRLabel
        Left = 438
        Top = 3
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666700000
          1158.875000000000000000
          7.937500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotInteresOtros'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        OnPrint = QRLabel44Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape38: TQRShape
        Left = 778
        Top = 2
        Width = 59
        Height = 1
        Size.Values = (
          2.645833333333330000
          2058.458333333330000000
          5.291666666666670000
          156.104166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlLeyendas: TQRLabel
        Left = 244
        Top = 21
        Width = 733
        Height = 37
        Size.Values = (
          97.895833333333340000
          645.583333333333400000
          55.562500000000000000
          1939.395833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTALES:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        OnPrint = qrlLeyendasPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
  end
  object qAux: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 16
    Top = 12
  end
end
