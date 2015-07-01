inherited qrSiniestralidad: TqrSiniestralidad
  Width = 1056
  Height = 816
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  DataSet = sdqDatos
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Orientation = poLandscape
  Page.Values = (
    50.000000000000000000
    2159.000000000000000000
    50.000000000000000000
    2794.000000000000000000
    50.000000000000000000
    50.000000000000000000
    0.000000000000000000)
  ReportTitle = 'Informe de Siniestralidad'
  PreviewInitialState = wsMaximized
  PreviewWidth = 780
  PreviewHeight = 580
  inherited qrbPageHeader: TQRBand
    Left = 19
    Top = 19
    Width = 1018
    Height = 88
    Size.Values = (
      232.833333333333400000
      2693.458333333333000000)
    inherited qriLogoART: TQRImage
      Left = 834
      Top = 16
      Width = 164
      Size.Values = (
        169.333333333333300000
        2206.625000000000000000
        42.333333333333340000
        433.916666666666800000)
    end
    object QRLabel1: TQRLabel
      Left = 402
      Top = 5
      Width = 214
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666670000
        1063.625000000000000000
        13.229166666666670000
        566.208333333333400000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'INFORME DE SINIESTRALIDAD'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 98
      Top = 48
      Width = 88
      Height = 13
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        259.291666666666700000
        127.000000000000000000
        232.833333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CORTE_CONTROL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlTitFAcciDesde: TQRLabel
      Left = 10
      Top = 59
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        26.458333333333330000
        156.104166666666700000
        476.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de accidente mayor o igual al'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlFacciDesde: TQRLabel
      Left = 190
      Top = 59
      Width = 69
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        502.708333333333400000
        156.104166666666700000
        182.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFacciDesde'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlFacciHasta: TQRLabel
      Left = 190
      Top = 71
      Width = 68
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        502.708333333333400000
        187.854166666666700000
        179.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFacciHasta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlTitFAcciHasta: TQRLabel
      Left = 10
      Top = 71
      Width = 180
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        26.458333333333330000
        187.854166666666700000
        476.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de accidente menor o igual al'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlCorteControl: TQRLabel
      Left = 10
      Top = 48
      Width = 84
      Height = 13
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        26.458333333333330000
        127.000000000000000000
        222.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Corte de Control'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object qrlEmpresa: TQRLabel
      Left = 10
      Top = 8
      Width = 58
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        26.458333333333330000
        21.166666666666670000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlEmpresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  inherited qrbTitle: TQRBand
    Left = 19
    Top = 107
    Width = 1018
    Height = 55
    Enabled = False
    Size.Values = (
      145.520833333333300000
      2693.458333333333000000)
    inherited qrlReferencia: TQRLabel
      Left = 600
      Top = 30
      Height = 20
      Size.Values = (
        52.916666666666660000
        1587.500000000000000000
        79.375000000000000000
        89.958333333333340000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 636
      Top = 32
      Width = 332
      Height = 20
      Size.Values = (
        52.916666666666660000
        1682.750000000000000000
        84.666666666666680000
        878.416666666666800000)
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Left = 10
      Top = 30
      Height = 20
      Size.Values = (
        52.916666666666670000
        26.458333333333330000
        79.375000000000000000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Left = 10
      Top = 10
      Height = 20
      Size.Values = (
        52.916666666666670000
        26.458333333333330000
        26.458333333333330000
        142.875000000000000000)
      FontSize = 10
    end
    inherited qrlFecha: TQRLabel
      Left = 712
      Top = 10
      Height = 20
      Size.Values = (
        52.916666666666660000
        1883.833333333333000000
        26.458333333333330000
        682.625000000000000000)
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Left = 19
    Top = 3329
    Width = 1018
    Height = 75
    Enabled = False
    Size.Values = (
      198.437500000000000000
      2693.458333333333000000)
    inherited qrmDatosART: TQRMemo
      Top = 4
      Height = 68
      Size.Values = (
        179.916666666666700000
        10.583333333333330000
        10.583333333333330000
        764.645833333333400000)
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Left = 880
      Size.Values = (
        148.166666666666700000
        2328.333333333333000000
        42.333333333333340000
        256.645833333333400000)
    end
  end
  inherited qrbSummary: TQRBand
    Left = 19
    Top = 3309
    Width = 1018
    Height = 20
    Enabled = False
    Size.Values = (
      52.916666666666670000
      2693.458333333333000000)
    inherited qrlSaludoFinal: TQRLabel
      Left = 10
      Top = 35
      Width = 370
      Height = 20
      Enabled = False
      Size.Values = (
        52.916666666666660000
        26.458333333333330000
        92.604166666666680000
        978.958333333333500000)
      FontSize = 10
    end
  end
  object DetailBand1: TQRBand [4]
    Left = 19
    Top = 239
    Width = 1018
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.687500000000000000
      2693.458333333333000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 120
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        317.500000000000000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CANTIDAD_INITINERE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 172
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        455.083333333333300000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DIAS_CAIDOS_INITINERE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 268
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        709.083333333333400000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'LEVES_INITINERE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 6
      Top = 0
      Width = 92
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        15.875000000000000000
        0.000000000000000000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'PERIODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText5: TQRDBText
      Left = 312
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        825.500000000000100000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'GRAVE_INITINERE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 356
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        941.916666666666800000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'MORTAL_INITINERE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr2: TQRExpr
      Left = 220
      Top = 0
      Width = 39
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        582.083333333333400000
        0.000000000000000000
        103.187500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'AVERAGE(sdqDatos.DIAS_CAIDOS_INITINERE / sdqDatos.CANTIDAD_INITI' +
        'NERE)'
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 412
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1090.083333333333000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CANTIDAD_INSITU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 464
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1227.666666666667000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DIAS_CAIDOS_INSITU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 560
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1481.666666666667000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'LEVES_INSITU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 604
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1598.083333333333000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'GRAVE_INSITU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 648
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1714.500000000000000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'MORTAL_INSITU'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr3: TQRExpr
      Left = 512
      Top = 0
      Width = 39
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1354.666666666667000000
        0.000000000000000000
        103.187500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'AVERAGE(sdqDatos.DIAS_CAIDOS_INSITU / sdqDatos.CANTIDAD_INSITU)'
      FontSize = 8
    end
    object QRShape2: TQRShape
      Left = 96
      Top = 0
      Width = 5
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        254.000000000000000000
        0.000000000000000000
        13.229166666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText12: TQRDBText
      Left = 716
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1894.416666666667000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CANTIDAD_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 768
      Top = 0
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2032.000000000000000000
        0.000000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DIAS_CAIDOS_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr4: TQRExpr
      Left = 816
      Top = 0
      Width = 39
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2159.000000000000000000
        0.000000000000000000
        103.187500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'AVERAGE(sdqDatos.DIAS_CAIDOS_TOTAL / sdqDatos.CANTIDAD_TOTAL)'
      FontSize = 8
    end
    object QRShape6: TQRShape
      Left = 388
      Top = 0
      Width = 5
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1026.583333333333000000
        0.000000000000000000
        13.229166666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape7: TQRShape
      Left = 684
      Top = 0
      Width = 5
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1809.750000000000000000
        0.000000000000000000
        13.229166666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRExpr19: TQRExpr
      Left = 960
      Top = 0
      Width = 39
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2540.000000000000000000
        0.000000000000000000
        103.187500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(sdqDatos.EMPLEADOS = 0,0,sdqDatos.CANTIDAD_TOTAL/sdqDatos.EMP' +
        'LEADOS)*100'
      FontSize = 8
    end
  end
  object qrbEvolucionInItinere: TQRChildBand [5]
    Left = 19
    Top = 2389
    Width = 1018
    Height = 59
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clRed
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      156.104166666666700000
      2693.458333333333000000)
    ParentBand = qrbEvolucionDias
    object QRChartEvolucion: TQRChart
      Left = 4
      Top = 4
      Width = 485
      Height = 293
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      Size.Values = (
        775.229166666666800000
        10.583333333333330000
        10.583333333333330000
        1283.229166666667000000)
      object QRDBChart1: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de la'
          'Cantidad de Siniestros In Itinere')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        Chart3DPercent = 45
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Verdana'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de siniestros'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -11
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -11
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object Series1: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = sdqDatos
          SeriesColor = clRed
          Title = 'Evoluci'#243'n'
          XLabelsSource = 'PERIODO'
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INITINERE'
        end
      end
    end
    object QRChartEvolucionDiasCaidos: TQRChart
      Left = 492
      Top = 4
      Width = 481
      Height = 293
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      Size.Values = (
        775.229166666666800000
        1301.750000000000000000
        10.583333333333330000
        1272.645833333333000000)
      object QRDBChart2: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de la'
          'Cantidad de d'#237'as perdidos In Itinere')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        Chart3DPercent = 45
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.Title.Caption = 'Cantidad de d'#237'as perdidos'
        Legend.DividingLines.SmallDots = True
        object BarSeries1: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = sdqDatos
          SeriesColor = clRed
          Title = 'Evoluci'#243'n'
          XLabelsSource = 'PERIODO'
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_INITINERE'
        end
      end
    end
  end
  object qrbSiniestrosPorEstablecimiento: TQRChildBand [6]
    Left = 19
    Top = 1310
    Width = 1018
    Height = 47
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      124.354166666666700000
      2693.458333333333000000)
    ParentBand = qrbCantidadTotalSiniestros
    object QRChartSiniestrosEstablecimientos: TQRChart
      Left = 4
      Top = 4
      Width = 1005
      Height = 342
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        904.875000000000000000
        10.583333333333330000
        10.583333333333330000
        2659.062500000000000000)
      object QRDBChart3: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Siniestros por ***')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Establecimiento'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 45
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de siniestros'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object Series3: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454143
          Title = 'Siniestros in itinere'
          XLabelsSource = 'CLAVE'
          BarStyle = bsRectGradient
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INITINERE'
        end
        object Series4: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454016
          Title = 'Siniestros in situ'
          XLabelsSource = 'CLAVE'
          BarStyle = bsRectGradient
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INSITU'
        end
        object BarSeries2: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8421631
          Title = 'Total de siniestros'
          XLabelsSource = 'CLAVE'
          BarStyle = bsRectGradient
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_TOTAL'
        end
      end
    end
  end
  object qrbCorteControl: TQRGroup [7]
    Left = 19
    Top = 162
    Width = 1018
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = qrbCorteControlBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      58.208333333333340000
      2693.458333333333000000)
    Expression = 'sdqDatos.CORTE_CONTROL'
    FooterBand = qrbPieCorteControl
    Master = Owner
    ReprintOnNewPage = True
    object QRDBText15: TQRDBText
      Left = 6
      Top = 4
      Width = 108
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        15.875000000000000000
        10.583333333333330000
        285.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CORTE_CONTROL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText16: TQRDBText
      Left = 934
      Top = 4
      Width = 77
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2471.208333333333000000
        10.583333333333330000
        203.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EMPLEADOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 874
      Top = 4
      Width = 56
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2312.458333333333000000
        10.583333333333330000
        148.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Dotaci'#243'n:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbDiasPerdidos: TQRChildBand [8]
    Left = 19
    Top = 1701
    Width = 1018
    Height = 344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = EstablecimientoNoMuestraGrafico
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbEvolucionSiniestros
    object QRChartDiasPerdidos: TQRChart
      Left = 0
      Top = 0
      Width = 1017
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        0.000000000000000000
        0.000000000000000000
        2690.812500000000000000)
      object QRDBChart4: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'D'#237'as perdidos por ***')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -9
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 30
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de d'#237'as perdidos'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries7: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454143
          Title = 'In itinere'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_INITINERE'
        end
        object BarSeries8: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454016
          Title = 'In situ'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_INSITU'
        end
        object BarSeries6: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8421631
          Title = 'Total'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_TOTAL'
        end
      end
    end
  end
  object qrbIncidenciaDotacionDias: TQRChildBand [9]
    Left = 19
    Top = 2559
    Width = 1018
    Height = 62
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      164.041666666666700000
      2693.458333333333000000)
    ParentBand = qrbPieCorteControl
    object QRChartIncidenciaDotacionDias: TQRChart
      Left = 4
      Top = 4
      Width = 966
      Height = 534
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        1412.875000000000000000
        10.583333333333330000
        10.583333333333330000
        2555.875000000000000000)
      object QRDBChart5: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Incidencia de la dotaci'#243'n'
          'con respecto a los d'#237'as perdidos'
          'agrupado por Establecimiento')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Establecimiento'
        Chart3DPercent = 45
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de d'#237'as perdidos'
        Legend.DividingLines.SmallDots = True
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries12: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8454143
          Title = 'D'#237'as perdidos in itinere'
          ValueFormat = '##0.## %'
          XLabelsSource = 'PERIODO'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'DIAS_CAIDOS_INITINERE'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'LEVES_INITINERE'
        end
        object BarSeries13: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454016
          Title = 'D'#237'as perdidos in situ'
          ValueFormat = '##0.## %'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_INSITU_DIAS'
        end
        object BarSeries14: TBarSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8421631
          Title = 'Total de d'#237'as perdidos'
          ValueFormat = '##0.## %'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_TOTAL_DIAS'
        end
      end
    end
  end
  object qrbIncidenciaDotacionSiniestros: TQRChildBand [10]
    Left = 19
    Top = 278
    Width = 1018
    Height = 344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = EstablecimientoNoMuestraGrafico
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbSep1
    object QRChartIncidenciaDotacionSini: TQRChart
      Left = 0
      Top = 0
      Width = 1017
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        0.000000000000000000
        0.000000000000000000
        2690.812500000000000000)
      object QRDBChart6: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Incidencia de la dotaci'#243'n'
          'con respecto a la cantidad de siniestros'
          '-agrupado por Establecimiento-')
        BottomAxis.Axis.Width = 1
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -9
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Font.Charset = ANSI_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Verdana'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 30
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Axis.Width = 1
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.LabelsMultiLine = True
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Incidencia de la dotaci'#243'n'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries9: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454143
          Title = 'In itinere'
          ValueFormat = '##0.## %'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_INITINERE_SINI'
        end
        object BarSeries10: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8454016
          Title = 'In situ'
          ValueFormat = '##0.## %'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_INSITU_SINI'
        end
        object BarSeries11: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          SeriesColor = 8421631
          Title = 'Total'
          ValueFormat = '##0.## %'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_TOTAL_SINI'
        end
      end
    end
  end
  object qrbSep1: TQRChildBand [11]
    Left = 19
    Top = 270
    Width = 1018
    Height = 8
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
      21.166666666666670000
      2693.458333333333000000)
    ParentBand = qrbPieGrilla
  end
  object qrbLesion: TQRChildBand [12]
    Left = 19
    Top = 2621
    Width = 1018
    Height = 344
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
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbIncidenciaDotacionDias
    object QRChartLesion: TQRChart
      Left = 4
      Top = 0
      Width = 1005
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        10.583333333333330000
        0.000000000000000000
        2659.062500000000000000)
      object QRDBChart14: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Distribuci'#243'n por Lesi'#243'n')
        AxisVisible = False
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 45
        ClipPoints = False
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        Frame.Visible = False
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        object BarSeries23: TPieSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqLesion
          SeriesColor = 8421631
          Title = 'Lesi'#243'n'
          XLabelsSource = 'LN_DESCRIPCION'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1.000000000000000000
          PieValues.Order = loNone
          PieValues.ValueSource = 'CANTIDAD'
        end
      end
    end
  end
  object qrbEvolucionSiniestros: TQRChildBand [13]
    Left = 19
    Top = 1357
    Width = 1018
    Height = 344
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
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbSiniestrosPorEstablecimiento
    object QRChartEvolucionSiniestros: TQRChart
      Left = 0
      Top = 0
      Width = 1017
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        0.000000000000000000
        0.000000000000000000
        2690.812500000000000000)
      object QRDBChart13: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de Siniestros')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -9
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 30
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de siniestros'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object Series7: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8454143
          Title = 'In itinere'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INITINERE'
        end
        object Series6: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8454016
          Title = 'In situ'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INSITU'
        end
        object BarSeries20: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8421631
          Title = 'Total'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_TOTAL'
        end
      end
    end
  end
  object qrbEvolucion: TQRChildBand [14]
    Left = 19
    Top = 2500
    Width = 1018
    Height = 51
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      134.937500000000000000
      2693.458333333333000000)
    ParentBand = qrbEvolucionInSitu
    object QRChart1: TQRChart
      Left = 4
      Top = 1
      Width = 485
      Height = 293
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      Size.Values = (
        775.229166666666800000
        10.583333333333330000
        2.645833333333333000
        1283.229166666667000000)
      object QRDBChart7: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual Total de la'
          'Cantidad de Siniestros')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        Chart3DPercent = 45
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Verdana'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de siniestros'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -11
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -11
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries3: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = sdqDatos
          SeriesColor = clRed
          Title = 'Evoluci'#243'n'
          XLabelsSource = 'PERIODO'
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_TOTAL'
        end
      end
    end
    object QRChart2: TQRChart
      Left = 492
      Top = 1
      Width = 481
      Height = 293
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      Size.Values = (
        775.229166666666800000
        1301.750000000000000000
        2.645833333333333000
        1272.645833333333000000)
      object QRDBChart8: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual Total de la'
          'Cantidad de d'#237'as perdidos')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        Chart3DPercent = 45
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.Title.Caption = 'Cantidad de d'#237'as perdidos'
        Legend.DividingLines.SmallDots = True
        object BarSeries4: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = sdqDatos
          SeriesColor = clRed
          Title = 'Evoluci'#243'n'
          XLabelsSource = 'PERIODO'
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_TOTAL'
        end
      end
    end
  end
  object qrbEvolucionInSitu: TQRChildBand [15]
    Left = 19
    Top = 2448
    Width = 1018
    Height = 52
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      137.583333333333300000
      2693.458333333333000000)
    ParentBand = qrbEvolucionInItinere
    object QRChart3: TQRChart
      Left = 4
      Top = 1
      Width = 485
      Height = 293
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      Size.Values = (
        775.229166666666800000
        10.583333333333330000
        2.645833333333333000
        1283.229166666667000000)
      object QRDBChart9: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de la'
          'Cantidad de Siniestros In Situ')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -11
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        Chart3DPercent = 45
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -11
        LeftAxis.LabelsFont.Name = 'Verdana'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de siniestros'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -11
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -11
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries5: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = sdqDatos
          SeriesColor = clRed
          Title = 'Evoluci'#243'n'
          XLabelsSource = 'PERIODO'
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INSITU'
        end
      end
    end
    object QRChart4: TQRChart
      Left = 492
      Top = 1
      Width = 481
      Height = 293
      Frame.Color = clRed
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Style = psDot
      Size.Values = (
        775.229166666666800000
        1301.750000000000000000
        2.645833333333333000
        1272.645833333333000000)
      object QRDBChart10: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -16
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de la'
          'Cantidad de d'#237'as perdidos In Situ')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        Chart3DPercent = 45
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.Title.Caption = 'Cantidad de d'#237'as perdidos'
        Legend.DividingLines.SmallDots = True
        object BarSeries15: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Transparent = True
          Marks.Visible = True
          DataSource = sdqDatos
          SeriesColor = clRed
          Title = 'Evoluci'#243'n'
          XLabelsSource = 'PERIODO'
          BarStyle = bsRectGradient
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_INSITU'
        end
      end
    end
  end
  object qrbEncabezadoGrilla: TQRGroup [16]
    Left = 19
    Top = 184
    Width = 1018
    Height = 55
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      145.520833333333300000
      2693.458333333333000000)
    FooterBand = qrbPieGrilla
    Master = Owner
    ReprintOnNewPage = False
    object QRLabel22: TQRLabel
      Left = 10
      Top = 35
      Width = 44
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        26.458333333333330000
        92.604166666666680000
        116.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Per'#237'odo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 100
      Top = 35
      Width = 52
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        264.583333333333400000
        92.604166666666680000
        137.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 156
      Top = 24
      Width = 53
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        71.437500000000000000
        412.750000000000100000
        63.500000000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'D'#237'as perdidos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 270
      Top = 35
      Width = 28
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        714.375000000000000000
        92.604166666666680000
        74.083333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Leve'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel26: TQRLabel
      Left = 310
      Top = 35
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        820.208333333333400000
        92.604166666666680000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grave'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel27: TQRLabel
      Left = 350
      Top = 35
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        926.041666666666800000
        92.604166666666680000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Mortal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel28: TQRLabel
      Left = 205
      Top = 5
      Width = 65
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        542.395833333333400000
        13.229166666666670000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'IN ITINERE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 212
      Top = 24
      Width = 58
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        71.437500000000000000
        560.916666666666800000
        63.500000000000000000
        153.458333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Promedio d'#237'as'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel30: TQRLabel
      Left = 395
      Top = 35
      Width = 52
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1045.104166666667000000
        92.604166666666680000
        137.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel31: TQRLabel
      Left = 452
      Top = 24
      Width = 53
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        71.437500000000000000
        1195.916666666667000000
        63.500000000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'D'#237'as perdidos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel32: TQRLabel
      Left = 570
      Top = 35
      Width = 28
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1508.125000000000000000
        92.604166666666680000
        74.083333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Leve'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel33: TQRLabel
      Left = 605
      Top = 35
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1600.729166666667000000
        92.604166666666680000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Grave'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel34: TQRLabel
      Left = 650
      Top = 35
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1719.791666666667000000
        92.604166666666680000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Mortal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel35: TQRLabel
      Left = 510
      Top = 5
      Width = 46
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1349.375000000000000000
        13.229166666666670000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'IN SITU'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel36: TQRLabel
      Left = 508
      Top = 24
      Width = 58
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        71.437500000000000000
        1344.083333333333000000
        63.500000000000000000
        153.458333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Promedio d'#237'as'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape10: TQRShape
      Left = 95
      Top = 0
      Width = 6
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.166666666666700000
        251.354166666666700000
        0.000000000000000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel37: TQRLabel
      Left = 690
      Top = 35
      Width = 52
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1825.625000000000000000
        92.604166666666680000
        137.583333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel38: TQRLabel
      Left = 748
      Top = 24
      Width = 53
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        71.437500000000000000
        1979.083333333333000000
        63.500000000000000000
        140.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'D'#237'as perdidos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel39: TQRLabel
      Left = 810
      Top = 5
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        2143.125000000000000000
        13.229166666666670000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TOTAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel40: TQRLabel
      Left = 804
      Top = 24
      Width = 58
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        71.437500000000000000
        2127.250000000000000000
        63.500000000000000000
        153.458333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Promedio d'#237'as'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape11: TQRShape
      Left = 387
      Top = 0
      Width = 6
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.166666666666700000
        1023.937500000000000000
        0.000000000000000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape12: TQRShape
      Left = 683
      Top = 0
      Width = 6
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.166666666666700000
        1807.104166666667000000
        0.000000000000000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel3: TQRLabel
      Left = 936
      Top = 36
      Width = 77
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        2476.500000000000000000
        95.250000000000000000
        203.729166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Incidencia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbPieGrilla: TQRBand [17]
    Left = 19
    Top = 254
    Width = 1018
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.333333333333340000
      2693.458333333333000000)
    BandType = rbGroupFooter
    object QRExpr1: TQRExpr
      Left = 112
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        296.333333333333400000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.CANTIDAD_INITINERE)'
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 8
      Top = 0
      Width = 73
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        21.166666666666670000
        0.000000000000000000
        193.145833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'TOTALES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 96
      Top = -25
      Width = 5
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        254.000000000000000000
        -66.145833333333340000
        13.229166666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape8: TQRShape
      Left = 388
      Top = -25
      Width = 5
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        1026.583333333333000000
        -66.145833333333340000
        13.229166666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape9: TQRShape
      Left = 684
      Top = -25
      Width = 5
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        1809.750000000000000000
        -66.145833333333340000
        13.229166666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRExpr5: TQRExpr
      Left = 165
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        436.562499999999900000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.DIAS_CAIDOS_INITINERE)'
      FontSize = 8
    end
    object QRExpr6: TQRExpr
      Left = 220
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        582.083333333333400000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(SUM(sdqDatos.CANTIDAD_INITINERE) > 0, SUM(sdqDatos.DIAS_CAIDO' +
        'S_INITINERE) / SUM(sdqDatos.CANTIDAD_INITINERE), 0)'
      FontSize = 8
    end
    object QRExpr7: TQRExpr
      Left = 260
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        687.916666666666800000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(LEVES_INITINERE)'
      FontSize = 8
    end
    object QRExpr8: TQRExpr
      Left = 305
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        806.979166666666800000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(GRAVE_INITINERE)'
      FontSize = 8
    end
    object QRExpr9: TQRExpr
      Left = 350
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        926.041666666666800000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(MORTAL_INITINERE)'
      FontSize = 8
    end
    object QRExpr10: TQRExpr
      Left = 405
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1071.562500000000000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.CANTIDAD_INSITU)'
      FontSize = 8
    end
    object QRExpr11: TQRExpr
      Left = 456
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1206.500000000000000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.DIAS_CAIDOS_INSITU)'
      FontSize = 8
    end
    object QRExpr12: TQRExpr
      Left = 511
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1352.020833333333000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(SUM(sdqDatos.CANTIDAD_INSITU) > 0, SUM(sdqDatos.DIAS_CAIDOS_I' +
        'NSITU) / SUM(sdqDatos.CANTIDAD_INSITU), 0)'
      FontSize = 8
    end
    object QRExpr13: TQRExpr
      Left = 551
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1457.854166666667000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(LEVES_INSITU)'
      FontSize = 8
    end
    object QRExpr14: TQRExpr
      Left = 596
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1576.916666666667000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(GRAVE_INSITU)'
      FontSize = 8
    end
    object QRExpr15: TQRExpr
      Left = 641
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1695.979166666667000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(MORTAL_INSITU)'
      FontSize = 8
    end
    object QRExpr16: TQRExpr
      Left = 707
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1870.604166666667000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.CANTIDAD_TOTAL)'
      FontSize = 8
    end
    object QRExpr17: TQRExpr
      Left = 760
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2010.833333333333000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(sdqDatos.DIAS_CAIDOS_TOTAL)'
      FontSize = 8
    end
    object QRExpr18: TQRExpr
      Left = 815
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2156.354166666667000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = AjustoDecimales
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(SUM(sdqDatos.CANTIDAD_TOTAL) > 0, SUM(sdqDatos.DIAS_CAIDOS_TO' +
        'TAL) / SUM(sdqDatos.CANTIDAD_TOTAL), 0)'
      FontSize = 8
    end
    object QRExpr20: TQRExpr
      Left = 959
      Top = 0
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        2537.354166666667000000
        0.000000000000000000
        105.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Color = clWhite
      OnPrint = CargoConsultaEstablecimientos
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 
        'AVERAGE(SUM(IF(sdqDatos.EMPLEADOS = 0,0,sdqDatos.CANTIDAD_TOTAL/' +
        'sdqDatos.EMPLEADOS))*100)'
      FontSize = 8
    end
  end
  object qrbPieCorteControl: TQRBand [18]
    Left = 19
    Top = 2551
    Width = 1018
    Height = 8
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      21.166666666666670000
      2693.458333333333000000)
    BandType = rbGroupFooter
  end
  object qrbCantidadTotalSiniestros: TQRChildBand [19]
    Left = 19
    Top = 966
    Width = 1018
    Height = 344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = EstablecimientoNoMuestraGrafico
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbEvolucionIncidenciaSiniestros
    object QRChartCantidadSiniestros: TQRChart
      Left = 0
      Top = 0
      Width = 1017
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        0.000000000000000000
        0.000000000000000000
        2690.812500000000000000)
      object QRDBChart12: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Cantidad de siniestros')
        BottomAxis.Axis.Width = 1
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -9
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.LabelStyle = talText
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Font.Charset = ANSI_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Verdana'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 30
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Axis.Width = 1
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Cantidad de siniestros'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries17: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          PercentFormat = '##0.##'
          SeriesColor = 8454143
          Title = 'In itinere'
          ValueFormat = '##0.##'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INITINERE'
        end
        object BarSeries18: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          PercentFormat = '##0.##'
          SeriesColor = 8454016
          Title = 'In situ'
          ValueFormat = '##0.##'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_INSITU'
        end
        object BarSeries19: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqIncidenciasDotacion
          PercentFormat = '##0.##'
          SeriesColor = 8421631
          Title = 'Total'
          ValueFormat = '##0.##'
          XLabelsSource = 'CLAVE'
          BarWidthPercent = 50
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'ID'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'CANTIDAD_TOTAL'
        end
      end
    end
  end
  object qrbEvolucionIncidenciaSiniestros: TQRChildBand [20]
    Left = 19
    Top = 622
    Width = 1018
    Height = 344
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
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbIncidenciaDotacionSiniestros
    object QRChartEvolucionIncidencia: TQRChart
      Left = 0
      Top = 0
      Width = 1017
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        0.000000000000000000
        0.000000000000000000
        2690.812500000000000000)
      object QRDBChart11: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de la incidencia de la dotaci'#243'n'
          'sobre la cantidad de siniestros')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -9
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 30
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'Tahoma'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'Incidencia de la dotaci'#243'n'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        Legend.TextStyle = ltsRightValue
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object Series2: TBarSeries
          Marks.ArrowLength = 10
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8454143
          Title = 'In itinere'
          ValueFormat = '#,##0.### %'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_II'
        end
        object Series5: TBarSeries
          Marks.ArrowLength = 10
          Marks.Font.Charset = DEFAULT_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Arial'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8454016
          Title = 'In situ'
          ValueFormat = '#,##0.### %'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA_IS'
        end
        object BarSeries16: TBarSeries
          Marks.ArrowLength = 10
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          SeriesColor = 8421631
          Title = 'Total'
          ValueFormat = '#,##0.### %'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'INCIDENCIA'
        end
      end
    end
  end
  object qrbEvolucionDias: TQRChildBand [21]
    Left = 19
    Top = 2045
    Width = 1018
    Height = 344
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
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbDiasPerdidos
    object QRChartEvolucionDias: TQRChart
      Left = 0
      Top = 0
      Width = 1017
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        0.000000000000000000
        0.000000000000000000
        2690.812500000000000000)
      object QRDBChart16: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Evoluci'#243'n mensual de la cantidad total de d'#237'as perdidos')
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsAngle = 90
        BottomAxis.LabelsFont.Charset = ANSI_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -9
        BottomAxis.LabelsFont.Name = 'Tahoma'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.LabelsMultiLine = True
        BottomAxis.RoundFirstLabel = False
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Caption = 'Per'#237'odo'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 30
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.LabelsFont.Charset = ANSI_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -9
        LeftAxis.LabelsFont.Name = 'Verdana'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Caption = 'D'#237'as perdidos'
        LeftAxis.Title.Font.Charset = ANSI_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Verdana'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        Legend.TextStyle = ltsRightValue
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        object BarSeries25: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          PercentFormat = '##0.##'
          SeriesColor = 8454143
          Title = 'In itinere'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_INITINERE'
        end
        object Series8: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          PercentFormat = '##0.##'
          SeriesColor = 8454016
          Title = 'In situ'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_INSITU'
        end
        object Series9: TBarSeries
          Marks.ArrowLength = 20
          Marks.Font.Charset = ANSI_CHARSET
          Marks.Font.Color = clBlack
          Marks.Font.Height = -9
          Marks.Font.Name = 'Tahoma'
          Marks.Font.Style = []
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqEvolucion
          PercentFormat = '##0.##'
          SeriesColor = 8421631
          Title = 'Total'
          XLabelsSource = 'PERIODO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          XValues.ValueSource = 'PERIODO_NUM'
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'DIAS_CAIDOS_TOTAL'
        end
      end
    end
  end
  object qrbAccidente: TQRChildBand [22]
    Left = 19
    Top = 2965
    Width = 1018
    Height = 344
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
      910.166666666666600000
      2693.458333333333000000)
    ParentBand = qrbLesion
    object QRChartAccidente: TQRChart
      Left = 4
      Top = 0
      Width = 1005
      Height = 342
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        904.875000000000000000
        10.583333333333330000
        0.000000000000000000
        2659.062500000000000000)
      object QRDBChart15: TQRDBChart
        Left = -1
        Top = -1
        Width = 1
        Height = 1
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Distribuci'#243'n por Tipo de Accidente')
        AxisVisible = False
        BottomAxis.Grid.Color = clSilver
        BottomAxis.LabelsMultiLine = True
        BottomAxis.Ticks.Color = clSilver
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -9
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        Chart3DPercent = 45
        ClipPoints = False
        DepthAxis.Grid.Color = clSilver
        DepthAxis.Ticks.Color = clSilver
        Frame.Visible = False
        LeftAxis.Grid.Color = clSilver
        LeftAxis.Grid.SmallDots = True
        LeftAxis.MinorGrid.Color = clSilver
        LeftAxis.MinorTicks.Color = clSilver
        LeftAxis.Ticks.Color = clSilver
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -9
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.DividingLines.SmallDots = True
        Legend.Font.Charset = ANSI_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -9
        Legend.Font.Name = 'Verdana'
        Legend.Font.Style = []
        RightAxis.Grid.Color = clSilver
        RightAxis.Ticks.Color = clSilver
        TopAxis.Grid.Color = clSilver
        TopAxis.Ticks.Color = clSilver
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        object PieSeries1: TPieSeries
          Marks.ArrowLength = 20
          Marks.Style = smsValue
          Marks.Visible = True
          DataSource = sdqAccidente
          SeriesColor = 8421631
          Title = 'Accidente'
          XLabelsSource = 'LF_DESCRIPCION'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1.000000000000000000
          PieValues.Order = loNone
          PieValues.ValueSource = 'CANTIDAD'
        end
      end
    end
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      
        'SELECT   '#39' -Totales- '#39' AS tipo, '#39'Totales'#39' AS corte_control, TO_C' +
        'HAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      '         TO_CHAR(NULL) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento total'
      '           WHERE total.es_contrato = ex_contrato'
      
        '             AND total.es_fechabaja IS NULL) empleados, TO_NUMBE' +
        'R(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS periodo_num,'
      '         ex_contrato AS contrato'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral, cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39'),'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')), ex_con' +
        'trato'
      'UNION ALL'
      'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS tipo,'
      
        '         '#39'Regi'#243'n: '#39' || NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39 +
        ') AS corte_control,'
      
        '         TO_CHAR(NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39')) AS ' +
        'region, TO_CHAR(NULL) AS gerente,'
      '         TO_CHAR(NULL) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento region'
      '           WHERE region.es_regiondisco = aes.es_regiondisco'
      '             AND region.es_contrato = ex_contrato'
      '             AND region.es_fechabaja IS NULL) empleados,'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS peri' +
        'odo_num, ex_contrato AS contrato'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral, cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY es_regiondisco, TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39 +
        ' '#39' || TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')), ex_con' +
        'trato'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') AS tipo,'
      
        '         '#39'Gerente: '#39' || NVL(es_gerente, '#39'Sin gerente definido'#39') ' +
        'AS corte_control,'
      
        '         NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS region, N' +
        'VL(es_gerente, '#39'Sin gerente definido'#39') AS gerente,'
      '         TO_CHAR(NULL) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento gerencia'
      '           WHERE gerencia.es_gerente = aes.es_gerente'
      '             AND gerencia.es_regiondisco = aes.es_regiondisco'
      '             AND gerencia.es_contrato = ex_contrato'
      '             AND gerencia.es_fechabaja IS NULL) empleados,'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS peri' +
        'odo_num, ex_contrato AS contrato'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral, cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39'), es_regiondisco,'
      
        '         es_gerente, TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' |' +
        '| TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')), ex_con' +
        'trato'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39')'
      
        '         || '#39' - '#39' || NVL(es_codigoestdisco, '#39'Sin establecimiento' +
        ' definido'#39') AS tipo,'
      
        '         '#39'Establecimiento: '#39' || NVL(es_codigoestdisco, '#39'Sin esta' +
        'blecimiento definido'#39') AS corte_control,'
      '         TO_CHAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NVL(es_codigoestdisco, '#39'Sin establecimiento def' +
        'inido'#39')) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento establecimiento'
      '           WHERE establecimiento.es_gerente = aes.es_gerente'
      
        '             AND establecimiento.es_regiondisco = aes.es_regiond' +
        'isco'
      '             AND establecimiento.es_contrato = ex_contrato'
      
        '             AND establecimiento.es_nroestableci = aes.es_nroest' +
        'ableci'
      
        '             AND establecimiento.es_fechabaja IS NULL) empleados' +
        ','
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS peri' +
        'odo_num, ex_contrato AS contrato'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral, cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') || '#39' - '#39
      
        '         || NVL(es_codigoestdisco, '#39'Sin establecimiento definido' +
        #39'),'
      
        '         es_codigoestdisco, TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') |' +
        '| '#39' '#39' || TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')), ex_con' +
        'trato, es_gerente, es_regiondisco, es_nroestableci'
      'ORDER BY tipo, periodo_num, corte_control')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end>
    object sdqDatosPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 15
    end
    object sdqDatosCANTIDAD_INITINERE: TFloatField
      FieldName = 'CANTIDAD_INITINERE'
    end
    object sdqDatosDIAS_CAIDOS_INITINERE: TFloatField
      FieldName = 'DIAS_CAIDOS_INITINERE'
    end
    object sdqDatosLEVES_INITINERE: TFloatField
      FieldName = 'LEVES_INITINERE'
    end
    object sdqDatosGRAVE_INITINERE: TFloatField
      FieldName = 'GRAVE_INITINERE'
    end
    object sdqDatosMORTAL_INITINERE: TFloatField
      FieldName = 'MORTAL_INITINERE'
    end
    object sdqDatosSINGRAVEDAD_INITINERE: TFloatField
      FieldName = 'SINGRAVEDAD_INITINERE'
    end
    object sdqDatosCANTIDAD_INSITU: TFloatField
      FieldName = 'CANTIDAD_INSITU'
    end
    object sdqDatosDIAS_CAIDOS_INSITU: TFloatField
      FieldName = 'DIAS_CAIDOS_INSITU'
    end
    object sdqDatosLEVES_INSITU: TFloatField
      FieldName = 'LEVES_INSITU'
    end
    object sdqDatosGRAVE_INSITU: TFloatField
      FieldName = 'GRAVE_INSITU'
    end
    object sdqDatosMORTAL_INSITU: TFloatField
      FieldName = 'MORTAL_INSITU'
    end
    object sdqDatosSINGRAVEDAD_INSITU: TFloatField
      FieldName = 'SINGRAVEDAD_INSITU'
    end
    object sdqDatosCANTIDAD_TOTAL: TFloatField
      FieldName = 'CANTIDAD_TOTAL'
    end
    object sdqDatosDIAS_CAIDOS_TOTAL: TFloatField
      FieldName = 'DIAS_CAIDOS_TOTAL'
    end
    object sdqDatosEMPLEADOS: TFloatField
      FieldName = 'EMPLEADOS'
    end
    object sdqDatosPERIODO_NUM: TFloatField
      FieldName = 'PERIODO_NUM'
    end
    object sdqDatosTIPO: TStringField
      FieldName = 'TIPO'
      Size = 116
    end
    object sdqDatosCORTE_CONTROL: TStringField
      FieldName = 'CORTE_CONTROL'
      Size = 50
    end
    object sdqDatosREGION: TStringField
      FieldName = 'REGION'
      Size = 50
    end
    object sdqDatosGERENTE: TStringField
      FieldName = 'GERENTE'
      Size = 50
    end
    object sdqDatosESTABLECIMIENTO: TStringField
      FieldName = 'ESTABLECIMIENTO'
      Size = 10
    end
    object sdqDatosCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
  end
  object sdqIncidenciasDotacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   ROWNUM AS ID, datos.*,'
      
        '         DECODE(empleados, 0, 0, ROUND(cantidad_initinere / empl' +
        'eados * 100, 2)) AS incidencia_initinere_sini,'
      
        '         DECODE(empleados, 0, 0, ROUND(dias_caidos_initinere / e' +
        'mpleados * 100, 2)) AS incidencia_initinere_dias,'
      
        '         DECODE(empleados, 0, 0, ROUND(cantidad_insitu / emplead' +
        'os * 100, 2)) AS incidencia_insitu_sini,'
      
        '         DECODE(empleados, 0, 0, ROUND(dias_caidos_insitu / empl' +
        'eados * 100, 2)) AS incidencia_insitu_dias,'
      
        '         DECODE(empleados, 0, 0, ROUND(cantidad_total / empleado' +
        's * 100, 2)) AS incidencia_total_sini,'
      
        '         DECODE(empleados, 0, 0, ROUND(dias_caidos_total / emple' +
        'ados * 100, 2)) AS incidencia_total_dias'
      '    FROM ('
      '          /*Regiones*/'
      
        '          SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS' +
        ' clave,'
      '                   '
      '                   /* in itinere */'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2 THEN 1'
      '                         ELSE 0'
      '                       END) cantidad_initinere,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo = 2 THEN art.SIN.get_cant' +
        'diascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_initinere, SUM(CASE'
      
        '                                                   WHEN ex_tipo ' +
        '= 2'
      
        '                                                   AND (ex_grave' +
        'dad = '#39'5'#39') THEN 1'
      '                                                   ELSE 0'
      
        '                                                 END) mortal_ini' +
        'tinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) singravedad_initinere,'
      '                                                  /* in situ */'
      '                                                  SUM(CASE'
      
        '                                                        WHEN ex_' +
        'tipo IN(1, 3) THEN 1'
      '                                                        ELSE 0'
      
        '                                                      END) canti' +
        'dad_insitu,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo IN(1, 3) THEN art.SIN.get' +
        '_cantdiascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_insitu, SUM(CASE'
      
        '                                                WHEN ex_tipo IN(' +
        '1, 3)'
      
        '                                                AND (ex_gravedad' +
        ' = '#39'5'#39') THEN 1'
      '                                                ELSE 0'
      
        '                                              END) mortal_insitu' +
        ','
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      
        '                       END) singravedad_insitu, COUNT(*) AS cant' +
        'idad_total,'
      
        '                   SUM(art.SIN.get_cantdiascaidostotales(ex_sini' +
        'estro, ex_orden)) dias_caidos_total,'
      '                   (SELECT SUM(es_empleados)'
      '                      FROM aes_establecimiento total'
      
        '                     WHERE total.es_contrato = aes.es_contrato) ' +
        'empleados'
      
        '              FROM afi.aes_establecimiento aes INNER JOIN art.se' +
        'x_expedientes ON ex_contrato = es_contrato'
      
        '                   INNER JOIN crl_relacionlaboral ON rl_idtrabaj' +
        'ador = ex_idtrabajador'
      
        '                                                AND rl_contrato ' +
        '= ex_contrato'
      
        '                   INNER JOIN cre_relacionestablecimiento ON re_' +
        'idrelacionlaboral = rl_id'
      
        '                                                        AND re_i' +
        'destablecimiento = es_id'
      '             WHERE es_contrato = :contrato'
      '               AND :region IS NULL'
      '               AND :gerente IS NULL'
      '               AND :establecimiento IS NULL'
      '               AND re_idestablecimiento = es_id'
      
        '               AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010' +
        #39', '#39'dd/mm/yyyy'#39')'
      '               AND ex_fechaaccidente BETWEEN :fdesde AND :fhasta'
      '               AND ex_recaida = 0'
      
        '               AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39 +
        ')'
      '          GROUP BY es_contrato, es_regiondisco'
      '          UNION ALL'
      '          /*Gerentes*/'
      
        '          SELECT   NVL(es_gerente, '#39'Sin gerente definido'#39') AS cl' +
        'ave,'
      '                   '
      '                   /* in itinere */'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2 THEN 1'
      '                         ELSE 0'
      '                       END) cantidad_initinere,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo = 2 THEN art.SIN.get_cant' +
        'diascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_initinere, SUM(CASE'
      
        '                                                   WHEN ex_tipo ' +
        '= 2'
      
        '                                                   AND (ex_grave' +
        'dad = '#39'5'#39') THEN 1'
      '                                                   ELSE 0'
      
        '                                                 END) mortal_ini' +
        'tinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) singravedad_initinere,'
      '                                                  /* in situ */'
      '                                                  SUM(CASE'
      
        '                                                        WHEN ex_' +
        'tipo IN(1, 3) THEN 1'
      '                                                        ELSE 0'
      
        '                                                      END) canti' +
        'dad_insitu,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo IN(1, 3) THEN art.SIN.get' +
        '_cantdiascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_insitu, SUM(CASE'
      
        '                                                WHEN ex_tipo IN(' +
        '1, 3)'
      
        '                                                AND (ex_gravedad' +
        ' = '#39'5'#39') THEN 1'
      '                                                ELSE 0'
      
        '                                              END) mortal_insitu' +
        ','
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      
        '                       END) singravedad_insitu, COUNT(*) AS cant' +
        'idad_total,'
      
        '                   SUM(art.SIN.get_cantdiascaidostotales(ex_sini' +
        'estro, ex_orden)) dias_caidos_total,'
      '                   (SELECT SUM(es_empleados)'
      '                      FROM aes_establecimiento region'
      
        '                     WHERE region.es_regiondisco = aes.es_region' +
        'disco) AS empleados'
      
        '              FROM afi.aes_establecimiento aes INNER JOIN art.se' +
        'x_expedientes ON ex_contrato = es_contrato'
      
        '                   INNER JOIN crl_relacionlaboral ON rl_idtrabaj' +
        'ador = ex_idtrabajador'
      
        '                                                AND rl_contrato ' +
        '= ex_contrato'
      
        '                   INNER JOIN cre_relacionestablecimiento ON re_' +
        'idrelacionlaboral = rl_id'
      
        '                                                        AND re_i' +
        'destablecimiento = es_id'
      
        '             WHERE NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = ' +
        ':region'
      '               AND :region IS NOT NULL'
      '               AND :gerente IS NULL'
      '               AND es_contrato = :contrato'
      '               AND re_idestablecimiento = es_id'
      
        '               AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010' +
        #39', '#39'dd/mm/yyyy'#39')'
      '               AND ex_fechaaccidente BETWEEN :fdesde AND :fhasta'
      '               AND ex_recaida = 0'
      
        '               AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39 +
        ')'
      '          GROUP BY es_regiondisco, es_gerente'
      '          UNION ALL'
      '          /*Establecimientos*/'
      
        '          SELECT   NVL(es_codigoestdisco, '#39'Sin establecimiento d' +
        'efinido'#39') AS clave,'
      '                   '
      '                   /* in itinere */'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2 THEN 1'
      '                         ELSE 0'
      '                       END) cantidad_initinere,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo = 2 THEN art.SIN.get_cant' +
        'diascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_initinere, SUM(CASE'
      
        '                                                   WHEN ex_tipo ' +
        '= 2'
      
        '                                                   AND (ex_grave' +
        'dad = '#39'5'#39') THEN 1'
      '                                                   ELSE 0'
      
        '                                                 END) mortal_ini' +
        'tinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) singravedad_initinere,'
      '                                                  /* in situ */'
      '                                                  SUM(CASE'
      
        '                                                        WHEN ex_' +
        'tipo IN(1, 3) THEN 1'
      '                                                        ELSE 0'
      
        '                                                      END) canti' +
        'dad_insitu,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo IN(1, 3) THEN art.SIN.get' +
        '_cantdiascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_insitu, SUM(CASE'
      
        '                                                WHEN ex_tipo IN(' +
        '1, 3)'
      
        '                                                AND (ex_gravedad' +
        ' = '#39'5'#39') THEN 1'
      '                                                ELSE 0'
      
        '                                              END) mortal_insitu' +
        ','
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      
        '                       END) singravedad_insitu, COUNT(*) AS cant' +
        'idad_total,'
      
        '                   SUM(art.SIN.get_cantdiascaidostotales(ex_sini' +
        'estro, ex_orden)) dias_caidos_total,'
      '                   (SELECT SUM(es_empleados)'
      '                      FROM aes_establecimiento gerencia'
      
        '                     WHERE gerencia.es_gerente = aes.es_gerente)' +
        ' AS empleados'
      
        '              FROM afi.aes_establecimiento aes INNER JOIN afi.ac' +
        'o_contrato ON co_contrato = es_contrato'
      
        '                   INNER JOIN art.sex_expedientes ON ex_contrato' +
        ' = co_contrato'
      
        '                   INNER JOIN crl_relacionlaboral ON rl_idtrabaj' +
        'ador = ex_idtrabajador'
      
        '                                                AND rl_contrato ' +
        '= ex_contrato'
      
        '                   INNER JOIN cre_relacionestablecimiento ON re_' +
        'idrelacionlaboral = rl_id'
      
        '                                                        AND re_i' +
        'destablecimiento = es_id'
      
        '             --INNER JOIN SIN.sud_ubicaciondenuncia ON ud_idexpe' +
        'diente = ex_id'
      '             --AND ud_establecimiento = es_id'
      
        '          WHERE    NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = ' +
        ':region'
      '               AND :region IS NOT NULL'
      
        '               AND NVL(es_gerente, '#39'Sin gerente definido'#39') = :ge' +
        'rente'
      '               AND :gerente IS NOT NULL'
      '               AND es_contrato = :contrato'
      
        '               AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010' +
        #39', '#39'dd/mm/yyyy'#39')'
      '               AND ex_fechaaccidente BETWEEN :fdesde AND :fhasta'
      '               AND ex_recaida = 0'
      
        '               AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39 +
        ')'
      '          GROUP BY es_gerente, es_codigoestdisco'
      '          UNION ALL'
      '          /*Establecimientos - Este est'#225' al pedo*/'
      
        '          SELECT   NVL(es_codigoestdisco, '#39'Sin establecimiento d' +
        'efinido'#39') AS clave,'
      '                   '
      '                   /* in itinere */'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2 THEN 1'
      '                         ELSE 0'
      '                       END) cantidad_initinere,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo = 2 THEN art.SIN.get_cant' +
        'diascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_initinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_initinere, SUM(CASE'
      
        '                                                   WHEN ex_tipo ' +
        '= 2'
      
        '                                                   AND (ex_grave' +
        'dad = '#39'5'#39') THEN 1'
      '                                                   ELSE 0'
      
        '                                                 END) mortal_ini' +
        'tinere,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo = 2'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) singravedad_initinere,'
      '                                                  /* in situ */'
      '                                                  SUM(CASE'
      
        '                                                        WHEN ex_' +
        'tipo IN(1, 3) THEN 1'
      '                                                        ELSE 0'
      
        '                                                      END) canti' +
        'dad_insitu,'
      '                   SUM((CASE'
      
        '                          WHEN ex_tipo IN(1, 3) THEN art.SIN.get' +
        '_cantdiascaidostotales(ex_siniestro, ex_orden)'
      '                          ELSE 0'
      '                        END)) dias_caidos_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                              OR ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      '                       END) leves_insitu,'
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IN('#39'3'#39', '#39'4'#39')) THEN 1'
      '                         ELSE 0'
      '                       END) grave_insitu, SUM(CASE'
      
        '                                                WHEN ex_tipo IN(' +
        '1, 3)'
      
        '                                                AND (ex_gravedad' +
        ' = '#39'5'#39') THEN 1'
      '                                                ELSE 0'
      
        '                                              END) mortal_insitu' +
        ','
      '                   SUM(CASE'
      '                         WHEN ex_tipo IN(1, 3)'
      '                         AND (ex_gravedad IS NULL) THEN 1'
      '                         ELSE 0'
      
        '                       END) singravedad_insitu, COUNT(*) AS cant' +
        'idad_total,'
      
        '                   SUM(art.SIN.get_cantdiascaidostotales(ex_sini' +
        'estro, ex_orden)) dias_caidos_total,'
      '                   SUM(es_empleados) empleados'
      
        '              FROM afi.aes_establecimiento INNER JOIN afi.aco_co' +
        'ntrato ON co_contrato = es_contrato'
      
        '                   INNER JOIN art.sex_expedientes ON ex_contrato' +
        ' = co_contrato'
      
        '                   INNER JOIN crl_relacionlaboral ON rl_idtrabaj' +
        'ador = ex_idtrabajador'
      
        '                                                AND rl_contrato ' +
        '= ex_contrato'
      
        '                   INNER JOIN cre_relacionestablecimiento ON re_' +
        'idrelacionlaboral = rl_id'
      
        '                                                        AND re_i' +
        'destablecimiento = es_id'
      
        '             --INNER JOIN SIN.sud_ubicaciondenuncia ON ud_idexpe' +
        'diente = ex_id'
      '             --AND ud_establecimiento = es_id'
      
        '          WHERE    NVL(es_codigoestdisco, '#39'Sin establecimiento d' +
        'efinido'#39') = :establecimiento'
      '               AND :establecimiento IS NOT NULL'
      '               AND es_contrato = :contrato'
      
        '               AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010' +
        #39', '#39'dd/mm/yyyy'#39')'
      '               AND ex_fechaaccidente BETWEEN :fdesde AND :fhasta'
      '               AND ex_recaida = 0'
      
        '               AND NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39 +
        ')'
      '          GROUP BY es_codigoestdisco'
      '          ORDER BY 1) datos'
      '   WHERE 1 = 1'
      'ORDER BY clave')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end>
    object sdqIncidenciasDotacionCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 50
    end
    object sdqIncidenciasDotacionEMPLEADOS: TFloatField
      FieldName = 'EMPLEADOS'
    end
    object sdqIncidenciasDotacionCANTIDAD_INITINERE: TFloatField
      FieldName = 'CANTIDAD_INITINERE'
    end
    object sdqIncidenciasDotacionDIAS_CAIDOS_INITINERE: TFloatField
      FieldName = 'DIAS_CAIDOS_INITINERE'
    end
    object sdqIncidenciasDotacionLEVES_INITINERE: TFloatField
      FieldName = 'LEVES_INITINERE'
    end
    object sdqIncidenciasDotacionGRAVE_INITINERE: TFloatField
      FieldName = 'GRAVE_INITINERE'
    end
    object sdqIncidenciasDotacionMORTAL_INITINERE: TFloatField
      FieldName = 'MORTAL_INITINERE'
    end
    object sdqIncidenciasDotacionSINGRAVEDAD_INITINERE: TFloatField
      FieldName = 'SINGRAVEDAD_INITINERE'
    end
    object sdqIncidenciasDotacionCANTIDAD_INSITU: TFloatField
      FieldName = 'CANTIDAD_INSITU'
    end
    object sdqIncidenciasDotacionDIAS_CAIDOS_INSITU: TFloatField
      FieldName = 'DIAS_CAIDOS_INSITU'
    end
    object sdqIncidenciasDotacionLEVES_INSITU: TFloatField
      FieldName = 'LEVES_INSITU'
    end
    object sdqIncidenciasDotacionGRAVE_INSITU: TFloatField
      FieldName = 'GRAVE_INSITU'
    end
    object sdqIncidenciasDotacionMORTAL_INSITU: TFloatField
      FieldName = 'MORTAL_INSITU'
    end
    object sdqIncidenciasDotacionSINGRAVEDAD_INSITU: TFloatField
      FieldName = 'SINGRAVEDAD_INSITU'
    end
    object sdqIncidenciasDotacionCANTIDAD_TOTAL: TFloatField
      FieldName = 'CANTIDAD_TOTAL'
    end
    object sdqIncidenciasDotacionDIAS_CAIDOS_TOTAL: TFloatField
      FieldName = 'DIAS_CAIDOS_TOTAL'
    end
    object sdqIncidenciasDotacionID: TFloatField
      FieldName = 'ID'
    end
    object sdqIncidenciasDotacionINCIDENCIA_INITINERE_SINI: TFloatField
      FieldName = 'INCIDENCIA_INITINERE_SINI'
    end
    object sdqIncidenciasDotacionINCIDENCIA_INITINERE_DIAS: TFloatField
      FieldName = 'INCIDENCIA_INITINERE_DIAS'
    end
    object sdqIncidenciasDotacionINCIDENCIA_INSITU_SINI: TFloatField
      FieldName = 'INCIDENCIA_INSITU_SINI'
    end
    object sdqIncidenciasDotacionINCIDENCIA_INSITU_DIAS: TFloatField
      FieldName = 'INCIDENCIA_INSITU_DIAS'
    end
    object sdqIncidenciasDotacionINCIDENCIA_TOTAL_SINI: TFloatField
      FieldName = 'INCIDENCIA_TOTAL_SINI'
    end
    object sdqIncidenciasDotacionINCIDENCIA_TOTAL_DIAS: TFloatField
      FieldName = 'INCIDENCIA_TOTAL_DIAS'
    end
  end
  object sdqEvolucion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    OnCalcFields = sdqEvolucionCalcFields
    SQL.Strings = (
      
        'SELECT   '#39' -Totales- '#39' AS tipo, '#39'Totales'#39' AS corte_control, TO_C' +
        'HAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      '         TO_CHAR(NULL) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento total'
      '           WHERE total.es_contrato = ex_contrato'
      
        '             AND total.es_fechabaja IS NULL) empleados, TO_NUMBE' +
        'R(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS periodo_num'
      
        '    FROM art.sex_expedientes, aes_establecimiento, crl_relacionl' +
        'aboral,'
      
        '         cre_relacionestablecimiento   --, SIN.sud_ubicaciondenu' +
        'ncia'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     --AND ex_id = ud_idexpediente(+)'
      '     --AND ud_establecimiento = es_id(+)'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      '     AND :region IS NULL'
      '     AND :gerente IS NULL'
      '     AND :establecimiento IS NULL'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY ex_contrato, TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' ' +
        '|| TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39'))'
      'UNION ALL'
      'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS tipo,'
      
        '         '#39'Regi'#243'n: '#39' || NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39 +
        ') AS corte_control,'
      
        '         TO_CHAR(NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39')) AS ' +
        'region, TO_CHAR(NULL) AS gerente,'
      '         TO_CHAR(NULL) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento region'
      '           WHERE region.es_regiondisco = aes.es_regiondisco'
      '             AND region.es_contrato = ex_contrato'
      '             AND region.es_fechabaja IS NULL) empleados,'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS peri' +
        'odo_num'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral,'
      
        '         cre_relacionestablecimiento   --, SIN.sud_ubicaciondenu' +
        'ncia'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     --AND ex_id = ud_idexpediente(+)'
      '     --AND ud_establecimiento = es_id(+)'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      '     AND NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = :region'
      '     AND :region IS NOT NULL'
      '     AND :gerente IS NULL'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY ex_contrato, es_regiondisco, TO_CHAR(ex_fechaaccidente,' +
        ' '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39'))'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') AS tipo,'
      
        '         '#39'Gerente: '#39' || NVL(es_gerente, '#39'Sin gerente definido'#39') ' +
        'AS corte_control,'
      
        '         NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS region, N' +
        'VL(es_gerente, '#39'Sin gerente definido'#39') AS gerente,'
      '         TO_CHAR(NULL) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento gerencia'
      '           WHERE gerencia.es_gerente = aes.es_gerente'
      '             AND gerencia.es_regiondisco = aes.es_regiondisco'
      '             AND gerencia.es_contrato = ex_contrato'
      '             AND gerencia.es_fechabaja IS NULL) empleados,'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS peri' +
        'odo_num'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral,'
      
        '         cre_relacionestablecimiento   --, SIN.sud_ubicaciondenu' +
        'ncia'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     --AND ex_id = ud_idexpediente(+)'
      '     --AND ud_establecimiento = es_id(+)'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      '     AND NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = :region'
      '     AND :region IS NOT NULL'
      '     AND NVL(es_gerente, '#39'Sin gerente definido'#39') = :gerente'
      '     AND :gerente IS NOT NULL'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39'), es_regiondisco,'
      
        '         es_gerente, TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' |' +
        '| TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')), ex_con' +
        'trato'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39')'
      
        '         || '#39' - '#39' || NVL(es_codigoestdisco, '#39'Sin establecimiento' +
        ' definido'#39') AS tipo,'
      
        '         '#39'Establecimiento: '#39' || NVL(es_codigoestdisco, '#39'Sin esta' +
        'blecimiento definido'#39') AS corte_control,'
      '         TO_CHAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NVL(es_codigoestdisco, '#39'Sin establecimiento def' +
        'inido'#39')) AS establecimiento,'
      
        '         TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') || '#39' '#39' || TO_CHAR(ex' +
        '_fechaaccidente, '#39'Month'#39') periodo,'
      '         '
      '         /* in itinere */'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2 THEN 1'
      '               ELSE 0'
      '             END) cantidad_initinere,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo = 2 THEN art.SIN.get_cantdiascaidos' +
        'totales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_initinere, SUM(CASE'
      '                                         WHEN ex_tipo = 2'
      
        '                                         AND (ex_gravedad IN('#39'3'#39 +
        ', '#39'4'#39')) THEN 1'
      '                                         ELSE 0'
      '                                       END) grave_initinere,'
      '         SUM(CASE'
      '               WHEN ex_tipo = 2'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_initinere, SUM(CASE'
      '                                          WHEN ex_tipo = 2'
      
        '                                          AND (ex_gravedad IS NU' +
        'LL) THEN 1'
      '                                          ELSE 0'
      
        '                                        END) singravedad_initine' +
        're,'
      '         '
      '         /* in situ */'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3) THEN 1'
      '               ELSE 0'
      '             END) cantidad_insitu,'
      '         SUM((CASE'
      
        '                WHEN ex_tipo IN(1, 3) THEN art.SIN.get_cantdiasc' +
        'aidostotales(ex_siniestro, ex_orden)'
      '                ELSE 0'
      '              END)) dias_caidos_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (   ex_gravedad IN('#39'1'#39', '#39'2'#39')'
      '                    OR ex_gravedad IS NULL) THEN 1'
      '               ELSE 0'
      '             END) leves_insitu, SUM(CASE'
      '                                      WHEN ex_tipo IN(1, 3)'
      
        '                                      AND (ex_gravedad IN('#39'3'#39', '#39 +
        '4'#39')) THEN 1'
      '                                      ELSE 0'
      '                                    END) grave_insitu,'
      '         SUM(CASE'
      '               WHEN ex_tipo IN(1, 3)'
      '               AND (ex_gravedad = '#39'5'#39') THEN 1'
      '               ELSE 0'
      '             END) mortal_insitu, SUM(CASE'
      '                                       WHEN ex_tipo IN(1, 3)'
      
        '                                       AND (ex_gravedad IS NULL)' +
        ' THEN 1'
      '                                       ELSE 0'
      
        '                                     END) singravedad_insitu, CO' +
        'UNT(*) AS cantidad_total,'
      
        '         SUM(art.SIN.get_cantdiascaidostotales(ex_siniestro, ex_' +
        'orden)) dias_caidos_total,'
      '         (SELECT SUM(es_empleados)'
      '            FROM aes_establecimiento establecimiento'
      '           WHERE establecimiento.es_gerente = aes.es_gerente'
      
        '             AND establecimiento.es_regiondisco = aes.es_regiond' +
        'isco'
      '             AND establecimiento.es_contrato = ex_contrato'
      
        '             AND establecimiento.es_nroestableci = aes.es_nroest' +
        'ableci'
      
        '             AND establecimiento.es_fechabaja IS NULL) empleados' +
        ','
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')) AS peri' +
        'odo_num'
      
        '    FROM art.sex_expedientes, aes_establecimiento aes, crl_relac' +
        'ionlaboral,'
      
        '         cre_relacionestablecimiento   --, SIN.sud_ubicaciondenu' +
        'ncia'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     --AND ex_id = ud_idexpediente(+)'
      '     --AND ud_establecimiento = es_id(+)'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND NVL(es_codigoestdisco, '#39'Sin establecimiento definido'#39') ' +
        '= :establecimiento'
      '     AND :establecimiento IS NOT NULL'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') || '#39' - '#39
      
        '         || NVL(es_codigoestdisco, '#39'Sin establecimiento definido' +
        #39'),'
      
        '         es_codigoestdisco, TO_CHAR(ex_fechaaccidente, '#39'yyyy'#39') |' +
        '| '#39' '#39' || TO_CHAR(ex_fechaaccidente, '#39'Month'#39'),'
      
        '         TO_NUMBER(TO_CHAR(ex_fechaaccidente, '#39'yyyymm'#39')), ex_con' +
        'trato, es_gerente, es_regiondisco, es_nroestableci'
      'ORDER BY tipo, periodo_num, corte_control')
    Left = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'PERIODO'
      Size = 15
    end
    object FloatField1: TFloatField
      FieldName = 'CANTIDAD_INITINERE'
    end
    object FloatField2: TFloatField
      FieldName = 'DIAS_CAIDOS_INITINERE'
    end
    object FloatField3: TFloatField
      FieldName = 'LEVES_INITINERE'
    end
    object FloatField4: TFloatField
      FieldName = 'GRAVE_INITINERE'
    end
    object FloatField5: TFloatField
      FieldName = 'MORTAL_INITINERE'
    end
    object FloatField6: TFloatField
      FieldName = 'SINGRAVEDAD_INITINERE'
    end
    object FloatField7: TFloatField
      FieldName = 'CANTIDAD_INSITU'
    end
    object FloatField8: TFloatField
      FieldName = 'DIAS_CAIDOS_INSITU'
    end
    object FloatField9: TFloatField
      FieldName = 'LEVES_INSITU'
    end
    object FloatField10: TFloatField
      FieldName = 'GRAVE_INSITU'
    end
    object FloatField11: TFloatField
      FieldName = 'MORTAL_INSITU'
    end
    object FloatField12: TFloatField
      FieldName = 'SINGRAVEDAD_INSITU'
    end
    object FloatField13: TFloatField
      FieldName = 'CANTIDAD_TOTAL'
    end
    object FloatField14: TFloatField
      FieldName = 'DIAS_CAIDOS_TOTAL'
    end
    object FloatField15: TFloatField
      FieldName = 'EMPLEADOS'
    end
    object FloatField16: TFloatField
      FieldName = 'PERIODO_NUM'
    end
    object StringField2: TStringField
      FieldName = 'TIPO'
      Size = 116
    end
    object StringField3: TStringField
      FieldName = 'CORTE_CONTROL'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'REGION'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'GERENTE'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'ESTABLECIMIENTO'
      Size = 10
    end
    object sdqEvolucionINCIDENCIA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INCIDENCIA'
      DisplayFormat = '##0,0#'
      Calculated = True
    end
    object sdqEvolucionINCIDENCIA_DIAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INCIDENCIA_DIAS'
      Calculated = True
    end
    object sdqEvolucionINCIDENCIA_II: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INCIDENCIA_II'
      Calculated = True
    end
    object sdqEvolucionINCIDENCIA_IS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'INCIDENCIA_IS'
      Calculated = True
    end
  end
  object sdqLesion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   '#39' -Totales- '#39' AS tipo, '#39'Totales'#39' AS corte_control, TO_C' +
        'HAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NULL) AS establecimiento, ex_contrato AS contra' +
        'to, ln_descripcion, COUNT(*) AS cantidad'
      
        '    FROM SIN.sln_lesionnaturaleza, art.sex_expedientes, aes_esta' +
        'blecimiento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      '     AND :region IS NULL'
      '     AND :gerente IS NULL'
      '     AND :establecimiento IS NULL'
      
        '     AND ln_codigo = pau.get_naturaleza(ex_siniestro, ex_orden, ' +
        'ex_recaida, ex_diagnosticooms, ex_tipo, 1)'
      '     AND ln_fechabaja IS NULL'
      'GROUP BY ex_contrato, ln_descripcion'
      'UNION ALL'
      'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS tipo,'
      
        '         '#39'Regi'#243'n: '#39' || NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39 +
        ') AS corte_control,'
      
        '         TO_CHAR(NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39')) AS ' +
        'region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NULL) AS establecimiento, ex_contrato AS contra' +
        'to, ln_descripcion, COUNT(*) AS cantidad'
      
        '    FROM SIN.sln_lesionnaturaleza, art.sex_expedientes, aes_esta' +
        'blecimiento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      '     AND NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = :region'
      '     AND :region IS NOT NULL'
      '     AND :gerente IS NULL'
      
        '     AND ln_codigo = pau.get_naturaleza(ex_siniestro, ex_orden, ' +
        'ex_recaida, ex_diagnosticooms, ex_tipo, 1)'
      '     AND ln_fechabaja IS NULL'
      'GROUP BY es_regiondisco, ex_contrato, ln_descripcion'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') AS tipo,'
      
        '         '#39'Gerente: '#39' || NVL(es_gerente, '#39'Sin gerente definido'#39') ' +
        'AS corte_control,'
      
        '         NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS region, N' +
        'VL(es_gerente, '#39'Sin gerente definido'#39') AS gerente,'
      
        '         TO_CHAR(NULL) AS establecimiento, ex_contrato AS contra' +
        'to, ln_descripcion, COUNT(*) AS cantidad'
      
        '    FROM SIN.sln_lesionnaturaleza, art.sex_expedientes, aes_esta' +
        'blecimiento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      '     AND NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = :region'
      '     AND :region IS NOT NULL'
      '     AND NVL(es_gerente, '#39'Sin gerente definido'#39') = :gerente'
      
        '     AND ln_codigo = pau.get_naturaleza(ex_siniestro, ex_orden, ' +
        'ex_recaida, ex_diagnosticooms, ex_tipo, 1)'
      '     AND ln_fechabaja IS NULL'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39'), es_regiondisco,'
      '         es_gerente, ex_contrato, ln_descripcion'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39')'
      
        '         || '#39' - '#39' || NVL(es_codigoestdisco, '#39'Sin establecimiento' +
        ' definido'#39') AS tipo,'
      
        '         '#39'Establecimiento: '#39' || NVL(es_codigoestdisco, '#39'Sin esta' +
        'blecimiento definido'#39') AS corte_control,'
      '         TO_CHAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NVL(es_codigoestdisco, '#39'Sin establecimiento def' +
        'inido'#39')) AS establecimiento, ex_contrato AS contrato,'
      '         ln_descripcion, COUNT(*) AS cantidad'
      
        '    FROM SIN.sln_lesionnaturaleza, art.sex_expedientes, aes_esta' +
        'blecimiento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        '     AND NVL(es_codigoestdisco, '#39'Sin establecimiento definido'#39') ' +
        '= :establecimiento'
      '     AND :establecimiento IS NOT NULL'
      
        '     AND ln_codigo = pau.get_naturaleza(ex_siniestro, ex_orden, ' +
        'ex_recaida, ex_diagnosticooms, ex_tipo, 1)'
      '     AND ln_fechabaja IS NULL'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') || '#39' - '#39
      
        '         || NVL(es_codigoestdisco, '#39'Sin establecimiento definido' +
        #39'),'
      '         es_codigoestdisco, ex_contrato, ln_descripcion'
      'ORDER BY tipo, corte_control, cantidad DESC')
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end>
    object sdqLesionTIPO: TStringField
      FieldName = 'TIPO'
      Size = 134
    end
    object sdqLesionCORTE_CONTROL: TStringField
      FieldName = 'CORTE_CONTROL'
      Size = 59
    end
    object sdqLesionREGION: TStringField
      FieldName = 'REGION'
      Size = 50
    end
    object sdqLesionGERENTE: TStringField
      FieldName = 'GERENTE'
      Size = 50
    end
    object sdqLesionESTABLECIMIENTO: TStringField
      FieldName = 'ESTABLECIMIENTO'
      Size = 28
    end
    object sdqLesionCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object sdqLesionLN_DESCRIPCION: TStringField
      FieldName = 'LN_DESCRIPCION'
      Size = 250
    end
    object sdqLesionCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
  end
  object sdqAccidente: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   '#39' -Totales- '#39' AS tipo, '#39'Totales'#39' AS corte_control, TO_C' +
        'HAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NULL) AS establecimiento, ex_contrato AS contra' +
        'to, SUBSTR(lf_descripcion, 1, 40) as lf_descripcion, COUNT(*) AS' +
        ' cantidad'
      
        '    FROM SIN.slf_lesionforma, art.sex_expedientes, aes_estableci' +
        'miento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      '     AND :region IS NULL'
      '     AND :gerente IS NULL'
      '     AND :establecimiento IS NULL'
      
        '     AND lf_codigo = pau.get_forma(ex_siniestro, ex_orden, ex_re' +
        'caida, ex_diagnosticooms)'
      '     AND lf_fechabaja IS NULL'
      'GROUP BY ex_contrato, SUBSTR(lf_descripcion, 1, 40)'
      'UNION ALL'
      'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS tipo,'
      
        '         '#39'Regi'#243'n: '#39' || NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39 +
        ') AS corte_control,'
      
        '         TO_CHAR(NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39')) AS ' +
        'region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NULL) AS establecimiento, ex_contrato AS contra' +
        'to, SUBSTR(lf_descripcion, 1, 40) as lf_descripcion, COUNT(*) AS' +
        ' cantidad'
      
        '    FROM SIN.slf_lesionforma, art.sex_expedientes, aes_estableci' +
        'miento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      '     AND NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = :region'
      '     AND :region IS NOT NULL'
      '     AND :gerente IS NULL'
      
        '     AND lf_codigo = pau.get_forma(ex_siniestro, ex_orden, ex_re' +
        'caida, ex_diagnosticooms)'
      '     AND lf_fechabaja IS NULL'
      
        'GROUP BY es_regiondisco, ex_contrato, SUBSTR(lf_descripcion, 1, ' +
        '40)'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') AS tipo,'
      
        '         '#39'Gerente: '#39' || NVL(es_gerente, '#39'Sin gerente definido'#39') ' +
        'AS corte_control,'
      
        '         NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') AS region, N' +
        'VL(es_gerente, '#39'Sin gerente definido'#39') AS gerente,'
      
        '         TO_CHAR(NULL) AS establecimiento, ex_contrato AS contra' +
        'to, SUBSTR(lf_descripcion, 1, 40) as lf_descripcion, COUNT(*) AS' +
        ' cantidad'
      
        '    FROM SIN.slf_lesionforma, art.sex_expedientes, aes_estableci' +
        'miento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      '     AND NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') = :region'
      '     AND :region IS NOT NULL'
      '     AND NVL(es_gerente, '#39'Sin gerente definido'#39') = :gerente'
      
        '     AND lf_codigo = pau.get_forma(ex_siniestro, ex_orden, ex_re' +
        'caida, ex_diagnosticooms)'
      '     AND lf_fechabaja IS NULL'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39'), es_regiondisco,'
      '         es_gerente, ex_contrato, SUBSTR(lf_descripcion, 1, 40)'
      'UNION ALL'
      
        'SELECT   NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39')'
      
        '         || '#39' - '#39' || NVL(es_codigoestdisco, '#39'Sin establecimiento' +
        ' definido'#39') AS tipo,'
      
        '         '#39'Establecimiento: '#39' || NVL(es_codigoestdisco, '#39'Sin esta' +
        'blecimiento definido'#39') AS corte_control,'
      '         TO_CHAR(NULL) AS region, TO_CHAR(NULL) AS gerente,'
      
        '         TO_CHAR(NVL(es_codigoestdisco, '#39'Sin establecimiento def' +
        'inido'#39')) AS establecimiento, ex_contrato AS contrato,'
      
        '         SUBSTR(lf_descripcion, 1, 40) as lf_descripcion, COUNT(' +
        '*) AS cantidad'
      
        '    FROM SIN.slf_lesionforma, art.sex_expedientes, aes_estableci' +
        'miento aes, crl_relacionlaboral,'
      '         cre_relacionestablecimiento'
      '   WHERE NVL(ex_causafin, '#39' '#39') NOT IN('#39'99'#39', '#39'95'#39', '#39'02'#39')'
      '     AND ex_contrato = :contrato'
      '     AND re_idrelacionlaboral(+) = rl_id'
      '     AND re_idestablecimiento = es_id(+)'
      '     AND rl_idtrabajador = ex_idtrabajador'
      '     AND rl_contrato = ex_contrato'
      
        '     AND '#39#39' || ex_fechaaccidente > TO_DATE('#39'01/02/2010'#39', '#39'dd/mm/' +
        'yyyy'#39')'
      '     AND '#39#39' || ex_fechaaccidente >= :fdesde'
      '     AND '#39#39' || ex_fechaaccidente <= :fhasta'
      '     AND ex_recaida = 0'
      
        '     AND NVL(es_codigoestdisco, '#39'Sin establecimiento definido'#39') ' +
        '= :establecimiento'
      '     AND :establecimiento IS NOT NULL'
      
        '     AND lf_codigo = pau.get_forma(ex_siniestro, ex_orden, ex_re' +
        'caida, ex_diagnosticooms)'
      '     AND lf_fechabaja IS NULL'
      
        'GROUP BY NVL(es_regiondisco, '#39'Sin regi'#243'n definida'#39') || '#39' - '#39' || ' +
        'NVL(es_gerente, '#39'Sin gerente definido'#39') || '#39' - '#39
      
        '         || NVL(es_codigoestdisco, '#39'Sin establecimiento definido' +
        #39'),'
      
        '         es_codigoestdisco, ex_contrato, SUBSTR(lf_descripcion, ' +
        '1, 40)'
      'ORDER BY tipo, corte_control, cantidad DESC')
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'region'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gerente'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'contrato'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fdesde'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fhasta'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'establecimiento'
        ParamType = ptInput
      end>
    object StringField7: TStringField
      FieldName = 'TIPO'
      Size = 134
    end
    object StringField8: TStringField
      FieldName = 'CORTE_CONTROL'
      Size = 59
    end
    object StringField9: TStringField
      FieldName = 'REGION'
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'GERENTE'
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'ESTABLECIMIENTO'
      Size = 28
    end
    object FloatField17: TFloatField
      FieldName = 'CONTRATO'
    end
    object FloatField18: TFloatField
      FieldName = 'CANTIDAD'
    end
    object sdqAccidenteLF_DESCRIPCION: TStringField
      FieldName = 'LF_DESCRIPCION'
      Size = 250
    end
  end
end
