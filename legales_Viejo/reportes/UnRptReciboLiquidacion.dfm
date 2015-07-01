object RptReciboLiquidacion: TRptReciboLiquidacion
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = sdqLiquidacion
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
  IDReport = 0
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    100.012500000000000000
    2794.000000000000000000
    100.012500000000000000
    2159.000000000000000000
    100.012500000000000000
    100.012500000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.OutputBin = Auto
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.ExtendedDuplex = 0
  PrinterSettings.UseStandardprinter = False
  PrinterSettings.UseCustomBinCode = False
  PrinterSettings.CustomBinCode = 0
  PrinterSettings.UseCustomPaperCode = False
  PrinterSettings.CustomPaperCode = 0
  PrinterSettings.PrintMetaFile = False
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Pixels
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsMaximized
  object qrbTitulo: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 329
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      870.479166666666800000
      1957.916666666667000000)
    BandType = rbTitle
    object QRShape4: TQRShape
      Left = 300
      Top = 268
      Width = 151
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333300000
        793.750000000000000000
        709.083333333333200000
        399.520833333333300000)
      Pen.Mode = pmBlack
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape1: TQRShape
      Left = 0
      Top = 69
      Width = 739
      Height = 180
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        476.250000000000000000
        0.000000000000000000
        182.562500000000000000
        1955.270833333333000000)
      Pen.Width = 2
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrlLiquidacionNumero: TQRLabel
      Left = 8
      Top = 78
      Width = 95
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        21.166666666666670000
        206.375000000000000000
        251.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Liquidaci'#243'n N'#186':'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLDetalleJuicio: TQRLabel
      Left = 8
      Top = 103
      Width = 84
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        21.166666666666670000
        272.520833333333400000
        222.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Detalle Juicio:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLCaratula: TQRLabel
      Left = 8
      Top = 136
      Width = 55
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        21.166666666666670000
        359.833333333333400000
        145.520833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Car'#225'tula:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLJurisdiccion: TQRLabel
      Left = 8
      Top = 178
      Width = 74
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        21.166666666666670000
        470.958333333333400000
        195.791666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Jurisdicci'#243'n:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLJuzgado: TQRLabel
      Left = 8
      Top = 199
      Width = 53
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        21.166666666666670000
        526.520833333333400000
        140.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Juzgado:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbJuzgado: TQRDBText
      Left = 112
      Top = 199
      Width = 226
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        296.333333333333400000
        526.520833333333400000
        597.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'JT_JUZGADO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbJurisdiccion: TQRDBText
      Left = 112
      Top = 178
      Width = 226
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        296.333333333333400000
        470.958333333333400000
        597.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'JT_JURISDICCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbCaratula: TQRDBText
      Left = 112
      Top = 157
      Width = 621
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        296.333333333333400000
        415.395833333333400000
        1643.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'JT_CARATULA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbIdJuicioEnTramite: TQRDBText
      Left = 112
      Top = 99
      Width = 193
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.083333333333340000
        296.333333333333400000
        261.937500000000000000
        510.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'JT_NUMEROCARPETA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 18
    end
    object qrdbNroLiquidacion: TQRDBText
      Left = 112
      Top = 78
      Width = 193
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        296.333333333333400000
        206.375000000000000000
        510.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'PL_ID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLFuero: TQRLabel
      Left = 342
      Top = 178
      Width = 40
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        904.875000000000000000
        470.958333333333400000
        105.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fuero:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLSecretaria: TQRLabel
      Left = 342
      Top = 199
      Width = 65
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        904.875000000000000000
        526.520833333333400000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Secretaria:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbSecretaria: TQRDBText
      Left = 411
      Top = 199
      Width = 322
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333300000
        1087.437500000000000000
        526.520833333333400000
        851.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'JT_SECRETARIA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbFuero: TQRDBText
      Left = 411
      Top = 178
      Width = 322
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        1087.437500000000000000
        470.958333333333400000
        851.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'JT_FUERO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRShape2: TQRShape
      Left = 294
      Top = 262
      Width = 151
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333300000
        777.875000000000000000
        693.208333333333200000
        399.520833333333300000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrlTitulo: TQRLabel
      Left = 328
      Top = 271
      Width = 83
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        66.145833333333340000
        867.833333333333500000
        717.020833333333400000
        219.604166666666700000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = 'RECIBO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 16
    end
    object QRDBText1: TQRDBText
      Left = 112
      Top = 136
      Width = 621
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        296.333333333333400000
        359.833333333333400000
        1643.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'AUTOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel2: TQRLabel
      Left = 8
      Top = 220
      Width = 49
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        21.166666666666670000
        582.083333333333400000
        129.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Estudio:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRDBText3: TQRDBText
      Left = 112
      Top = 220
      Width = 226
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        296.333333333333400000
        582.083333333333400000
        597.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'ESTUDIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qriLogo: TQRImage
      Left = 574
      Top = 2
      Width = 163
      Height = 64
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        169.333333333333300000
        1518.708333333333000000
        5.291666666666667000
        431.270833333333400000)
      Stretch = True
    end
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 367
    Width = 740
    Height = 477
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      1262.062500000000000000
      1957.916666666667000000)
    BandType = rbDetail
    object QRLabel1: TQRLabel
      Left = 12
      Top = 72
      Width = 286
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        31.750000000000000000
        190.500000000000000000
        756.708333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Recib'#237' de PROVINCIA ART, la cantidad de $'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbTotal: TQRDBText
      Left = 309
      Top = 72
      Width = 145
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        817.562500000000000000
        190.500000000000000000
        383.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'TOTAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      Mask = '######0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRDBText2: TQRDBText
      Left = 12
      Top = 135
      Width = 703
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        31.750000000000000000
        357.187500000000000000
        1860.020833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'DETALLE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrl: TQRLabel
      Left = 12
      Top = 174
      Width = 703
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333300000
        31.750000000000000000
        460.375000000000000000
        1860.020833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Queda entendido y convenido que, con este pago, PROVINCIA ART ca' +
        'ncela el importe total, no teniendo nada m'#225's que reclamar.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrlCantidadEnLetras: TQRLabel
      Left = 12
      Top = 93
      Width = 703
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        31.750000000000000000
        246.062500000000000000
        1860.020833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '()'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      OnPrint = qrlCantidadEnLetrasPrint
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRShape3: TQRShape
      Left = 462
      Top = 448
      Width = 237
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        1222.375000000000000000
        1185.333333333333000000
        627.062500000000000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel3: TQRLabel
      Left = 527
      Top = 450
      Width = 116
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        1394.354166666667000000
        1190.625000000000000000
        306.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Firma y Aclaraci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRExpr1: TQRExpr
      Left = 12
      Top = 114
      Width = 526
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        31.750000000000000000
        301.625000000000000000
        1391.708333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        #39'en concepto de cancelacion de factura N'#186#39' + sdqLiquidacion.NROF' +
        'ACTURA + '#39' por'#39
      FontSize = 12
    end
    object QRSysData1: TQRSysData
      Left = 15
      Top = 393
      Width = 129
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        39.687500000000000000
        1039.812500000000000000
        341.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDate
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Text = 'Buenos Aires, '
      Transparent = False
      FontSize = 12
    end
    object qrlChequesANombreDe: TQRLabel
      Left = 12
      Top = 225
      Width = 142
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        31.750000000000000000
        595.312500000000000000
        375.708333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Cheques a Nombre de:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object qrdbChequeANombreDe: TQRDBText
      Left = 159
      Top = 225
      Width = 556
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        420.687500000000000000
        595.312500000000000000
        1471.083333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqLiquidacion
      DataField = 'PL_CHEQUENOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
  object sdqLiquidacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT lpl.*, ljt.*,'
      '          lpl.pl_letrafactura'
      '       || '#39'-'#39
      '       || lpl.pl_situacionfactura'
      '       || '#39'-'#39
      '       || lpl.pl_numerofactura AS nrofactura,'
      '       NVL (lpl.pl_importepago, 0)'
      '       + NVL (lpl.pl_importeconretencion, 0) total,'
      '       f.fu_descripcion jt_fuero,'
      
        '       jz.jz_descripcion jt_juzgado, ju.ju_descripcion jt_jurisd' +
        'iccion,'
      '       s.sc_descripcion jt_secretaria,'
      '       (jt_demandante || '#39' C/ '#39' || jt_demandado) autos,'
      '       lbo.bo_nombre estudio, lpl.pl_comentario detalle'
      '  FROM legales.lbo_abogado lbo,'
      '       legales.ljt_juicioentramite ljt,'
      '       legales.v_lpl_pagolegal lpl,'
      '       legales.lfu_fuero f,'
      '       legales.ljz_juzgado jz,'
      '       legales.lju_jurisdiccion ju,'
      '       legales.lsc_secretaria s'
      ' WHERE ljt.jt_id = lpl.pl_idjuicioentramite'
      '   AND lpl.pl_id = :idpagolegal'
      '   AND jz.jz_id(+) = ljt.jt_idjuzgado'
      '   AND f.fu_id(+) = jz.jz_idfuero'
      '   AND ju.ju_id(+) = jz.jz_idjurisdiccion'
      '   AND s.sc_idjuzgado(+) = jz.jz_id'
      '   AND s.sc_id = JT_IDSECRETARIA'
      '   AND ljt.jt_idabogado = lbo.bo_id'
      '')
    Left = 34
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPAGOLEGAL'
        ParamType = ptInput
        Value = '24'
      end>
  end
end
