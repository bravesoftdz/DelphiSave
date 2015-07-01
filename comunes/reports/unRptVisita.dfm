inherited qrVisita: TqrVisita
  Width = 950
  Height = 734
  Frame.Color = clGray
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
  BeforePrint = QuickRepBeforePrint
  DataSet = sdqDetalle
  Font.Name = 'Neo Sans'
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRLOOPBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    '0')
  Page.Columns = 2
  Page.Orientation = poLandscape
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    100.000000000000000000
    60.000000000000000000)
  ReportTitle = 'Visita N'#176' '
  Zoom = 90
  ExplicitWidth = 950
  ExplicitHeight = 734
  inherited qrbPageHeader: TQRBand
    Left = 34
    Top = 34
    Width = 882
    Height = 98
    Frame.Color = clSilver
    Size.Values = (
      288.101851851851900000
      2592.916666666667000000)
    ExplicitLeft = 34
    ExplicitTop = 34
    ExplicitWidth = 882
    ExplicitHeight = 98
    inherited qriLogoART: TQRImage
      Left = 365
      Top = 5
      Width = 147
      Height = 58
      Size.Values = (
        170.509259259259300000
        1073.032407407407000000
        14.699074074074070000
        432.152777777777800000)
      ExplicitLeft = 365
      ExplicitTop = 5
      ExplicitWidth = 147
      ExplicitHeight = 58
    end
    object QRDBText8: TQRDBText
      Left = 382
      Top = 73
      Width = 111
      Height = 19
      Size.Values = (
        55.856481481481480000
        1123.009259259259000000
        214.606481481481500000
        326.319444444444500000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VS_DESCRIPCION'
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
    Left = 34
    Top = 147
    Width = 882
    Height = 98
    Frame.Color = clGray
    Size.Values = (
      288.101851851851900000
      2592.916666666667000000)
    ExplicitLeft = 34
    ExplicitTop = 147
    ExplicitWidth = 882
    ExplicitHeight = 98
    inherited qrlReferencia: TQRLabel
      Left = 313
      Top = 153
      Width = 31
      Height = 16
      Size.Values = (
        47.037037037037040000
        920.162037037037100000
        449.791666666666700000
        91.134259259259260000)
      FontSize = 10
      ExplicitLeft = 313
      ExplicitTop = 153
      ExplicitWidth = 31
      ExplicitHeight = 16
    end
    inherited qrdbPrimeraReferencia: TQRDBText
      Left = 346
      Top = 153
      Width = 300
      Height = 15
      Size.Values = (
        44.979166666666670000
        1016.000000000000000000
        449.791666666666700000
        881.062500000000000000)
      FontSize = 10
      ExplicitLeft = 346
      ExplicitTop = 153
      ExplicitWidth = 300
      ExplicitHeight = 15
    end
    inherited qrlSaludo: TQRLabel
      Left = 11
      Top = 153
      Width = 163
      Height = 16
      Enabled = False
      Size.Values = (
        47.037037037037040000
        32.337962962962960000
        449.791666666666700000
        479.189814814814800000)
      FontSize = 10
      ExplicitLeft = 11
      ExplicitTop = 153
      ExplicitWidth = 163
      ExplicitHeight = 16
    end
    inherited qrlDestinatario: TQRLabel
      Left = 248
      Top = 153
      Width = 41
      Height = 16
      Size.Values = (
        47.037037037037040000
        729.074074074074100000
        449.791666666666700000
        120.532407407407400000)
      FontSize = 10
      ExplicitLeft = 248
      ExplicitTop = 153
      ExplicitWidth = 41
      ExplicitHeight = 16
    end
    inherited qrlFecha: TQRLabel
      Left = 445
      Top = 153
      Width = 202
      Height = 16
      Enabled = False
      Size.Values = (
        47.037037037037040000
        1308.217592592593000000
        449.791666666666700000
        593.842592592592600000)
      FontSize = 10
      ExplicitLeft = 445
      ExplicitTop = 153
      ExplicitWidth = 202
      ExplicitHeight = 16
    end
    object QRDBText1: TQRDBText
      Left = 62
      Top = 55
      Width = 80
      Height = 17
      Size.Values = (
        49.976851851851850000
        182.268518518518500000
        161.689814814814800000
        235.185185185185200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VI_CONTRATO'
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
      Left = 313
      Top = 55
      Width = 74
      Height = 16
      Size.Values = (
        47.037037037037040000
        920.162037037037100000
        161.689814814814800000
        217.546296296296300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
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
    object QRLabel2: TQRLabel
      Left = 15
      Top = 55
      Width = 45
      Height = 17
      Size.Values = (
        49.976851851851850000
        44.097222222222220000
        161.689814814814800000
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
      Left = 263
      Top = 55
      Width = 45
      Height = 17
      Size.Values = (
        49.976851851851850000
        773.171296296296300000
        161.689814814814800000
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
    object QRLabel5: TQRLabel
      Left = 123
      Top = 55
      Width = 36
      Height = 17
      Size.Values = (
        49.976851851851850000
        361.597222222222200000
        161.689814814814800000
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
      Left = 162
      Top = 55
      Width = 37
      Height = 17
      Size.Values = (
        49.976851851851850000
        476.250000000000000000
        161.689814814814800000
        108.773148148148100000)
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
      Left = 15
      Top = 3
      Width = 62
      Height = 17
      Size.Values = (
        49.976851851851850000
        44.097222222222220000
        8.819444444444444000
        182.268518518518500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha visita'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrdbFechaFinalizado: TQRDBText
      Left = 82
      Top = 3
      Width = 80
      Height = 16
      Size.Values = (
        47.037037037037040000
        241.064814814814800000
        8.819444444444444000
        235.185185185185200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VI_FECHAINICIOVISITA'
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
      Left = 15
      Top = 21
      Width = 70
      Height = 18
      Size.Values = (
        52.916666666666660000
        44.097222222222220000
        61.736111111111120000
        205.787037037037100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario visita'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 90
      Top = 21
      Width = 90
      Height = 18
      Size.Values = (
        52.916666666666660000
        264.583333333333400000
        61.736111111111120000
        264.583333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'USUARIOVISITA'
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
    object qrlNoAsignado: TQRLabel
      Left = 91
      Top = 21
      Width = 65
      Height = 18
      Size.Values = (
        52.916666666666660000
        267.523148148148200000
        61.736111111111120000
        191.087962962963000000)
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
    object QRLabel10: TQRLabel
      Left = 15
      Top = 37
      Width = 66
      Height = 17
      Size.Values = (
        49.976851851851850000
        44.097222222222220000
        108.773148148148100000
        194.027777777777800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Responsable'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText13: TQRDBText
      Left = 84
      Top = 37
      Width = 84
      Height = 17
      Size.Values = (
        49.976851851851850000
        246.944444444444400000
        108.773148148148100000
        246.944444444444400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'RESPONSABLE'
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
    object QRLabel11: TQRLabel
      Left = 170
      Top = 3
      Width = 54
      Height = 17
      Size.Values = (
        49.976851851851850000
        499.768518518518500000
        8.819444444444444000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hora inicio'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 227
      Top = 3
      Width = 50
      Height = 16
      Size.Values = (
        47.037037037037040000
        667.337962962962900000
        8.819444444444444000
        146.990740740740700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'HORA_INICIO'
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
    object QRLabel12: TQRLabel
      Left = 282
      Top = 3
      Width = 41
      Height = 17
      Size.Values = (
        49.976851851851850000
        829.027777777777800000
        8.819444444444444000
        120.532407407407400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hora fin'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText15: TQRDBText
      Left = 327
      Top = 3
      Width = 50
      Height = 16
      Size.Values = (
        47.037037037037040000
        961.319444444444400000
        8.819444444444444000
        146.990740740740700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'HORA_FIN'
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
    object QRDBText11: TQRDBText
      Left = 103
      Top = 73
      Width = 71
      Height = 17
      Size.Values = (
        49.976851851851850000
        302.800925925926000000
        214.606481481481500000
        208.726851851851900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'ES_NOMBRE'
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
    object QRLabel9: TQRLabel
      Left = 15
      Top = 73
      Width = 83
      Height = 17
      Size.Values = (
        49.976851851851850000
        44.097222222222220000
        214.606481481481500000
        244.004629629629600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Establecimiento'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 603
      Top = 3
      Width = 47
      Height = 17
      Size.Values = (
        49.976851851851850000
        1772.708333333333000000
        8.819444444444444000
        138.171296296296300000)
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
    object QRDBText3: TQRDBText
      Left = 654
      Top = 3
      Width = 80
      Height = 17
      Size.Values = (
        49.976851851851850000
        1922.638888888889000000
        8.819444444444444000
        235.185185185185200000)
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
    object QRLabel13: TQRLabel
      Left = 603
      Top = 21
      Width = 31
      Height = 17
      Size.Values = (
        49.976851851851850000
        1772.708333333333000000
        61.736111111111120000
        91.134259259259260000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cargo'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText16: TQRDBText
      Left = 639
      Top = 21
      Width = 39
      Height = 17
      Size.Values = (
        49.976851851851850000
        1878.541666666667000000
        61.736111111111120000
        114.652777777777800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'CARGO'
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
    Left = 34
    Top = 341
    Width = 882
    Height = 22
    Frame.Color = clGray
    AlignToBottom = True
    Color = 14803425
    LinkBand = qrbObservaciones
    Size.Values = (
      64.675925925925930000
      2592.916666666667000000)
    ExplicitLeft = 34
    ExplicitTop = 341
    ExplicitWidth = 882
    ExplicitHeight = 22
    inherited qrmDatosART: TQRMemo
      Left = 13
      Top = 22
      Width = 260
      Height = 66
      Enabled = False
      Size.Values = (
        193.145833333333300000
        37.041666666666670000
        63.500000000000000000
        764.645833333333400000)
      FontSize = 8
      ExplicitLeft = 13
      ExplicitTop = 22
      ExplicitWidth = 260
      ExplicitHeight = 66
    end
    inherited qriLogoGBP: TQRImage
      Left = 567
      Top = 25
      Width = 87
      Height = 50
      Enabled = False
      Size.Values = (
        148.166666666666700000
        1666.875000000000000000
        74.083333333333340000
        256.645833333333400000)
      ExplicitLeft = 567
      ExplicitTop = 25
      ExplicitWidth = 87
      ExplicitHeight = 50
    end
    object qrePagina: TQRExpr
      Left = 802
      Top = 3
      Width = 75
      Height = 17
      Size.Values = (
        49.976851851851850000
        2357.731481481482000000
        8.819444444444444000
        220.486111111111100000)
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
      Left = 825
      Top = 3
      Width = 37
      Height = 17
      Size.Values = (
        49.976851851851850000
        2425.347222222222000000
        8.819444444444444000
        108.773148148148100000)
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
      Left = 298
      Top = 3
      Width = 70
      Height = 17
      Size.Values = (
        49.976851851851850000
        876.064814814814700000
        8.819444444444444000
        205.787037037037100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario visita'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 372
      Top = 3
      Width = 90
      Height = 17
      Size.Values = (
        49.976851851851850000
        1093.611111111111000000
        8.819444444444444000
        264.583333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'USUARIOVISITA'
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
      Left = 15
      Top = 3
      Width = 62
      Height = 17
      Size.Values = (
        49.976851851851850000
        44.097222222222220000
        8.819444444444444000
        182.268518518518500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha visita'
      Color = clWhite
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 79
      Top = 3
      Width = 80
      Height = 16
      Size.Values = (
        47.037037037037040000
        232.245370370370400000
        8.819444444444444000
        235.185185185185200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VI_FECHAINICIOVISITA'
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
    object qrlNoAsignado2: TQRLabel
      Left = 372
      Top = 3
      Width = 65
      Height = 17
      Size.Values = (
        49.976851851851850000
        1093.611111111111000000
        8.819444444444444000
        191.087962962963000000)
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
    Left = 34
    Top = 297
    Width = 882
    Height = 18
    AlignToBottom = True
    Color = 14803425
    Size.Values = (
      52.916666666666670000
      2592.916666666667000000)
    ExplicitLeft = 34
    ExplicitTop = 297
    ExplicitWidth = 882
    ExplicitHeight = 18
    inherited qrlSaludoFinal: TQRLabel
      Left = 15
      Top = 1
      Width = 79
      Height = 15
      Size.Values = (
        44.097222222222220000
        44.097222222222220000
        2.939814814814815000
        232.245370370370400000)
      Caption = 'OBSERVACIONES'
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      FontSize = 8
      ExplicitLeft = 15
      ExplicitTop = 1
      ExplicitWidth = 79
      ExplicitHeight = 15
    end
  end
  object qrbDetalle: TQRBand [4]
    Left = 34
    Top = 263
    Width = 431
    Height = 18
    Frame.Color = clSilver
    AlignToBottom = False
    BeforePrint = qrbDetalleBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666670000
      1267.060185185185000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRDBText6: TQRDBText
      Left = 35
      Top = 2
      Width = 378
      Height = 13
      Size.Values = (
        38.217592592592590000
        102.893518518518500000
        5.879629629629629000
        1111.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'TEMA'
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
      Left = 14
      Top = 2
      Width = 13
      Height = 13
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        37.041666666666670000
        42.333333333333330000
        5.291666666666667000
        37.041666666666670000)
      XLColumn = 0
      TickStyle = tsCross
      Checked = False
    end
  end
  object QRGroup1: TQRGroup [5]
    Left = 34
    Top = 245
    Width = 431
    Height = 18
    Frame.Color = clSilver
    Frame.DrawTop = True
    Frame.DrawBottom = True
    AlignToBottom = False
    Color = 14803425
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666670000
      1267.060185185185000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Expression = 'sdqDetalle.BREADCRUMB'
    Master = Owner
    ReprintOnNewPage = False
    object QRDBText4: TQRDBText
      Left = 14
      Top = 2
      Width = 403
      Height = 13
      Size.Values = (
        38.217592592592590000
        41.157407407407410000
        5.879629629629629000
        1184.745370370370000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'BREADCRUMB'
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
  object ChildBand5: TQRChildBand [6]
    Left = 34
    Top = 132
    Width = 882
    Height = 15
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.097222222222220000
      2592.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbPageHeader
    PrintOrder = cboAfterParent
  end
  object qrbObservaciones: TQRChildBand [7]
    Left = 34
    Top = 315
    Width = 882
    Height = 26
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      76.435185185185190000
      2592.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbSummary
    PrintOrder = cboAfterParent
    object QRDBText5: TQRDBText
      Left = 14
      Top = 5
      Width = 855
      Height = 14
      Size.Values = (
        41.157407407407410000
        41.157407407407410000
        14.699074074074070000
        2513.541666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatos
      DataField = 'VI_OBSERVACIONES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object qrbObservacionesDetalle: TQRChildBand [8]
    Left = 34
    Top = 281
    Width = 431
    Height = 16
    Frame.Color = clSilver
    AlignToBottom = False
    BeforePrint = qrbObservacionesDetalleBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.037037037037040000
      1267.060185185185000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbDetalle
    PrintOrder = cboAfterParent
    object QRDBText9: TQRDBText
      Left = 33
      Top = 3
      Width = 380
      Height = 13
      Size.Values = (
        38.217592592592590000
        97.013888888888900000
        8.819444444444444000
        1117.129629629630000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'OBSERVACIONES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object qrbRespuestaDetalle: TQRChildBand [9]
    Left = 34
    Top = 363
    Width = 431
    Height = 21
    Frame.Color = clSilver
    AlignToBottom = False
    BeforePrint = qrbRespuestaDetalleBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      61.736111111111100000
      1267.060185185185000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbDetalle
    PrintOrder = cboAfterParent
    object QRDBText17: TQRDBText
      Left = 33
      Top = 3
      Width = 380
      Height = 13
      Size.Values = (
        38.217592592592590000
        97.013888888888900000
        8.819444444444444000
        1117.129629629630000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDetalle
      DataField = 'RESPUESTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  inherited sdqDatos: TSDQuery
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      'SELECT ct_contacto,'
      '       tb_descripcion cargo,'
      '       em_nombre,'
      '       em_cuit,'
      '       co_direlectronica,'
      '       UPPER(u1.se_nombre) responsable,'
      '       UPPER(u2.se_nombre) usuariovisita,'
      '       cvs.*,'
      '       cvi.*,'
      '       es_nombre,'
      '       TO_CHAR(vi_fechainiciovisita, '#39'HH24:MI'#39') hora_inicio,'
      '       TO_CHAR(vi_fechafinvisita, '#39'HH24:MI'#39') hora_fin'
      '  FROM aes_establecimiento,'
      '       art.use_usuarios u1,'
      '       art.use_usuarios u2,'
      '       act_contacto,'
      '       aem_empresa,'
      '       aco_contrato,'
      '       comercial.cvs_visita cvs,'
      '       comercial.cvi_visitainstancia cvi,'
      '       art.ctb_tablas'
      ' WHERE vi_id = :id'
      '   AND vi_idvisita = vs_id'
      '   AND vi_contrato = co_contrato(+)'
      '   AND co_idempresa = em_id(+)'
      '   AND vi_idcontacto = ct_id(+)'
      '   AND vi_usuariovisita = u2.se_usuario(+)'
      '   AND vi_responsable = u1.se_usuario(+)'
      '   AND es_id = vi_idestablecimiento'
      '   AND tb_clave(+) = '#39'CARGO'#39
      '   AND ct_cargo = tb_codigo(+)')
    Left = 20
    Top = 65528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT vt_descripcion tema,'
      
        '         comercial.visita.get_descripcioncategoria(vt_id) breadc' +
        'rumb,'
      '         vd_seleccionado seleccionado,'
      '         vd_observaciones observaciones,'
      '         NVL(vd_respuestadinamica, vr_descripcion) respuesta'
      '    FROM comercial.cvt_visitatema,'
      '         comercial.cvc_visitacategoria,'
      '         comercial.cvd_visitainstanciadetalle,'
      '         comercial.cvr_visitarespuesta'
      '   WHERE vd_idrespuesta = vr_id(+)'
      '     AND vd_idtema = vt_id'
      '     AND vt_idcategoria = vc_id(+)'
      '     AND vd_idvisitainstancia = :idvisitainstancia'
      '     AND vt_idvisita = :idvisita'
      'ORDER BY vt_orden')
    Left = 76
    Top = 65528
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idvisitainstancia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idvisita'
        ParamType = ptInput
      end>
    object sdqDetalleTEMA: TStringField
      FieldName = 'TEMA'
      Required = True
      Size = 1000
    end
    object sdqDetalleBREADCRUMB: TStringField
      FieldName = 'BREADCRUMB'
      Size = 4000
    end
    object sdqDetalleSELECCIONADO: TStringField
      FieldName = 'SELECCIONADO'
      Size = 1
    end
    object sdqDetalleOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 4000
    end
    object sdqDetalleRESPUESTA: TStringField
      FieldName = 'RESPUESTA'
      Size = 4000
    end
  end
end
