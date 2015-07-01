inherited qrEndoso1: TqrEndoso1
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = []
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  ReportTitle = 'Endoso'
  PreviewInitialState = wsMaximized
  object TitleBand1: TQRBand [0]
    Left = 38
    Top = 38
    Width = 740
    Height = 187
    AlignToBottom = False
    BeforePrint = TitleBand1BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      494.770833333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbTitle
    object QRLabel1: TQRLabel
      Left = 5
      Top = 1
      Width = 103
      Height = 13
      Size.Values = (
        34.395833333333330000
        13.229166666666670000
        2.645833333333333000
        272.520833333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'CODIGO DE ART 0005-1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel2: TQRLabel
      Left = 5
      Top = 13
      Width = 105
      Height = 13
      Size.Values = (
        34.395833333333330000
        13.229166666666670000
        34.395833333333330000
        277.812500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'C.U.I.T. N'#186' 30-68825409-0'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object qrlLugarFecha: TQRLabel
      Left = 7
      Top = 56
      Width = 74
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        148.166666666666700000
        195.791666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Lugar y fecha'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qriLogoNom: TQRImage
      Left = 575
      Top = 0
      Width = 165
      Height = 65
      Size.Values = (
        171.979166666666700000
        1521.354166666667000000
        0.000000000000000000
        436.562499999999900000)
      XLColumn = 0
      Stretch = True
    end
  end
  object ChildBand1: TQRChildBand [1]
    Left = 38
    Top = 225
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = TitleBand1
    PrintOrder = cboAfterParent
    object qrEndosoNro: TQRLabel
      Left = 8
      Top = 2
      Width = 58
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Endoso N'#186' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrVigenciaEndoso: TQRLabel
      Left = 465
      Top = 2
      Width = 211
      Height = 17
      Size.Values = (
        44.979166666666670000
        1230.312500000000000000
        5.291666666666667000
        558.270833333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'Fecha de inicio de vigencia del endoso: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object ChildBand2: TQRChildBand [2]
    Left = 38
    Top = 256
    Width = 740
    Height = 40
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand15
    PrintOrder = cboAfterParent
    object QRDBText3: TQRDBText
      Left = 641
      Top = 19
      Width = 98
      Height = 21
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        55.562500000000000000
        1695.979166666670000000
        50.270833333333300000
        259.291666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'VIG_HASTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 544
      Top = 19
      Width = 98
      Height = 21
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        55.562500000000000000
        1439.333333333330000000
        50.270833333333300000
        259.291666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'VIG_DESDE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 449
      Top = 19
      Width = 96
      Height = 21
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        55.562500000000000000
        1187.979166666670000000
        50.270833333333300000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 544
      Top = 1
      Width = 195
      Height = 20
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        52.916666666666700000
        1439.333333333330000000
        2.645833333333330000
        515.937500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Vigencia del Contrato'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 449
      Top = 1
      Width = 96
      Height = 20
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        52.916666666666700000
        1187.979166666670000000
        2.645833333333330000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Contrato N'#186
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrMotivo: TQRLabel
      Left = 8
      Top = 0
      Width = 437
      Height = 37
      Size.Values = (
        97.895833333333300000
        21.166666666666700000
        0.000000000000000000
        1156.229166666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Motivo: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object ChildBand3: TQRChildBand [3]
    Left = 38
    Top = 306
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand16
    PrintOrder = cboAfterParent
    object QRLabel6: TQRLabel
      Left = 8
      Top = 2
      Width = 60
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Asegurado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 454
      Top = 2
      Width = 111
      Height = 17
      Size.Values = (
        44.979166666666700000
        1201.208333333330000000
        5.291666666666670000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'C.U.I.T.'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape3: TQRShape
      Left = 567
      Top = 0
      Width = 1
      Height = 21
      Size.Values = (
        55.562500000000000000
        1500.187500000000000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape1: TQRShape
      Left = 455
      Top = 0
      Width = 1
      Height = 21
      Size.Values = (
        55.562500000000000000
        1203.854166666670000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object ChildBand4: TQRChildBand [4]
    Left = 38
    Top = 327
    Width = 740
    Height = 21
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
    ParentBand = ChildBand3
    PrintOrder = cboAfterParent
    object QRDBText4: TQRDBText
      Left = 8
      Top = 2
      Width = 429
      Height = 17
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        5.291666666666670000
        1135.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrCUIT: TQRDBText
      Left = 454
      Top = 2
      Width = 111
      Height = 17
      Size.Values = (
        44.979166666666700000
        1201.208333333330000000
        5.291666666666670000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = qrCUITPrint
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRShape4: TQRShape
      Left = 567
      Top = 0
      Width = 1
      Height = 21
      Size.Values = (
        55.562500000000000000
        1500.187500000000000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape2: TQRShape
      Left = 455
      Top = 0
      Width = 1
      Height = 21
      Size.Values = (
        55.562500000000000000
        1203.854166666670000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object ChildBand5: TQRChildBand [5]
    Left = 38
    Top = 348
    Width = 740
    Height = 10
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.458333333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand4
    PrintOrder = cboAfterParent
  end
  object ChildBand6: TQRChildBand [6]
    Left = 38
    Top = 358
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand5
    PrintOrder = cboAfterParent
    object QRLabel8: TQRLabel
      Left = 8
      Top = 2
      Width = 91
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio Postal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object ChildBand7: TQRChildBand [7]
    Left = 38
    Top = 379
    Width = 740
    Height = 57
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      150.812500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand6
    PrintOrder = cboAfterParent
    object QRLocalidadPostal: TQRDBText
      Left = 7
      Top = 20
      Width = 88
      Height = 17
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        52.916666666666670000
        232.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'LOCALIDAD_P'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 7
      Top = 37
      Width = 82
      Height = 17
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        97.895833333333330000
        216.958333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'PROVINCIA_P'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 7
      Top = 3
      Width = 140
      Height = 17
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        7.937500000000000000
        370.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'HD_DOMICILIOPOSTAL'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  object ChildBand8: TQRChildBand [8]
    Left = 38
    Top = 436
    Width = 740
    Height = 10
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.458333333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand7
    PrintOrder = cboAfterParent
  end
  object ChildBand9: TQRChildBand [9]
    Left = 38
    Top = 446
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand8
    PrintOrder = cboAfterParent
    object lbDomicilioLegalTitulo: TQRLabel
      Left = 8
      Top = 2
      Width = 120
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio Constituido'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = lbDomicilioLegalTituloPrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object ChildBand10: TQRChildBand [10]
    Left = 38
    Top = 467
    Width = 740
    Height = 57
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      150.812500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand9
    PrintOrder = cboAfterParent
    object QRLocalidadLegal: TQRDBText
      Left = 7
      Top = 20
      Width = 88
      Height = 17
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        52.916666666666670000
        232.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'LOCALIDAD_L'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 7
      Top = 37
      Width = 82
      Height = 17
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        97.895833333333330000
        216.958333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'PROVINCIA_L'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 7
      Top = 3
      Width = 131
      Height = 17
      Size.Values = (
        44.979166666666670000
        18.520833333333330000
        7.937500000000000000
        346.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'HD_DOMICILIOLEGAL'
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  object ChildBand11: TQRChildBand [11]
    Left = 38
    Top = 524
    Width = 740
    Height = 10
    Frame.DrawTop = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.458333333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand10
    PrintOrder = cboAfterParent
  end
  object ChildBand12: TQRChildBand [12]
    Left = 38
    Top = 534
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand11
    PrintOrder = cboAfterParent
    object QRLabel10: TQRLabel
      Left = 8
      Top = 2
      Width = 51
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        134.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Actividad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape6: TQRShape
      Left = 551
      Top = 0
      Width = 1
      Height = 21
      Size.Values = (
        55.562500000000000000
        1457.854166666670000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrcb13: TQRChildBand [13]
    Left = 38
    Top = 555
    Width = 740
    Height = 53
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    BeforePrint = qrcb13BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      140.229166666666700000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand12
    PrintOrder = cboAfterParent
    object QRDBText7: TQRDBText
      Left = 8
      Top = 2
      Width = 60
      Height = 17
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        5.291666666666670000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'COD_ACTIVIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = QRDBText7Print
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrshActividadLinea1: TQRShape
      Left = 73
      Top = 0
      Width = 1
      Height = 52
      Size.Values = (
        137.583333333333000000
        193.145833333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText8: TQRDBText
      Left = 80
      Top = 2
      Width = 465
      Height = 17
      Size.Values = (
        44.979166666666700000
        211.666666666667000000
        5.291666666666670000
        1230.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'ACTIVIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = QRDBText8Print
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrshActividadLinea2: TQRShape
      Left = 551
      Top = 0
      Width = 1
      Height = 52
      Size.Values = (
        137.583333333333000000
        1457.854166666670000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText5: TQRDBText
      Left = 8
      Top = 18
      Width = 60
      Height = 17
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        47.625000000000000000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'COD_ACTIVIDAD2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = QRDBText5Print
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 80
      Top = 18
      Width = 465
      Height = 17
      Size.Values = (
        44.979166666666700000
        211.666666666667000000
        47.625000000000000000
        1230.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'ACTIVIDAD2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = QRDBText6Print
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 8
      Top = 34
      Width = 60
      Height = 17
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        89.958333333333300000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'COD_ACTIVIDAD3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = QRDBText9Print
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 80
      Top = 34
      Width = 465
      Height = 17
      Size.Values = (
        44.979166666666700000
        211.666666666667000000
        89.958333333333300000
        1230.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqQuery
      DataField = 'ACTIVIDAD3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      OnPrint = QRDBText14Print
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
  object ChildBand15: TQRChildBand [14]
    Left = 38
    Top = 246
    Width = 740
    Height = 10
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.458333333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand1
    PrintOrder = cboAfterParent
  end
  object ChildBand16: TQRChildBand [15]
    Left = 38
    Top = 296
    Width = 740
    Height = 10
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.458333333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand2
    PrintOrder = cboAfterParent
  end
  object shNivelHigieneTitulo: TQRShape [16]
    Left = 590
    Top = 531
    Width = 191
    Height = 54
    Frame.Color = clBlue
    Frame.DrawTop = True
    Frame.DrawRight = True
    Frame.Width = 2
    Size.Values = (
      142.875000000000000000
      1561.041666666667000000
      1404.937500000000000000
      505.354166666666700000)
    XLColumn = 0
    Pen.Style = psClear
    Pen.Width = 0
    Shape = qrsRectangle
    VertAdjust = 0
  end
  object lbNivelHigieneTitulo: TQRLabel [17]
    Left = 591
    Top = 534
    Width = 145
    Height = 41
    Size.Values = (
      108.479166666666700000
      1563.687500000000000000
      1412.875000000000000000
      383.645833333333400000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Caption = 'Nivel Cumplimiento Higiene y Seguridad'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object ChildBand14: TQRChildBand [18]
    Left = 38
    Top = 608
    Width = 740
    Height = 10
    Frame.DrawTop = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      26.458333333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrcb13
    PrintOrder = cboAfterParent
  end
  object qrCh1: TQRChildBand [19]
    Left = 38
    Top = 618
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = ChildBand14
    PrintOrder = cboAfterParent
    object QRLabel12: TQRLabel
      Left = 8
      Top = 2
      Width = 66
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ALICUOTA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 372
      Top = 2
      Width = 118
      Height = 17
      Size.Values = (
        44.979166666666700000
        984.250000000000000000
        5.291666666666670000
        312.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Valor a Aplicar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel24: TQRLabel
      Left = 495
      Top = 2
      Width = 117
      Height = 17
      Size.Values = (
        44.979166666666700000
        1309.687500000000000000
        5.291666666666670000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel25: TQRLabel
      Left = 618
      Top = 2
      Width = 118
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        5.291666666666670000
        312.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = '%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object Raya1: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object Raya2: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object Raya3: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh2: TQRChildBand [20]
    Left = 38
    Top = 639
    Width = 740
    Height = 19
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh1
    PrintOrder = cboAfterParent
    object QRLabel13: TQRLabel
      Left = 8
      Top = 1
      Width = 127
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        336.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Suma fija por trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrSumaFijaTarifa: TQRLabel
      Left = 510
      Top = 1
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        2.645833333333330000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrSumaFijaTarifa'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape8: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape9: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape10: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh3: TQRChildBand [21]
    Left = 38
    Top = 658
    Width = 740
    Height = 19
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh2
    PrintOrder = cboAfterParent
    object QRLabel14: TQRLabel
      Left = 8
      Top = 1
      Width = 218
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        576.791666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Porcentaje Variable sobre la masa salarial'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrPorcMasaTarifa: TQRLabel
      Left = 620
      Top = 1
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        2.645833333333330000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrPorcMasaTarifa'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape13: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape14: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape15: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh4: TQRChildBand [22]
    Left = 38
    Top = 677
    Width = 740
    Height = 19
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh3
    PrintOrder = cboAfterParent
    object QRLabel15: TQRLabel
      Left = 8
      Top = 1
      Width = 177
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        468.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Rebaja por volumen masa salarial'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDescVolumen_0: TQRLabel
      Left = 360
      Top = 1
      Width = 99
      Height = 16
      Size.Values = (
        42.333333333333330000
        952.500000000000000000
        2.645833333333333000
        261.937500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDescVolumen_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDescVolumen_2: TQRLabel
      Left = 620
      Top = 1
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        2.645833333333330000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDescVolumen_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape16: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape17: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape18: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh5: TQRChildBand [23]
    Left = 38
    Top = 696
    Width = 740
    Height = 19
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh4
    PrintOrder = cboAfterParent
    object QRLabel16: TQRLabel
      Left = 8
      Top = 1
      Width = 148
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        391.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Rebaja Higiene y Seguridad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDescHYS_0: TQRLabel
      Left = 383
      Top = 1
      Width = 76
      Height = 16
      Size.Values = (
        42.333333333333330000
        1013.354166666667000000
        2.645833333333333000
        201.083333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDescHYS_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDescHYS_2: TQRLabel
      Left = 620
      Top = 1
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        2.645833333333330000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDescHYS_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape19: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape20: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape21: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh6: TQRChildBand [24]
    Left = 38
    Top = 715
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
    ParentBand = qrCh5
    PrintOrder = cboAfterParent
    object QRLabel19: TQRLabel
      Left = 293
      Top = 2
      Width = 69
      Height = 17
      Size.Values = (
        44.979166666666670000
        775.229166666666700000
        5.291666666666667000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'SUBTOTAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRSubTotal1: TQRLabel
      Left = 510
      Top = 2
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1349.375000000000000000
        5.291666666666670000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'QRSubTotal1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRSubTotal2: TQRLabel
      Left = 620
      Top = 2
      Width = 100
      Height = 17
      Size.Values = (
        44.979166666666700000
        1640.416666666670000000
        5.291666666666670000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'QRSubTotal2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape25: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape26: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape27: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh12: TQRChildBand [25]
    Left = 38
    Top = 841
    Width = 740
    Height = 21
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
    ParentBand = qrCh11
    PrintOrder = cboAfterParent
    object QRLabel17: TQRLabel
      Left = 8
      Top = 1
      Width = 363
      Height = 17
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        2.645833333333330000
        960.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'Aporte a SRT y SSN Res. SRT 39, 52/98 Res. SSN 25.806 y 25.945/9' +
        '8'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc5_0: TQRLabel
      Left = 401
      Top = 1
      Width = 58
      Height = 17
      Size.Values = (
        44.979166666666670000
        1060.979166666667000000
        2.645833333333333000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDesc5_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc5_1: TQRLabel
      Left = 510
      Top = 1
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1349.375000000000000000
        2.645833333333330000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc5_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc5_2: TQRLabel
      Left = 620
      Top = 1
      Width = 100
      Height = 17
      Size.Values = (
        44.979166666666700000
        1640.416666666670000000
        2.645833333333330000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc5_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape40: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 35
      Size.Values = (
        92.604166666666700000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape41: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 35
      Size.Values = (
        92.604166666666700000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape42: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 35
      Size.Values = (
        92.604166666666700000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh13: TQRChildBand [26]
    Left = 38
    Top = 862
    Width = 740
    Height = 19
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh12
    PrintOrder = cboAfterParent
    object QRLabel18: TQRLabel
      Left = 8
      Top = 1
      Width = 239
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        632.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fondo Espec'#237'fico Dto.590/97 Res.SSN 25.279'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc6_1: TQRLabel
      Left = 510
      Top = 1
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        2.645833333333330000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc6_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape43: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape44: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape45: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh14: TQRChildBand [27]
    Left = 38
    Top = 881
    Width = 740
    Height = 21
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clSilver
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh13
    PrintOrder = cboAfterParent
    object QRLabel20: TQRLabel
      Left = 8
      Top = 2
      Width = 106
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        280.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ALICUOTA FINAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel33: TQRLabel
      Left = 618
      Top = 2
      Width = 118
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        5.291666666666670000
        312.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = '%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel34: TQRLabel
      Left = 495
      Top = 2
      Width = 117
      Height = 17
      Size.Values = (
        44.979166666666700000
        1309.687500000000000000
        5.291666666666670000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape47: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape48: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh15: TQRChildBand [28]
    Left = 38
    Top = 902
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
    ParentBand = qrCh14
    PrintOrder = cboAfterParent
    object QRLabel21: TQRLabel
      Left = 8
      Top = 2
      Width = 136
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        359.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Suma Fija por trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrALICUOTA: TQRLabel
      Left = 510
      Top = 2
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1349.375000000000000000
        5.291666666666670000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrALICUOTA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape50: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape51: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh16: TQRChildBand [29]
    Left = 38
    Top = 923
    Width = 740
    Height = 21
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
    ParentBand = qrCh15
    PrintOrder = cboAfterParent
    object QRLabel22: TQRLabel
      Left = 8
      Top = 2
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        5.291666666666667000
        613.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Porcentaje Variable sobre la masa salarial'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrPORCMASA: TArtQRLabel
      Left = 620
      Top = 2
      Width = 100
      Height = 17
      Size.Values = (
        44.979166666666700000
        1640.416666666670000000
        5.291666666666670000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrPORCMASA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape53: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape54: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh17: TQRChildBand [30]
    Left = 38
    Top = 944
    Width = 740
    Height = 82
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      216.958333333333300000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh16
    PrintOrder = cboAfterParent
    object qrTextoInf: TQRLabel
      Left = 8
      Top = 50
      Width = 725
      Height = 29
      Size.Values = (
        76.729166666666700000
        21.166666666666700000
        132.291666666667000000
        1918.229166666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'Cl'#225'usula penal por incumplimiento de denuncias del empleador: $1' +
        '00.000. El costo de los ex'#225'menes m'#233'dicos peri'#243'dicos (Res. SRT 43' +
        '/97 y 54/98) se encuentra incluido en el valor de la al'#237'cuota'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrLeyenda060: TQRLabel
      Left = 8
      Top = 34
      Width = 725
      Height = 15
      Size.Values = (
        39.687500000000000000
        21.166666666666700000
        89.958333333333300000
        1918.229166666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'La al'#237'cuota final incluye la suma de $0,60 correspondiente al Fo' +
        'ndo Fiduciario de Enfermedades Profesionales - Decreto 1278/00.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrRecargosDescuentos: TQRLabel
      Left = 8
      Top = 4
      Width = 725
      Height = 29
      Size.Values = (
        76.729166666666700000
        21.166666666666700000
        10.583333333333300000
        1918.229166666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrRecargosDescuentos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
  end
  object qrCh19: TQRChildBand [31]
    Left = 38
    Top = 1026
    Width = 740
    Height = 25
    Frame.DrawTop = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      66.145833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh17
    PrintOrder = cboAfterParent
    object qrFormatoPie: TQRLabel
      Left = 8
      Top = 0
      Width = 725
      Height = 25
      Size.Values = (
        66.145833333333300000
        21.166666666666700000
        0.000000000000000000
        1918.229166666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrFormatoPie'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
  end
  object shNivelHigiene: TQRShape [32]
    Left = 738
    Top = 534
    Width = 40
    Height = 41
    Frame.Color = clBlue
    Frame.DrawTop = True
    Frame.DrawRight = True
    Frame.Width = 2
    Size.Values = (
      108.479166666666700000
      1952.625000000000000000
      1412.875000000000000000
      105.833333333333300000)
    XLColumn = 0
    Pen.Width = 0
    Shape = qrsRectangle
    VertAdjust = 0
  end
  object edNivelHigiene: TQRDBText [33]
    Left = 746
    Top = 544
    Width = 22
    Height = 21
    Size.Values = (
      55.562500000000000000
      1973.791666666667000000
      1439.333333333333000000
      58.208333333333340000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Color = clWhite
    DataSet = sdqQuery
    DataField = 'NIVEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FullJustify = False
    MaxBreakChars = 0
    FontSize = 10
  end
  object qrCuitCodBarra: TQRLabel [34]
    Left = 606
    Top = 298
    Width = 173
    Height = 50
    Size.Values = (
      132.291666666666700000
      1603.375000000000000000
      788.458333333333400000
      457.729166666666600000)
    XLColumn = 0
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    Caption = '**'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -43
    Font.Name = 'Codigo de Barras'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 32
  end
  object qrCh7: TQRChildBand [35]
    Left = 38
    Top = 736
    Width = 740
    Height = 21
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
    ParentBand = qrCh6
    PrintOrder = cboAfterParent
    object qrTit0: TQRLabel
      Left = 8
      Top = 1
      Width = 210
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        555.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Recargo por Siniestralidad % s/variable'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc0_0: TQRLabel
      Left = 401
      Top = 1
      Width = 58
      Height = 16
      Size.Values = (
        42.333333333333330000
        1060.979166666667000000
        2.645833333333333000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDesc0_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc0_1: TQRLabel
      Left = 510
      Top = 3
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        7.937500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc0_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc0_2: TQRLabel
      Left = 620
      Top = 3
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        7.937500000000000000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc0_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape22: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape23: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape24: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh8: TQRChildBand [36]
    Left = 38
    Top = 757
    Width = 740
    Height = 21
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
    ParentBand = qrCh7
    PrintOrder = cboAfterParent
    object qrTit1: TQRLabel
      Left = 8
      Top = 1
      Width = 185
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        489.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Recargo por Siniestralidad % s/fijo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc1_0: TQRLabel
      Left = 401
      Top = 1
      Width = 58
      Height = 16
      Size.Values = (
        42.333333333333330000
        1060.979166666667000000
        2.645833333333333000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDesc1_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc1_1: TQRLabel
      Left = 510
      Top = 3
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        7.937500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc1_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc1_2: TQRLabel
      Left = 620
      Top = 3
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        7.937500000000000000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc1_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape28: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape29: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape30: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh9: TQRChildBand [37]
    Left = 38
    Top = 778
    Width = 740
    Height = 21
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
    ParentBand = qrCh8
    PrintOrder = cboAfterParent
    object qrTit2: TQRLabel
      Left = 8
      Top = 1
      Width = 198
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        523.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Recargo por Siniestralidad monto fijo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc2_0: TQRLabel
      Left = 401
      Top = 1
      Width = 58
      Height = 16
      Size.Values = (
        42.333333333333330000
        1060.979166666667000000
        2.645833333333333000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDesc2_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc2_1: TQRLabel
      Left = 510
      Top = 3
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        7.937500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc2_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc2_2: TQRLabel
      Left = 620
      Top = 3
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        7.937500000000000000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc2_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape31: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape32: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape33: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh10: TQRChildBand [38]
    Left = 38
    Top = 799
    Width = 740
    Height = 21
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
    ParentBand = qrCh9
    PrintOrder = cboAfterParent
    object qrTit3: TQRLabel
      Left = 8
      Top = 1
      Width = 161
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        425.979166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Recargo Especial % s/variable'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc3_0: TQRLabel
      Left = 401
      Top = 1
      Width = 58
      Height = 16
      Size.Values = (
        42.333333333333330000
        1060.979166666667000000
        2.645833333333333000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDesc3_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc3_1: TQRLabel
      Left = 510
      Top = 3
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        7.937500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc3_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc3_2: TQRLabel
      Left = 620
      Top = 3
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        7.937500000000000000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc3_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape34: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape35: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape36: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object qrCh11: TQRChildBand [39]
    Left = 38
    Top = 820
    Width = 740
    Height = 21
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
    ParentBand = qrCh10
    PrintOrder = cboAfterParent
    object qrTit4: TQRLabel
      Left = 8
      Top = 1
      Width = 136
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        2.645833333333333000
        359.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Recargo Especial % s/fijo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc4_0: TQRLabel
      Left = 401
      Top = 1
      Width = 58
      Height = 16
      Size.Values = (
        42.333333333333330000
        1060.979166666667000000
        2.645833333333333000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDesc4_0'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc4_1: TQRLabel
      Left = 510
      Top = 3
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333300000
        1349.375000000000000000
        7.937500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc4_1'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrDesc4_2: TQRLabel
      Left = 620
      Top = 3
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333300000
        1640.416666666670000000
        7.937500000000000000
        264.583333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDesc4_2'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape37: TQRShape
      Left = 370
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        978.958333333333000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape38: TQRShape
      Left = 493
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1304.395833333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape39: TQRShape
      Left = 616
      Top = 0
      Width = 1
      Height = 19
      Size.Values = (
        50.270833333333300000
        1629.833333333330000000
        0.000000000000000000
        2.645833333333330000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object QRLabel27: TQRLabel [40]
    Left = 40
    Top = 902
    Width = 265
    Height = 19
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      50.270833333333300000
      105.833333333333000000
      2386.541666666670000000
      701.145833333333000000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Caption = 'POR PROVINCIA A.R.T.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRLabel31: TQRLabel [41]
    Left = 40
    Top = 919
    Width = 265
    Height = 76
    Frame.DrawTop = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      201.083333333333300000
      105.833333333333300000
      2431.520833333333000000
      701.145833333333400000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Caption = ' '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRLabel28: TQRLabel [42]
    Left = 440
    Top = 902
    Width = 337
    Height = 19
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      50.270833333333300000
      1164.166666666670000000
      2386.541666666670000000
      891.645833333333000000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Caption = 'POR EL CLIENTE'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRLabel32: TQRLabel [43]
    Left = 440
    Top = 919
    Width = 337
    Height = 96
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      254.000000000000000000
      1164.166666666667000000
      2431.520833333333000000
      891.645833333333200000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Caption = ' '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = True
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRDBImage1: TQRDBImage [44]
    Left = 113
    Top = 923
    Width = 120
    Height = 90
    Size.Values = (
      238.125000000000000000
      298.979166666666700000
      2442.104166666667000000
      317.500000000000000000)
    XLColumn = 0
    DataField = 'FIRMA'
    DataSet = sdqQuery
  end
  object QRNombreFirmante: TQRDBText [45]
    Left = 40
    Top = 982
    Width = 265
    Height = 17
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      44.979166666666700000
      105.833333333333000000
      2598.208333333330000000
      701.145833333333000000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Color = clWhite
    DataSet = sdqQuery
    DataField = 'NOMBRE_FIRMANTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FullJustify = False
    MaxBreakChars = 0
    FontSize = 8
  end
  object QRCaracterFirmante: TQRDBText [46]
    Left = 40
    Top = 998
    Width = 265
    Height = 18
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      47.625000000000000000
      105.833333333333000000
      2640.541666666670000000
      701.145833333333000000)
    XLColumn = 0
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    Color = clWhite
    DataSet = sdqQuery
    DataField = 'CARACTER_FIRMANTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = True
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FullJustify = False
    MaxBreakChars = 0
    FontSize = 8
  end
  object qrl1: TQRLabel [47]
    Left = 448
    Top = 972
    Width = 51
    Height = 15
    Size.Values = (
      39.687500000000000000
      1185.333333333333000000
      2571.750000000000000000
      134.937500000000000000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Aclaraci'#243'n'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 8
  end
  object qrl2: TQRLabel [48]
    Left = 592
    Top = 972
    Width = 30
    Height = 15
    Size.Values = (
      39.687500000000000000
      1566.333333333333000000
      2571.750000000000000000
      79.375000000000000000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'D.N.I.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 8
  end
  object qrl3: TQRLabel [49]
    Left = 692
    Top = 972
    Width = 28
    Height = 15
    Size.Values = (
      39.687500000000000000
      1830.916666666667000000
      2571.750000000000000000
      74.083333333333330000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Cargo'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 8
  end
  object Linea1: TQRShape [50]
    Left = 440
    Top = 984
    Width = 336
    Height = 6
    Size.Values = (
      15.875000000000000000
      1164.166666666670000000
      2603.500000000000000000
      889.000000000000000000)
    XLColumn = 0
    Shape = qrsHorLine
    VertAdjust = 0
  end
  object Linea2: TQRShape [51]
    Left = 440
    Top = 966
    Width = 336
    Height = 6
    Size.Values = (
      15.875000000000000000
      1164.166666666670000000
      2555.875000000000000000
      889.000000000000000000)
    XLColumn = 0
    Shape = qrsHorLine
    VertAdjust = 0
  end
  object qrCh20: TQRChildBand [52]
    Left = 38
    Top = 1051
    Width = 740
    Height = 8
    AlignToBottom = True
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      21.166666666666670000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrCh19
    PrintOrder = cboAfterParent
  end
end
