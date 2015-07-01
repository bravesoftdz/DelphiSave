inherited qrConfiguracionAGENDA: TqrConfiguracionAGENDA
  DataSet = sdqDatos
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  ReportTitle = 'SIC - Configuraci'#243'n de Eventos y Tareas'
  inherited qrbPageHeader: TQRBand
    Height = 111
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      293.687500000000000000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Left = 288
      Top = 4
      Width = 165
      Height = 65
      Size.Values = (
        171.979166666666700000
        762.000000000000000000
        10.583333333333330000
        436.562499999999900000)
      AutoSize = True
      Center = True
      Stretch = False
    end
    object QRLabel3: TQRLabel
      Left = 234
      Top = 72
      Width = 272
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        619.125000000000000000
        190.500000000000000000
        719.666666666666800000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'SIC - Configuraci'#243'n de Eventos y Tareas'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlbUsuario: TQRLabel
      Left = 668
      Top = 80
      Width = 66
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1767.416666666667000000
        211.666666666666700000
        174.625000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlbUsuario'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlbUsuarioPrint
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrlbHoy: TQRLabel
      Left = 689
      Top = 92
      Width = 45
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1822.979166666667000000
        243.416666666666700000
        119.062500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlbHoy'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlbHoyPrint
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 662
      Top = 68
      Width = 72
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1751.541666666667000000
        179.916666666666700000
        190.500000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Impreso por'
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
  inherited qrbTitle: TQRBand
    Top = 149
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Enabled = False
    Size.Values = (
      444.500000000000000000
      1957.916666666667000000)
    inherited qrlReferencia: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666670000
        963.083333333333400000
        201.083333333333300000
        89.958333333333340000)
      FontSize = 10
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Enabled = False
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        201.083333333333000000
        881.062500000000000000)
      FontSize = 10
    end
    inherited qrlSaludo: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        381.000000000000000000
        563.562500000000000000)
      FontSize = 10
    end
    inherited qrlDestinatario: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666670000
        52.916666666666670000
        95.250000000000000000
        142.875000000000000000)
      FontSize = 10
    end
    inherited qrlFecha: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1259.416666666667000000
        31.750000000000000000
        682.625000000000000000)
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 714
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      232.833333333333400000
      1957.916666666667000000)
    inherited qrmDatosART: TQRMemo
      Size.Values = (
        193.145833333333000000
        10.583333333333300000
        31.750000000000000000
        764.645833333333000000)
      FontSize = 8
    end
    inherited qriLogoGBP: TQRImage
      Size.Values = (
        148.166666666667000000
        1640.416666666670000000
        42.333333333333300000
        256.645833333333000000)
      Center = False
    end
  end
  inherited qrbSummary: TQRBand
    Top = 674
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = True
    Enabled = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    inherited qrlSaludoFinal: TQRLabel
      Enabled = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        21.166666666666670000
        984.250000000000000000)
      FontSize = 10
    end
  end
  object qrbDetail: TQRBand [4]
    Left = 38
    Top = 397
    Width = 740
    Height = 23
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      60.854166666666680000
      1957.916666666667000000)
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 36
      Top = 4
      Width = 40
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        95.250000000000000000
        10.583333333333330000
        105.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TE_ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 16
      Top = 4
      Width = 15
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        10.583333333333330000
        39.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#176
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 412
      Top = 4
      Width = 62
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1090.083333333333000000
        10.583333333333330000
        164.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'MODULOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 268
      Top = 4
      Width = 138
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        709.083333333333400000
        10.583333333333330000
        365.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'M'#243'dulos para completar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 228
      Top = 3
      Width = 26
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        603.250000000000000000
        7.937500000000000000
        68.791666666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'RI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      OnPrint = ColoreoTilde
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 92
      Top = 4
      Width = 130
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        243.416666666666700000
        10.583333333333330000
        343.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Resupuesta inteligente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 484
      Top = 4
      Width = 86
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1280.583333333333000000
        10.583333333333330000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #218'ltima revisi'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText21: TQRDBText
      Left = 576
      Top = 4
      Width = 43
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1524.000000000000000000
        10.583333333333330000
        113.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'FECHA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbAyuda: TQRChildBand [5]
    Left = 38
    Top = 420
    Width = 740
    Height = 38
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrbAyudaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      100.541666666666700000
      1957.916666666667000000)
    ParentBand = qrbDetail
    object QRDBText7: TQRDBText
      Left = 16
      Top = 20
      Width = 701
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        52.916666666666660000
        1854.729166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TE_AYUDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 16
      Top = 4
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        10.583333333333330000
        111.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Ayuda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbRtaSugFija: TQRChildBand [6]
    Left = 38
    Top = 458
    Width = 740
    Height = 38
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrbRtaSugFijaBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      100.541666666666700000
      1957.916666666667000000)
    ParentBand = qrbAyuda
    object QRDBText8: TQRDBText
      Left = 16
      Top = 20
      Width = 701
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        52.916666666666660000
        1854.729166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'RTA_SUGERIDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 16
      Top = 4
      Width = 137
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        10.583333333333330000
        362.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Resupuesta sugerida'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbGrupoProceso: TQRGroup [7]
    Left = 38
    Top = 317
    Width = 740
    Height = 40
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = 13224393
    ForceNewColumn = False
    ForceNewPage = True
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    Expression = 'sdqDatos.PO_DESCRIPCION'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText16: TQRDBText
      Left = 88
      Top = 12
      Width = 129
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        232.833333333333400000
        31.750000000000000000
        341.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'PO_DESCRIPCION'
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
    object QRLabel17: TQRLabel
      Left = 16
      Top = 12
      Width = 63
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        31.750000000000000000
        166.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PROCESO'
      Color = clWhite
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object qrbTitulosDetalleModulos: TQRBand [8]
    Left = 38
    Top = 599
    Width = 740
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = 15921906
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666660000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object QRLabel5: TQRLabel
      Left = 16
      Top = 2
      Width = 380
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        5.291666666666667000
        1005.416666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Detalle de m'#243'dulos (datos contextualmente relacionados)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbTituloDetalleMotivoIngreso: TQRBand [9]
    Left = 38
    Top = 561
    Width = 740
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = 15921906
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666660000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object QRLabel6: TQRLabel
      Left = 16
      Top = 2
      Width = 219
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        5.291666666666667000
        579.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Detalle de los motivos de ingreso'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbTitulosModulos: TQRChildBand [10]
    Left = 38
    Top = 619
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625000000000000000
      1957.916666666667000000)
    ParentBand = qrbTitulosDetalleModulos
    object QRLabel11: TQRLabel
      Left = 16
      Top = 2
      Width = 36
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        5.291666666666667000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Orden'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 100
      Top = 2
      Width = 41
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        264.583333333333400000
        5.291666666666667000
        108.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'M'#243'dulo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 340
      Top = 2
      Width = 63
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        899.583333333333400000
        5.291666666666667000
        166.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Obligatorio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 536
      Top = 2
      Width = 75
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1418.166666666667000000
        5.291666666666667000
        198.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Dependencia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbDestinatarioTareas: TQRChildBand [11]
    Left = 38
    Top = 496
    Width = 740
    Height = 65
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrbDestinatarioTareasBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      171.979166666666700000
      1957.916666666667000000)
    ParentBand = qrbRtaSugFija
    object QRLabel7: TQRLabel
      Left = 16
      Top = 4
      Width = 135
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        10.583333333333330000
        357.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Destinatario conceptual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 156
      Top = 4
      Width = 445
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        412.750000000000000000
        10.583333333333330000
        1177.395833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TD_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 16
      Top = 20
      Width = 123
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        52.916666666666670000
        325.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Evento que lo genera'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 144
      Top = 20
      Width = 209
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        381.000000000000000000
        52.916666666666660000
        552.979166666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'PADRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlTiempoResolucion: TQRLabel
      Left = 608
      Top = 4
      Width = 123
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1608.666666666667000000
        10.583333333333330000
        325.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tiempo de resoluci'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlTiempoResolucionPrint
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 640
      Top = 20
      Width = 122
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1693.333333333333000000
        52.916666666666670000
        322.791666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'DIAS_RESOLUCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlDias: TQRLabel
      Left = 608
      Top = 20
      Width = 26
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1608.666666666667000000
        52.916666666666670000
        68.791666666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'D'#237'as'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlDiasPrint
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText17: TQRDBText
      Left = 648
      Top = 35
      Width = 133
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1714.500000000000000000
        92.604166666666680000
        351.895833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'HORAS_RESOLUCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlHoras: TQRLabel
      Left = 608
      Top = 35
      Width = 34
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1608.666666666667000000
        92.604166666666680000
        89.958333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Horas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlHorasPrint
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText18: TQRDBText
      Left = 656
      Top = 50
      Width = 149
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1735.666666666667000000
        132.291666666666700000
        394.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'MINUTOS_RESOLUCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlMinutos: TQRLabel
      Left = 608
      Top = 50
      Width = 44
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1608.666666666667000000
        132.291666666666700000
        116.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Minutos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlMinutosPrint
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 360
      Top = 20
      Width = 38
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        952.500000000000000000
        52.916666666666660000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sector'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = VerificarDestinatarioConceptual
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 404
      Top = 20
      Width = 197
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1068.916666666667000000
        52.916666666666660000
        521.229166666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'SC_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 360
      Top = 35
      Width = 36
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        952.500000000000000000
        92.604166666666680000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cargo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = VerificarDestinatarioConceptual
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText19: TQRDBText
      Left = 404
      Top = 35
      Width = 197
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1068.916666666667000000
        92.604166666666680000
        521.229166666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TB_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 360
      Top = 50
      Width = 88
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        952.500000000000000000
        132.291666666666700000
        232.833333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sector Intranet'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = VerificarDestinatarioConceptual
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText20: TQRDBText
      Left = 452
      Top = 50
      Width = 149
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1195.916666666667000000
        132.291666666666700000
        394.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'SE_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object QRGroup1: TQRGroup [12]
    Left = 38
    Top = 357
    Width = 740
    Height = 40
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = 15658734
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    Expression = 'sdqDatos.TE_DESCRIPCION'
    FooterBand = qrbFooterEspaciador
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText13: TQRDBText
      Left = 16
      Top = 10
      Width = 629
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        26.458333333333330000
        1664.229166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TE_DESCRIPCION'
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
    object QRDBText2: TQRDBText
      Left = 696
      Top = 12
      Width = 32
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1841.500000000000000000
        31.750000000000000000
        84.666666666666680000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'TIPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbDetalleMotivoIngreso: TQRSubDetail [13]
    Left = 38
    Top = 581
    Width = 740
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625000000000000000
      1957.916666666667000000)
    Master = Owner
    DataSet = sdqDetalleMotivosIngreso
    HeaderBand = qrbTituloDetalleMotivoIngreso
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText5: TQRDBText
      Left = 16
      Top = 2
      Width = 106
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        5.291666666666667000
        280.458333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clGreen
      DataSet = sdqDetalleMotivosIngreso
      DataField = 'MI_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbDetalleModulos: TQRSubDetail [14]
    Left = 38
    Top = 637
    Width = 740
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.333333333333340000
      1957.916666666667000000)
    Master = Owner
    DataSet = sdqDetalleModulos
    HeaderBand = qrbTitulosDetalleModulos
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText4: TQRDBText
      Left = 100
      Top = 1
      Width = 115
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        264.583333333333400000
        2.645833333333333000
        304.270833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDetalleModulos
      DataField = 'MO_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrbdObligatorio: TQRDBText
      Left = 340
      Top = 0
      Width = 127
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        899.583333333333400000
        0.000000000000000000
        336.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDetalleModulos
      DataField = 'OBLIGATORIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      OnPrint = ColoreoTilde
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 16
      Top = 1
      Width = 65
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        2.645833333333333000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDetalleModulos
      DataField = 'TM_ORDEN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 536
      Top = 1
      Width = 78
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1418.166666666667000000
        2.645833333333333000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDetalleModulos
      DataField = 'DEPENDE_DE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
  end
  object qrbFooterEspaciador: TQRBand [15]
    Left = 38
    Top = 653
    Width = 740
    Height = 21
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    BandType = rbGroupFooter
  end
  inherited sdqDatos: TSDQuery
    AfterScroll = sdqDatosAfterScroll
    OnCalcFields = sdqDatosCalcFields
    SQL.Strings = (
      ' SELECT ate.*, apo.*, atd.*, (SELECT COUNT(*)'
      '                                FROM agenda.atm_tipomoduloevento'
      '                               WHERE tm_idtipoevento = te_id'
      
        '                                 AND tm_fechabaja IS NULL) AS mo' +
        'dulos,'
      '        CASE'
      '          WHEN te_sql IS NULL THEN '#39#251#39
      '          ELSE DECODE(te_respuestasugeridafija, NULL, '#39#252#39', '#39#251#39')'
      '        END AS ri,'
      '       (SELECT padre.te_descripcion'
      '          FROM agenda.ate_tipoevento padre'
      '         WHERE padre.te_id = ate.te_idpadre) as padre,'
      '       TRUNC(te_tiemporesolucion / 24 / 60) AS dias_resolucion,'
      
        '       TRUNC(te_tiemporesolucion / 60) - (TRUNC(te_tiemporesoluc' +
        'ion / 24 / 60) * 24) AS horas_resolucion,'
      
        '       te_tiemporesolucion - (TRUNC(te_tiemporesolucion / 60) -(' +
        'TRUNC(te_tiemporesolucion / 24 / 60) * 24)) * 60 - (TRUNC(te_tie' +
        'mporesolucion / 24 / 60) * 24 * 60) AS minutos_resolucion,'
      
        '       cse.se_descripcion, usc.sc_descripcion, ctb.tb_descripcio' +
        'n, NVL(te_fechamodif, te_fechaalta) as fecha'
      
        '  FROM art.ctb_tablas ctb, art.usc_sectores usc, computos.cse_se' +
        'ctor cse,'
      
        '       agenda.atd_tipodestinatario atd, agenda.apo_proceso apo, ' +
        'agenda.ate_tipoevento ate'
      ' WHERE te_idproceso = po_id(+)'
      '   AND te_iddestinatario = td_id(+)'
      '   AND te_destinatario_idsector = cse.se_id(+)'
      '   AND te_destinatario_sector = usc.sc_codigo(+)'
      '   AND te_destinatario_cargo = ctb.tb_codigo(+)'
      '   AND ctb.tb_clave(+) = '#39'USCAR'#39)
    object sdqDatosTE_ID: TFloatField
      FieldName = 'TE_ID'
      Required = True
    end
    object sdqDatosTE_DESCRIPCION: TStringField
      FieldName = 'TE_DESCRIPCION'
      Size = 250
    end
    object sdqDatosTE_USUALTA: TStringField
      FieldName = 'TE_USUALTA'
    end
    object sdqDatosTE_FECHAALTA: TDateTimeField
      FieldName = 'TE_FECHAALTA'
    end
    object sdqDatosTE_USUMODIF: TStringField
      FieldName = 'TE_USUMODIF'
    end
    object sdqDatosTE_FECHAMODIF: TDateTimeField
      FieldName = 'TE_FECHAMODIF'
      DisplayFormat = 'DD/MM/YYYY HH:NN'
    end
    object sdqDatosTE_USUBAJA: TStringField
      FieldName = 'TE_USUBAJA'
    end
    object sdqDatosTE_FECHABAJA: TDateTimeField
      FieldName = 'TE_FECHABAJA'
    end
    object sdqDatosTE_TIPOEVENTO: TStringField
      FieldName = 'TE_TIPOEVENTO'
      Size = 3
    end
    object sdqDatosTE_IDPROCESO: TFloatField
      FieldName = 'TE_IDPROCESO'
    end
    object sdqDatosTE_AYUDA: TStringField
      FieldName = 'TE_AYUDA'
      Size = 1000
    end
    object sdqDatosTE_IDPADRE: TFloatField
      FieldName = 'TE_IDPADRE'
    end
    object sdqDatosTE_IDDESTINATARIO: TFloatField
      FieldName = 'TE_IDDESTINATARIO'
    end
    object sdqDatosTE_TIEMPORESOLUCION: TFloatField
      FieldName = 'TE_TIEMPORESOLUCION'
    end
    object sdqDatosTE_RESPUESTASUGERIDAFIJA: TStringField
      FieldName = 'TE_RESPUESTASUGERIDAFIJA'
      Size = 4000
    end
    object sdqDatosTE_DESTINATARIO_IDSECTOR: TFloatField
      FieldName = 'TE_DESTINATARIO_IDSECTOR'
    end
    object sdqDatosTE_DESTINATARIO_SECTOR: TStringField
      FieldName = 'TE_DESTINATARIO_SECTOR'
      Size = 8
    end
    object sdqDatosTE_DESTINATARIO_CARGO: TStringField
      FieldName = 'TE_DESTINATARIO_CARGO'
      Size = 10
    end
    object sdqDatosPO_ID: TFloatField
      FieldName = 'PO_ID'
    end
    object sdqDatosPO_DESCRIPCION: TStringField
      FieldName = 'PO_DESCRIPCION'
      Size = 30
    end
    object sdqDatosTD_ID: TFloatField
      FieldName = 'TD_ID'
    end
    object sdqDatosTD_DESCRIPCION: TStringField
      FieldName = 'TD_DESCRIPCION'
      Size = 100
    end
    object sdqDatosTD_SQL: TStringField
      FieldName = 'TD_SQL'
      Size = 4000
    end
    object sdqDatosTD_FECHAALTA: TDateTimeField
      FieldName = 'TD_FECHAALTA'
    end
    object sdqDatosTD_USUALTA: TStringField
      FieldName = 'TD_USUALTA'
    end
    object sdqDatosTD_FECHAMODIF: TDateTimeField
      FieldName = 'TD_FECHAMODIF'
    end
    object sdqDatosTD_USUMODIF: TStringField
      FieldName = 'TD_USUMODIF'
    end
    object sdqDatosTD_FECHABAJA: TDateTimeField
      FieldName = 'TD_FECHABAJA'
    end
    object sdqDatosTD_USUBAJA: TStringField
      FieldName = 'TD_USUBAJA'
    end
    object sdqDatosTD_EDITABLE: TStringField
      FieldName = 'TD_EDITABLE'
      Size = 1
    end
    object sdqDatosMODULOS: TFloatField
      FieldName = 'MODULOS'
    end
    object sdqDatosPADRE: TStringField
      FieldName = 'PADRE'
      Size = 250
    end
    object sdqDatosDIAS_RESOLUCION: TFloatField
      FieldName = 'DIAS_RESOLUCION'
    end
    object sdqDatosHORAS_RESOLUCION: TFloatField
      FieldName = 'HORAS_RESOLUCION'
    end
    object sdqDatosMINUTOS_RESOLUCION: TFloatField
      FieldName = 'MINUTOS_RESOLUCION'
    end
    object sdqDatosRI: TStringField
      FieldName = 'RI'
      Size = 1
    end
    object sdqDatosTIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPO'
      Calculated = True
    end
    object sdqDatosSE_DESCRIPCION: TStringField
      FieldName = 'SE_DESCRIPCION'
      Size = 50
    end
    object sdqDatosSC_DESCRIPCION: TStringField
      FieldName = 'SC_DESCRIPCION'
      Size = 60
    end
    object sdqDatosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDatosFECHA: TDateTimeField
      FieldName = 'FECHA'
      DisplayFormat = 'DD/MM/YYYY HH:NN'
    end
    object sdqDatosRTA_SUGERIDA: TStringField
      FieldKind = fkCalculated
      FieldName = 'RTA_SUGERIDA'
      Size = 8000
      Calculated = True
    end
    object sdqDatosSQLEXPLICACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'SQLEXPLICACION'
      Size = 8000
      Calculated = True
    end
  end
  object sdqDetalleMotivosIngreso: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT '#39#183' '#39' || mi_descripcion as mi_descripcion, mi_id'
      
        '           FROM agenda.ami_motivoingreso, agenda.ati_tipoeventom' +
        'otivoingreso'
      '          WHERE ti_idmotivoingreso(+) = mi_id'
      '            AND mi_fechabaja IS NULL'
      '            AND ti_fechabaja IS NULL'
      '            AND ti_idtipoevento = :ID'
      '       ORDER BY mi_descripcion')
    Top = 28
    ParamData = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqDetalleMotivosIngresoMI_DESCRIPCION: TStringField
      FieldName = 'MI_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqDetalleMotivosIngresoMI_ID: TFloatField
      FieldName = 'MI_ID'
      Required = True
    end
  end
  object sdqDetalleModulos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    OnCalcFields = sdqDetalleModulosCalcFields
    SQL.Strings = (
      'SELECT ame.*, atm.*, (SELECT '#39'Depende de '#39' || dep.mo_descripcion'
      '                        FROM agenda.amo_modulo dep'
      
        '                       WHERE dep.mo_tipomodulo = ame.mo_tipomodu' +
        'lodependiente) AS depende_de'
      '  FROM agenda.amo_modulo ame, agenda.atm_tipomoduloevento atm'
      ' WHERE tm_idmoduloevento = mo_id'
      '   AND tm_idtipoevento = :id'
      '   AND tm_fechabaja IS NULL'
      ' ORDER BY tm_orden')
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'id'
        ParamType = ptInput
        Value = '0'
      end>
    object sdqDetalleModulosMO_ID: TFloatField
      FieldName = 'MO_ID'
      Required = True
    end
    object sdqDetalleModulosMO_DESCRIPCION: TStringField
      FieldName = 'MO_DESCRIPCION'
      Size = 255
    end
    object sdqDetalleModulosMO_TIPOMODULO: TStringField
      FieldName = 'MO_TIPOMODULO'
      Size = 3
    end
    object sdqDetalleModulosMO_TIPOMODULODEPENDIENTE: TStringField
      FieldName = 'MO_TIPOMODULODEPENDIENTE'
      Size = 3
    end
    object sdqDetalleModulosMO_USUALTA: TStringField
      FieldName = 'MO_USUALTA'
      Required = True
    end
    object sdqDetalleModulosMO_FECHAALTA: TDateTimeField
      FieldName = 'MO_FECHAALTA'
      Required = True
    end
    object sdqDetalleModulosMO_USUMODIF: TStringField
      FieldName = 'MO_USUMODIF'
    end
    object sdqDetalleModulosMO_FECHAMODIF: TDateTimeField
      FieldName = 'MO_FECHAMODIF'
    end
    object sdqDetalleModulosMO_USUBAJA: TStringField
      FieldName = 'MO_USUBAJA'
    end
    object sdqDetalleModulosMO_FECHABAJA: TDateTimeField
      FieldName = 'MO_FECHABAJA'
    end
    object sdqDetalleModulosMO_CODIGOPANEL: TFloatField
      FieldName = 'MO_CODIGOPANEL'
    end
    object sdqDetalleModulosTM_ID: TFloatField
      FieldName = 'TM_ID'
      Required = True
    end
    object sdqDetalleModulosTM_IDTIPOEVENTO: TFloatField
      FieldName = 'TM_IDTIPOEVENTO'
      Required = True
    end
    object sdqDetalleModulosTM_IDMODULOEVENTO: TFloatField
      FieldName = 'TM_IDMODULOEVENTO'
      Required = True
    end
    object sdqDetalleModulosTM_ORDEN: TStringField
      FieldName = 'TM_ORDEN'
      Size = 2
    end
    object sdqDetalleModulosTM_USUALTA: TStringField
      FieldName = 'TM_USUALTA'
      Required = True
    end
    object sdqDetalleModulosTM_FECHAALTA: TDateTimeField
      FieldName = 'TM_FECHAALTA'
      Required = True
    end
    object sdqDetalleModulosTM_USUMODIF: TStringField
      FieldName = 'TM_USUMODIF'
    end
    object sdqDetalleModulosTM_FECHAMODIF: TDateTimeField
      FieldName = 'TM_FECHAMODIF'
    end
    object sdqDetalleModulosTM_USUBAJA: TStringField
      FieldName = 'TM_USUBAJA'
    end
    object sdqDetalleModulosTM_FECHABAJA: TDateTimeField
      FieldName = 'TM_FECHABAJA'
    end
    object sdqDetalleModulosTM_OBLIGATORIO: TStringField
      FieldName = 'TM_OBLIGATORIO'
      Size = 1
    end
    object sdqDetalleModulosDEPENDE_DE: TStringField
      FieldName = 'DEPENDE_DE'
      Size = 266
    end
    object sdqDetalleModulosOBLIGATORIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBLIGATORIO'
      Size = 1
      Calculated = True
    end
  end
end
