inherited qrEncuesta: TqrEncuesta
  Frame.Color = clGray
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  BeforePrint = QuickRepBeforePrint
  DataSet = sdqDetalle
  Font.Name = 'Neo Sans'
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
  ReportTitle = 'Encuesta'
  inherited qrbPageHeader: TQRBand
    Frame.Color = clSilver
    Size.Values = (
      261.937500000000000000
      1957.916666666667000000)
    inherited qriLogoART: TQRImage
      Size.Values = (
        169.333333333333300000
        767.291666666666800000
        23.812500000000000000
        431.270833333333400000)
    end
    object QRDBText8: TQRDBText
      Left = 312
      Top = 76
      Width = 124
      Height = 21
      Size.Values = (
        55.562500000000000000
        825.500000000000000000
        201.083333333333300000
        328.083333333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EN_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 12
    end
  end
  inherited qrbTitle: TQRBand
    Height = 88
    Frame.Color = clGray
    Frame.DrawTop = True
    Size.Values = (
      232.833333333333400000
      1957.916666666667000000)
    ExplicitHeight = 88
    inherited qrlReferencia: TQRLabel
      Left = 211
      Top = 184
      Enabled = False
      Size.Values = (
        44.979166666666670000
        558.270833333333400000
        486.833333333333400000
        89.958333333333320000)
      FontSize = 10
      ExplicitLeft = 211
      ExplicitTop = 184
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 247
      Top = 184
      Enabled = False
      Size.Values = (
        44.979166666666670000
        653.520833333333200000
        486.833333333333300000
        881.062500000000000000)
      FontSize = 10
      ExplicitLeft = 247
      ExplicitTop = 184
    end
    inherited qrlSaludo: TQRLabel
      Left = 12
      Top = 183
      Width = 181
      Enabled = False
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        484.187500000000000000
        478.895833333333400000)
      FontSize = 10
      ExplicitLeft = 12
      ExplicitTop = 183
      ExplicitWidth = 181
    end
    inherited qrlDestinatario: TQRLabel
      Left = 16
      Top = 65
      Width = 46
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        171.979166666666700000
        121.708333333333300000)
      FontSize = 10
      ExplicitLeft = 16
      ExplicitTop = 65
      ExplicitWidth = 46
    end
    inherited qrlFecha: TQRLabel
      Left = 510
      Top = 28
      Width = 224
      Enabled = False
      Size.Values = (
        44.979166666666670000
        1349.375000000000000000
        74.083333333333340000
        592.666666666666800000)
      FontSize = 10
      ExplicitLeft = 510
      ExplicitTop = 28
      ExplicitWidth = 224
    end
    object QRDBText1: TQRDBText
      Left = 68
      Top = 43
      Width = 88
      Height = 18
      Size.Values = (
        47.625000000000000000
        179.916666666666700000
        113.770833333333300000
        232.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EI_CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 346
      Top = 44
      Width = 387
      Height = 38
      Size.Values = (
        100.541666666666700000
        915.458333333333200000
        116.416666666666700000
        1023.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EM_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 72
      Top = 63
      Width = 89
      Height = 18
      Size.Values = (
        47.625000000000000000
        190.500000000000000000
        166.687500000000000000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CT_CONTACTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 16
      Top = 44
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        116.416666666666700000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Contrato'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlEmpresa: TQRLabel
      Left = 290
      Top = 44
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        767.291666666666800000
        116.416666666666700000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Empresa'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 16
      Top = 64
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        169.333333333333300000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Contacto'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 128
      Top = 44
      Width = 40
      Height = 17
      Size.Values = (
        44.979166666666670000
        338.666666666666700000
        116.416666666666700000
        105.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C.U.I.T.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlCUIT: TQRLabel
      Left = 171
      Top = 43
      Width = 41
      Height = 18
      Size.Values = (
        47.625000000000000000
        452.437500000000000000
        113.770833333333300000
        108.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C.U.I.T'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 16
      Top = 24
      Width = 98
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        63.500000000000000000
        259.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha realizaci'#243'n'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrdbFechaFinalizado: TQRDBText
      Left = 118
      Top = 24
      Width = 89
      Height = 18
      Size.Values = (
        47.625000000000000000
        312.208333333333400000
        63.500000000000000000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EI_FECHATERMINADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 296
      Top = 24
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        783.166666666666800000
        63.500000000000000000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 346
      Top = 24
      Width = 79
      Height = 18
      Size.Values = (
        47.625000000000000000
        915.458333333333200000
        63.500000000000000000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'SE_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrlNoFinalizada: TQRLabel
      Left = 118
      Top = 24
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666670000
        312.208333333333400000
        63.500000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'No finalizada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlNoAsignado: TQRLabel
      Left = 346
      Top = 24
      Width = 72
      Height = 17
      Size.Values = (
        44.979166666666670000
        915.458333333333200000
        63.500000000000000000
        190.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'No asignado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 16
      Top = 5
      Width = 69
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        13.229166666666670000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Encuesta N'#176
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 87
      Top = 5
      Width = 33
      Height = 18
      Size.Values = (
        47.625000000000000000
        230.187500000000000000
        13.229166666666670000
        87.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EI_ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  inherited qrbPageFooter: TQRBand
    Top = 324
    Height = 25
    Frame.Color = clGray
    Color = 14803425
    Size.Values = (
      66.145833333333340000
      1957.916666666667000000)
    ExplicitTop = 324
    ExplicitHeight = 25
    inherited qrmDatosART: TQRMemo
      Left = 14
      Top = 24
      Enabled = False
      Size.Values = (
        193.145833333333300000
        37.041666666666670000
        63.500000000000000000
        764.645833333333400000)
      FontSize = 8
      ExplicitLeft = 14
      ExplicitTop = 24
    end
    inherited qriLogoGBP: TQRImage
      Left = 630
      Top = 28
      Enabled = False
      Size.Values = (
        148.166666666666700000
        1666.875000000000000000
        74.083333333333340000
        256.645833333333400000)
      ExplicitLeft = 630
      ExplicitTop = 28
    end
    object qrePagina: TQRExpr
      Left = 652
      Top = 4
      Width = 83
      Height = 17
      Size.Values = (
        44.979166666666670000
        1725.083333333334000000
        10.583333333333330000
        219.604166666666700000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      ResetAfterPrint = False
      Transparent = True
      Expression = 'PAGENUMBER'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 676
      Top = 4
      Width = 41
      Height = 17
      Size.Values = (
        44.979166666666670000
        1788.583333333333000000
        10.583333333333330000
        108.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'P'#225'gina'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 210
      Top = 3
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        555.625000000000000000
        7.937500000000000000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 261
      Top = 3
      Width = 79
      Height = 18
      Size.Values = (
        47.625000000000000000
        690.562500000000000000
        7.937500000000000000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'SE_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 16
      Top = 3
      Width = 98
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        7.937500000000000000
        259.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha realizaci'#243'n'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 118
      Top = 3
      Width = 89
      Height = 18
      Size.Values = (
        47.625000000000000000
        312.208333333333300000
        7.937500000000000000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'EI_FECHATERMINADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrlNoFinalizada2: TQRLabel
      Left = 118
      Top = 3
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666670000
        312.208333333333400000
        7.937500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'No finalizada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlNoAsignado2: TQRLabel
      Left = 261
      Top = 3
      Width = 72
      Height = 17
      Size.Values = (
        44.979166666666670000
        690.562500000000000000
        7.937500000000000000
        190.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'No asignado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  inherited qrbSummary: TQRBand
    Top = 284
    Enabled = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    ExplicitTop = 284
    inherited qrlSaludoFinal: TQRLabel
      Width = 314
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        21.166666666666670000
        830.791666666666800000)
      FontSize = 10
      ExplicitWidth = 314
    end
  end
  object QRBand4: TQRBand [4]
    Left = 38
    Top = 265
    Width = 740
    Height = 19
    AlignToBottom = False
    BeforePrint = QRBand4BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRDBText6: TQRDBText
      Left = 73
      Top = 2
      Width = 656
      Height = 14
      Size.Values = (
        37.041666666666670000
        193.145833333333300000
        5.291666666666667000
        1735.666666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'MP_RESPUESTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object chkElegida: TQRCheckBox
      Left = 50
      Top = 2
      Width = 14
      Height = 14
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        37.041666666666670000
        132.291666666666700000
        5.291666666666667000
        37.041666666666670000)
      XLColumn = 0
      TickStyle = tsCross
      Checked = False
    end
  end
  object QRGroup1: TQRGroup [5]
    Left = 38
    Top = 225
    Width = 740
    Height = 20
    Frame.Color = clSilver
    Frame.DrawTop = True
    AlignToBottom = False
    Color = 14803425
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666670000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Expression = 'sdqDetalle.MP_CATEGORIA'
    Master = Owner
    ReprintOnNewPage = True
    object QRDBText4: TQRDBText
      Left = 16
      Top = 2
      Width = 101
      Height = 14
      Size.Values = (
        37.041666666666670000
        42.333333333333340000
        5.291666666666667000
        267.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'MP_CATEGORIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object QRGroup2: TQRGroup [6]
    Left = 38
    Top = 245
    Width = 740
    Height = 20
    Frame.Color = clSilver
    Frame.DrawTop = True
    Frame.DrawBottom = True
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
    Expression = 'sdqDetalle.MP_PREGUNTA'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText5: TQRDBText
      Left = 44
      Top = 1
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666670000
        116.416666666666700000
        2.645833333333333000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'MP_PREGUNTA'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 14
      Top = 1
      Width = 27
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        2.645833333333333000
        71.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'MP_ORDEN'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  inherited sdqDatos: TSDQuery
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      'SELECT ct_contacto,'
      '       em_nombre,'
      '       em_cuit,'
      '       co_direlectronica,'
      '       se_nombre,'
      '       cen.*,'
      '       cei.*'
      
        '  FROM art.use_usuarios, act_contacto, aem_empresa, aco_contrato' +
        ', comercial.cen_encuesta cen, comercial.cei_encuestainstancia ce' +
        'i'
      ' WHERE ei_id = :id'
      '   AND ei_idencuesta = en_id'
      '   AND ei_contrato = co_contrato(+)'
      '   AND co_idempresa = em_id(+)'
      '   AND ei_idcontacto = ct_id(+)'
      '   AND NVL(ei_usuterminado, ei_responsable) = se_usuario(+)')
    Left = 32
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 11
      end>
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT *'
      '    FROM comercial.tmp_reporteencuesta'
      '   WHERE mp_usuario = art.getosuser'
      'ORDER BY mp_orden, mp_respuesta')
    Left = 84
    Top = 4
    object sdqDetalleMP_USUARIO: TStringField
      FieldName = 'MP_USUARIO'
      Required = True
    end
    object sdqDetalleMP_CATEGORIA: TStringField
      FieldName = 'MP_CATEGORIA'
      Size = 4000
    end
    object sdqDetalleMP_PREGUNTA: TStringField
      FieldName = 'MP_PREGUNTA'
      Required = True
      Size = 4000
    end
    object sdqDetalleMP_TIPO: TStringField
      FieldName = 'MP_TIPO'
      Required = True
      Size = 1
    end
    object sdqDetalleMP_RESPUESTA: TStringField
      FieldName = 'MP_RESPUESTA'
      Size = 4000
    end
    object sdqDetalleMP_ELEGIDA: TStringField
      FieldName = 'MP_ELEGIDA'
      Size = 1
    end
    object sdqDetalleMP_ORDEN: TFloatField
      FieldName = 'MP_ORDEN'
      Required = True
    end
  end
end
