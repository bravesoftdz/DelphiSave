object rptResumen: TrptResumen
  Left = 0
  Top = 0
  Width = 816
  Height = 882
  IDReport = 0
  BeforePrint = QuickRepBeforePrint
  DataSet = sdqLiquidaciones
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
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
  ReportTitle = 'Resumen de Siniestro'
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  PrevInitialZoom = qrZoomToFit
  PreviewDefaultSaveType = stQRP
  PreviewLeft = 0
  PreviewTop = 0
  object qrHeader: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 47
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      124.354166666666700000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageHeader
    object QRLabel1: TQRLabel
      Left = 281
      Top = 12
      Width = 178
      Height = 20
      Size.Values = (
        52.916666666666670000
        743.479166666666800000
        31.750000000000000000
        470.958333333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = True
      Caption = 'Resumen de Siniestro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 12
    end
    object QRDBText5: TQRDBText
      Left = 718
      Top = 16
      Width = 22
      Height = 17
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000
        42.333333333333340000
        58.208333333333340000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = True
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'HOY'
      Font.Charset = DEFAULT_CHARSET
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
  object qrTitle: TQRBand
    Left = 38
    Top = 85
    Width = 740
    Height = 130
    Frame.DrawBottom = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      343.958333333333400000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbTitle
    object QRLabel2: TQRLabel
      Left = 0
      Top = 8
      Width = 58
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        21.166666666666670000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 232
      Top = 8
      Width = 78
      Height = 17
      Size.Values = (
        44.979166666666670000
        613.833333333333400000
        21.166666666666670000
        206.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Ocurrencias'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 437
      Top = 8
      Width = 45
      Height = 17
      Size.Values = (
        44.979166666666670000
        1156.229166666667000000
        21.166666666666670000
        119.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Estado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 232
      Top = 32
      Width = 126
      Height = 17
      Size.Values = (
        44.979166666666670000
        613.833333333333400000
        84.666666666666680000
        333.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestros M'#250'ltiples'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 437
      Top = 32
      Width = 59
      Height = 17
      Size.Values = (
        44.979166666666670000
        1156.229166666667000000
        84.666666666666680000
        156.104166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Reca'#237'das'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 0
      Top = 60
      Width = 71
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        158.750000000000000000
        187.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Ocurrido el'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 162
      Top = 60
      Width = 31
      Height = 17
      Size.Values = (
        44.979166666666670000
        428.625000000000000000
        158.750000000000000000
        82.020833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'a las'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 344
      Top = 60
      Width = 152
      Height = 17
      Size.Values = (
        44.979166666666670000
        910.166666666666600000
        158.750000000000000000
        402.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de inicio Derecho'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 0
      Top = 80
      Width = 110
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        211.666666666666700000
        291.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tipo de Denuncia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 441
      Top = 80
      Width = 55
      Height = 17
      Size.Values = (
        44.979166666666670000
        1166.812500000000000000
        211.666666666666700000
        145.520833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Juicio N'#176
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 68
      Top = 8
      Width = 65
      Height = 17
      Size.Values = (
        44.979166666666670000
        179.916666666666700000
        21.166666666666670000
        171.979166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'SINIESTRO'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 318
      Top = 8
      Width = 85
      Height = 17
      Size.Values = (
        44.979166666666670000
        841.375000000000000000
        21.166666666666670000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'OCURRENCIAS'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 490
      Top = 8
      Width = 49
      Height = 17
      Size.Values = (
        44.979166666666670000
        1296.458333333333000000
        21.166666666666670000
        129.645833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ESTADO'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 366
      Top = 31
      Width = 23
      Height = 18
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        47.625000000000000000
        968.375000000000000000
        82.020833333333340000
        60.854166666666680000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'HAY_MULTIPLES'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 503
      Top = 31
      Width = 22
      Height = 19
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        50.270833333333330000
        1330.854166666667000000
        82.020833333333340000
        58.208333333333340000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'HAY_RECAIDAS'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 76
      Top = 60
      Width = 80
      Height = 17
      Size.Values = (
        44.979166666666670000
        201.083333333333300000
        158.750000000000000000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_FECHAACCIDENTE'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 200
      Top = 60
      Width = 56
      Height = 17
      Size.Values = (
        44.979166666666670000
        529.166666666666800000
        158.750000000000000000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_HORAACCIDENTE'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 505
      Top = 60
      Width = 179
      Height = 17
      Size.Values = (
        44.979166666666670000
        1336.145833333333000000
        158.750000000000000000
        473.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_BAJAMEDICA'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 505
      Top = 80
      Width = 39
      Height = 17
      Size.Values = (
        44.979166666666670000
        1336.145833333333000000
        211.666666666666700000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'JUICIO'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 116
      Top = 80
      Width = 29
      Height = 17
      Size.Values = (
        44.979166666666670000
        306.916666666666700000
        211.666666666666700000
        76.729166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TIPO'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText81: TQRDBText
      Left = 678
      Top = 31
      Width = 22
      Height = 19
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        50.270833333333330000
        1793.875000000000000000
        82.020833333333340000
        58.208333333333340000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ES_PLURIEMPLEO'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel81: TQRLabel
      Left = 597
      Top = 32
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666670000
        1579.562500000000000000
        84.666666666666680000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Pluriempleo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 416
      Top = 100
      Width = 80
      Height = 17
      Size.Values = (
        44.979166666666670000
        1100.666666666667000000
        264.583333333333400000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Mediaciones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText82: TQRDBText
      Left = 505
      Top = 100
      Width = 82
      Height = 17
      Size.Values = (
        44.979166666666670000
        1336.145833333333000000
        264.583333333333400000
        216.958333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'MEDIACIONES'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  object qrTituloColumnas: TQRBand
    Left = 38
    Top = 957
    Width = 740
    Height = 43
    Frame.DrawBottom = True
    AlignToBottom = False
    BeforePrint = qrLiquidacionesBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      113.770833333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbColumnHeader
    object QRLabel67: TQRLabel
      Left = 4
      Top = 24
      Width = 45
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        63.500000000000000000
        119.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'N'#250'mero'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel68: TQRLabel
      Left = 72
      Top = 24
      Width = 66
      Height = 17
      Size.Values = (
        44.979166666666670000
        190.500000000000000000
        63.500000000000000000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Descripci'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel69: TQRLabel
      Left = 379
      Top = 24
      Width = 36
      Height = 17
      Size.Values = (
        44.979166666666670000
        1002.770833333333000000
        63.500000000000000000
        95.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Desde'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel70: TQRLabel
      Left = 432
      Top = 24
      Width = 34
      Height = 17
      Size.Values = (
        44.979166666666670000
        1143.000000000000000000
        63.500000000000000000
        89.958333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hasta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel71: TQRLabel
      Left = 482
      Top = 24
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        1275.291666666667000000
        63.500000000000000000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel72: TQRLabel
      Left = 544
      Top = 24
      Width = 46
      Height = 17
      Size.Values = (
        44.979166666666670000
        1439.333333333333000000
        63.500000000000000000
        121.708333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Proceso'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel73: TQRLabel
      Left = 613
      Top = 24
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        1621.895833333333000000
        63.500000000000000000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Emisi'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel74: TQRLabel
      Left = 675
      Top = 24
      Width = 56
      Height = 17
      Size.Values = (
        44.979166666666670000
        1785.937500000000000000
        63.500000000000000000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Aprobado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel66: TQRLabel
      Left = 0
      Top = 1
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        2.645833333333333000
        447.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Liquidaciones'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel40: TQRLabel
      Left = 298
      Top = 24
      Width = 38
      Height = 17
      Size.Values = (
        44.979166666666670000
        788.458333333333400000
        63.500000000000000000
        100.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Origen'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
  object qrDetailBand: TQRBand
    Left = 38
    Top = 1000
    Width = 740
    Height = 13
    AlignToBottom = False
    BeforePrint = qrLiquidacionesBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      34.395833333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRDBText68: TQRDBText
      Left = 5
      Top = 1
      Width = 50
      Height = 12
      Size.Values = (
        31.750000000000000000
        13.229166666666670000
        2.645833333333333000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'NUMLIQUI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText69: TQRDBText
      Left = 73
      Top = 1
      Width = 220
      Height = 12
      Size.Values = (
        31.750000000000000000
        193.145833333333300000
        2.645833333333333000
        582.083333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText70: TQRDBText
      Left = 380
      Top = 1
      Width = 33
      Height = 12
      Size.Values = (
        31.750000000000000000
        1005.416666666667000000
        2.645833333333333000
        87.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'DESDE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText71: TQRDBText
      Left = 430
      Top = 1
      Width = 34
      Height = 12
      Size.Values = (
        31.750000000000000000
        1137.708333333333000000
        2.645833333333333000
        89.958333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'HASTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText72: TQRDBText
      Left = 483
      Top = 1
      Width = 45
      Height = 12
      Size.Values = (
        31.750000000000000000
        1277.937500000000000000
        2.645833333333333000
        119.062500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'IMPORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText73: TQRDBText
      Left = 541
      Top = 1
      Width = 48
      Height = 12
      Size.Values = (
        31.750000000000000000
        1431.395833333333000000
        2.645833333333333000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'PROCESO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText74: TQRDBText
      Left = 612
      Top = 1
      Width = 44
      Height = 12
      Size.Values = (
        31.750000000000000000
        1619.250000000000000000
        2.645833333333333000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'EMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText75: TQRDBText
      Left = 672
      Top = 1
      Width = 56
      Height = 12
      Size.Values = (
        31.750000000000000000
        1778.000000000000000000
        2.645833333333333000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'APROBADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText40: TQRDBText
      Left = 296
      Top = 1
      Width = 77
      Height = 12
      Size.Values = (
        31.750000000000000000
        783.166666666666800000
        2.645833333333333000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'ORIGEN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
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
  object ChildBand1: TQRChildBand
    Left = 38
    Top = 215
    Width = 740
    Height = 84
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      222.250000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrTitle
    PrintOrder = cboAfterParent
    object QRLabel13: TQRLabel
      Left = 4
      Top = 16
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 4
      Top = 32
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        84.666666666666680000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel'#233'fono'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
      Left = 4
      Top = 48
      Width = 54
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        127.000000000000000000
        142.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Localidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
      Left = 520
      Top = 48
      Width = 77
      Height = 17
      Size.Values = (
        44.979166666666670000
        1375.833333333333000000
        127.000000000000000000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C'#243'digo Postal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 4
      Top = 64
      Width = 53
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        169.333333333333300000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Provincia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 564
      Top = 4
      Width = 40
      Height = 17
      Size.Values = (
        44.979166666666670000
        1492.250000000000000000
        10.583333333333330000
        105.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C.U.I.T.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlEmpDep: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Empleador'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 173
      Top = 0
      Width = 95
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        0.000000000000000000
        251.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText13: TQRDBText
      Left = 173
      Top = 16
      Width = 108
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        42.333333333333340000
        285.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_DOMICILIO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText14: TQRDBText
      Left = 173
      Top = 32
      Width = 111
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        84.666666666666680000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_TELEFONOS'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText15: TQRDBText
      Left = 173
      Top = 48
      Width = 110
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        127.000000000000000000
        291.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_LOCALIDAD'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText17: TQRDBText
      Left = 173
      Top = 64
      Width = 109
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        169.333333333333300000
        288.395833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_PROVINCIA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText16: TQRDBText
      Left = 617
      Top = 48
      Width = 98
      Height = 17
      Size.Values = (
        44.979166666666670000
        1632.479166666667000000
        127.000000000000000000
        259.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_CPOSTAL'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText18: TQRDBText
      Left = 617
      Top = 4
      Width = 43
      Height = 17
      Size.Values = (
        44.979166666666670000
        1632.479166666667000000
        10.583333333333330000
        113.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_CUIT'
      Font.Charset = DEFAULT_CHARSET
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
  object ChildBand2: TQRChildBand
    Left = 38
    Top = 299
    Width = 740
    Height = 88
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      232.833333333333400000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand1
    PrintOrder = cboAfterParent
    object QRLabel20: TQRLabel
      Left = 4
      Top = 16
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 4
      Top = 32
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        84.666666666666680000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel'#233'fono'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 564
      Top = 4
      Width = 39
      Height = 17
      Size.Values = (
        44.979166666666670000
        1492.250000000000000000
        10.583333333333330000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C.U.I.L.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Trabajador'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel77: TQRLabel
      Left = 4
      Top = 48
      Width = 54
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        127.000000000000000000
        142.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Localidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel78: TQRLabel
      Left = 520
      Top = 48
      Width = 77
      Height = 17
      Size.Values = (
        44.979166666666670000
        1375.833333333333000000
        127.000000000000000000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C'#243'digo Postal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel79: TQRLabel
      Left = 4
      Top = 64
      Width = 53
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        169.333333333333300000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Provincia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText19: TQRDBText
      Left = 173
      Top = 0
      Width = 60
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        0.000000000000000000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TJ_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText20: TQRDBText
      Left = 173
      Top = 16
      Width = 129
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        42.333333333333340000
        341.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TRABAJADOR_DOMICILIO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText21: TQRDBText
      Left = 173
      Top = 32
      Width = 53
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        84.666666666666680000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TELEFONO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText78: TQRDBText
      Left = 173
      Top = 48
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        127.000000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TJ_LOCALIDAD'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText80: TQRDBText
      Left = 173
      Top = 64
      Width = 130
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        169.333333333333300000
        343.958333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TRABAJADOR_PROVINCIA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText79: TQRDBText
      Left = 617
      Top = 48
      Width = 63
      Height = 17
      Size.Values = (
        44.979166666666670000
        1632.479166666667000000
        127.000000000000000000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TJ_CPOSTAL'
      Font.Charset = DEFAULT_CHARSET
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
      Left = 617
      Top = 4
      Width = 42
      Height = 17
      Size.Values = (
        44.979166666666670000
        1632.479166666667000000
        10.583333333333330000
        111.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_CUIL'
      Font.Charset = DEFAULT_CHARSET
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
  object ChildBand3: TQRChildBand
    Left = 38
    Top = 387
    Width = 740
    Height = 52
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      137.583333333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand2
    PrintOrder = cboAfterParent
    object QRDBText22: TQRDBText
      Left = 173
      Top = 0
      Width = 101
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        0.000000000000000000
        267.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DENUNCIA_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRLabel23: TQRLabel
      Left = 4
      Top = 16
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText23: TQRDBText
      Left = 173
      Top = 16
      Width = 114
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        42.333333333333340000
        301.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DENUNCIA_DOMICILIO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRLabel24: TQRLabel
      Left = 4
      Top = 32
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        84.666666666666680000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel'#233'fono'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText24: TQRDBText
      Left = 173
      Top = 32
      Width = 117
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        84.666666666666680000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DENUNCIA_TELEFONOS'
      Font.Charset = DEFAULT_CHARSET
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
    object QRLabel22: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Ubicaci'#243'n de la denuncia'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
  object ChildBand4: TQRChildBand
    Left = 38
    Top = 439
    Width = 740
    Height = 84
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      222.250000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand3
    PrintOrder = cboAfterParent
    object QRLabel26: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Descripci'#243'n'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel27: TQRLabel
      Left = 0
      Top = 32
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        84.666666666666680000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Observaciones'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel28: TQRLabel
      Left = 0
      Top = 64
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        169.333333333333300000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Causa de cierre'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText26: TQRDBText
      Left = 173
      Top = 0
      Width = 560
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666600000
        0.000000000000000000
        1481.666666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_BREVEDESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText27: TQRDBText
      Left = 173
      Top = 32
      Width = 560
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666600000
        84.666666666666680000
        1481.666666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_OBSERVACIONES'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText28: TQRDBText
      Left = 173
      Top = 64
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        169.333333333333300000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CAUSAFIN'
      Font.Charset = DEFAULT_CHARSET
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
  object ChildBand5: TQRChildBand
    Left = 38
    Top = 523
    Width = 740
    Height = 204
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      539.750000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand4
    PrintOrder = cboAfterParent
    object QRLabel29: TQRLabel
      Left = 0
      Top = 4
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        10.583333333333330000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Forma'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel30: TQRLabel
      Left = 0
      Top = 20
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        52.916666666666660000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Naturaleza'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel31: TQRLabel
      Left = 0
      Top = 36
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        95.250000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Agente'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel32: TQRLabel
      Left = 0
      Top = 52
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        137.583333333333300000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Zona'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel33: TQRLabel
      Left = 0
      Top = 72
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        190.500000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Gravedad'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel34: TQRLabel
      Left = 0
      Top = 92
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        243.416666666666700000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Baja M'#233'dica'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel35: TQRLabel
      Left = 0
      Top = 108
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        285.750000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Fecha de egreso'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel36: TQRLabel
      Left = 380
      Top = 92
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        243.416666666666700000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'D'#237'as Previstos'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel37: TQRLabel
      Left = 380
      Top = 108
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        285.750000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'D'#237'as de baja en total'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel38: TQRLabel
      Left = 0
      Top = 128
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        338.666666666666700000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Diagn'#243'stico de ingreso'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel39: TQRLabel
      Left = 0
      Top = 144
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        381.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Diagn'#243'stico de egreso'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlCie10: TQRLabel
      Left = 0
      Top = 164
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        433.916666666666800000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'OMS CIE 10'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDias: TQRLabel
      Left = 0
      Top = 180
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        476.250000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'D'#237'as'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlIncapacidad: TQRLabel
      Left = 380
      Top = 180
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        476.250000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Incapacidad'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText29: TQRDBText
      Left = 173
      Top = 4
      Width = 37
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        10.583333333333330000
        97.895833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FORMA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText30: TQRDBText
      Left = 173
      Top = 20
      Width = 66
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        52.916666666666670000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'NATURALEZA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText31: TQRDBText
      Left = 173
      Top = 36
      Width = 40
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        95.250000000000000000
        105.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'AGENTE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText32: TQRDBText
      Left = 173
      Top = 52
      Width = 29
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        137.583333333333300000
        76.729166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ZONA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText33: TQRDBText
      Left = 173
      Top = 72
      Width = 55
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        190.500000000000000000
        145.520833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'GRAVEDAD'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText34: TQRDBText
      Left = 173
      Top = 92
      Width = 83
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        243.416666666666700000
        219.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_BAJAMEDICA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText35: TQRDBText
      Left = 173
      Top = 108
      Width = 83
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        285.750000000000000000
        219.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_ALTAMEDICA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText38: TQRDBText
      Left = 173
      Top = 128
      Width = 88
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        338.666666666666700000
        232.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PI_DIAGNOSTICO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText39: TQRDBText
      Left = 173
      Top = 144
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        381.000000000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PE_DIAGNOSTICO'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbDiagnosticooms: TQRDBText
      Left = 173
      Top = 164
      Width = 112
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        433.916666666666700000
        296.333333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_DIAGNOSTICOOMS'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbDiasLeve: TQRDBText
      Left = 173
      Top = 180
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666600000
        476.250000000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_DIASLEVE'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbDiasModerado: TQRDBText
      Left = 241
      Top = 180
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        637.645833333333400000
        476.250000000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_DIASMODERADO'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbDiasGrave: TQRDBText
      Left = 309
      Top = 180
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        817.562500000000000000
        476.250000000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_DIASGRAVE'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbDescripcion: TQRDBText
      Left = 241
      Top = 164
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        637.645833333333400000
        433.916666666666700000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText36: TQRDBText
      Left = 553
      Top = 92
      Width = 121
      Height = 17
      Size.Values = (
        44.979166666666670000
        1463.145833333333000000
        243.416666666666700000
        320.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PI_DIASBAJAPREVISTOS'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText37: TQRDBText
      Left = 553
      Top = 108
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        1463.145833333333000000
        285.750000000000000000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DIASBAJA'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbIncapLeve: TQRDBText
      Left = 553
      Top = 180
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        1463.145833333333000000
        476.250000000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_INCAPACIDADLEVE'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbIncapModerado: TQRDBText
      Left = 621
      Top = 180
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        1643.062500000000000000
        476.250000000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_INCAPACIDADMODERADO'
      Font.Charset = DEFAULT_CHARSET
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
    object qrdbIncapGrave: TQRDBText
      Left = 689
      Top = 180
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        1822.979166666667000000
        476.250000000000000000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DG_INCAPACIDADGRAVE'
      Font.Charset = DEFAULT_CHARSET
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
  object qrPrestador: TQRChildBand
    Left = 38
    Top = 727
    Width = 740
    Height = 52
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrPrestadorBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      137.583333333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand5
    PrintOrder = cboAfterParent
    object QRDBText48: TQRDBText
      Left = 173
      Top = 0
      Width = 109
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        0.000000000000000000
        288.395833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRESTADOR_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRLabel44: TQRLabel
      Left = 4
      Top = 16
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText49: TQRDBText
      Left = 173
      Top = 16
      Width = 122
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        42.333333333333340000
        322.791666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRESTADOR_DOMICILIO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRLabel45: TQRLabel
      Left = 4
      Top = 32
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        84.666666666666680000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel'#233'fono'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText50: TQRDBText
      Left = 173
      Top = 32
      Width = 119
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        84.666666666666680000
        314.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRESTADOR_TELEFONO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRLabel43: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Prestador'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
  object qrIncapacidades: TQRChildBand
    Left = 38
    Top = 779
    Width = 740
    Height = 88
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrIncapacidadesBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      232.833333333333400000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrPrestador
    PrintOrder = cboAfterParent
    object QRLabel47: TQRLabel
      Left = 4
      Top = 16
      Width = 71
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        187.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Permanente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel48: TQRLabel
      Left = 4
      Top = 32
      Width = 35
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        84.666666666666680000
        92.604166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Grado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel49: TQRLabel
      Left = 4
      Top = 48
      Width = 83
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        127.000000000000000000
        219.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Gran Invalidez'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel50: TQRLabel
      Left = 4
      Top = 64
      Width = 71
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        169.333333333333300000
        187.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '% Definitivo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel51: TQRLabel
      Left = 380
      Top = 32
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        84.666666666666680000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Car'#225'cter'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel52: TQRLabel
      Left = 380
      Top = 48
      Width = 74
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        127.000000000000000000
        195.791666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '% Provisorio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel53: TQRLabel
      Left = 380
      Top = 64
      Width = 63
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        169.333333333333300000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hologaci'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel46: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Incapacidades'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText51: TQRDBText
      Left = 173
      Top = 16
      Width = 105
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        42.333333333333340000
        277.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EXISTEINCAPACIDAD'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText52: TQRDBText
      Left = 173
      Top = 32
      Width = 37
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        84.666666666666680000
        97.895833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'GRADO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText53: TQRDBText
      Left = 173
      Top = 48
      Width = 81
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        127.000000000000000000
        214.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'GRANINVALIDEZ'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText54: TQRDBText
      Left = 173
      Top = 64
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        457.729166666666700000
        169.333333333333300000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'SI_PORCDEF'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText57: TQRDBText
      Left = 549
      Top = 64
      Width = 107
      Height = 17
      Size.Values = (
        44.979166666666670000
        1452.562500000000000000
        169.333333333333300000
        283.104166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FECHAHOMOLOGADO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText56: TQRDBText
      Left = 549
      Top = 48
      Width = 76
      Height = 17
      Size.Values = (
        44.979166666666670000
        1452.562500000000000000
        127.000000000000000000
        201.083333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'SI_PORCPROVI'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText55: TQRDBText
      Left = 549
      Top = 32
      Width = 55
      Height = 17
      Size.Values = (
        44.979166666666670000
        1452.562500000000000000
        84.666666666666680000
        145.520833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CARACTER'
      Font.Charset = DEFAULT_CHARSET
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
  object qrDocumentacion: TQRChildBand
    Left = 38
    Top = 867
    Width = 740
    Height = 52
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrDocumentacionBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      137.583333333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrIncapacidades
    PrintOrder = cboAfterParent
    object QRLabel55: TQRLabel
      Left = 4
      Top = 16
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Expediente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel56: TQRLabel
      Left = 4
      Top = 32
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        84.666666666666680000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Parte de Egreso'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel57: TQRLabel
      Left = 192
      Top = 16
      Width = 53
      Height = 17
      Size.Values = (
        44.979166666666670000
        508.000000000000000000
        42.333333333333340000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Denuncia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel58: TQRLabel
      Left = 192
      Top = 32
      Width = 32
      Height = 17
      Size.Values = (
        44.979166666666670000
        508.000000000000000000
        84.666666666666680000
        84.666666666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Otros'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel59: TQRLabel
      Left = 380
      Top = 16
      Width = 96
      Height = 17
      Size.Values = (
        44.979166666666670000
        1005.416666666667000000
        42.333333333333340000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Parte de Ingreso'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel60: TQRLabel
      Left = 379
      Top = 32
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        1002.770833333333000000
        84.666666666666680000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Denuncia Grave'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel62: TQRLabel
      Left = 564
      Top = 32
      Width = 87
      Height = 17
      Size.Values = (
        44.979166666666670000
        1492.250000000000000000
        84.666666666666680000
        230.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Parte Evolutivo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel54: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Documentaci'#243'n recibida'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText58: TQRDBText
      Left = 129
      Top = 16
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        341.312500000000000000
        42.333333333333340000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_EXPEDIENTE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText59: TQRDBText
      Left = 129
      Top = 32
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        341.312500000000000000
        84.666666666666680000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_EGRESO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText60: TQRDBText
      Left = 317
      Top = 16
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        838.729166666666800000
        42.333333333333340000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_DENUNCIA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText61: TQRDBText
      Left = 317
      Top = 32
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        838.729166666666800000
        84.666666666666680000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_OTROS'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText63: TQRDBText
      Left = 505
      Top = 32
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        1336.145833333333000000
        84.666666666666680000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_DENUNCIAGRAVE'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText62: TQRDBText
      Left = 505
      Top = 16
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        1336.145833333333000000
        42.333333333333340000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_INGRESO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText65: TQRDBText
      Left = 689
      Top = 32
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        1822.979166666667000000
        84.666666666666680000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DOC_EVOLUTIVO'
      Font.Charset = DEFAULT_CHARSET
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
  object qrCobranzas: TQRChildBand
    Left = 38
    Top = 919
    Width = 740
    Height = 36
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrCobranzasBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      95.250000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrDocumentacion
    PrintOrder = cboAfterParent
    object QRLabel63: TQRLabel
      Left = 4
      Top = 16
      Width = 91
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        42.333333333333340000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cuota promedio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel64: TQRLabel
      Left = 240
      Top = 16
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        635.000000000000000000
        42.333333333333340000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Deuda admitida'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel65: TQRLabel
      Left = 472
      Top = 16
      Width = 89
      Height = 17
      Size.Values = (
        44.979166666666670000
        1248.833333333333000000
        42.333333333333340000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Deuda a vencer'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel61: TQRLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 17
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        0.000000000000000000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Estado de Cobranzas'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText64: TQRDBText
      Left = 113
      Top = 16
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        298.979166666666700000
        42.333333333333340000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CUOTAPROMEDIO'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText66: TQRDBText
      Left = 349
      Top = 16
      Width = 85
      Height = 17
      Size.Values = (
        44.979166666666670000
        923.395833333333400000
        42.333333333333340000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DEUDAADMITIDA'
      Font.Charset = DEFAULT_CHARSET
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
    object QRDBText67: TQRDBText
      Left = 581
      Top = 16
      Width = 35
      Height = 17
      Size.Values = (
        44.979166666666670000
        1537.229166666667000000
        42.333333333333340000
        92.604166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DEUDA'
      Font.Charset = DEFAULT_CHARSET
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
  object qrFooter: TQRBand
    Left = 38
    Top = 1043
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageFooter
    object QRLabel75: TQRLabel
      Left = 4
      Top = 2
      Width = 39
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        5.291666666666667000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'P'#225'gina'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel76: TQRLabel
      Left = 580
      Top = 2
      Width = 51
      Height = 17
      Size.Values = (
        44.979166666666670000
        1534.583333333333000000
        5.291666666666667000
        134.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRExpr1: TQRExpr
      Left = 60
      Top = 2
      Width = 68
      Height = 17
      Size.Values = (
        44.979166666666670000
        158.750000000000000000
        5.291666666666667000
        179.916666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'PAGENUMBER'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText77: TQRDBText
      Left = 680
      Top = 2
      Width = 55
      Height = 17
      Size.Values = (
        44.979166666666670000
        1799.166666666667000000
        5.291666666666667000
        145.520833333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'SINIESTRO'
      Font.Charset = DEFAULT_CHARSET
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
  object qrSummary: TQRBand
    Left = 38
    Top = 1026
    Width = 740
    Height = 17
    Frame.DrawTop = True
    AlignToBottom = False
    BeforePrint = qrLiquidacionesBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrDetailBand
    Size.Values = (
      44.979166666666670000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbSummary
    object QRExpr2: TQRExpr
      Left = 163
      Top = 3
      Width = 367
      Height = 14
      Size.Values = (
        37.041666666666670000
        431.270833333333400000
        7.937500000000000000
        971.020833333333400000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'FORMATNUMERIC('#39'$ #,##0.00'#39',SUM(sdqLiquidaciones.IMPORTE))'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel80: TQRLabel
      Left = 332
      Top = 2
      Width = 30
      Height = 14
      Size.Values = (
        37.041666666666670000
        878.416666666666800000
        5.291666666666667000
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
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
  end
  object qrExtraDetail: TQRChildBand
    Left = 38
    Top = 1013
    Width = 740
    Height = 13
    AlignToBottom = False
    BeforePrint = qrExtraDetailBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = qrDetailBand
    Size.Values = (
      34.395833333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrDetailBand
    PrintOrder = cboAfterParent
    object QRDBText76: TQRDBText
      Left = 96
      Top = 1
      Width = 225
      Height = 12
      Size.Values = (
        31.750000000000000000
        254.000000000000000000
        2.645833333333333000
        595.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqLiquidaciones
      DataField = 'DESCRIPCION_EXTRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
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
  object ChildBand8: TQRChildBand
    Left = 38
    Top = 955
    Width = 740
    Height = 2
    AlignToBottom = False
    BeforePrint = qrLiquidacionesBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      5.291666666666667000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCobranzas
    PrintOrder = cboAfterParent
  end
  object QRLabel41: TQRLabel
    Left = 38
    Top = 185
    Width = 125
    Height = 17
    Size.Values = (
      44.979166666666670000
      100.541666666666700000
      489.479166666666600000
      330.729166666666700000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fecha de recepci'#243'n'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRDBText41: TQRDBText
    Left = 169
    Top = 185
    Width = 127
    Height = 17
    Size.Values = (
      44.979166666666670000
      447.145833333333400000
      489.479166666666600000
      336.020833333333400000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = sdqReporte
    DataField = 'EX_FECHARECEPCION'
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FullJustify = False
    MaxBreakChars = 0
    FontSize = 10
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT (SELECT MAX(ex_recaida) + 1'
      '          FROM sex_expedientes sex_1'
      '         WHERE sex_1.ex_siniestro = sex.ex_siniestro'
      '           AND sex_1.ex_orden = sex.ex_orden) AS ocurrencias,'
      '     ART.SIN.Get_ListaNrosMediacionesExp(EX_ID) as MEDIACIONES,'
      '       /* Siniestro con m'#250'ltiples ordenes */'
      '       (SELECT DISTINCT NVL('#39'x'#39', '#39#39')'
      '                   FROM sex_expedientes sex_2'
      '                  WHERE sex_2.ex_siniestro = sex.ex_siniestro'
      '                    AND sex_2.ex_orden > 1) AS hay_multiples,'
      '       /* Siniestro con m'#250'ltiples reca'#237'das */'
      '       (SELECT DISTINCT NVL('#39'x'#39', '#39#39')'
      '                   FROM sex_expedientes sex_3'
      '                  WHERE sex_3.ex_siniestro = sex.ex_siniestro'
      '                    AND sex_3.ex_orden = sex.ex_orden'
      
        '                    AND sex_3.ex_recaida > 0) AS hay_recaidas, -' +
        '- Adicionales '
      '       /* Siniestro con pluriempleo */'
      '       (SELECT DISTINCT NVL('#39'x'#39', '#39#39')'
      '                   FROM sex_expedientes sex_4'
      '                  WHERE sex_4.ex_siniestro = sex.ex_siniestro'
      '                    AND sex_4.ex_orden = sex.ex_orden'
      '                    AND sex_4.ex_recaida = sex.ex_recaida '
      
        '                    AND sex_4.ex_pluriempleo = '#39'S'#39' ) AS es_pluri' +
        'empleo,                      '
      
        '                                                               a' +
        'rt.actualdate hoy, se_descripcion AS estado,'
      
        '       ta_descripcion AS tipo, tg_descripcion AS gravedad, ex_fe' +
        'chaaccidente, NVL(ex_horaaccidente, '#39'-'#39') AS ex_horaaccidente,'
      
        '       ex_bajamedica, art.utiles.armar_siniestro(ex_siniestro, e' +
        'x_orden, ex_recaida) siniestro, ex_cuit, ex_cuil,'
      
        '       ex_brevedescripcion, ex_observaciones, art.SIN.get_listan' +
        'rosjuicioexp(ex_siniestro, ex_orden, ex_recaida) juicio,'
      '       ct_descripcion causafin,'
      '       /* Empresa */'
      
        '       utiles.armar_domicilio(mp_calle_post, mp_numero_post, mp_' +
        'piso_post, mp_departamento_post) empresa_domicilio,'
      
        '       mp_nombre empresa_nombre, mp_telefonos empresa_telefonos,' +
        ' mp_localidad_post empresa_localidad,'
      
        '       mp_cpostal_post empresa_cpostal, cpv_cmp.pv_descripcion e' +
        'mpresa_provincia,'
      '       /* Trabajador */'
      
        '       utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_d' +
        'epartamento) trabajador_domicilio, tj_nombre, art.trabajador.get' +
        '_telefono(tj_id, 4) Telefono,'
      
        '       tj_localidad, tj_cpostal, cpv_ctj.pv_descripcion trabajad' +
        'or_provincia,'
      '       /* Denuncia */'
      
        '       utiles.armar_domicilio(ud_calle, ud_numero, ud_piso, ud_d' +
        'epartamento) denuncia_domicilio, ud_nombre denuncia_nombre,'
      
        '       ud_cpostal denuncia_cpostal, ud_cpostala denuncia_cpostal' +
        'a, ud_localidad denuncia_localidad,'
      
        '       utiles.armar_telefono(ud_codareatelefonos, NULL, ud_telef' +
        'onos) denuncia_telefonos,'
      '       cpv_sud.pv_descripcion denuncia_provincia,'
      '       /* Prestador */'
      
        '       utiles.armar_domicilio(cpr.ca_calle, cpr.ca_numero, cpr.c' +
        'a_piso, cpr.ca_departamento) prestador_domicilio,'
      
        '       cpr.ca_descripcion prestador_nombre, cpr.ca_telefono pres' +
        'tador_telefono,                                      /* Partes *' +
        '/'
      
        '                                                                ' +
        '               pi_diasbajaprevistos,'
      
        '       pi_diagnostico, ex_iddiagnostico, pe_diasbajatotales, pe_' +
        'diagnostico, ex_altamedica, lf_descripcion forma,'
      
        '       la_descripcion agente, ln_descripcion naturaleza, lz_desc' +
        'ripcion zona, ex_brevedescripcion, ex_observaciones,'
      
        '       ex_diagnosticooms, ex_prestador, pa_fechaauditoria pa_fec' +
        'hacontrol, pa_calidadprest calidadauditoria, pa_medico, ex_pluri' +
        'empleo, '
      
        '       cdg.dg_descripcion, dg_incapacidadleve, dg_incapacidadmod' +
        'erado, dg_incapacidadgrave, dg_diasleve, dg_diasmoderado,'
      '       dg_diasgrave,'
      '       DECODE(ex_altamedica,'
      '              NULL, pe_diasbajatotales,'
      '              DECODE(ex_bajamedica,'
      '                     NULL, pe_diasbajatotales,'
      
        '                     iif_compara('#39'>='#39', TO_CHAR(ex_altamedica, '#39'Y' +
        'YYYMMDD'#39'), TO_CHAR(ex_bajamedica, '#39'YYYYMMDD'#39'),'
      
        '                                 trunc(ex_altamedica - ex_bajame' +
        'dica + 1), pe_diasbajatotales))) diasbaja,'
      '       /* Incapacidades */'
      
        '       DECODE(si_grado, NULL, DECODE(si_caracter, NULL, '#39'No'#39', '#39'S' +
        'i'#39'), '#39'Si'#39') existeincapacidad,'
      
        '       DECODE(si_grado, '#39'P'#39', '#39'Parcial'#39', DECODE(si_grado, '#39'T'#39', '#39'T' +
        'otal'#39', '#39'-'#39')) grado,'
      
        '       DECODE(si_caracter, '#39'P'#39', '#39'Provisorio'#39', DECODE(si_caracter' +
        ', '#39'D'#39', '#39'Definitivo'#39', '#39'-'#39')) caracter,'
      '       DECODE(si_graninc, '#39'S'#39', '#39'Si'#39', '#39'No'#39') graninvalidez,'
      '       /*'
      
        '      DECODE(art.siniestro.is_rechazopatologiabase(ex_id), '#39'S'#39', ' +
        '1, 0) rechazopatologiabase,'
      '      DECODE(ex_gravedad, '#39'5'#39', '#39'Si'#39', '#39'No'#39') fallecimiento,'
      '      */'
      
        '       DECODE(siniestro.get_fecha_homologado(ex_id), NULL, '#39'No'#39',' +
        ' '#39'Si'#39') homologado,'
      
        '       siniestro.get_fecha_homologado(ex_id) fechahomologado, si' +
        '_porcprovi, si_porcdef,'
      
        '       DECODE(ex_presupincapacidad, '#39'?'#39', '#39' '#39', ex_presupincapacid' +
        'ad) presupincap,'
      '       /* Cobranzas */'
      
        '       art.compdeuda.get_cuotapromedio(afiliacion.get_contratovi' +
        'gente(ex_cuit, ex_fechaaccidente), '#39'E'#39','
      
        '                                       utiles.periodo_anterior(c' +
        'obranza.get_ultperiododevengado('#39'E'#39'), 12),'
      
        '                                       cobranza.get_ultperiodode' +
        'vengado('#39'E'#39'), '#39'S'#39') cuotapromedio,'
      
        '       art.compdeuda.get_deuda(afiliacion.get_contratovigente(ex' +
        '_cuit, ex_fechaaccidente), '#39'D'#39', '#39'S'#39', '#39'N'#39') deuda,'
      '       DECODE(art.afiliacion.check_cobertura(ex_cuit),'
      
        '              1 /*ART.AFILIACION.ESTADO_ACTIVA*/, art.compdeuda.' +
        'get_cuotapromedio(afiliacion.get_contratovigente(ex_cuit,'
      
        '                                                                ' +
        '                                                 ex_fechaacciden' +
        'te),'
      
        '                                                                ' +
        '                  '#39'E'#39','
      
        '                                                                ' +
        '                  utiles.periodo_anterior(cobranza.get_ultperiod' +
        'odevengado('#39'E'#39'),'
      
        '                                                                ' +
        '                                          12),'
      
        '                                                                ' +
        '                  cobranza.get_ultperiododevengado('#39'E'#39'), '#39'S'#39'),'
      '              0) deudaadmitida,'
      '       /* Documentaci'#243'n */'
      
        '       DECODE(ex_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_expedient' +
        'e, DECODE(de_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_denuncia,'
      
        '       DECODE(pi_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_ingreso, ' +
        'DECODE(pe_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_egreso,'
      
        '       DECODE(sa_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_otros, DE' +
        'CODE(dg_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_denunciagrave,'
      
        '       DECODE(pv_fecharecepcion, NULL, '#39'No'#39', '#39'Si'#39') doc_evolutivo' +
        ', ex_fecharecepcion'
      
        '  FROM sex_expedientes sex, art.cdg_diagnostico cdg, art.cpr_pre' +
        'stador cpr, cmp_empresas, ctj_trabajador, SIN.sta_tipoaccidente,'
      
        '       SIN.sse_siniestroestado, SIN.sct_causaterminacion, cpv_pr' +
        'ovincias cpv_cmp, cpv_provincias cpv_ctj,'
      
        '       cpv_provincias cpv_sud, SIN.sud_ubicaciondenuncia, SIN.st' +
        'g_tipogravedad, SIN.sla_lesionagente, SIN.slf_lesionforma,'
      
        '       SIN.sln_lesionnaturaleza, SIN.slz_lesionzona, SIN.spi_par' +
        'tedeingreso, SIN.spe_partedeegreso, SIN.spa_partedeauditoria,'
      
        '       sin_incapacidsin, SIN.sde_denuncia, SIN.ssa_solicitudasis' +
        'tencia, SIN.sdg_denunciagrave, spv_parteevolutivo'
      ' WHERE ex_id = :idexpediente'
      '   AND cpv_sud.pv_codigo(+) = ud_provincia'
      '   AND cpv_cmp.pv_codigo(+) = mp_provincia_post'
      '   AND cpv_ctj.pv_codigo(+) = tj_provincia'
      
        '   AND cpr.ROWID(+) = art.SIN.get_prestadorid(ex_siniestro, ex_o' +
        'rden, ex_recaida)'
      '   AND se_codigo = ex_estado'
      '   AND ta_codigo(+) = ex_tipo'
      '   AND tg_codigo(+) = ex_gravedad'
      '   AND cdg.dg_codigo(+) = ex_diagnosticooms'
      '   AND mp_cuit = ex_cuit'
      '   AND tj_cuil = ex_cuil'
      '   AND ct_codigo(+) = ex_causafin'
      '   AND ud_idexpediente(+) = ex_id'
      '   AND pi_idexpediente(+) = ex_id'
      '   AND pe_idexpediente(+) = ex_id'
      '   AND de_idexpediente(+) = ex_id'
      '   AND sa_idexpediente(+) = ex_id'
      '   AND dg_idexpediente(+) = ex_id'
      '   AND la_id(+) = ex_idagente'
      '   AND lf_id(+) = ex_idforma'
      '   AND ln_id(+) = ex_idnaturaleza'
      '   AND lz_id(+) = ex_idzona'
      '   AND (   dg_nroparte = (SELECT MAX(dg_nroparte)'
      '                            FROM SIN.sdg_denunciagrave'
      '                           WHERE dg_idexpediente = ex_id)'
      '        OR dg_nroparte IS NULL)'
      '   AND pv_idexpediente(+) = ex_id'
      '   AND (   pv_nroparte = (SELECT MAX(pv_nroparte)'
      '                            FROM spv_parteevolutivo'
      '                           WHERE pv_idexpediente = ex_id)'
      '        OR pv_nroparte IS NULL)'
      '   AND pa_idexpediente(+) = ex_id'
      '   AND (   pa_nroparte = (SELECT MAX(pa_nroparte)'
      '                            FROM SIN.spa_partedeauditoria'
      '                           WHERE pa_idexpediente = ex_id)'
      '        OR pa_nroparte IS NULL)'
      '   AND si_idexpediente(+) = ex_id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEXPEDIENTE'
        ParamType = ptInput
        Value = 0
      end>
    object sdqReporteOCURRENCIAS: TFloatField
      FieldName = 'OCURRENCIAS'
    end
    object sdqReporteMEDIACIONES: TStringField
      FieldName = 'MEDIACIONES'
      Size = 4000
    end
    object sdqReporteHAY_MULTIPLES: TStringField
      FieldName = 'HAY_MULTIPLES'
      Size = 1
    end
    object sdqReporteHAY_RECAIDAS: TStringField
      FieldName = 'HAY_RECAIDAS'
      Size = 1
    end
    object sdqReporteES_PLURIEMPLEO: TStringField
      FieldName = 'ES_PLURIEMPLEO'
      Size = 1
    end
    object sdqReporteHOY: TDateTimeField
      FieldName = 'HOY'
    end
    object sdqReporteESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 100
    end
    object sdqReporteTIPO: TStringField
      FieldName = 'TIPO'
      Size = 25
    end
    object sdqReporteGRAVEDAD: TStringField
      FieldName = 'GRAVEDAD'
      Size = 25
    end
    object sdqReporteEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqReporteEX_HORAACCIDENTE: TStringField
      FieldName = 'EX_HORAACCIDENTE'
      Size = 5
    end
    object sdqReporteEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object sdqReporteSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqReporteEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqReporteEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqReporteEX_BREVEDESCRIPCION: TStringField
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqReporteEX_OBSERVACIONES: TStringField
      FieldName = 'EX_OBSERVACIONES'
      Size = 250
    end
    object sdqReporteJUICIO: TStringField
      FieldName = 'JUICIO'
      Size = 4000
    end
    object sdqReporteCAUSAFIN: TStringField
      FieldName = 'CAUSAFIN'
      Size = 100
    end
    object sdqReporteEMPRESA_DOMICILIO: TStringField
      FieldName = 'EMPRESA_DOMICILIO'
      Size = 4000
    end
    object sdqReporteEMPRESA_NOMBRE: TStringField
      FieldName = 'EMPRESA_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqReporteEMPRESA_TELEFONOS: TStringField
      FieldName = 'EMPRESA_TELEFONOS'
      Size = 60
    end
    object sdqReporteEMPRESA_LOCALIDAD: TStringField
      FieldName = 'EMPRESA_LOCALIDAD'
      Required = True
      Size = 60
    end
    object sdqReporteEMPRESA_CPOSTAL: TStringField
      FieldName = 'EMPRESA_CPOSTAL'
      Required = True
      Size = 5
    end
    object sdqReporteEMPRESA_PROVINCIA: TStringField
      FieldName = 'EMPRESA_PROVINCIA'
      Size = 50
    end
    object sdqReporteTRABAJADOR_DOMICILIO: TStringField
      FieldName = 'TRABAJADOR_DOMICILIO'
      Size = 4000
    end
    object sdqReporteTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqReporteTJ_LOCALIDAD: TStringField
      FieldName = 'TJ_LOCALIDAD'
      Size = 85
    end
    object sdqReporteTJ_CPOSTAL: TStringField
      FieldName = 'TJ_CPOSTAL'
      Size = 5
    end
    object sdqReporteTRABAJADOR_PROVINCIA: TStringField
      FieldName = 'TRABAJADOR_PROVINCIA'
      Size = 50
    end
    object sdqReporteDENUNCIA_DOMICILIO: TStringField
      FieldName = 'DENUNCIA_DOMICILIO'
      Size = 4000
    end
    object sdqReporteDENUNCIA_NOMBRE: TStringField
      FieldName = 'DENUNCIA_NOMBRE'
      Size = 100
    end
    object sdqReporteDENUNCIA_CPOSTAL: TStringField
      FieldName = 'DENUNCIA_CPOSTAL'
      Size = 5
    end
    object sdqReporteDENUNCIA_CPOSTALA: TStringField
      FieldName = 'DENUNCIA_CPOSTALA'
      Size = 8
    end
    object sdqReporteDENUNCIA_LOCALIDAD: TStringField
      FieldName = 'DENUNCIA_LOCALIDAD'
      Size = 60
    end
    object sdqReporteDENUNCIA_TELEFONOS: TStringField
      FieldName = 'DENUNCIA_TELEFONOS'
      Size = 4000
    end
    object sdqReporteDENUNCIA_PROVINCIA: TStringField
      FieldName = 'DENUNCIA_PROVINCIA'
      Size = 50
    end
    object sdqReportePRESTADOR_DOMICILIO: TStringField
      FieldName = 'PRESTADOR_DOMICILIO'
      Size = 4000
    end
    object sdqReportePRESTADOR_NOMBRE: TStringField
      FieldName = 'PRESTADOR_NOMBRE'
      Size = 150
    end
    object sdqReportePRESTADOR_TELEFONO: TStringField
      FieldName = 'PRESTADOR_TELEFONO'
      Size = 50
    end
    object sdqReportePI_DIASBAJAPREVISTOS: TFloatField
      FieldName = 'PI_DIASBAJAPREVISTOS'
    end
    object sdqReportePI_DIAGNOSTICO: TStringField
      FieldName = 'PI_DIAGNOSTICO'
      Size = 250
    end
    object sdqReporteEX_IDDIAGNOSTICO: TFloatField
      FieldName = 'EX_IDDIAGNOSTICO'
    end
    object sdqReportePE_DIASBAJATOTALES: TFloatField
      FieldName = 'PE_DIASBAJATOTALES'
    end
    object sdqReportePE_DIAGNOSTICO: TStringField
      FieldName = 'PE_DIAGNOSTICO'
      Size = 250
    end
    object sdqReporteEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqReporteFORMA: TStringField
      FieldName = 'FORMA'
      Size = 250
    end
    object sdqReporteAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 250
    end
    object sdqReporteNATURALEZA: TStringField
      FieldName = 'NATURALEZA'
      Size = 250
    end
    object sdqReporteZONA: TStringField
      FieldName = 'ZONA'
      Size = 250
    end
    object sdqReporteEX_BREVEDESCRIPCION_1: TStringField
      FieldName = 'EX_BREVEDESCRIPCION_1'
      Size = 250
    end
    object sdqReporteEX_OBSERVACIONES_1: TStringField
      FieldName = 'EX_OBSERVACIONES_1'
      Size = 250
    end
    object sdqReporteEX_DIAGNOSTICOOMS: TStringField
      FieldName = 'EX_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqReporteEX_PRESTADOR: TFloatField
      FieldName = 'EX_PRESTADOR'
    end
    object sdqReportePA_FECHACONTROL: TDateTimeField
      FieldName = 'PA_FECHACONTROL'
    end
    object sdqReporteCALIDADAUDITORIA: TStringField
      FieldName = 'CALIDADAUDITORIA'
      Size = 1
    end
    object sdqReportePA_MEDICO: TStringField
      FieldName = 'PA_MEDICO'
      Size = 30
    end
    object sdqReporteEX_PLURIEMPLEO: TStringField
      FieldName = 'EX_PLURIEMPLEO'
      Size = 1
    end
    object sdqReporteDG_DESCRIPCION: TStringField
      FieldName = 'DG_DESCRIPCION'
      Size = 100
    end
    object sdqReporteDG_INCAPACIDADLEVE: TFloatField
      FieldName = 'DG_INCAPACIDADLEVE'
    end
    object sdqReporteDG_INCAPACIDADMODERADO: TFloatField
      FieldName = 'DG_INCAPACIDADMODERADO'
    end
    object sdqReporteDG_INCAPACIDADGRAVE: TFloatField
      FieldName = 'DG_INCAPACIDADGRAVE'
    end
    object sdqReporteDG_DIASLEVE: TFloatField
      FieldName = 'DG_DIASLEVE'
    end
    object sdqReporteDG_DIASMODERADO: TFloatField
      FieldName = 'DG_DIASMODERADO'
    end
    object sdqReporteDG_DIASGRAVE: TFloatField
      FieldName = 'DG_DIASGRAVE'
    end
    object sdqReporteDIASBAJA: TFloatField
      FieldName = 'DIASBAJA'
    end
    object sdqReporteEXISTEINCAPACIDAD: TStringField
      FieldName = 'EXISTEINCAPACIDAD'
      Size = 2
    end
    object sdqReporteGRADO: TStringField
      FieldName = 'GRADO'
      Size = 7
    end
    object sdqReporteCARACTER: TStringField
      FieldName = 'CARACTER'
      Size = 10
    end
    object sdqReporteGRANINVALIDEZ: TStringField
      FieldName = 'GRANINVALIDEZ'
      Size = 2
    end
    object sdqReporteHOMOLOGADO: TStringField
      FieldName = 'HOMOLOGADO'
      Size = 2
    end
    object sdqReporteFECHAHOMOLOGADO: TDateTimeField
      FieldName = 'FECHAHOMOLOGADO'
    end
    object sdqReporteSI_PORCPROVI: TFloatField
      FieldName = 'SI_PORCPROVI'
    end
    object sdqReporteSI_PORCDEF: TFloatField
      FieldName = 'SI_PORCDEF'
    end
    object sdqReportePRESUPINCAP: TStringField
      FieldName = 'PRESUPINCAP'
      Size = 1
    end
    object sdqReporteCUOTAPROMEDIO: TFloatField
      FieldName = 'CUOTAPROMEDIO'
    end
    object sdqReporteDEUDA: TFloatField
      FieldName = 'DEUDA'
    end
    object sdqReporteDEUDAADMITIDA: TFloatField
      FieldName = 'DEUDAADMITIDA'
    end
    object sdqReporteDOC_EXPEDIENTE: TStringField
      FieldName = 'DOC_EXPEDIENTE'
      Size = 2
    end
    object sdqReporteDOC_DENUNCIA: TStringField
      FieldName = 'DOC_DENUNCIA'
      Size = 2
    end
    object sdqReporteDOC_INGRESO: TStringField
      FieldName = 'DOC_INGRESO'
      Size = 2
    end
    object sdqReporteDOC_EGRESO: TStringField
      FieldName = 'DOC_EGRESO'
      Size = 2
    end
    object sdqReporteDOC_OTROS: TStringField
      FieldName = 'DOC_OTROS'
      Size = 2
    end
    object sdqReporteDOC_DENUNCIAGRAVE: TStringField
      FieldName = 'DOC_DENUNCIAGRAVE'
      Size = 2
    end
    object sdqReporteDOC_EVOLUTIVO: TStringField
      FieldName = 'DOC_EVOLUTIVO'
      Size = 2
    end
    object sdqReporteTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 4000
    end
    object sdqReporteEX_FECHARECEPCION: TDateTimeField
      FieldName = 'EX_FECHARECEPCION'
    end
  end
  object sdqLiquidaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '/* Liquidaciones ILT/ILP */'
      
        'SELECT   '#39'A'#39' AS tipo, le_numliqui AS numliqui, art.liq.get_tipol' +
        'iquidacion(le_siniestro, le_orden, le_recaida, le_numliqui) AS d' +
        'escripcion, TO_CHAR(NULL) AS descripcion_extra, le_imporperi AS ' +
        'importe,'
      
        '         le_fechades AS desde, le_fechahas AS hasta, le_fproceso' +
        ' AS proceso, le_femision AS emision, le_faprobado AS aprobado, '#39 +
        'P. Dinerarias'#39' as origen'
      '    FROM sle_liquiempsin, art.sex_expedientes'
      '   WHERE le_siniestro = ex_siniestro'
      '     AND le_orden = ex_orden'
      '     AND le_recaida = ex_recaida'
      '     AND ex_id = :idexpediente'
      'UNION ALL'
      '/* Liquidaciones otros conceptos */'
      
        'SELECT   '#39'B'#39' AS tipo, pr_numpago AS numliqui, NVL(cp_titpago, cp' +
        '_denpago) || '#39'('#39' || pr_conpago || '#39')'#39' AS descripcion,'
      
        '         art.liq.get_acreedor(pr_acreedor, pr_cuitcuil, pr_prest' +
        'adorsecuencia, pr_prestadormutual) AS descripcion_extra, pr_impo' +
        'rpago AS importe, TO_DATE(NULL) AS desde, TO_DATE(NULL) AS hasta' +
        ','
      
        '         pr_fmodif AS proceso, pr_fmodif AS emision, pr_faprobad' +
        'o AS aprobado, '#39'Otros Pagos'#39' as origen'
      '    FROM spr_pagoexpesin, scp_conpago, art.sex_expedientes'
      '   WHERE pr_siniestro = ex_siniestro'
      '     AND pr_orden = ex_orden'
      '     AND pr_recaida = ex_recaida'
      '     AND pr_conpago = cp_conpago(+)'
      '     AND ex_id = :idexpediente'
      'UNION ALL'
      '/* Liquidaciones prestaciones m'#233'dicas */'
      
        'SELECT   '#39'C'#39' AS tipo, iv_numpago AS numliqui, cp_denpago AS desc' +
        'ripcion, TO_CHAR(NULL) AS descripcion_extra, iv_impfacturado AS ' +
        'importe, TO_DATE(NULL) AS desde, TO_DATE(NULL) AS hasta,'
      
        '         iv_fecalta AS proceso, iv_fecalta AS emision, vo_fechap' +
        'ro AS aprobado, '#39'P. M'#233'dicas'#39' as origen'
      
        '    FROM siv_itemvolante, svo_volantes, scp_conpago, art.sex_exp' +
        'edientes'
      '   WHERE iv_siniestro = ex_siniestro'
      '     AND iv_orden = ex_orden'
      '     AND iv_recaida = ex_recaida'
      '     AND iv_conpago = cp_conpago(+)'
      '     AND iv_volante = vo_volante(+)'
      '     AND NVL(vo_estado, '#39' '#39') IN ('#39'E'#39', '#39'EG'#39', '#39'EAM'#39', '#39'EM'#39', '#39'EAG'#39')'
      '     AND iv_estado NOT IN('#39'X'#39', '#39'Z'#39')'
      '     AND ex_id = :idexpediente'
      'UNION ALL'
      '/* Liquidaciones de legales */'
      
        'SELECT   '#39'D'#39' AS tipo, pl_numpago AS numliqui, NVL(cp_titpago, cp' +
        '_denpago) || '#39'('#39' || pl_conpago || '#39')'#39' AS descripcion, TO_CHAR(NU' +
        'LL) AS descripcion_extra,'
      
        '         NVL(pl_importeconretencion, 0) + NVL(pl_importepago, 0)' +
        ' AS importe, TO_DATE(NULL) AS desde, TO_DATE(NULL) AS hasta, TRU' +
        'NC(NVL(pl_fechamodif, pl_fechaalta)) AS proceso,'
      
        '         pl_fechaemision AS emision, TRUNC(pl_fechaaprobado) AS ' +
        'aprobado, '#39'Juicios'#39' as origen'
      
        '    FROM art.scp_conpago, legales.lsj_siniestrosjuicioentramite ' +
        'sj, legales.lod_origendemanda od, legales.ljt_juicioentramite jt' +
        ', legales.lpl_pagolegal lpl'
      '   WHERE od.od_id = sj.sj_idorigendemanda'
      '     AND jt.jt_id = od.od_idjuicioentramite'
      '     AND lpl.pl_idjuicioentramite = od.od_idjuicioentramite'
      '     AND pl_estado <> '#39'C'#39
      '     AND sj_idsiniestro = :idexpediente'
      '     AND pl_conpago = cp_conpago'
      '     AND od.od_fechabaja IS NULL'
      '     AND sj.sj_fechabaja IS NULL'
      ''
      'UNION ALL '
      '/* Mediaciones */    '
      
        'SELECT   '#39'E'#39' AS tipo, lpm.pm_idliquidacion AS numliqui, NVL(cp_t' +
        'itpago, cp_denpago) AS descripcion, TO_CHAR(NULL) AS descripcion' +
        '_extra,'
      '           (NVL (lpm.pm_importepago, 0))'
      
        '         + (NVL (lpm.pm_importeconretencion, 0)) AS importe, TO_' +
        'DATE(NULL) AS desde, TO_DATE(NULL) AS hasta, '
      
        '         TRUNC(NVL(pm_fechamodif, pm_fechaalta)) AS proceso, pm_' +
        'fechaemision AS emision, TRUNC(pm_fechaaprobado) AS aprobado, '#39'M' +
        'ediaciones'#39' as origen'
      '    FROM legales.lpm_pagomediacion lpm,'
      '         art.scp_conpago,'
      '         legales.lme_mediacion'
      '   WHERE lpm.pm_conpago = cp_conpago'
      '     AND lpm.pm_estado IN ('#39'C'#39', '#39'E'#39')'
      '     AND pm_idmediacion = me_id'
      '     AND me_idexpediente = :idexpediente    '
      '     '
      'ORDER BY tipo, desde, numliqui')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexpediente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idexpediente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idexpediente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idexpediente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idexpediente'
        ParamType = ptInput
      end>
    object sdqLiquidacionesTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object sdqLiquidacionesNUMLIQUI: TFloatField
      FieldName = 'NUMLIQUI'
    end
    object sdqLiquidacionesDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 4000
    end
    object sdqLiquidacionesDESCRIPCION_EXTRA: TStringField
      FieldName = 'DESCRIPCION_EXTRA'
      Size = 4000
    end
    object sdqLiquidacionesIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      currency = True
    end
    object sdqLiquidacionesDESDE: TDateTimeField
      FieldName = 'DESDE'
    end
    object sdqLiquidacionesHASTA: TDateTimeField
      FieldName = 'HASTA'
    end
    object sdqLiquidacionesPROCESO: TDateTimeField
      FieldName = 'PROCESO'
    end
    object sdqLiquidacionesEMISION: TDateTimeField
      FieldName = 'EMISION'
    end
    object sdqLiquidacionesAPROBADO: TDateTimeField
      FieldName = 'APROBADO'
    end
    object sdqLiquidacionesORIGEN: TStringField
      FieldName = 'ORIGEN'
    end
  end
end
