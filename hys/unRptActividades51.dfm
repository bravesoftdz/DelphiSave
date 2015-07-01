object rptActividades51: TrptActividades51
  Left = 274
  Top = 219
  Caption = 'rptActividades51'
  ClientHeight = 610
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrResolucion: TQuickRep
    Left = -8
    Top = 1
    Width = 816
    Height = 1056
    IDReport = 0
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
    ReportTitle = 'Formulario de Resoluci'#243'n'
    SnapToGrid = True
    Units = Pixels
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
      Height = 755
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1997.604166666667000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape47: TQRShape
        Left = 452
        Top = 122
        Width = 288
        Height = 21
        Size.Values = (
          55.562500000000000000
          1195.916666666667000000
          322.791666666666700000
          762.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 463
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          1225.020833333333000000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 303
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          801.687500000000100000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 315
        Top = 303
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          801.687500000000100000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 345
        Top = 303
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          801.687500000000100000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 706
        Top = 304
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          1867.958333333333000000
          804.333333333333200000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 320
        Top = 305
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          806.979166666666800000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText4: TQRDBText
        Left = 323
        Top = 307
        Width = 83
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          812.270833333333300000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'EXCAVACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape12: TQRShape
        Left = 711
        Top = 305
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          1881.187500000000000000
          806.979166666666800000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 6
        Top = 308
        Width = 56
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          814.916666666666700000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Excavaci'#243'n'
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
      object QRLabel2: TQRLabel
        Left = 352
        Top = 308
        Width = 57
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          814.916666666666700000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ascensores'
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
      object QRShape1: TQRShape
        Left = 0
        Top = 326
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          862.541666666666900000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 315
        Top = 326
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          862.541666666666900000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 345
        Top = 326
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          862.541666666666900000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 706
        Top = 327
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          1867.958333333333000000
          865.187500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 320
        Top = 328
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          867.833333333333500000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 323
        Top = 330
        Width = 83
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          873.125000000000000000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'DEMOLICION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape14: TQRShape
        Left = 711
        Top = 328
        Width = 17
        Height = 18
        Size.Values = (
          47.625000000000000000
          1881.187500000000000000
          867.833333333333500000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 6
        Top = 331
        Width = 55
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          875.770833333333300000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Demolici'#243'n'
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
      object QRLabel4: TQRLabel
        Left = 352
        Top = 331
        Width = 38
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          875.770833333333300000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pintura'
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
      object QRShape15: TQRShape
        Left = 0
        Top = 349
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          923.395833333333400000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 315
        Top = 349
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          923.395833333333400000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 345
        Top = 349
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          923.395833333333400000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 706
        Top = 350
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          1867.958333333333000000
          926.041666666666800000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 320
        Top = 351
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          928.687500000000000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 323
        Top = 353
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          933.979166666666700000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'ALBA'#209'ILERIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape21: TQRShape
        Left = 711
        Top = 351
        Width = 17
        Height = 17
        Size.Values = (
          44.979166666666670000
          1881.187500000000000000
          928.687500000000000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 6
        Top = 354
        Width = 55
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          936.625000000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Alba'#241'iler'#237'a'
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
      object QRLabel6: TQRLabel
        Left = 352
        Top = 354
        Width = 267
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          936.625000000000000000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Tiene la obra mas de 1000m'#178' de superficie cubierta?'
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
      object QRShape22: TQRShape
        Left = 0
        Top = 371
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          981.604166666666800000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 315
        Top = 371
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          981.604166666666800000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 345
        Top = 371
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          981.604166666666800000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 706
        Top = 372
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          1867.958333333333000000
          984.249999999999900000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 320
        Top = 373
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          986.895833333333400000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText7: TQRDBText
        Left = 323
        Top = 375
        Width = 18
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          992.187500000000000000
          47.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'HA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape28: TQRShape
        Left = 711
        Top = 373
        Width = 17
        Height = 18
        Size.Values = (
          47.625000000000000000
          1881.187500000000000000
          986.895833333333400000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 6
        Top = 377
        Width = 26
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          997.479166666666700000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'H'#186'A'#186
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
      object QRLabel8: TQRLabel
        Left = 352
        Top = 376
        Width = 151
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          994.833333333333300000
          399.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Silletas o Andamios Colgantes'
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
      object QRShape29: TQRShape
        Left = 0
        Top = 394
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          1042.458333333333000000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 315
        Top = 395
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          1045.104166666667000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 345
        Top = 394
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          1042.458333333333000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 706
        Top = 395
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          1867.958333333333000000
          1045.104166666667000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 320
        Top = 396
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1047.750000000000000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText9: TQRDBText
        Left = 323
        Top = 398
        Width = 66
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          1053.041666666667000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'MONTAJES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape35: TQRShape
        Left = 711
        Top = 396
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          1881.187500000000000000
          1047.750000000000000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 6
        Top = 399
        Width = 136
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          1055.687500000000000000
          359.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Montajes Electromec'#225'nicos'
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
      object QRLabel10: TQRLabel
        Left = 352
        Top = 399
        Width = 235
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          1055.687500000000000000
          621.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Medios de Izaje, Montacargas o Montapersonas'
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
      object QRShape36: TQRShape
        Left = 0
        Top = 417
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          1103.312500000000000000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 315
        Top = 417
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          1103.312500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 345
        Top = 417
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          1103.312500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape39: TQRShape
        Left = 706
        Top = 418
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          1867.958333333333000000
          1105.958333333333000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape41: TQRShape
        Left = 320
        Top = 419
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1108.604166666667000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText11: TQRDBText
        Left = 323
        Top = 421
        Width = 102
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          1113.895833333333000000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'INSTALACIONES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape42: TQRShape
        Left = 711
        Top = 419
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          1881.187500000000000000
          1108.604166666667000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 6
        Top = 422
        Width = 102
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          1116.541666666667000000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instalaciones Varias'
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
      object QRLabel12: TQRLabel
        Left = 352
        Top = 422
        Width = 106
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          1116.541666666667000000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Alta y media Tensi'#243'n'
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
      object QRShape43: TQRShape
        Left = 0
        Top = 440
        Width = 739
        Height = 24
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          1164.166666666667000000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 315
        Top = 440
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          1164.166666666667000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 345
        Top = 440
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          1164.166666666667000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 706
        Top = 441
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          1867.958333333333000000
          1166.812500000000000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 320
        Top = 442
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1169.458333333333000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText13: TQRDBText
        Left = 323
        Top = 444
        Width = 120
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          1174.750000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'ESTRUCMETALICAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRShape49: TQRShape
        Left = 711
        Top = 442
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          1881.187500000000000000
          1169.458333333333000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 6
        Top = 445
        Width = 108
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          1177.395833333333000000
          285.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estructuras Met'#225'licas'
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
      object QRShape51: TQRShape
        Left = 315
        Top = 463
        Width = 1
        Height = 23
        Size.Values = (
          60.854166666666680000
          833.437500000000000000
          1225.020833333333000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Left = 345
        Top = 463
        Width = 1
        Height = 24
        Size.Values = (
          63.500000000000000000
          912.812500000000100000
          1225.020833333333000000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Left = 320
        Top = 465
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1230.312500000000000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText15: TQRDBText
        Left = 323
        Top = 467
        Width = 93
        Height = 16
        Size.Values = (
          42.333333333333330000
          854.604166666666700000
          1235.604166666667000000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'ELECTRICIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 6
        Top = 468
        Width = 59
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          1238.250000000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Electricidad'
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
      object QRLabel14: TQRLabel
        Left = 352
        Top = 444
        Width = 178
        Height = 14
        Size.Values = (
          37.041666666666670000
          931.333333333333300000
          1174.750000000000000000
          470.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se trabaja a mas de 4m de altura?'
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
      object QRShape11: TQRShape
        Left = 0
        Top = 486
        Width = 739
        Height = 43
        Size.Values = (
          113.770833333333300000
          0.000000000000000000
          1285.875000000000000000
          1955.270833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 6
        Top = 492
        Width = 33
        Height = 14
        Size.Values = (
          37.041666666666670000
          15.875000000000000000
          1301.750000000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otros:'
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
      object QRDBText16: TQRDBText
        Left = 47
        Top = 491
        Width = 682
        Height = 16
        Size.Values = (
          42.333333333333340000
          124.354166666666700000
          1299.104166666667000000
          1804.458333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'AO_ACTIVIDAD_OTROS'
        Font.Charset = DEFAULT_CHARSET
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
      object QRShape19: TQRShape
        Left = 0
        Top = 122
        Width = 453
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          322.791666666666700000
          1198.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 0
        Top = 82
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          216.958333333333400000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 0
        Top = 102
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          269.875000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Left = 0
        Top = 62
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          164.041666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 288
        Top = 66
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          762.000000000000000000
          174.625000000000000000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATOS DE LA EMPRESA'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 4
        Top = 86
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          227.541666666666700000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Raz'#243'n Social:'
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
      object QRLabel21: TQRLabel
        Left = 4
        Top = 106
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          280.458333333333300000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Direcci'#243'n:'
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
      object QRShape50: TQRShape
        Left = 0
        Top = 142
        Width = 305
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          375.708333333333400000
          806.979166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 304
        Top = 142
        Width = 281
        Height = 21
        Size.Values = (
          55.562500000000000000
          804.333333333333200000
          375.708333333333400000
          743.479166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape54: TQRShape
        Left = 584
        Top = 142
        Width = 156
        Height = 21
        Size.Values = (
          55.562500000000000000
          1545.166666666667000000
          375.708333333333400000
          412.750000000000100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 0
        Top = 162
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          428.625000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape57: TQRShape
        Left = 0
        Top = 182
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          481.541666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Left = 0
        Top = 202
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          534.458333333333400000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 4
        Top = 125
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          330.729166666666700000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel/Fax:'
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
      object QRLabel23: TQRLabel
        Left = 4
        Top = 145
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          383.645833333333300000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIT:'
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
      object QRLabel24: TQRLabel
        Left = 301
        Top = 165
        Width = 123
        Height = 15
        Size.Values = (
          39.687500000000000000
          796.395833333333300000
          436.562500000000000000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATOS DE LA OBRA'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 4
        Top = 186
        Width = 131
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          492.125000000000000000
          346.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Direcci'#243'n del Obrador:'
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
      object QRLabel26: TQRLabel
        Left = 4
        Top = 205
        Width = 183
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          542.395833333333300000
          484.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel'#233'fono para coordinar visitas:'
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
      object QRLabel27: TQRLabel
        Left = 308
        Top = 145
        Width = 74
        Height = 14
        Size.Values = (
          37.041666666666670000
          814.916666666666700000
          383.645833333333300000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contrato N'#186':'
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
      object QRLabel28: TQRLabel
        Left = 588
        Top = 145
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          1555.750000000000000000
          383.645833333333300000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CIIU:'
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
      object QRLabel29: TQRLabel
        Left = 456
        Top = 126
        Width = 95
        Height = 14
        Size.Values = (
          37.041666666666670000
          1206.500000000000000000
          333.375000000000000000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' de Recepci'#243'n'
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
      object qrRazonSocial: TQRDBText
        Left = 88
        Top = 84
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          222.250000000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'EM_NOMBRE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrDireccion: TQRDBText
        Left = 69
        Top = 105
        Width = 668
        Height = 17
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          277.812500000000000000
          1767.416666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'DOMICILIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrTelefono: TQRDBText
        Left = 56
        Top = 124
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          328.083333333333300000
          275.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'DC_TELEFONOS'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrCuit: TQRDBText
        Left = 43
        Top = 144
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          381.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'EM_CUIT'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrContrato: TQRDBText
        Left = 385
        Top = 144
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1018.645833333333000000
          381.000000000000000000
          256.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'CO_CONTRATO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrCIIU: TQRDBText
        Left = 632
        Top = 144
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          381.000000000000000000
          240.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'AC_RELACION'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrDireccionobrador: TQRDBText
        Left = 148
        Top = 184
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          391.583333333333300000
          486.833333333333300000
          306.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'DOMICILIO_ESTAB'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrTelEstablecimiento: TQRDBText
        Left = 192
        Top = 204
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          539.750000000000000000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'TELEFONO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape59: TQRShape
        Left = 0
        Top = 222
        Width = 740
        Height = 58
        Size.Values = (
          153.458333333333300000
          0.000000000000000000
          587.375000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel30: TQRLabel
        Left = 4
        Top = 226
        Width = 195
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          597.958333333333300000
          515.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Breve descripci'#243'n de la actividad:'
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
      object QRLabel31: TQRLabel
        Left = 43
        Top = 639
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          113.770833333333300000
          1690.687500000000000000
          542.395833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '...................................................'
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
      object lblfirmaprofart: TQRLabel
        Left = 84
        Top = 654
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          1730.375000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Aprobaci'#243'n'
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
      object QRMemo1: TQRMemo
        Left = 480
        Top = 679
        Width = 241
        Height = 67
        Size.Values = (
          177.270833333333300000
          1270.000000000000000000
          1796.520833333334000000
          637.645833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          'PROVINCIA A.R.T.'
          'Carlos Pellegrini 91 - (1009) Buenos Aires'
          'Centro de atenci'#243'n al cliente:'
          'Tel.: 4819-2800 (L'#237'neas Rotativas)'
          'Fax: 4819-2888')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRLabel32: TQRLabel
        Left = 511
        Top = 636
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          1352.020833333333000000
          1682.750000000000000000
          542.395833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '...................................................'
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
      object QRLabel33: TQRLabel
        Left = 580
        Top = 650
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          1719.791666666667000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Firma y sello'
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
      object QRDBText17: TQRDBText
        Left = 85
        Top = 629
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          224.895833333333300000
          1664.229166666667000000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'FECHAAPROBADO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 714
        Top = 306
        Width = 81
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          809.625000000000000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'ASCENSORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 714
        Top = 329
        Width = 52
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          870.479166666666700000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'PINTURA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 714
        Top = 352
        Width = 70
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          931.333333333333300000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'MASDE1000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 714
        Top = 375
        Width = 56
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          992.187500000000000000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'SILLETAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 714
        Top = 398
        Width = 81
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          1053.041666666667000000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'MEDIOSIZAJE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 714
        Top = 421
        Width = 82
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          1113.895833333333000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'ALTATENSION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 714
        Top = 444
        Width = 49
        Height = 14
        Size.Values = (
          37.041666666666670000
          1889.125000000000000000
          1174.750000000000000000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqActividades
        DataField = 'MASDE4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrDescripcion: TQRDBText
        Left = 197
        Top = 226
        Width = 540
        Height = 49
        Size.Values = (
          129.645833333333300000
          521.229166666666800000
          597.958333333333400000
          1428.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_OBSERVACIONES'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape60: TQRShape
        Left = 20
        Top = 8
        Width = 337
        Height = 37
        Size.Values = (
          97.895833333333340000
          52.916666666666660000
          21.166666666666670000
          891.645833333333200000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object lblcuit: TQRLabel
        Left = 39
        Top = 12
        Width = 299
        Height = 15
        Size.Values = (
          39.687500000000000000
          103.187500000000000000
          31.750000000000000000
          791.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'APROBACI'#211'N DEL PLAN DE SEGURIDAD DE OBRAS'
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
      object qrlbResolucion: TQRLabel
        Left = 45
        Top = 28
        Width = 288
        Height = 15
        Size.Values = (
          39.687500000000000000
          119.062500000000000000
          74.083333333333330000
          762.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'EN CONSTRUCCI'#211'N RESOLUCI'#211'N S.RT. N'#186' 51/97'
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
      object QRLabel17: TQRLabel
        Left = 9
        Top = 284
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          751.416666666666700000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Actividades'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText18: TQRDBText
        Left = 557
        Top = 124
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          1473.729166666667000000
          328.083333333333300000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_RECEPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object lbDenunciaSRT: TQRLabel
        Left = 642
        Top = 284
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          1698.625000000000000000
          751.416666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Denuncia SRT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object logo: TQRImage
        Left = 588
        Top = 0
        Width = 152
        Height = 60
        Size.Values = (
          158.750000000000000000
          1555.750000000000000000
          0.000000000000000000
          402.166666666666600000)
        XLColumn = 0
        AutoSize = True
        Picture.Data = {
          07544269746D6170166B0000424D166B00000000000036000000280000009800
          00003C0000000100180000000000E06A0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFFFFFFFEFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFEFEFFFFFFFFFFFEFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFFFFFFFFFFFEFFFFFEFFFEFEFFFFFEFEFFFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFEFEFEFFFEFEFEFFFEFFFEFFFFFFFFFFFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FFFFFEFFFFFEFFFEFFFEFFFFFFFFFEFDF8EBFAEED1F7E8BFF6E3B1F6E3B1F6E3
          B1F6E3B1F6E3B1F6E3B1F6E3B1F6E3B1F6E3B1F6E3B1F6E3B1F6E3B1F6E3B1F6
          E3B1F6E3B1F6E3B1F6E3B1F6E4B3FBF1D9FEFEFEFFFFFFFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFDFFFEFEFFFFFFFFFEFEFF
          FEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFEFFFFFFFF
          FFFEFEFFFEFFFFFEFFFFFFFFFFFFFFFFFFFEFFFEFEFFFFFEFEFFFEFFFFFFFFFF
          FFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFFFEFFFEFEFFFEFEFEFEFBF2D9F3D68DEBBC46E7AF1EE6AA10E6A608
          E3A400E3A400E3A400E3A400E3A400E3A400E3A400E3A400E3A400E3A400E3A4
          00E3A400E3A400E3A400E4A400E5A400E4A500E5A402E7AB17F3D78FFFFFFFFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFFFEFEFFFE
          ECBF4CEDC151FEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDF9EDC55AEDC0
          4FFEFCF7F6E1AEE8B122FCF4DFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBF0CC6EEA
          BA3EFCF9EDFFFFFFFFFFFFFFFFFFFEFCF6ECC151F0CA6CFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFEF9F2D8EEC55FE5A80DE5A401E4A400E3
          A400E4A401E4A401E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A400E4A400E5A401E4A4
          00E6AB15FAF0D5FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFFFFFFFEFFFEEDC358E5A90DFBF1D8FFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
          FBF4DFE5AA12ECC255FEFEFDF2D58AE5A609FAEDCEFFFFFFFFFFFEFEFFFFFFFF
          FFF5E2AEE5A301EDC459FFFEFBFFFFFFFFFFFFFFFFFFFDF9EEE9B22AECBE4AFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFFFEFEFEFFFEFEFEFFFEFFFFFFFDFCF7F3D58BE5A80BE4A300E4A3
          00E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFF5DFA5E4A402F3DA97FFFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFF4DEA0E4A401F4DC9EFFFFFFF2D58AE5A609FAEDCEFEFFFF
          FEFFFEFFFFFFFCF8EBE8AF1FE6AE1CFAF0D7FEFFFFFFFFFFFFFFFFFFFFFFFDF9
          EEE9B22AECBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFEFEFEFFFFFEFFFFFDFAF0EFC761E4A604
          E5A400E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFEFCF8EBE5A505EBBF
          4EFEFEFDFFFFFFFFFFFFFFFFFFFFFEFCEEC357E6AB14FBF1D7FFFFFFF2D58AE5
          A609FAEDCEFFFFFFFFFFFEFEFEFBEEC763E5A505F3DA98FEFFFEFFFFFFFFFFFF
          FFFFFFFFFFFFFDF9EEE9B22AECBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFEFFFFFDFDF9F0
          CB6EE4A402E4A400E4A400E4A300E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFF
          FFFEFDEBBC42E7AE1BFCF5E4FFFFFFFFFFFFFFFFFFFDF8EDE6AC15EABA3DFEFC
          F8FFFFFFF2D58AE5A70AFAEDCEFFFFFFFFFFFFF7E4B5E5A809ECBD45FEFCF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9EEE9B22AECBE4AFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFE
          FFFEFFFEF5DD9FE4A605E4A400E4A400E4A300E4A300E4A300E4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFEF2D58CE4A503E8AF20E8B227E8B127E8B227E8B123
          E4A401F2D385FEFFFFFDFFFFF2D68AE5A70AFAEECDFEFFFFFCF7E8E9B42DE6A9
          0FFBF2D9FEFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFDF9EEE9B22AECBE4AFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFFFFFEFEFFFCF8EBE7AE1BE4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300E4A300E4A400E4A400E4A400E4A400E4A400E4A400E5A401E4A401E3
          A400E4A401E4A400E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF0D7E3A504E6AA11EAB93BEA
          B93BECB93BE6AB15E5A80CF8EAC6FEFFFFFEFFFEF2D58AE4A402E9B227E9B631
          E8B125E4A402E8B42BF8E8C1FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF9
          EEE9B22AECBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFF2D385E4A400E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300E4A400E4A400E4A400E3A400E4A400E4A401E5A4
          00E4A501E4A400E4A400E3A400E4A300E4A300E4A300E4A300E4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF4EBB6
          34E9B42DFEF9F0FFFFFFFEFEFDE9B125E8B42BFEFCF8FFFEFEFFFFFEF2D58AE4
          A502E9B227E9B631EAB532E9B229E5A80EE4A503EFCD73FEFEFCFFFFFFFFFFFF
          FFFFFFFFFFFFFDF9EEE9B22AECBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCF8E6AD1AE4A400E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300E4A401E4A400E3A400E4A503
          E6AA13EBBE49EFCD74F2D589EEC55EE4A403E3A401E4A400E4A300E4A300E4A3
          00E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFFFDFFFEF1CE75E4A708F9EBC7FEFFFFFBF1D7E4A401F0CB70FEFFFFFEFF
          FEFFFFFFF2D58AE5A70AFAEDCEFFFFFFFFFFFFFEFFFFFBF2DBEABA3DE5A80CF8
          EBC7FEFFFFFFFFFFFFFFFFFFFFFFFDF9EEE9B22AECBE4AFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E4
          B5E4A503E4A400E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E5
          A400E7AD1BF3D994FDF8ECFFFFFFFFFFFFFFFFFFF9EDCAE5A607E4A300E4A300
          E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFFFF8E9C1E4A504F2D281FEFFFFF2D68BE5A606
          F7E5B6FFFEFFFEFFFEFFFFFFF2D58AE5A609FAEDCEFFFFFFFFFFFFFFFFFFFFFF
          FFF8E6BBE4A400F3DA97FFFFFFFFFFFFFFFFFFFFFFFFFDF9EEE9B22AECBE4AFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFFFFEFCC71E4A400E4A301E4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300E4A400E9B42DFAEFD1FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EDCAE5
          A607E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFCF7EAE9B127EBBB41FE
          FBF5EABA3FE6AC18FDFAEFFDFFFEFEFFFFFFFFFEF2D58AE5A609FAEDCEFFFFFF
          FFFFFFFFFFFFFFFFFFF9EED0E5A400F3D890FEFFFFFFFFFFFFFFFFFFFFFFFDF9
          EEE9B22AECBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFFFEAB93AE5A400E4A400E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300E6AB14F9EBC6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF9EDCAE5A607E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFE
          FDEDC65FE5A90DF8E8BEE6AA10EDC358FEFFFEFEFFFFFFFFFEFEFFFFF2D58AE5
          A609FAEDCEFFFFFFFFFFFFFFFFFFFFFFFFF5DC9EE4A401F4DDA1FEFFFFFFFFFF
          FFFFFFFFFFFFFDF9EEE9B22AECBE4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF3E6AD1AE4A400E4A401E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300EFCB6DFEFEFDFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF9EDCAE5A607E4A300E4A300E4A300E4A300E4A3
          00E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFFFFFEFFFFF6E0A9E4A400EABA3EE5A503F6DEA3FFFFFFFFFFFFFFFF
          FFFEFFFFF2D58AE5A709F7E5B6FDF6E8FDF6E8FAF2D8F3DB99E6AB15E7AD19FC
          F3DDFEFFFFFCF7E6FBF5E1FBF4E2FAEFD2E8B125EBBB41FCF4E1FCF4E1FCF5E2
          FDF9ECFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF2DCE6A9
          11E4A401E4A400E4A300E4A300E4A300E4A300E5A400E4A401E6A80BF9EBC7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8ECCAE4A607E4A400E4A400
          E4A400E4A400E4A400E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFBF5E3E8B023E4A500E6A910FCF9EE
          FFFFFFFFFFFFFFFFFFFFFFFFF4D78DE3A400E4A400E4A400E4A400E4A400E4A5
          04E7AE1DF6E2B1FEFFFEFBF3DCE6AD17E4A401E4A400E4A400E4A400E4A400E4
          A401E4A401E4A300E7AE1CFDF9F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFBEFD2E6A90EE4A400E4A400E4A300E4A300E4A300E4A300E4A400E4A4
          00E7B023FDF8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEDCAE5
          A607E5A401E4A401E4A400E3A400E4A300E4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFEFFFFFEF8E9C2F2
          D281F9E9C2FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF5E3F2D384F2D180F2D280
          F2D180F2D68BF6E2ADFCF8EDFEFFFEFEFEFFFEFBF5F5E0A8F4DC9DF3DC9DF4DC
          9DF5DB9DF4DC9DF4DC9DF5DC9DF5DC9DF5E1ACFEFEFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A400E4A400E4A300E4A300E4A300
          E4A300E4A400E4A400EAB530FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF9ECCAE5A707E4A400E4A400E4A400E5A401E4A400E4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFEFFFF
          FFFEFFFFFFFFFFFFFFFFFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
          FFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFEFFFFFFFFFEFFFFFEFFFFFFFFFFFEFFFE
          FEFEFFFEFFFFFFFFFFFEFEFEFFFFFEFFFFFFFEFFFEFEFFFFFFFFFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E6A90EE4A400E4A400E4
          A300E4A300E4A300E4A300E4A400E4A400E9B530FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCF8ECF1D07AF0CE76F1CE76F0CD73EDC356EAB7
          36E7AB17E4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300F7E4B3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A9
          0EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFFFEFFFFFDFCF7FBF2DBF6DEA4EBBD47E5A709E4A401E4A401E4A400E4A4
          00E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFEFFFEFFFEFFFEFDFCF7F7E7BCEAB837
          E4A401E4A401E4A400E4A300F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFFFEFEFEFFFFFEFFFF
          FFFFFEFFFFFDFAF0EFCA6EE4A503E4A300E4A300F7E4B3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFEF1D281E4A402E4A300F7E4B3FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F5F5F6F5F5F7F6
          F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F8F8F6F5F5F6F5F5FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          F4F4F4EDEDEDECECECF0EFEFFAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFDFDF2F1F1ECECECF2F1F1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFD
          FCFCF6F5F5F6F5F5F9F9F9FFFFFFFFFFFFF5F5F5F6F5F5F7F7F7FEFEFEFFFFFF
          FFFFFFFFFFFFFCFCFCF6F5F5F6F5F5F9F8F8FFFFFFFFFFFFFFFFFFFFFFFFFAFA
          FAF0F0F0ECECECECECECEFEFEEF6F5F5FEFEFEFEFEFEF6F6F6F6F5F5F7F7F7FE
          FEFEFFFFFFFFFFFFFCFCFCF1F1F1ECECECEEEDEDF7F7F7FFFFFFF7F7F7F6F5F5
          F7F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A9
          0EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFEFEFFFF
          FFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFAEEC4
          58E3A400F7E4B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E0E0
          9896959895959E9C9BF7F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAFADAD989595989696DDDCDCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1F0F0BBB9B99593928884848582818D8988A3A0A0D5D4D4FCFCFCFFFFFF
          FFFFFFFFFFFFFFFFFFFCFCFCC2C0C0908D8D868282908D8CBFBEBDFBFBFBFFFF
          FFFFFFFFFFFFFFD5D3D3989594989594B4B2B1FCFCFCF4F3F3979595989595A1
          9F9EF0F0F0FFFFFFFFFFFFFFFFFFD9D8D8989595989594B0AEAEFCFCFCFFFFFF
          FDFDFDDAD9D9A5A3A28D8A898682818682818B8887989695E9E9E9F0EFEF9D9B
          9B989595A09E9EF1F0F0FFFFFFEFEFEFADABAB908C8B8582818985859B9897C2
          C0C09F9C9B9895949F9D9DF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
          FFFFFEFFFEFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          FEFFFEFEFFFFFCF5E4E8AF1FF7E4B3FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDAD9D98682818682818B8887F3F3F3FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA09D9D868281858281D6D5D5FFFFFFFFFF
          FFFFFFFFFFFFFFF0EFEF9D9A9986828186828186828186828186828186828189
          8685C2C1C1FDFDFDFFFFFFFFFFFFFFFFFFDEDDDD8A8786868281858281868281
          888584DAD9D8FFFFFFFFFFFFFFFFFFCAC7C7868281868281A3A1A0FBFBFBF0EF
          EF8582818682818D8A89EBEAEAFFFFFFFFFFFFFFFFFFCFCECE8582818682819D
          9A9AFBFAFAFEFEFED1CFD08B8787868281868281868281868281868281858281
          E2E1E1E8E8E88B88878682818E8B8AECEBEBFBFBFAA5A3A38682818682818682
          818582818582818682818682818682818D8A8AEBEAEAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFFFFF8E7BAF3D893F4DC9BF7E7BDFDFAF1FFFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFFFEFFFFFFFFFEFFFEFFFEF3D791F7E4B3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818582818B8887F3F3F3FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA09D9D868281858281
          D6D5D5FFFFFFFFFFFFFFFFFFFEFEFEB4B1B1868281868281878484A6A2A2B0AE
          AE9492918682818582818A8786E5E4E3FFFFFFFFFFFFFFFFFFB9B7B786828185
          8281A3A1A0858281858281B3B1B0FFFFFFFFFFFFFFFFFFC9C7C7868281868281
          A4A1A0FBFBFBF0EFEF8582818582818D8A89EBEAEAFFFFFFFFFFFFFFFFFFD0CE
          CE8682818582819E9A9AFBFAFAF3F2F2908D8D858281868281939090B2B1B0B4
          B2B1B3B2B1ACA9A9EBEAEAE8E8E88B88878582818E8B8AECEBEBE3E2E28A8686
          848281888483B2B0B0CCCACABBBABA9995958682818682818E8A89EBEAEAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCF7E8E5AA11E4A300E4A400E4A607E9B632F8E9
          C2FFFFFEFEFFFFFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF8EBFCF3DFFF
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818582818B88
          87F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0
          9D9C868281868281D6D5D5FFFFFFFFFFFFFFFFFFF5F5F5898685868281868282
          C5C4C4FBFBFBFEFEFEF1F0F09A9796868281868281B5B4B3FEFEFEFFFFFFF8F8
          F89F9C9B8682818A8786F1F0F08A87868682819B9897F7F7F7FFFFFFFFFFFFC9
          C7C7868281868281A4A1A0FBFBFBF0EFEF8582818582818C8A89EBEAEAFFFFFF
          FFFFFFFFFFFFD0CECE8682818682819E9B9AFBFAFACDCCCC868281868281918E
          8DECEBEAFFFFFFFFFFFFFFFFFFFDFDFDFEFEFEE8E7E78A87868582818E8B8AEC
          EBEBDBDADA8582818482818C8989FDFDFDFFFFFFFFFFFFE5E4E48B8887868281
          8E8A89EBEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A9
          0EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6E4E5A70AE4A300E4A400
          E4A400E4A400E6AC18FBF4E2FFFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFF
          FFFFFFFFFEFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA
          8682818582818B8887F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFA09D9C868281868281D6D5D5FFFFFFFFFFFFFFFFFFDBDADA86
          8281868281949191F2F2F2FFFFFFFFFFFFFFFFFFC9C8C8868281858281999796
          FCFCFCFFFFFFEAEAEA8A8786858281A19F9EFBFBFBA3A0A0868281888584E5E4
          E4FFFFFFFFFFFFC9C7C7868281868281A4A1A0FBFBFBF0EFEF8582818582818C
          8A89EBEAEAFFFFFFFFFFFFFFFFFFD0CECE8682818783829E9A9AFAFAFAB4B2B2
          868281868281B1AFAEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E78A87
          868582818E8B8AECEBEBDCDBDB8682818582818B8988FAF9F9FFFFFFFFFFFFE8
          E8E88C88878682818E8A89EBEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6E4E5
          A70AE4A300E4A401E3A400E4A400E5A401F0CD73FEFFFEFEFFFFFFFEFFFFFFFF
          FFFFFFFFFFFFFEFFFFFEFFFEFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDBD9DA8682818582818B8887F3F3F3FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA09D9C868281868281D6D5D5FFFFFFFFFF
          FFFFFFFFD0CECE8682818582819E9C9BF9F9F9FFFFFFFFFFFFFFFFFFD9D8D885
          8281858281928F8FFBFBFBFFFFFFCCCBCA858281858281BBB9B9FFFFFFBCBABA
          868281868281C7C6C6FFFFFFFFFFFFC9C7C7868281868281A4A1A0FBFBFBF0EF
          EF8582818582818C8A89EBEAEAFFFFFFFFFFFFFFFFFFD0CECE8682818682819D
          9A9AFAFAFAB0ADAD868281868281B8B7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE8E7E78A88878582818E8B8AECEBEBEDECEC918C8D858281878382B3B2
          B1E0DFDFECECEBD9D9D88B87868682818E8A89EBEAEAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFCF6E4E5A70AE4A300E4A300E3A301E4A400E4A401EBBB40FEFEFEFE
          FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFFFFFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA868281868281898585C2C0BFC7C6C5C7
          C5C5CECCCCDFDEDEF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFA09D9C868281868281
          D6D5D5FFFFFFFFFFFFFFFFFFCFCECE8682818682819F9C9BF9F9F9FFFFFFFFFF
          FFFFFFFFDAD9D9858281848281918F8FFBFBFBFDFDFDAEABAB868281868281D5
          D4D4FFFFFFD8D7D7868281868281A8A6A5FCFCFCFFFFFFC9C7C7868281868281
          A4A1A0FBFBFBF0EFEF8582818582818C8A89EBEAEAFFFFFFFFFFFFFFFFFFCFCE
          CD8682818682819E9B9AFBFAFAB0ADAD868281868281B8B7B6FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFE8E8E88A87868582818E8B8AECEBEBFEFEFEC3C2C2
          8A86868682818582818482818582818682818682818682818E8A89EBEAEAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCF6E4E5A70AE4A300E4A400E4A400E4A400E4A4
          00ECBC43FEFEFEFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818682818682
          81868281868281858281868281878382959292C2C0C0F8F8F8FFFFFFFFFFFFA0
          9D9C868281868281D6D5D5FFFFFFFFFFFFFFFFFFCFCECE8682818682819F9C9B
          F9F9F9FFFFFFFFFFFFFFFFFFDAD9D8868281858281928F8FFBFBFBF6F5F59390
          8F868281898585EEEDEDFFFFFFF0F0F0898584868281908D8DF3F3F3FFFFFFC9
          C7C7868281868281A4A1A0FBFBFBF0EFEF8582818582818C8A89EBEAEAFFFFFF
          FFFFFFFFFFFFCFCECD8582818682819E9B9AFAFAFAB0ADAC868281868281B9B7
          B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E88A87868582818E8B8AEC
          EBEBFFFFFFFDFDFDDAD9D9ABA9A99B9898928F8E8F8C8B8D8A89868281868281
          8E8A89EBEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A9
          0EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6E4E5A70AE4A300E4A400
          E4A401E4A400E4A400F0CE75FFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA
          868281868281868281858281858282848281858281868281868281878382AFAD
          ADFAFAFAFFFFFFA09D9C868281868281D6D5D5FFFFFFFFFFFFFFFFFFD4D3D386
          82818682819A9796F6F6F6FFFFFFFFFFFFFFFFFFD5D3D3858281858281969393
          FBFBFBE3E1E18682818682819C9998F8F8F8FFFFFFF9F9F99C9A998682818582
          81DDDCDCFFFFFFC9C7C7868281868281A4A1A0FBFBFBF0EFEF8582818582818C
          8A89EBEAEAFFFFFFFFFFFFFFFFFFD0CECE868281868281A29F9EFBFBFBB1AEAE
          868281868281B6B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E88A87
          868582818E8B8AECEBEBFFFFFFFFFFFFFFFFFFFDFDFDF7F7F7F2F2F2F1F1F1DD
          DCDC8B87878682818E8A89EBEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF6E4E5
          A70AE4A300E4A400E4A400E4A401E6AE19FBF4E0FEFFFFFEFFFFFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDBD9DA868281868281898685CDCCCCDAD9D9D9D7D7C6C5C5979594
          868281868281888483D4D3D3FFFFFFA09D9C868281868281D6D5D5FFFFFFFFFF
          FFFFFFFFEAEAEA858281868281898584DFDEDEFFFFFFFFFFFFFCFCFCACAAAA86
          8281868281A9A6A7FDFDFDBFBDBD868281868281B1AFAFFEFEFEFFFFFFFEFEFE
          B4B1B1868281868281BBB9B8FEFEFEC9C7C7868281868281A4A1A0FBFBFBF0EF
          EF8582818582818D8A89EBEAEAFFFFFFFFFFFFFFFFFFC2C1C0868281868281A9
          A6A6FDFCFCC1BFBF8682818682819E9C9BF8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE9E8E88A87868582818E8B8AECEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE5E4E48B87868682818E8B8AEDEDEDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300
          E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDF8EAE4A80BE5A400E4A500E4A401E8B42EF9ECC9FFFFFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818582818B8887F3F3F3FFFFFFFF
          FFFFFFFFFFF9F8F8959291868281858281A9A7A7FEFEFEA09D9C868281868281
          8F8C8BB9B8B7DAD9D9E9E8E8FBFBFB9D9A9A868281868281918F8FCCCBCAD9D8
          D7B4B2B1868382868281868382D2D1D0FDFDFDA09D9C868281868281CCCACAFF
          FFFFFFFFFFFFFFFFCECDCD8582818682819D9A99FBFBFBC9C7C7868281868281
          A4A1A0FBFBFBF0EFEF858281858281868281999796C8C7C7E5E4E4D6D5D49592
          92868281868281B8B6B6FEFEFEE7E6E6878483868281868281B0AEAEE1E0E0E8
          E7E7DEDDDDD5D4D3F4F4F4E8E7E78B88878582818E8B8AECEBEBFFFFFFEBEBEB
          DAD9D8E8E7E7E8E7E7E8E7E7E3E2E1AAA8A7868281868281979493FBFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90EE4A300E4A300E4
          A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EAC2F5DFA7F5DFA8F9EBC7FDFDF9FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818582818B88
          87F3F3F3FFFFFFFFFFFFFFFFFFFEFEFEBCBAB98682818682819F9D9DFAFAFAA0
          9D9C868281868281868281868281868281858281FBFBFBDFDEDE8C8989868281
          868281858281858281868281868281868281A8A5A4F9F9F9F4F3F38885848682
          81888483E4E4E3FFFFFFFFFFFFFFFFFFE6E6E6888584868281868382F0EFEFC9
          C8C8868281868281A4A1A0FBFBFBF0EFEF858281858281868281868281868281
          868281858281868281868281888483DAD9D9FFFFFFFDFCFCB4B2B28682818682
          81868281858281858281858281858281E2E1E1E8E7E78A87868582818E8B8AEC
          EBEBFFFFFFB5B4B4868281858281858281858282858281868281868281868382
          C3C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A9
          0EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A300E9B430FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFEFEFFFFFEFEFEFFFFFF
          FEFFFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA
          8682818582818B8887F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFBEBCBC8682818683
          82A09D9DFAFAFAA09D9C868281888483A09E9D8C8888868281868281FBFBFBFE
          FEFED7D6D69996968783828682818582818582818A8786B0AEAEF3F2F2FFFFFF
          D8D7D6858281868281969392F3F3F2FFFFFFFFFFFFFFFFFFF4F4F49794938582
          81868281D0CECFCAC8C8868281868281A5A1A1FBFBFBF0F0F08582818582818D
          89889E9B9B898685868281848281868281898584B6B4B4FBFAFAFFFFFFFFFFFF
          F6F5F5B6B4B48C8988868281868281868281868281868382E3E2E2E9E9E98B88
          878582818E8B8AECECECFFFFFFBDBBBB86828185828185828186828186828186
          82818D8A89B7B6B6F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAEFD2E5A90EE4A300E4A300E4A300E4A300E4A300E4A300E4A300E4A3
          00E9B430FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFE
          FFFFFEFFFEFFFFFEFEFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDBD9DA8682818682818B8887F3F2F2FFFFFFFFFFFFFFFFFFFEFEFE
          A5A3A2858281868281A4A2A1FCFCFCE1E0E0D5D4D4D7D6D6F5F5F5E6E5E5CDCC
          CCC1C0C0FDFDFDFFFFFFFFFFFFF4F4F4DAD8D8C6C4C4BEBDBDCCCBCBE5E5E4FC
          FCFCFFFFFFFFFFFFF0F0F0D5D4D4D5D4D3E0DFDFFEFEFEFFFFFFFFFFFFFFFFFF
          FEFEFEE0E0E0D4D4D4D5D4D4ECEBEBF0F0F0D5D4D4D5D4D4E2E2E1FEFEFEFCFB
          FBD6D6D5D5D4D4DDDCDCF8F7F7E2E1E1C9C8C8BEBDBCC7C6C5DFDEDEFBFBFAFF
          FFFFFFFFFFFFFFFFFFFFFFFDFCFCE7E6E6CDCCCCBFBDBDC4C2C2C9C7C7DCDBDB
          F9F9F9FBFBFBD7D7D7D5D4D4D9D8D8FBFBFBFFFFFFF5F5F5DEDEDDCECECEC7C6
          C5BEBCBBC4C2C2D1CFCFEAE9E9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAEFD2E6A90EE4A400E4A400E4A300E4A300E4A300
          E4A300E4A300E4A400E8B126FAF0D3FBF1D8FBF1D8FBF1D8FCF5E4FFFEFCFFFF
          FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818682818A8786E3E1E1F4F3F3F2
          F2F2E3E3E2B6B4B3888483868281868282C3C1C1FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F3F3F4F3F3
          F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F5F3F3F3F5F5F5FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A90FE4A400E4A300E4
          A300E4A300E4A300E5A300E3A500E4A400E4A503E6AA12E6AB14E6AB14E6AB14
          E6AE1AEDC45AFCF8EDFEFFFFFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD9DA8682818682818682
          818A87868D8A898C8988898685868281868281868281989696F1F0F0FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF
          CDCD8C89888C8988A4A2A1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEAEA918F8E8C8989928F8FE8
          E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFD2E5A9
          0FE5A400E4A400E4A300E4A300E4A300E4A300E4A401E4A400E4A400E4A300E4
          A300E4A300E4A300E4A401E4A402ECC257FEFCF6FEFFFEFFFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDADA
          868282868281868281868281868281858281868281858281888584A2A09FEDED
          EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFC9C7C7868281868281999796F7F7F6FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E78B87
          868582818A8686E2E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFAF2DBE7AA11E4A401E5A401E4A300E4A300E4A300E4A300E5A401E4A4
          00E5A401E4A300E4A300E4A300E4A300E5A401E4A401E4A400EEC762FDFBF5FD
          FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF5F4F4CAC8C8B9B7B6B0AEADA6A4A3A6A4A4A6A4A3ADABAABFBDBD
          DDDCDCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECDCC8F8C8B8F8C8BA4A1A0F8F8F8FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEBEAEA9391908F8C8B939190E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFDEFCC6EE5A80BE4A400E4A400E4A400E4A400
          E4A400E4A400E4A400E4A400E4A400E4A400E4A400E4A400E4A400E4A400E4A4
          00E4A400F1D07CFEFEFCFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7ECECECECECEC
          F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDECECECEEEDEDFDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFDFAF8EAC5F6E3B0F7
          E3B1F7E3B1F7E3B1F7E3B1F7E3B1F7E3B1F7E3B1F7E3B1F7E3B1F7E3B1F7E3B1
          F7E3B1F7E3B1F7E3B1F7E3B0F7E5B8FEFDFCFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFE
          FFFEFFFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Stretch = True
      end
    end
  end
  object sdqAvisoObra: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ao_recepcion || '#39' CAR'#39' as ao_recepcion, ps_fecharecepcion' +
        ', ao_fechainicio, ao_fechafindeobra,'
      
        '       ps_canttrabajadores,AO_FECHARECEPCION,PS_REQUIEREFECHAANE' +
        'XO, PS_FECHAANEXO,'
      
        '       TO_CHAR (ps_fechaaprobado, '#39'DD "de" Month "de" YYYY'#39') AS ' +
        'fechaaprobado,'
      '       (   ct_contacto'
      '        || '#39' '#39
      
        '        || NVL (ct_telefonos, art.afi.get_telefonos('#39'ATN_TELEFON' +
        'OCONTACTO'#39', ct_id))'
      '       ) AS ct_contacto,'
      '       oc_descripcion, ao_observaciones'
      '  FROM art.pao_avisoobra,'
      '       hys.hps_programaseguridad,'
      '       afi.act_contacto,'
      '       hys.hoc_obrascomitente'
      ' WHERE ao_cuit = ps_cuit'
      '   AND ao_estableci = ps_establecimiento'
      '   AND ao_cuit = :cuit'
      '   AND ao_estableci = :estableci'
      '   AND ao_tipo = :tipo'
      '   AND ao_contacto = ct_id(+)'
      '   AND oc_id(+) = ao_comitente'
      '   AND (   ps_fechainicio ='
      '                    (SELECT MAX (ps_fechainicio)'
      '                       FROM hys.hps_programaseguridad'
      
        '                      WHERE ps_cuit = :cuit AND ps_establecimien' +
        'to ='
      
        '                                                                ' +
        '    :estableci)'
      '        OR ps_fecharecepcion ='
      '                    (SELECT MAX (ps_fecharecepcion)'
      '                       FROM hys.hps_programaseguridad'
      
        '                      WHERE ps_cuit = :cuit AND ps_establecimien' +
        'to ='
      
        '                                                                ' +
        '    :estableci)'
      '       )'
      '')
    Left = 118
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object sdqActividades: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT DECODE (SUBSTR (ao_actividad, 1, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS exc' +
        'avacion,'
      
        '       DECODE (SUBSTR (ao_actividad, 2, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS dem' +
        'olicion,'
      
        '       DECODE (SUBSTR (ao_actividad, 3, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS alb' +
        'a'#241'ileria,'
      '       DECODE (SUBSTR (ao_actividad, 4, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS HA,'
      
        '       DECODE (SUBSTR (ao_actividad, 5, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS mon' +
        'tajes,'
      
        '       DECODE (SUBSTR (ao_actividad, 6, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS ins' +
        'talaciones,'
      
        '       DECODE (SUBSTR (ao_actividad, 7, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS est' +
        'rucmetalicas,'
      
        '       DECODE (SUBSTR (ao_actividad, 8, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS ele' +
        'ctricidad,'
      
        '       DECODE (SUBSTR (ao_actividad, 9, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS asc' +
        'ensores,'
      
        '       DECODE (SUBSTR (ao_actividad, 10, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS pi' +
        'ntura,'
      
        '       DECODE (SUBSTR (ao_actividad, 11, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS ma' +
        'sde1000,'
      
        '       DECODE (SUBSTR (ao_actividad, 12, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS si' +
        'lletas,'
      
        '       DECODE (SUBSTR (ao_actividad, 13, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS me' +
        'diosizaje,'
      
        '       DECODE (SUBSTR (ao_actividad, 14, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS al' +
        'tatension,'
      
        '       DECODE (SUBSTR (ao_actividad, 15, 1), '#39'S'#39', '#39'X'#39', '#39#39') AS ma' +
        'sde4,'
      '       AO_ACTIVIDAD_OTROS'
      '  FROM art.pao_avisoobra'
      ' WHERE ao_cuit = :cuit AND ao_estableci = :estableci'
      'AND AO_TIPO = :tipo  AND AO_OPERATIVO = :operativo'
      '')
    Left = 146
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'operativo'
        ParamType = ptInput
      end>
  end
  object sdqEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT aem.em_nombre,'
      '          art.afi.armar_domicilio (es_calle,'
      '                                   es_numero,'
      '                                   es_piso,'
      '                                   es_departamento,'
      '                                   es_localidad'
      '                                  )'
      '       || NVL2 (es_telefonos,'
      
        '                '#39' Tel.'#39' || (NVL (es_codareatelefonos, '#39#39') || es_' +
        'telefonos),'
      '                '#39#39
      '               )'
      '       || '#39' - '#39
      '       || (SELECT pv_descripcion'
      '             FROM cpv_provincias'
      '            WHERE pv_codigo = es_provincia)'
      ' AS domicilio_estab,'
      '       dc_telefonos, aem.em_cuit,'
      
        '       (aco.co_contrato || '#39'/'#39' || es_nroestableci) AS co_contrat' +
        'o,'
      '       ac_relacion, aes.es_nroestableci, aes.es_nombre,'
      '          art.afi.armar_domicilio (dc_calle,'
      '                                   dc_numero,'
      '                                   dc_piso,'
      '                                   dc_departamento,'
      '                                   dc_localidad'
      '                                  )'
      '       || '#39' - '#39
      '       || (SELECT pv_descripcion'
      '             FROM cpv_provincias'
      '            WHERE pv_codigo = dc_provincia)'
      ' as domicilio,'
      '       NVL (es_telefonos, dc_telefonos) telefono, ac_descripcion'
      '  FROM afi.adc_domiciliocontrato ahdl,'
      '       afi.aem_empresa aem,'
      '       afi.aco_contrato aco,'
      '       afi.aes_establecimiento aes,'
      '       comunes.cac_actividad cac'
      ' WHERE co_contrato = art.get_vultcontrato (em_cuit)'
      '   AND ahdl.dc_contrato(+) = aco.co_contrato'
      '   AND ahdl.dc_tipo(+) = '#39'L'#39
      '   AND aem.em_id = aco.co_idempresa'
      '   AND cac.ac_id = aes.es_idactividad'
      '   AND aco.co_contrato = aes.es_contrato'
      '--   AND aes.es_fechabaja IS NULL'
      '--   AND co_estado = '#39'1'#39
      '   AND em_cuit = :cuit'
      '   AND es_nroestableci = :estableci'
      ''
      ''
      '')
    Left = 90
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
end
