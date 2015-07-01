object RptInformeSRT: TRptInformeSRT
  Left = 0
  Top = 0
  Width = 816
  Height = 1344
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  Page.PaperSize = Legal
  Page.Values = (
    50.000000000000000000
    3556.000000000000000000
    50.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
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
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsMaximized
  object QRBand1: TQRBand
    Left = 38
    Top = 19
    Width = 740
    Height = 445
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      1177.395833333333000000
      1957.916666666667000000)
    BandType = rbTitle
    object QRShape9: TQRShape
      Left = 0
      Top = 423
      Width = 740
      Height = 22
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.208333333333300000
        0.000000000000000000
        1119.187500000000000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape8: TQRShape
      Left = 0
      Top = 401
      Width = 740
      Height = 23
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666700000
        0.000000000000000000
        1060.979166666670000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape7: TQRShape
      Left = 0
      Top = 363
      Width = 740
      Height = 39
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        0.000000000000000000
        960.437500000000000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape4: TQRShape
      Left = 0
      Top = 209
      Width = 740
      Height = 23
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666700000
        0.000000000000000000
        552.979166666667000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape3: TQRShape
      Left = 0
      Top = 187
      Width = 740
      Height = 23
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666700000
        0.000000000000000000
        494.770833333333000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape2: TQRShape
      Left = 0
      Top = 94
      Width = 740
      Height = 94
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        248.708333333333000000
        0.000000000000000000
        248.708333333333000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape1: TQRShape
      Left = 0
      Top = 73
      Width = 740
      Height = 22
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.208333333333300000
        0.000000000000000000
        193.145833333333000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel1: TQRLabel
      Left = 0
      Top = 2
      Width = 740
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.500000000000000000
        0.000000000000000000
        5.291666666666670000
        1957.916666666670000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SUPERINTENDENCIA DE RIESGOS DEL TRABAJO'
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 13
    end
    object QRLabel2: TQRLabel
      Left = 0
      Top = 24
      Width = 740
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.500000000000000000
        0.000000000000000000
        63.500000000000000000
        1957.916666666670000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SUBGERENCIA DE CONTROL DE PRESTACIONES'
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 13
    end
    object QRLabel3: TQRLabel
      Left = 0
      Top = 46
      Width = 740
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        63.500000000000000000
        0.000000000000000000
        121.708333333333000000
        1957.916666666670000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'DEPARTAMENTO DE PRESTACIONES EN ESPECIE-RECALIFICACION PROFESION' +
        'AL'
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 13
    end
    object QRLabel4: TQRLabel
      Left = 5
      Top = 75
      Width = 214
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        198.437500000000000000
        566.208333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ASEGURADORA / AUTOASEGURADA:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlProvincia: TQRLabel
      Left = 236
      Top = 75
      Width = 92
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        624.416666666666800000
        198.437500000000000000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PROVINCIA A.R.T'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 613
      Top = 75
      Width = 44
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        1621.895833333333000000
        198.437500000000000000
        116.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRSysData6: TQRSysData
      Left = 659
      Top = 75
      Width = 34
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        1743.604166666667000000
        198.437500000000000000
        89.958333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDate
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 5
      Top = 95
      Width = 208
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        251.354166666666700000
        550.333333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre y apellido del siniestrado'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 5
      Top = 113
      Width = 67
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        298.979166666666700000
        177.270833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#186' de CUIL'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 5
      Top = 132
      Width = 59
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        349.250000000000000000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Direcci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 5
      Top = 167
      Width = 60
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        441.854166666666700000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tel'#233'fonos'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 381
      Top = 113
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1008.062500000000000000
        298.979166666666700000
        87.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Edad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbNombreApellido: TQRDBText
      Left = 222
      Top = 95
      Width = 67
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        587.375000000000000000
        251.354166666666700000
        177.270833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'TJ_NOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbCuil: TQRDBText
      Left = 139
      Top = 113
      Width = 25
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        298.979166666666700000
        66.145833333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'CUIL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbDomTrab: TQRDBText
      Left = 139
      Top = 131
      Width = 86
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        346.604166666666700000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'DOMICILIOTRAB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbLocTrab: TQRDBText
      Left = 139
      Top = 149
      Width = 88
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        394.229166666666700000
        232.833333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'LOCALIDADTRAB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbTelefono: TQRDBText
      Left = 139
      Top = 167
      Width = 586
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        441.854166666666700000
        1550.458333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'TELEFONOTRAB'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbEdad: TQRDBText
      Left = 419
      Top = 113
      Width = 28
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        1108.604166666667000000
        298.979166666666700000
        74.083333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'EDAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel12: TQRLabel
      Left = 5
      Top = 189
      Width = 125
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        500.062500000000000000
        330.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha del accidente'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbFechaAccidente: TQRDBText
      Left = 139
      Top = 189
      Width = 112
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        500.062500000000000000
        296.333333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'EX_FECHAACCIDENTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel13: TQRLabel
      Left = 5
      Top = 211
      Width = 92
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        558.270833333333400000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'N'#186' de siniestro'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbSiniestro: TQRDBText
      Left = 139
      Top = 211
      Width = 56
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        558.270833333333400000
        148.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'SINIESTRO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape6: TQRShape
      Left = 0
      Top = 231
      Width = 740
      Height = 95
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        251.354166666667000000
        0.000000000000000000
        611.187500000000000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrdbTelEmp: TQRDBText
      Left = 139
      Top = 305
      Width = 87
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        806.979166666666800000
        230.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'MP_TELEFONOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel15: TQRLabel
      Left = 5
      Top = 305
      Width = 60
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        806.979166666666800000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tel'#233'fonos'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbLocEmp: TQRDBText
      Left = 139
      Top = 287
      Width = 60
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        759.354166666666800000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'LOCALIDAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbDomEmp: TQRDBText
      Left = 139
      Top = 269
      Width = 58
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        711.729166666666800000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'DOMICILIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel16: TQRLabel
      Left = 5
      Top = 271
      Width = 59
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        717.020833333333400000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Direcci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlCuit: TQRLabel
      Left = 5
      Top = 252
      Width = 68
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        13.229166666666700000
        666.750000000000000000
        179.916666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'N'#186' de CUIT'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbCuit: TQRDBText
      Left = 139
      Top = 251
      Width = 110
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        367.770833333333000000
        664.104166666667000000
        291.041666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'CUIT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrlEmpDep: TQRLabel
      Left = 5
      Top = 233
      Width = 242
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        616.479166666666800000
        640.291666666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre del establecimiento empleador'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbEmpleador: TQRDBText
      Left = 254
      Top = 234
      Width = 71
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        672.041666666666800000
        619.125000000000000000
        187.854166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'MP_NOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape5: TQRShape
      Left = 0
      Top = 325
      Width = 740
      Height = 39
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        0.000000000000000000
        859.895833333333000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel18: TQRLabel
      Left = 5
      Top = 327
      Width = 114
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        865.187500000000000000
        301.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Rama de actividad'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbRama: TQRDBText
      Left = 5
      Top = 343
      Width = 733
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        13.229166666666700000
        907.520833333333000000
        1939.395833333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'AV_DESCRIPCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel19: TQRLabel
      Left = 5
      Top = 365
      Width = 315
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        965.729166666666800000
        833.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sector y/o puesto que ocupaba antes del accidente'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 5
      Top = 403
      Width = 322
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        1066.270833333333000000
        851.958333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tipo de accidente (en Lugar de Trabajo o In Itinere)'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbTipoAcc: TQRDBText
      Left = 334
      Top = 403
      Width = 47
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        883.708333333333400000
        1066.270833333333000000
        124.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'T1DESCR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel21: TQRLabel
      Left = 5
      Top = 425
      Width = 482
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        1124.479166666667000000
        1275.291666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'Descripci'#243'n sint'#233'tica del accidente y/o Enfermedad Profesional y' +
        ' sus secuelas'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlTarea: TQRLabel
      Left = 5
      Top = 381
      Width = 50
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        1008.062500000000000000
        132.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlTarea'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRSubDetail1: TQRSubDetail
    Left = 38
    Top = 605
    Width = 740
    Height = 35
    Frame.Color = clSilver
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      92.604166666666680000
      1957.916666666667000000)
    Master = Owner
    DataSet = sdqDetalleReporte
    FooterBand = GroupFooterBand1
    HeaderBand = GroupHeaderBand1
    PrintBefore = False
    PrintIfEmpty = True
    object qrdbDetalle2: TQRDBText
      Left = 32
      Top = 16
      Width = 703
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        84.666666666666700000
        42.333333333333300000
        1860.020833333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDetalleReporte
      DataField = 'ER_OBSERVACIONES'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrdbDetalle1: TQRDBText
      Left = 16
      Top = 0
      Width = 719
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        42.333333333333300000
        0.000000000000000000
        1902.354166666670000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDetalleReporte
      DataField = 'EM_DESCRIPCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 776
    Width = 740
    Height = 81
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
      214.312500000000000000
      1957.916666666667000000)
    BandType = rbPageFooter
    object QRLabel32: TQRLabel
      Left = 40
      Top = 40
      Width = 225
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        105.833333333333000000
        105.833333333333000000
        595.312500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Firma y aclaraci'#243'n del Responsable'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel33: TQRLabel
      Left = 40
      Top = 57
      Width = 225
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        105.833333333333000000
        150.812500000000000000
        595.312500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'de Recalificaci'#243'n Profesional'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object GroupFooterBand1: TQRBand
    Left = 38
    Top = 640
    Width = 740
    Height = 136
    Frame.Color = clSilver
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      359.833333333333400000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRShape17: TQRShape
      Left = 0
      Top = 96
      Width = 740
      Height = 39
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        0.000000000000000000
        254.000000000000000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape16: TQRShape
      Left = 0
      Top = 74
      Width = 740
      Height = 23
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666700000
        0.000000000000000000
        195.791666666667000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape15: TQRShape
      Left = 0
      Top = 0
      Width = 740
      Height = 75
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        198.437500000000000000
        0.000000000000000000
        0.000000000000000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel26: TQRLabel
      Left = 5
      Top = 2
      Width = 560
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        5.291666666666667000
        1481.666666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'Si el seguimiento del caso lo realiza un prestador, consignar No' +
        'mbre, Direcci'#243'n y Tel'#233'fono'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlNombreResp: TQRLabel
      Left = 139
      Top = 20
      Width = 89
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        52.916666666666660000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlNombreResp'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlDirResp: TQRLabel
      Left = 139
      Top = 38
      Width = 61
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        100.541666666666700000
        161.395833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlDirResp'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlTelResp: TQRLabel
      Left = 139
      Top = 55
      Width = 62
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        367.770833333333400000
        145.520833333333300000
        164.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlTelResp'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel29: TQRLabel
      Left = 5
      Top = 55
      Width = 60
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        145.520833333333300000
        158.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Tel'#233'fonos'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel28: TQRLabel
      Left = 5
      Top = 38
      Width = 59
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        100.541666666666700000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Direcci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel27: TQRLabel
      Left = 5
      Top = 20
      Width = 49
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        52.916666666666660000
        129.645833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlFechaReubicacion: TQRLabel
      Left = 256
      Top = 76
      Width = 120
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        201.083333333333300000
        317.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFechaReubicacion'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel31: TQRLabel
      Left = 5
      Top = 76
      Width = 239
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        201.083333333333300000
        632.354166666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de Reinserci'#243'n y/o Capacitaci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel30: TQRLabel
      Left = 5
      Top = 99
      Width = 386
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        261.937500000000000000
        1021.291666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sector y/o puesto de trabajo en el que se insert'#243' laboralmente'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlSector: TQRLabel
      Left = 5
      Top = 115
      Width = 53
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        304.270833333333400000
        140.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlSector'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand3: TQRBand
    Left = 38
    Top = 464
    Width = 740
    Height = 21
    Frame.Color = clSilver
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      55.562500000000000000
      1957.916666666667000000)
    BandType = rbDetail
    object qrdbDescripcion: TQRDBText
      Left = 5
      Top = 1
      Width = 732
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        13.229166666666700000
        2.645833333333330000
        1936.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'BREVEDESC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape19: TQRShape
      Left = 0
      Top = 0
      Width = 1
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        0.000000000000000000
        0.000000000000000000
        2.645833333333330000)
      Pen.Color = clSilver
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape20: TQRShape
      Left = 739
      Top = 0
      Width = 1
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        58.208333333333300000
        1955.270833333330000000
        0.000000000000000000
        2.645833333333330000)
      Pen.Color = clSilver
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object GroupHeaderBand1: TQRBand
    Left = 38
    Top = 485
    Width = 740
    Height = 120
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
      317.500000000000000000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object QRShape10: TQRShape
      Left = 0
      Top = 20
      Width = 740
      Height = 39
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        0.000000000000000000
        52.916666666666700000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape11: TQRShape
      Left = 0
      Top = 58
      Width = 740
      Height = 23
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666700000
        0.000000000000000000
        153.458333333333000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape12: TQRShape
      Left = 0
      Top = 80
      Width = 740
      Height = 39
      Frame.Color = clSilver
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        0.000000000000000000
        211.666666666667000000
        1957.916666666670000000)
      Pen.Color = clSilver
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrlEtapas: TQRLabel
      Left = 5
      Top = 82
      Width = 444
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        216.958333333333400000
        1174.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'Etapas de la Recalificaci'#243'n Profesional cumplidas a la fecha del' +
        ' informe'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlEtapas2: TQRLabel
      Left = 5
      Top = 99
      Width = 289
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        261.937500000000000000
        764.645833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '(descripci'#243'n de los procedimientos realizados)'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlFechaRecal: TQRLabel
      Left = 368
      Top = 60
      Width = 81
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        973.666666666666900000
        158.750000000000000000
        214.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrlFechaRecal'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 5
      Top = 60
      Width = 352
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        158.750000000000000000
        931.333333333333500000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha de inicio del proceso de Recalificaci'#243'n Profesional'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbLateralidad: TQRDBText
      Left = 5
      Top = 38
      Width = 733
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        13.229166666666700000
        100.541666666667000000
        1939.395833333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'T3DESCR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel22: TQRLabel
      Left = 5
      Top = 22
      Width = 140
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        13.229166666666670000
        58.208333333333340000
        370.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Lateralidad dominante'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrdbDiagnostico: TQRDBText
      Left = 5
      Top = 0
      Width = 733
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        13.229166666666700000
        0.000000000000000000
        1939.395833333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosReporte
      DataField = 'DIAGNOSTICO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape18: TQRShape
      Left = 0
      Top = -19
      Width = 1
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        0.000000000000000000
        -50.270833333333300000
        2.645833333333330000)
      Pen.Color = clSilver
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape21: TQRShape
      Left = 739
      Top = -19
      Width = 1
      Height = 39
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        103.187500000000000000
        1955.270833333330000000
        -50.270833333333300000
        2.645833333333330000)
      Pen.Color = clSilver
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object sdqDetalleReporte: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT em_descripcion, er_observaciones'
      '  FROM ser_evemedrecalif, sin.sem_eventomedicoreca'
      ' WHERE er_siniestro = 146'
      '   AND er_orden = 1'
      '   AND er_evento > 0'
      '   AND em_codigo = er_codigo')
    Left = 40
    Top = 5
    object sdqDetalleReporteTB_DESCRIPCION: TStringField
      FieldName = 'EM_DESCRIPCION'
      Size = 150
    end
    object sdqDetalleReporteER_OBSERVACIONES: TStringField
      FieldName = 'ER_OBSERVACIONES'
      Size = 550
    end
  end
  object sdqDatosReporte: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqDatosReporteAfterOpen
    SQL.Strings = (
      'SELECT tj_nombre,'
      '       art.trabajador.get_telefono(tj_id, 4) TelefonoTrab,'
      '       ex_cuil, ex_cuit, ex_fechaaccidente,'
      '       mp_telefonos, av_descripcion, t1.tb_descripcion t1descr, '
      
        '       NVL(de_descripcion, ex_brevedescripcion) BreveDesc, mp_no' +
        'mbre, de_tareahabitual, '
      
        '       art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) Siniestro, '
      
        '       utiles.armar_domicilio(mp_calle, mp_numero, mp_piso, mp_d' +
        'epartamento) Domicilio, '
      
        '       utiles.armar_localidad(mp_cpostal, mp_cpostala, mp_locali' +
        'dad, mp_provincia) Localidad, '
      
        '       utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_d' +
        'epartamento) DomicilioTrab, '
      
        '       utiles.armar_localidad(tj_cpostal, tj_cpostala, tj_locali' +
        'dad, tj_provincia) LocalidadTrab, '
      
        '       de_descripcion, NVL(pe_diagnostico, pi_diagnostico) Diagn' +
        'ostico, t3.tb_descripcion T3Descr,'
      '       cuit_ponerguiones(ex_cuit) cuit,   '
      '       cuit_ponerguiones(ex_cuil) cuil,'
      '       floor((actualdate - tj_fnacimiento)/365) Edad '
      'FROM sex_expedientes, ctj_trabajador, cmp_empresas, '
      '     cav_actividad, ctb_tablas t1, sde_denuncias, '
      '     spi_parteingreso, spe_parteegreso, ctb_tablas t3 '
      'WHERE ex_siniestro= :pSiniestro'
      '  AND ex_orden= :pOrden'
      '  AND ex_recaida=0 '
      '  AND ex_cuil=tj_cuil '
      '  AND ex_cuit=mp_cuit '
      '  AND mp_actividad=av_codigo '
      '  AND t1.tb_codigo(+)=ex_tipo '
      '  AND t1.tb_clave(+)='#39'STIPO'#39
      '  AND de_siniestro(+)=ex_siniestro '
      '  AND de_orden(+)=ex_orden '
      '  AND de_recaida(+)=ex_recaida '
      '  AND pi_siniestro(+)=ex_siniestro '
      '  AND pi_orden(+)=ex_orden '
      '  AND pi_recaida(+)=ex_recaida '
      '  AND pe_siniestro(+)=ex_siniestro '
      '  AND pe_orden(+)=ex_orden '
      '  AND pe_recaida(+)=ex_recaida '
      '  AND t3.tb_codigo(+)=tj_lateralidaddominante '
      '  AND t3.tb_clave(+)='#39'LATDO'#39)
    Left = 8
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pOrden'
        ParamType = ptInput
      end>
    object sdqDatosReporteTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqDatosReporteEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqDatosReporteMP_TELEFONOS: TStringField
      FieldName = 'MP_TELEFONOS'
      Size = 60
    end
    object sdqDatosReporteAV_DESCRIPCION: TStringField
      FieldName = 'AV_DESCRIPCION'
      Size = 200
    end
    object sdqDatosReporteT1DESCR: TStringField
      FieldName = 'T1DESCR'
      Size = 150
    end
    object sdqDatosReporteMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqDatosReporteDE_TAREAHABITUAL: TStringField
      FieldName = 'DE_TAREAHABITUAL'
      Size = 10
    end
    object sdqDatosReporteSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqDatosReporteDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqDatosReporteLOCALIDAD: TStringField
      FieldName = 'LOCALIDAD'
      Size = 4000
    end
    object sdqDatosReporteDOMICILIOTRAB: TStringField
      FieldName = 'DOMICILIOTRAB'
      Size = 4000
    end
    object sdqDatosReporteLOCALIDADTRAB: TStringField
      FieldName = 'LOCALIDADTRAB'
      Size = 4000
    end
    object sdqDatosReporteDE_DESCRIPCION: TStringField
      FieldName = 'DE_DESCRIPCION'
      Size = 250
    end
    object sdqDatosReporteT3DESCR: TStringField
      FieldName = 'T3DESCR'
      Size = 150
    end
    object sdqDatosReporteCUIL: TStringField
      FieldName = 'CUIL'
      Size = 4000
    end
    object sdqDatosReporteEDAD: TFloatField
      FieldName = 'EDAD'
    end
    object sdqDatosReporteCUIT: TStringField
      FieldName = 'CUIT'
      Size = 4000
    end
    object sdqDatosReporteEX_CUIL: TStringField
      FieldName = 'EX_CUIL'
      Size = 11
    end
    object sdqDatosReporteEX_CUIT: TStringField
      FieldName = 'EX_CUIT'
      Size = 11
    end
    object sdqDatosReporteBREVEDESC: TStringField
      FieldName = 'BREVEDESC'
      Size = 250
    end
    object sdqDatosReporteDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosReporteTELEFONOTRAB: TStringField
      FieldName = 'TELEFONOTRAB'
      Size = 200
    end
  end
  object dsDatosReporte: TDataSource
    DataSet = sdqDatosReporte
    Left = 8
    Top = 37
  end
end
