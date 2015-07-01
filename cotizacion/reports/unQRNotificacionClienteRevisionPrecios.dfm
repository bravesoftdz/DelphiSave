object QRNotificacionClienteRevisionPrecios: TQRNotificacionClienteRevisionPrecios
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = Query
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'BFORMATOVIEJO')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    #39#39)
  IDReport = 0
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    70.000000000000000000
    2794.000000000000000000
    70.000000000000000000
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
  ReportTitle = 'Cotizaci'#243'n de Riesgos del Trabajo'
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsMaximized
  object bFormatoNuevo: TQRBand
    Left = 38
    Top = 26
    Width = 740
    Height = 1000
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bFormatoNuevoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2645.833333333333000000
      1957.916666666667000000)
    BandType = rbTitle
    object QRShape9: TQRShape
      Left = 8
      Top = 844
      Width = 256
      Height = 76
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        201.083333333333300000
        21.166666666666670000
        2233.083333333333000000
        677.333333333333400000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape2: TQRShape
      Left = 8
      Top = 72
      Width = 728
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        190.500000000000000000
        1926.166666666667000000)
      Brush.Color = clBlack
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape3: TQRShape
      Left = 8
      Top = 196
      Width = 544
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        63.500000000000000000
        21.166666666666670000
        518.583333333333400000
        1439.333333333333000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape4: TQRShape
      Left = 8
      Top = 176
      Width = 544
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        465.666666666666800000
        1439.333333333333000000)
      Brush.Color = clBlack
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape1: TQRShape
      Left = 8
      Top = 219
      Width = 544
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        63.500000000000000000
        21.166666666666670000
        579.437500000000000000
        1439.333333333333000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrImgBanco: TQRImage
      Left = 576
      Top = 8
      Width = 305
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.166666666666700000
        1524.000000000000000000
        21.166666666666670000
        806.979166666666800000)
    end
    object QRLabel3: TQRLabel
      Left = 200
      Top = 96
      Width = 109
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        529.166666666666700000
        254.000000000000000000
        288.395833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nombre o raz'#243'n social'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 8
      Top = 96
      Width = 45
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        254.000000000000000000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C.U.I.T. N'#186
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 260
      Top = 12
      Width = 219
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        687.916666666666800000
        31.750000000000000000
        579.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COTIZACI'#211'N RIESGOS DEL TRABAJO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 12
      Top = 200
      Width = 208
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        31.750000000000000000
        529.166666666666800000
        550.333333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Suma fija por trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 316
      Top = 200
      Width = 232
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        836.083333333333400000
        529.166666666666800000
        613.833333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Porcentaje variable sobre masa salarial'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrCosto1: TQRLabel
      Left = 12
      Top = 223
      Width = 208
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        31.750000000000000000
        590.020833333333400000
        550.333333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCosto1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrCosto2: TQRLabel
      Left = 316
      Top = 223
      Width = 232
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        836.083333333333400000
        590.020833333333400000
        613.833333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCosto2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 8
      Top = 244
      Width = 295
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.750000000000000000
        21.166666666666670000
        645.583333333333400000
        780.520833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '(*) Fondo Fiduciario para Enfermedades Profesionales (Decreto N'#186 +
        '1278/00)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 7
    end
    object qrEmpr1: TQRLabel
      Left = 320
      Top = 96
      Width = 408
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        846.666666666666600000
        254.000000000000000000
        1079.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrEmpr1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrEmpr2: TQRLabel
      Left = 60
      Top = 96
      Width = 46
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        158.750000000000000000
        254.000000000000000000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrEmpr2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = qrEmpr2Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrLugarFecha: TQRLabel
      Left = 44
      Top = 16
      Width = 80
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        116.416666666666700000
        42.333333333333340000
        211.666666666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '16/06/2004'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrImgProv: TQRImage
      Left = 571
      Top = 8
      Width = 165
      Height = 65
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666666700000
        1510.770833333333000000
        21.166666666666670000
        436.562499999999900000)
      Stretch = True
    end
    object QRLabel14: TQRLabel
      Left = 8
      Top = 16
      Width = 30
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        42.333333333333340000
        79.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 8
      Top = 114
      Width = 406
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        301.625000000000000000
        1074.208333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'C'#243'digo de actividad seg'#250'n formulario A.F.I.P. N'#186'150 (Resoluci'#243'n ' +
        'A.F.I.P. N'#186' 485/99)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrEmpr3: TQRLabel
      Left = 416
      Top = 114
      Width = 312
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1100.666666666667000000
        301.625000000000000000
        825.500000000000100000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrEmpr3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 8
      Top = 132
      Width = 127
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        349.250000000000000000
        336.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Descripci'#243'n actividad real'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 8
      Top = 150
      Width = 150
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        396.875000000000000000
        396.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad total de trabajadores'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 264
      Top = 150
      Width = 208
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        698.500000000000000000
        396.875000000000000000
        550.333333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Masa salarial sujeta a aportes (sin SAC)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrEmpr4: TQRLabel
      Left = 152
      Top = 132
      Width = 576
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        402.166666666666600000
        349.250000000000000000
        1524.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrEmpr4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrEmpr5: TQRLabel
      Left = 176
      Top = 150
      Width = 46
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        465.666666666666700000
        396.875000000000000000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrEmpr5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrEmpr6: TQRLabel
      Left = 484
      Top = 150
      Width = 46
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        1280.583333333333000000
        396.875000000000000000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrEmpr6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 8
      Top = 258
      Width = 26
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        21.166666666666670000
        682.625000000000000000
        68.791666666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Nota: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 7
    end
    object QRLabel26: TQRLabel
      Left = 203
      Top = 178
      Width = 126
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.979166666666670000
        537.104166666666700000
        470.958333333333400000
        333.375000000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VALOR DE LA AL'#205'CUOTA'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape6: TQRShape
      Left = 220
      Top = 196
      Width = 8
      Height = 47
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        124.354166666666700000
        582.083333333333400000
        518.583333333333400000
        21.166666666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape14: TQRShape
      Left = 308
      Top = 196
      Width = 8
      Height = 47
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        124.354166666666700000
        814.916666666666800000
        518.583333333333400000
        21.166666666666670000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel27: TQRLabel
      Left = 334
      Top = 28
      Width = 72
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        883.708333333333400000
        74.083333333333340000
        190.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'LEY 24.557'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel28: TQRLabel
      Left = 12
      Top = 74
      Width = 128
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        42.333333333333340000
        31.750000000000000000
        195.791666666666700000
        338.666666666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'DATOS DEL EMPLEADOR'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 228
      Top = 200
      Width = 82
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        603.250000000000000000
        529.166666666666800000
        216.958333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'F.F.E.P.(*)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel30: TQRLabel
      Left = 40
      Top = 258
      Width = 225
      Height = 12
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        31.750000000000000000
        105.833333333333300000
        682.625000000000000000
        595.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'La cotizaci'#243'n de referencia tiene una vigencia de 30 d'#237'as.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 7
    end
    object QRShape7: TQRShape
      Left = 8
      Top = 111
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        293.687500000000000000
        1905.000000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape10: TQRShape
      Left = 8
      Top = 165
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        436.562499999999900000
        1905.000000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape11: TQRShape
      Left = 8
      Top = 147
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        388.937500000000000000
        1905.000000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape12: TQRShape
      Left = 8
      Top = 129
      Width = 720
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        341.312500000000000000
        1905.000000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel31: TQRLabel
      Left = 228
      Top = 223
      Width = 82
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        603.250000000000000000
        590.020833333333400000
        216.958333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '$ 0,60'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape13: TQRShape
      Left = 44
      Top = 32
      Width = 80
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        116.416666666666700000
        84.666666666666680000
        211.666666666666700000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object qrImporte3: TQRLabel
      Left = 196
      Top = 420
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        518.583333333333400000
        1111.250000000000000000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrImporte1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrImporte2: TQRLabel
      Left = 196
      Top = 400
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        518.583333333333400000
        1058.333333333333000000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrImporte1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrImporte1: TQRLabel
      Left = 196
      Top = 380
      Width = 60
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        518.583333333333400000
        1005.416666666667000000
        158.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrImporte1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel32: TQRLabel
      Left = 8
      Top = 380
      Width = 75
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        1005.416666666667000000
        198.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Cuota anual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel33: TQRLabel
      Left = 8
      Top = 400
      Width = 89
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        1058.333333333333000000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Cuota mensual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel34: TQRLabel
      Left = 8
      Top = 420
      Width = 118
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        1111.250000000000000000
        312.208333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Cuota por trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel35: TQRLabel
      Left = 8
      Top = 298
      Width = 712
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        127.000000000000000000
        21.166666666666670000
        788.458333333333400000
        1883.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'R'#201'GIMEN DE AL'#205'CUOTAS PARA SUPUESTOS ESPECIALES - Resoluci'#243'n 65/9' +
        '6 S.R.T. Y S.S.N. N'#186' 24.573/96: ART. 1'#176'.- El empleador que conta' +
        're con m'#225's de un establecimiento celebrar'#225' un '#250'nico contrato de ' +
        'afiliaci'#243'n. La al'#237'cuota se determinar'#225' de acuerdo a los procedim' +
        'ientos estipulados por la normativa que regula el r'#233'gimen en gen' +
        'eral, entendi'#233'ndose que el nivel de cumplimiento, a los fines de' +
        'l encuadramiento en el r'#233'gimen de al'#237'cuotas, ser'#225' el que corresp' +
        'onda al establecimiento de menor nivel de cumplimiento; salvo qu' +
        'e de com'#250'n acuerdo el empleador y la Aseguradora establezcan com' +
        'o m'#225's representativo del estado de riesgo de la empresa en su co' +
        'njunto, el nivel de cualquiera de los otros establecimientos.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel36: TQRLabel
      Left = 8
      Top = 360
      Width = 531
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        952.500000000000000000
        1404.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'En funci'#243'n a las al'#237'cuotas y los datos informados resultan las s' +
        'iguientes primas estimadas a pagar:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape15: TQRShape
      Left = 296
      Top = 384
      Width = 424
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        116.416666666666700000
        783.166666666666800000
        1016.000000000000000000
        1121.833333333333000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel37: TQRLabel
      Left = 317
      Top = 400
      Width = 358
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        838.729166666666800000
        1058.333333333333000000
        947.208333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'Cl'#225'usula penal por incumplimientos de denuncias del empleador: $' +
        '100.000.- (pesos cien mil)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRLabel41: TQRLabel
      Left = 8
      Top = 444
      Width = 720
      Height = 60
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        158.750000000000000000
        21.166666666666670000
        1174.750000000000000000
        1905.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Asimismo, si con posterioridad al inicio de vigencia de la cotiz' +
        'aci'#243'n existiera un cambio legislativo por el cual la responsabil' +
        'idad del asegurador se viera aumentada o extendida, las partes a' +
        'cuerdan entablar inmediatas negociaciones, con el objeto de adec' +
        'uar los t'#233'rminos de la cotizaci'#243'n a la nueva situaci'#243'n para neut' +
        'ralizar los perjuicios que '#233'sta irrogue. Si no llegara a un acue' +
        'rdo entre las partes en el t'#233'rmino de 30 d'#237'as de convocada la re' +
        'uni'#243'n, la aseguradora est'#225' facultada a la rescisi'#243'n de la cotiza' +
        'ci'#243'n original (quedar'#225' sin efecto la mencionada cotizaci'#243'n).'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel38: TQRLabel
      Left = 8
      Top = 276
      Width = 182
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        730.250000000000000000
        481.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Bonificaciones especiales:        N/A %'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = False
      FontSize = 8
    end
    object QRLabel39: TQRLabel
      Left = 8
      Top = 512
      Width = 68
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        1354.666666666667000000
        179.916666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'IMPORTANTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel40: TQRLabel
      Left = 8
      Top = 528
      Width = 720
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        74.083333333333340000
        21.166666666666670000
        1397.000000000000000000
        1905.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        'Este documento carece de car'#225'cter obligacional. La presente coti' +
        'zaci'#243'n tiene car'#225'cter informativo y no puede invocarse cobertura' +
        ' hasta tanto no se suscriba la solicitud de cobertura, cuya fech' +
        'a no ser'#225' anterior a la fecha de la presente.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape16: TQRShape
      Left = 8
      Top = 395
      Width = 250
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        1045.104166666667000000
        661.458333333333400000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape17: TQRShape
      Left = 8
      Top = 435
      Width = 250
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        1150.937500000000000000
        661.458333333333400000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape18: TQRShape
      Left = 8
      Top = 415
      Width = 250
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        21.166666666666670000
        1098.020833333333000000
        661.458333333333400000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel42: TQRLabel
      Left = 8
      Top = 568
      Width = 503
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        1502.833333333333000000
        1330.854166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'PARA INICIAR EL PROCESO DE AFILIACI'#211'N COMPLETE Y PRESENTE LA SIG' +
        'UIENTE DOCUMENTACI'#211'N:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel43: TQRLabel
      Left = 32
      Top = 592
      Width = 452
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        84.666666666666680000
        1566.333333333333000000
        1195.916666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Completar la Solicitud de Afiliaci'#243'n, confeccionada por un rep' +
        'resentante de Provincia ART.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel50: TQRLabel
      Left = 8
      Top = 968
      Width = 62
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        2561.166666666667000000
        164.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TE-04-F001'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel44: TQRLabel
      Left = 32
      Top = 608
      Width = 657
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        84.666666666666680000
        1608.666666666667000000
        1738.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Si la empresa cuenta con m'#225's de un local, filial o lugar de ri' +
        'esgo (establecimientos), completar el formulario de Ubicaci'#243'n de' +
        ' Riesgo.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel45: TQRLabel
      Left = 32
      Top = 624
      Width = 688
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375000000000000000
        84.666666666666680000
        1651.000000000000000000
        1820.333333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '> Presentar las constancias de Alta temprana de la A.F.I.P. - "M' +
        'i simplificaci'#243'n". Si la empresa posee m'#225's de 35 trabajadores, a' +
        'djuntar el listado que surge de la p'#225'gina web de A.F.I.P. con lo' +
        's movimientos realizados por "Mi simplificaci'#243'n".'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel46: TQRLabel
      Left = 32
      Top = 656
      Width = 593
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        84.666666666666680000
        1735.666666666667000000
        1568.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Si es una persona f'#237'sica, deber'#225' presentar el D.N.I. del titul' +
        'ar, firmado por el titular y el representante de Provincia ART.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel47: TQRLabel
      Left = 32
      Top = 672
      Width = 688
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375000000000000000
        84.666666666666680000
        1778.000000000000000000
        1820.333333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '> Si es una persona jur'#237'dica, deber'#225' presentar el poder de quien' +
        ' solicita la cobertura, su D.N.I. y el estatuto social, todo fir' +
        'mado por el titular y el representante de Provincia ART.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel48: TQRLabel
      Left = 32
      Top = 704
      Width = 405
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        84.666666666666680000
        1862.666666666667000000
        1071.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Presentar fotocopia del formulario 460 de constancia de inscri' +
        'pci'#243'n en la A.F.I.P.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel49: TQRLabel
      Left = 32
      Top = 720
      Width = 687
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        84.666666666666680000
        1905.000000000000000000
        1817.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Completar los formularios de RGRL (Resoluci'#243'n 463/09 y 529/09)' +
        ', en funci'#243'n de sus establecimientos y la actividad de cada uno ' +
        'de ellos.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel51: TQRLabel
      Left = 32
      Top = 736
      Width = 688
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375000000000000000
        84.666666666666680000
        1947.333333333334000000
        1820.333333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '> Formulario de Exposici'#243'n a Riesgos Qu'#237'micos, F'#237'sicos y/o Biol'#243 +
        'gicos y N'#243'mina de Personal Expuesto (Res. SRT 37/2010), utilizan' +
        'do un formulario para cada establecimiento.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape5: TQRShape
      Left = 8
      Top = 768
      Width = 720
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        21.166666666666670000
        2032.000000000000000000
        1905.000000000000000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel24: TQRLabel
      Left = 275
      Top = 792
      Width = 189
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.979166666666670000
        727.604166666666800000
        2095.500000000000000000
        500.062500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'RESPONSABILIDAD CIVIL PATRONAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel52: TQRLabel
      Left = 20
      Top = 852
      Width = 89
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        52.916666666666670000
        2254.250000000000000000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Al'#237'cuota variable'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrAlicuotaVariable: TQRLabel
      Left = 120
      Top = 852
      Width = 48
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        317.500000000000000000
        2254.250000000000000000
        127.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrCosto1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel53: TQRLabel
      Left = 20
      Top = 876
      Width = 83
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        52.916666666666670000
        2317.750000000000000000
        219.604166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuota inicial de'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrCuotaInicialDe: TQRLabel
      Left = 120
      Top = 876
      Width = 48
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        317.500000000000000000
        2317.750000000000000000
        127.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrCosto1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel54: TQRLabel
      Left = 20
      Top = 896
      Width = 88
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        52.916666666666670000
        2370.666666666667000000
        232.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Suma asegurada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrSumaAsegurada: TQRLabel
      Left = 120
      Top = 896
      Width = 48
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        317.500000000000000000
        2370.666666666667000000
        127.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrCosto1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      OnPrint = AgregarEspacioInicial
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel55: TQRLabel
      Left = 280
      Top = 824
      Width = 440
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375000000000000000
        740.833333333333400000
        2180.166666666667000000
        1164.166666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '> Cobertura: Responsabilidad civil por Accidentes de Trabajo y E' +
        'nfermedades profesionales, en exceso de las prestaciones otorgad' +
        'as por la Ley de Accidentes de Trabajo N'#186' 24.557'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel56: TQRLabel
      Left = 280
      Top = 856
      Width = 440
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375000000000000000
        740.833333333333400000
        2264.833333333333000000
        1164.166666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '> Descubierto obligatorio: 5% del monto indemnizable, con un m'#237'n' +
        'imo del 1% y un m'#225'ximo del 5% de la suma asegurada.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel57: TQRLabel
      Left = 280
      Top = 888
      Width = 216
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        740.833333333333200000
        2349.500000000000000000
        571.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '> Suma asegurable por trabajador: #SUMA#'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel58: TQRLabel
      Left = 280
      Top = 904
      Width = 374
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        740.833333333333200000
        2391.833333333333000000
        989.541666666666800000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> L'#237'mite m'#225'ximo anual: Hasta tres veces la suma asegurable por t' +
        'rabajador.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel59: TQRLabel
      Left = 280
      Top = 920
      Width = 393
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        740.833333333333200000
        2434.166666666667000000
        1039.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Premio Anual: El costo en $, resultante de los factores aplica' +
        'bles establecidos.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel60: TQRLabel
      Left = 280
      Top = 936
      Width = 321
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        740.833333333333200000
        2476.500000000000000000
        849.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        '> Tipo de facturaci'#243'n: Mensual, conforme altas y bajas de c'#225'pita' +
        's.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRShape8: TQRShape
      Left = 8
      Top = 824
      Width = 256
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        2180.166666666667000000
        677.333333333333400000)
      Brush.Color = clBlack
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel61: TQRLabel
      Left = 87
      Top = 825
      Width = 95
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        44.979166666666670000
        230.187500000000000000
        2182.812500000000000000
        251.354166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VALOR COTIZADO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Neo Sans'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRImage2: TQRImage
      Left = 608
      Top = 776
      Width = 119
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333300000
        1608.666666666667000000
        2053.166666666667000000
        314.854166666666700000)
      Picture.Data = {
        0A544A504547496D616765817B0000FFD8FFE000104A46494600010201004800
        480000FFE10F5B4578696600004D4D002A000000080007011200030000000100
        010000011A00050000000100000062011B0005000000010000006A0128000300
        00000100020000013100020000001E0000007201320002000000140000009087
        69000400000001000000A4000000D0000AFC8000002710000AFC800000271041
        646F62652050686F746F73686F7020435333204D6163696E746F736800323031
        313A30363A30312031323A30323A3432000003A00100030000000100010000A0
        02000400000001000000EEA0030004000000010000005C000000000000000601
        0300030000000100060000011A0005000000010000011E011B00050000000100
        00012601280003000000010002000002010004000000010000012E0202000400
        00000100000E250000000000000048000000010000004800000001FFD8FFE000
        104A46494600010200004800480000FFED000C41646F62655F434D0001FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108003E00A003012200
        021101031101FFDD0004000AFFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554925E4F
        8DD43EBDFD63FAD9D67A5F4EEB3F63AFA7DF70ADAE6B43456CB9D456C6FA553B
        E8B7F39E929F584979C7D5BFADDF587A57D65C9FAB3F5B6F6648A697DCDCD634
        0DADAEAFB59717B194FA947D9D967D3ABD6F5974F89F5F7EA8E6DF8B8F8BD459
        6DD9AF35D158659B8B81DBB6C6BABFD06EFCCF5FD3F53FC1A4A7A04973DD43EB
        FF00D4FE9D9AFC0CBEA4C664D676D8C632CB035D3B5CC7D9457654C7B1DFCE31
        CFFD1FF8456F3FEB5FD5EE9C70BED79AC637A998C2B1A1D657641637736EA5B6
        52D67E9ABF7D8FD8929D6496775BFAC1D23A063332FAB647D9A8B1E2A63B6BDF
        2F21CFDBB28658FF00A2C77E6AE67A667331BEBAF59BF27AFBF271A8C47E4BFA
        639B78663D518D7FAF0F6FD93F4553BFC0FE9BF4BFF1A929EDD25CC3FF00C657
        D486535DCEEA8C2CBB76D0DAED73C6D30EF529654EB69FE47ACC67A9FE0D6CB7
        AE748774A1D646655FB35CDDE328B80AE09F4F573BE8BFD4FD17A7FCE7ADFA1F
        E712537925CDE1FD7AFAADD66E774DE97D4A736FAECF47F437360B58EB1D64DD
        5575FE8DADF53E9AC9FA95D6F07A67D58CBEA5D53EB03BAAE2D795B0E65ADC82
        584B298C76B7299F6A7FD2DFFA3AFD3FFC11253DD24B9FE99F5FBEA8F55CB6E1
        60F5163F22CD2B63D9655B893018C764D7531F63BFD1B7DEBA0494A497CEBF5C
        7ABF55B7EB5756DF97711565DF4D603DC036BAEC7D7556D6B4ED6B58C6AB3F55
        BEAD7D67FAD35E4BFA7670AC621636C17DD6B49DE1E5BB3D365BFE8D253F40A4
        B90FA89F51EEFABCC7E6754C939BD56D05921EF755556483E9D3EAEDDF65BB18
        EBAE733FE06AFF000966475E9294924924A7FFD0F555E2DD18FD6A1F5E3EB21F
        AB028764FDA3205C2F88D9F6876B5EE8F76F5ED2B93FAB5F52F23A2FD66EAFD6
        ECCA65B5F537D8E652D690E6FA96FDA3DEF2EFCCFA0929E7E8FA8FD67199D6FE
        B47D65CAAF27A9BF032454CA7869343A9F51EE0DA59B9940F459532BD8A9FF00
        8BDC0C0A7EA1F55EBACC5A9FD5713ED4FC7CA7303AC63AAA1B653E8BDFBBD3DA
        F3FE0D7A6F55C3767F4BCCC16BC56ECBA2DA05846E0D3631D5EFDB2DDDB772C6
        FA95F551FF00573A15BD272EE6667AD6D963F6B486ED7B5957A443CBB7FF0036
        929E43FC5AFD55FABFD53EA7665F9F8B5DD7E45B6D6EC8780E7D6D631BB3D07F
        FDA7D9BFD4F67D3FCFFCC5CD5185767FF8ACBB289DCEE8FD4CBAA26496D36B28
        65B4D5FBAD764DF5DEBAF7FF008AFEBF8432BA7F43EBAEC6E8D9C49BF1AC0EDC
        1A7DAE68D9EDB1CEAFF4763DBF66F5ABFD1DABA7E99F527A674EFAAB77D5A639
        CFAB2ABB064641037BADB1BB1D9019F419E9EDAFD067E67A557F39FCE24A78DF
        ADD963EB6755FA9FD2B692DCEAABCECB634E9E9DDB0DBB5C3FC2535636620DFF
        00F8B8FAEFFF00A66CAFFCF78ABA0FAA1FE2EF37A2F58AFA9F54CF6E71C2A5D8
        DD398D691E9B1C5DEF979F67B2DBDBE8FE93F9FF00E75587FD44C97FD60EBDD5
        4E5B057D6B06DC2AD9B097566D6D2CF51FEEDAFD9E8A4A79AFA81D07A2667D42
        EA7999783464654E4B45F63039ED0CA5AE67A563BDD4ED73BFC16C5C9599371F
        F1738F8FBC8A8F57B647F571E9737FE95D62F5BFAADF53F23A1FD57CAE876E4B
        2EB728DC45CD610D6FAAC6D23DAE76E7EDDBBFF3164E17F8ACAC7D51BBEAFE76
        6075CECB39B46554C315BCD75E3ED35B9CDF55BB18FDFEE67D3FE424A7A7A7EA
        CFD5EE9B48B707A6E363DD8F539B55ECA9A2D0363AAFE91B7D77B9CC3EF7BECD
        F62F37FA97D67A3F46FF001779B95D6311B9F43FA93ABA711EC6BDB65DE8D165
        6D77AA1F5B1ADF4DCFF536AEB7A0FD58FAED879B51EABD7865F4EA58F60C70D2
        4BC1ADF4D5EABDC18FFD1B9CCB7F9CB7E82CFA3FC55DBFF33EDFABD919ED179C
        DFB7D17D6C2581DE9371BD2B58E3B9CC733D4FA0EFFD26929E3FEBBD993E974A
        CD1F56AAFAB32F73E8B697561F67F34F68B69A2AC7B6A7D3F4DBEBB3FEFEBDCD
        79AF53FF0016BF5B7ADD18C3ACFD60664598AE8AEB3512C6B081BACF55BE8BED
        B9DB1BFCE57FF5E5E94929F9ABEB67FE2ABACFFE1FC9FF00CFD62F44FF0011BF
        D1FAC7F5F1FF0025EBCEFEB67FE2ABACFF00E1FC9FFCFD62F44FF11BFD1FAC7F
        5F1FF25E929DDFF1B3D433FA7FD58AEFC0C9B712D765D6C75943CD6E2D2CB9DB
        37D7B5FB7735AB1FFC507D66EB7D4ECCDE9DD46EB3329A18DBABC8B9C5EF6173
        B69A5F73F73DFEA7D3AF7BBFC12EF3ADF41E97D7B0860F54A7D7C70F1635A1CE
        610F682D6B83AB731DF45EF4DD13EAF746E818EEC6E938CDC6AEC3BAC20B9CE7
        1FE5DB6B9F63B6FE6FB9253A292E31DF5DF1FA8FD78E9BD07A4DE2DC5AFD7B33
        AE66ADB1CDA6DF4B1EBB01DAFAEA77E96DFF0085F4BFD1AECD253FFFD1F55492
        4925292492494E0FD73EB799D1BA555761FA6CB72B26AC439576B4E336E25AEC
        DC8E3F45547E7BB67A8F67FC5A6E93D27EB56366D791D43EB0B7A961C3B7E37D
        8AAA7748FD1965F4D9B9BB1FEF5B397462E463BE8CC632DC7B46CB2BB402C702
        636B9AFF006FD25C86363BBEAB7D69E9BD0BA666BACE99D55990474CBDDEABB1
        5D531F7D77E2D8EFD2B31AC733D2F46DFF00867FE99FFCCA53B4FF00AEBF55AB
        EAA7A3BFA8D43383FD235C3B68B3FD13B236FD99B6EEF67A7EB6FF0053F47FCE
        2275AFAD9F57BA0D95D5D573598D6DA3732B873DFB78DE6BA5B63D8CDC3E9BD7
        0BF573A375BEB1F50874EC7CAE9B5F4EB9B63325B6D369BEBB4586CB1D9167AD
        B1B935BF63DAE7D5F43D245CEFAC167D54FAEF9FEA32ACAB7A8E361836655BF6
        79754C752EB28C8F4F2AB663BFD3FD33323D1FD3FD0494F6787F5C3EADE6D15E
        462E6B6CA6ECA6E0D6FD96343B22C6FA95D037D6DFA6CFCEFE6D5DC8EAFD3B1B
        2FEC57DED6649A1F95E9907F99AC86DB69746DF6EE5E7F6E1FD83A4747CDBF27
        1AC667FD67ABA83DD8AFF531A96D9EAB0D35E47D07D74BABFD259EC67A9FE7AD
        9FAC0F61FAE0E68702E6F42CBDCD044897B36EE6FE6EE494ECF4EFAE3F567A9B
        326CC2CF6595E131B6E4D8E0FAD8C6384B5CEB2E656CECA5D17EB7FD5CEBB73F
        1FA566B722EAC6E7565AFADDB7F7D8CBD953AC6FFC5AE63A98A5BFE2CFA21BC0
        182074D39C23DA69DF49BBD503F35CFDBBBF96B57EB1D98EFF00AD1F55863B98
        734DF7BD91A9FB31A2CFB4BB4FCC7FB367FD0494D9AFEBFF00D50B7A8B3A655D
        459665D968A18D632D735D6388ADAC66436AFB3BB73DDF4FD5D8BA15C4E38EA1
        F51C626355755D47EACE4E4B71F1D861B958EFC8B1CE68ADCCF6750A1B639EE7
        FF00DAAF7FFA2A576C929F9B7EB954FA7EB675865821C736F781E4FB1D6B3FE8
        3D771FE2433F1D991D53A7BDC1B91736ABAA69FCE6D7EA32E8FEA7AB52AFFE38
        7EAB5F47511F58F1985F8B941ACCC70D7D3B5A0555BDC3F36ABEA6D6CFF8E67F
        C354BCEF1B2B2712F664E2DAFA2FA8CD76D6E2D7B4F8B5EDF735253EEFFE343A
        D754E8BF576BCCE979071B20E557597B435D2C2CB9CE67E95AFF00CE63578DF5
        4FADDF59BAB566ACFEA37DD53843A90ED95B87F2E9A7D3A9FF00DA623759FAED
        F593AE6037A7F54CA191432C168FD1D6C76E68731B2EA995FEFAC2494F5BFE2A
        BFF17181FD5BFF00F3CDABDF57817F8AAFFC5C607F56FF00FCF36AF7D494FF00
        FFD2F554924925292492494D4EA5D2FA7F55C5389D471D9958E4877A76091B9B
        F45C3F75CAB748FAB1D03A23DD674BC1AB1AC782D758D04BCB490E2CF56CDF67
        A7B9ADFD1EE5A8924A7132FEA5FD55CCCD39D93D328B325C4B9EFDB01CE27739
        F6D6DDB5DAF73BE93EC62A37745EBBD3BAFF0051EA9D26AC4CDC4EAD5D0CBF17
        21EEA5D5BA861C6AFD2732AC8A9F8FE93B7DAC7B7FF33EA52494F37F577EAA8C
        3E919D83D62AC5BC753CAB32EFC4A59FAB337FA6D651536C0DDFE97A0CB1B67A
        75FE93FE2FD457B07EA9FD5BE9E4BB0BA7514B9D5BEA7B9ADD5D5D9B7D5ADEE7
        4B9ED76CFCF5AC924A6BD781855E0B7A736867D89B58A063B80733D303D3F49C
        C7EEDECD9EDF72A7D27EAC740E8D6D9774CC1AB16DB810FB1A25DB490E3587BF
        739956E6FF0034CFD1AD4492538989F52FEAAE166B73F17A6515E4B08731E1B2
        1AE07735F556E26AADED77E7B18B6D2492530BA9AAFA9F45EC6DB4DAD2CB2B78
        0E6B9AE1B5EC7B1DED731CD5C3F54FF13BF55F32D7DD88FBFA7B9DA8AEA707D4
        0FE77E8EE6BECFFC1F62EED2494F977FE31B8FFF00970FFF00D871FF00A5D2FF
        00C6371FFF002E1FFF00B0E3FF004BAF5149253C5FD50FF163D3FEAD7523D4DD
        96FCDC96B5CCA2582B6B378DB63F68758E7D9B3D9F4FE83FE82ED1249253FFD9
        FFED2C3850686F746F73686F7020332E30003842494D04040000000000071C02
        0000020000003842494D0425000000000010E8F15CF32FC118A1A27B67ADC564
        D5BA3842494D03EA0000000018203C3F786D6C2076657273696F6E3D22312E30
        2220656E636F64696E673D225554462D38223F3E0A3C21444F43545950452070
        6C697374205055424C494320222D2F2F4170706C652F2F44544420504C495354
        20312E302F2F454E222022687474703A2F2F7777772E6170706C652E636F6D2F
        445444732F50726F70657274794C6973742D312E302E647464223E0A3C706C69
        73742076657273696F6E3D22312E30223E0A3C646963743E0A093C6B65793E63
        6F6D2E6170706C652E7072696E742E50616765466F726D61742E504D486F7269
        7A6F6E74616C5265733C2F6B65793E0A093C646963743E0A09093C6B65793E63
        6F6D2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B
        65793E0A09093C737472696E673E636F6D2E6170706C652E6A6F627469636B65
        743C2F737472696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E
        742E7469636B65742E6974656D41727261793C2F6B65793E0A09093C61727261
        793E0A0909093C646963743E0A090909093C6B65793E636F6D2E6170706C652E
        7072696E742E50616765466F726D61742E504D486F72697A6F6E74616C526573
        3C2F6B65793E0A090909093C7265616C3E37323C2F7265616C3E0A090909093C
        6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E7374617465
        466C61673C2F6B65793E0A090909093C696E74656765723E303C2F696E746567
        65723E0A0909093C2F646963743E0A09093C2F61727261793E0A093C2F646963
        743E0A093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F72
        6D61742E504D4F7269656E746174696F6E3C2F6B65793E0A093C646963743E0A
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6372
        6561746F723C2F6B65793E0A09093C737472696E673E636F6D2E6170706C652E
        6A6F627469636B65743C2F737472696E673E0A09093C6B65793E636F6D2E6170
        706C652E7072696E742E7469636B65742E6974656D41727261793C2F6B65793E
        0A09093C61727261793E0A0909093C646963743E0A090909093C6B65793E636F
        6D2E6170706C652E7072696E742E50616765466F726D61742E504D4F7269656E
        746174696F6E3C2F6B65793E0A090909093C696E74656765723E313C2F696E74
        656765723E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E7374617465466C61673C2F6B65793E0A090909093C696E746567
        65723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F6172
        7261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072
        696E742E50616765466F726D61742E504D5363616C696E673C2F6B65793E0A09
        3C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469
        636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E636F6D
        2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B6579
        3E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261
        793C2F6B65793E0A09093C61727261793E0A0909093C646963743E0A09090909
        3C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E
        504D5363616C696E673C2F6B65793E0A090909093C7265616C3E313C2F726561
        6C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
        65742E7374617465466C61673C2F6B65793E0A090909093C696E74656765723E
        303C2F696E74656765723E0A0909093C2F646963743E0A09093C2F6172726179
        3E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C652E7072696E74
        2E50616765466F726D61742E504D566572746963616C5265733C2F6B65793E0A
        093C646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E63726561746F723C2F6B65793E0A09093C737472696E673E636F
        6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D417272
        61793C2F6B65793E0A09093C61727261793E0A0909093C646963743E0A090909
        093C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D6174
        2E504D566572746963616C5265733C2F6B65793E0A090909093C7265616C3E37
        323C2F7265616C3E0A090909093C6B65793E636F6D2E6170706C652E7072696E
        742E7469636B65742E7374617465466C61673C2F6B65793E0A090909093C696E
        74656765723E303C2F696E74656765723E0A0909093C2F646963743E0A09093C
        2F61727261793E0A093C2F646963743E0A093C6B65793E636F6D2E6170706C65
        2E7072696E742E50616765466F726D61742E504D566572746963616C5363616C
        696E673C2F6B65793E0A093C646963743E0A09093C6B65793E636F6D2E617070
        6C652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909
        3C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F737472
        696E673E0A09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
        65742E6974656D41727261793C2F6B65793E0A09093C61727261793E0A090909
        3C646963743E0A090909093C6B65793E636F6D2E6170706C652E7072696E742E
        50616765466F726D61742E504D566572746963616C5363616C696E673C2F6B65
        793E0A090909093C7265616C3E313C2F7265616C3E0A090909093C6B65793E63
        6F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C
        2F6B65793E0A090909093C696E74656765723E303C2F696E74656765723E0A09
        09093C2F646963743E0A09093C2F61727261793E0A093C2F646963743E0A093C
        6B65793E636F6D2E6170706C652E7072696E742E7375625469636B65742E7061
        7065725F696E666F5F7469636B65743C2F6B65793E0A093C646963743E0A0909
        3C6B65793E504D5050445061706572436F64654E616D653C2F6B65793E0A0909
        3C646963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E74
        69636B65742E63726561746F723C2F6B65793E0A0909093C737472696E673E63
        6F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A0909093C
        6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D41
        727261793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E
        0A09090909093C6B65793E504D5050445061706572436F64654E616D653C2F6B
        65793E0A09090909093C737472696E673E4C65747465723C2F737472696E673E
        0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
        303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
        61793E0A09093C2F646963743E0A09093C6B65793E504D54696F676150617065
        724E616D653C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E63726561746F723C2F6B6579
        3E0A0909093C737472696E673E636F6D2E6170706C652E6A6F627469636B6574
        3C2F737472696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E
        742E7469636B65742E6974656D41727261793C2F6B65793E0A0909093C617272
        61793E0A090909093C646963743E0A09090909093C6B65793E504D54696F6761
        50617065724E616D653C2F6B65793E0A09090909093C737472696E673E6E612D
        6C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D2E6170
        706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B65793E
        0A09090909093C696E74656765723E303C2F696E74656765723E0A090909093C
        2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A09093C
        6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E50
        4D41646A757374656450616765526563743C2F6B65793E0A09093C646963743E
        0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E
        63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E617070
        6C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E6974656D41727261793C2F
        6B65793E0A0909093C61727261793E0A090909093C646963743E0A0909090909
        3C6B65793E636F6D2E6170706C652E7072696E742E50616765466F726D61742E
        504D41646A757374656450616765526563743C2F6B65793E0A09090909093C61
        727261793E0A0909090909093C696E74656765723E303C2F696E74656765723E
        0A0909090909093C696E74656765723E303C2F696E74656765723E0A09090909
        09093C7265616C3E3733343C2F7265616C3E0A0909090909093C7265616C3E35
        37363C2F7265616C3E0A09090909093C2F61727261793E0A09090909093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E7374617465466C
        61673C2F6B65793E0A09090909093C696E74656765723E303C2F696E74656765
        723E0A090909093C2F646963743E0A0909093C2F61727261793E0A09093C2F64
        6963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E50616765
        466F726D61742E504D41646A75737465645061706572526563743C2F6B65793E
        0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E
        742E7469636B65742E63726561746F723C2F6B65793E0A0909093C737472696E
        673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E673E0A09
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E6974
        656D41727261793C2F6B65793E0A0909093C61727261793E0A090909093C6469
        63743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E5061
        6765466F726D61742E504D41646A75737465645061706572526563743C2F6B65
        793E0A09090909093C61727261793E0A0909090909093C7265616C3E2D31383C
        2F7265616C3E0A0909090909093C7265616C3E2D31383C2F7265616C3E0A0909
        090909093C7265616C3E3737343C2F7265616C3E0A0909090909093C7265616C
        3E3539343C2F7265616C3E0A09090909093C2F61727261793E0A09090909093C
        6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E7374617465
        466C61673C2F6B65793E0A09090909093C696E74656765723E303C2F696E7465
        6765723E0A090909093C2F646963743E0A0909093C2F61727261793E0A09093C
        2F646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E742E5061
        706572496E666F2E504D50617065724E616D653C2F6B65793E0A09093C646963
        743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D2E61
        70706C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65793E
        636F6D2E6170706C652E7072696E742E7469636B65742E6974656D4172726179
        3C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A090909
        09093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F
        2E504D50617065724E616D653C2F6B65793E0A09090909093C737472696E673E
        6E612D6C65747465723C2F737472696E673E0A09090909093C6B65793E636F6D
        2E6170706C652E7072696E742E7469636B65742E7374617465466C61673C2F6B
        65793E0A09090909093C696E74656765723E303C2F696E74656765723E0A0909
        09093C2F646963743E0A0909093C2F61727261793E0A09093C2F646963743E0A
        09093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E666F
        2E504D556E61646A757374656450616765526563743C2F6B65793E0A09093C64
        6963743E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E746963
        6B65742E63726561746F723C2F6B65793E0A0909093C737472696E673E636F6D
        2E6170706C652E6A6F627469636B65743C2F737472696E673E0A0909093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E6974656D417272
        61793C2F6B65793E0A0909093C61727261793E0A090909093C646963743E0A09
        090909093C6B65793E636F6D2E6170706C652E7072696E742E5061706572496E
        666F2E504D556E61646A757374656450616765526563743C2F6B65793E0A0909
        0909093C61727261793E0A0909090909093C696E74656765723E303C2F696E74
        656765723E0A0909090909093C696E74656765723E303C2F696E74656765723E
        0A0909090909093C7265616C3E3733343C2F7265616C3E0A0909090909093C72
        65616C3E3537363C2F7265616C3E0A09090909093C2F61727261793E0A090909
        09093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E7374
        617465466C61673C2F6B65793E0A09090909093C696E74656765723E303C2F69
        6E74656765723E0A090909093C2F646963743E0A0909093C2F61727261793E0A
        09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E7072696E74
        2E5061706572496E666F2E504D556E61646A7573746564506170657252656374
        3C2F6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C
        652E7072696E742E7469636B65742E63726561746F723C2F6B65793E0A090909
        3C737472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F737472
        696E673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E746963
        6B65742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A09
        0909093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072
        696E742E5061706572496E666F2E504D556E61646A7573746564506170657252
        6563743C2F6B65793E0A09090909093C61727261793E0A0909090909093C7265
        616C3E2D31383C2F7265616C3E0A0909090909093C7265616C3E2D31383C2F72
        65616C3E0A0909090909093C7265616C3E3737343C2F7265616C3E0A09090909
        09093C7265616C3E3539343C2F7265616C3E0A09090909093C2F61727261793E
        0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E7374617465466C61673C2F6B65793E0A09090909093C696E74656765723E
        303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F617272
        61793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E70
        72696E742E5061706572496E666F2E7070642E504D50617065724E616D653C2F
        6B65793E0A09093C646963743E0A0909093C6B65793E636F6D2E6170706C652E
        7072696E742E7469636B65742E63726561746F723C2F6B65793E0A0909093C73
        7472696E673E636F6D2E6170706C652E6A6F627469636B65743C2F737472696E
        673E0A0909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65
        742E6974656D41727261793C2F6B65793E0A0909093C61727261793E0A090909
        093C646963743E0A09090909093C6B65793E636F6D2E6170706C652E7072696E
        742E5061706572496E666F2E7070642E504D50617065724E616D653C2F6B6579
        3E0A09090909093C737472696E673E5553204C65747465723C2F737472696E67
        3E0A09090909093C6B65793E636F6D2E6170706C652E7072696E742E7469636B
        65742E7374617465466C61673C2F6B65793E0A09090909093C696E7465676572
        3E303C2F696E74656765723E0A090909093C2F646963743E0A0909093C2F6172
        7261793E0A09093C2F646963743E0A09093C6B65793E636F6D2E6170706C652E
        7072696E742E7469636B65742E41504956657273696F6E3C2F6B65793E0A0909
        3C737472696E673E30302E32303C2F737472696E673E0A09093C6B65793E636F
        6D2E6170706C652E7072696E742E7469636B65742E747970653C2F6B65793E0A
        09093C737472696E673E636F6D2E6170706C652E7072696E742E506170657249
        6E666F5469636B65743C2F737472696E673E0A093C2F646963743E0A093C6B65
        793E636F6D2E6170706C652E7072696E742E7469636B65742E41504956657273
        696F6E3C2F6B65793E0A093C737472696E673E30302E32303C2F737472696E67
        3E0A093C6B65793E636F6D2E6170706C652E7072696E742E7469636B65742E74
        7970653C2F6B65793E0A093C737472696E673E636F6D2E6170706C652E707269
        6E742E50616765466F726D61745469636B65743C2F737472696E673E0A3C2F64
        6963743E0A3C2F706C6973743E0A3842494D03ED000000000010004800000001
        000200480000000100023842494D042600000000000E00000000000000000000
        3F8000003842494D040D0000000000040000001E3842494D0419000000000004
        0000001E3842494D03F3000000000009000000000000000001003842494D040A
        00000000000100003842494D271000000000000A000100000000000000023842
        494D03F5000000000048002F66660001006C66660006000000000001002F6666
        000100A1999A0006000000000001003200000001005A00000006000000000001
        003500000001002D000000060000000000013842494D03F80000000000700000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF03E800003842494D0408000000000010000000010000
        024000000240000000003842494D041E000000000004000000003842494D041A
        0000000003470000000600000000000000000000005C000000EE000000090050
        002D00530065006700750072006F007300000001000000000000000000000000
        00000000000000010000000000000000000000EE0000005C0000000000000000
        0000000000000000010000000000000000000000000000000000000010000000
        010000000000006E756C6C0000000200000006626F756E64734F626A63000000
        01000000000000526374310000000400000000546F70206C6F6E670000000000
        0000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000005C00
        000000526768746C6F6E67000000EE00000006736C69636573566C4C73000000
        014F626A6300000001000000000005736C6963650000001200000007736C6963
        6549446C6F6E67000000000000000767726F757049446C6F6E67000000000000
        00066F726967696E656E756D0000000C45536C6963654F726967696E0000000D
        6175746F47656E6572617465640000000054797065656E756D0000000A45536C
        6963655479706500000000496D672000000006626F756E64734F626A63000000
        01000000000000526374310000000400000000546F70206C6F6E670000000000
        0000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000005C00
        000000526768746C6F6E67000000EE0000000375726C54455854000000010000
        000000006E756C6C54455854000000010000000000004D736765544558540000
        0001000000000006616C74546167544558540000000100000000000E63656C6C
        54657874497348544D4C626F6F6C010000000863656C6C546578745445585400
        000001000000000009686F727A416C69676E656E756D0000000F45536C696365
        486F727A416C69676E0000000764656661756C740000000976657274416C6967
        6E656E756D0000000F45536C69636556657274416C69676E0000000764656661
        756C740000000B6267436F6C6F7254797065656E756D0000001145536C696365
        4247436F6C6F7254797065000000004E6F6E6500000009746F704F7574736574
        6C6F6E67000000000000000A6C6566744F75747365746C6F6E67000000000000
        000C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F
        75747365746C6F6E6700000000003842494D042800000000000C000000013FF0
        0000000000003842494D0414000000000004000000013842494D040C00000000
        0E4100000001000000A00000003E000001E00000744000000E2500180001FFD8
        FFE000104A46494600010200004800480000FFED000C41646F62655F434D0001
        FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C11
        0B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10
        140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108003E00A003
        012200021101031101FFDD0004000AFFC4013F00000105010101010101000000
        00000000030001020405060708090A0B01000105010101010101000000000000
        00010002030405060708090A0B1000010401030204020507060805030C330100
        02110304211231054151611322718132061491A1B14223241552C16233347282
        D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2
        B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6
        D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605
        350100021103213112044151617122130532819114A1B14223C152D1F0332462
        E1728292435315637334F1250616A2B283072635C2D2449354A3176445553674
        65E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6
        B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554
        925E4F8DD43EBDFD63FAD9D67A5F4EEB3F63AFA7DF70ADAE6B43456CB9D456C6
        FA553BE8B7F39E929F584979C7D5BFADDF587A57D65C9FAB3F5B6F6648A697DC
        DCD6340DADAEAFB59717B194FA947D9D967D3ABD6F5974F89F5F7EA8E6DF8B8F
        8BD4596DD9AF35D158659B8B81DBB6C6BABFD06EFCCF5FD3F53FC1A4A7A04973
        DD43EBFF00D4FE9D9AFC0CBEA4C664D676D8C632CB035D3B5CC7D9457654C7B1
        DFCE31CFFD1FF8456F3FEB5FD5EE9C70BED79AC637A998C2B1A1D65764163773
        6EA5B652D67E9ABF7D8FD8929D6496775BFAC1D23A063332FAB647D9A8B1E2A6
        3B6BDF2F21CFDBB28658FF00A2C77E6AE67A667331BEBAF59BF27AFBF271A8C4
        7E4BFA639B78663D518D7FAF0F6FD93F4553BFC0FE9BF4BFF1A929EDD25CC3FF
        00C657D486535DCEEA8C2CBB76D0DAED73C6D30EF529654EB69FE47ACC67A9FE
        0D6CB7AE748774A1D646655FB35CDDE328B80AE09F4F573BE8BFD4FD17A7FCE7
        ADFA1FE712537925CDE1FD7AFAADD66E774DE97D4A736FAECF47F437360B58EB
        1D64DD5575FE8DADF53E9AC9FA95D6F07A67D58CBEA5D53EB03BAAE2D795B0E6
        5ADC82584B298C76B7299F6A7FD2DFFA3AFD3FFC11253DD24B9FE99F5FBEA8F5
        5CB6E160F5163F22CD2B63D9655B893018C764D7531F63BFD1B7DEBA0494A497
        CEBF5C7ABF55B7EB5756DF97711565DF4D603DC036BAEC7D7556D6B4ED6B58C6
        AB3F55BEAD7D67FAD35E4BFA7670AC621636C17DD6B49DE1E5BB3D365BFE8D25
        3F40A4B90FA89F51EEFABCC7E6754C939BD56D05921EF755556483E9D3EAEDDF
        65BB18EBAE733FE06AFF000966475E9294924924A7FFD0F555E2DD18FD6A1F5E
        3EB21FAB028764FDA3205C2F88D9F6876B5EE8F76F5ED2B93FAB5F52F23A2FD6
        6EAFD6ECCA65B5F537D8E652D690E6FA96FDA3DEF2EFCCFA0929E7E8FA8FD671
        99D6FEB47D65CAAF27A9BF032454CA7869343A9F51EE0DA59B9940F459532BD8
        A9FF008BDC0C0A7EA1F55EBACC5A9FD5713ED4FC7CA7303AC63AAA1B653E8BDF
        BBD3DAF3FE0D7A6F55C3767F4BCCC16BC56ECBA2DA05846E0D3631D5EFDB2DDD
        B772C6FA95F551FF00573A15BD272EE6667AD6D963F6B486ED7B5957A443CBB7
        FF0036929E43FC5AFD55FABFD53EA7665F9F8B5DD7E45B6D6EC8780E7D6D631B
        B3D07FFDA7D9BFD4F67D3FCFFCC5CD5185767FF8ACBB289DCEE8FD4CBAA26496
        D36B2865B4D5FBAD764DF5DEBAF7FF008AFEBF8432BA7F43EBAEC6E8D9C49BF1
        AC0EDC1A7DAE68D9EDB1CEAFF4763DBF66F5ABFD1DABA7E99F527A674EFAAB77
        D5A639CFAB2ABB064641037BADB1BB1D9019F419E9EDAFD067E67A557F39FCE2
        4A78DFADD963EB6755FA9FD2B692DCEAABCECB634E9E9DDB0DBB5C3FC2535636
        620DFF00F8B8FAEFFF00A66CAFFCF78ABA0FAA1FE2EF37A2F58AFA9F54CF6E71
        C2A5D8DD398D691E9B1C5DEF979F67B2DBDBE8FE93F9FF00E75587FD44C97FD6
        0EBDD54E5B057D6B06DC2AD9B097566D6D2CF51FEEDAFD9E8A4A79AFA81D07A2
        667D42EA7999783464654E4B45F63039ED0CA5AE67A563BDD4ED73BFC16C5C95
        99371FF1738F8FBC8A8F57B647F571E9737FE95D62F5BFAADF53F23A1FD57CAE
        876E4B2EB728DC45CD610D6FAAC6D23DAE76E7EDDBBFF3164E17F8ACAC7D51BB
        EAFE766075CECB39B46554C315BCD75E3ED35B9CDF55BB18FDFEE67D3FE424A7
        A7A7EACFD5EE9B48B707A6E363DD8F539B55ECA9A2D0363AAFE91B7D77B9CC3E
        F7BECDF62F37FA97D67A3F46FF001779B95D6311B9F43FA93ABA711EC6BDB65D
        E8D1656D77AA1F5B1ADF4DCFF536AEB7A0FD58FAED879B51EABD7865F4EA58F6
        0C70D24BC1ADF4D5EABDC18FFD1B9CCB7F9CB7E82CFA3FC55DBFF33EDFABD919
        ED179CDFB7D17D6C2581DE9371BD2B58E3B9CC733D4FA0EFFD26929E3FEBBD99
        3E974ACD1F56AAFAB32F73E8B697561F67F34F68B69A2AC7B6A7D3F4DBEBB3FE
        FEBDCD79AF53FF0016BF5B7ADD18C3ACFD60664598AE8AEB3512C6B081BACF55
        BE8BEDB9DB1BFCE57FF5E5E94929F9ABEB67FE2ABACFFE1FC9FF00CFD62F44FF
        0011BFD1FAC7F5F1FF0025EBCEFEB67FE2ABACFF00E1FC9FFCFD62F44FF11BFD
        1FAC7F5F1FF25E929DDFF1B3D433FA7FD58AEFC0C9B712D765D6C75943CD6E2D
        2CB9DB37D7B5FB7735AB1FFC507D66EB7D4ECCDE9DD46EB3329A18DBABC8B9C5
        EF6173B69A5F73F73DFEA7D3AF7BBFC12EF3ADF41E97D7B0860F54A7D7C70F16
        35A1CE610F682D6B83AB731DF45EF4DD13EAF746E818EEC6E938CDC6AEC3BAC2
        0B9CE71FE5DB6B9F63B6FE6FB9253A292E31DF5DF1FA8FD78E9BD07A4DE2DC5A
        FD7B33AE66ADB1CDA6DF4B1EBB01DAFAEA77E96DFF0085F4BFD1AECD253FFFD1
        F554924925292492494E0FD73EB799D1BA555761FA6CB72B26AC439576B4E336
        E25AECDC8E3F45547E7BB67A8F67FC5A6E93D27EB56366D791D43EB0B7A961C3
        B7E37D8AAA7748FD1965F4D9B9BB1FEF5B397462E463BE8CC632DC7B46CB2BB4
        02C702636B9AFF006FD25C86363BBEAB7D69E9BD0BA666BACE99D55990474CBD
        DEABB15D531F7D77E2D8EFD2B31AC733D2F46DFF00867FE99FFCCA53B4FF00AE
        BF55ABEAA7A3BFA8D43383FD235C3B68B3FD13B236FD99B6EEF67A7EB6FF0053
        F47FCE2275AFAD9F57BA0D95D5D573598D6DA3732B873DFB78DE6BA5B63D8CDC
        3E9BD70BF573A375BEB1F50874EC7CAE9B5F4EB9B63325B6D369BEBB4586CB1D
        9167ADB1B935BF63DAE7D5F43D245CEFAC167D54FAEF9FEA32ACAB7A8E361836
        655BF679754C752EB28C8F4F2AB663BFD3FD33323D1FD3FD0494F6787F5C3EAD
        E6D15E462E6B6CA6ECA6E0D6FD96343B22C6FA95D037D6DFA6CFCEFE6D5DC8EA
        FD3B1B2FEC57DED6649A1F95E9907F99AC86DB69746DF6EE5E7F6E1FD83A4747
        CDBF271AC667FD67ABA83DD8AFF531A96D9EAB0D35E47D07D74BABFD259EC67A
        9FE7AD9FAC0F61FAE0E68702E6F42CBDCD044897B36EE6FE6EE494ECF4EFAE3F
        567A9B326CC2CF6595E131B6E4D8E0FAD8C6384B5CEB2E656CECA5D17EB7FD5C
        EBB73F1FA566B722EAC6E7565AFADDB7F7D8CBD953AC6FFC5AE63A98A5BFE2CF
        A21BC0182074D39C23DA69DF49BBD503F35CFDBBBF96B57EB1D98EFF00AD1F55
        863B98734DF7BD91A9FB31A2CFB4BB4FCC7FB367FD0494D9AFEBFF00D50B7A8B
        3A655D459665D968A18D632D735D6388ADAC66436AFB3BB73DDF4FD5D8BA15C4
        E38EA1F51C626355755D47EACE4E4B71F1D861B958EFC8B1CE68ADCCF6750A1B
        639EE7FF00DAAF7FFA2A576C929F9B7EB954FA7EB675865821C736F781E4FB1D
        6B3FE83D771FE2433F1D991D53A7BDC1B91736ABAA69FCE6D7EA32E8FEA7AB52
        AFFE387EAB5F47511F58F1985F8B941ACCC70D7D3B5A0555BDC3F36ABEA6D6CF
        F8E67FC354BCEF1B2B2712F664E2DAFA2FA8CD76D6E2D7B4F8B5EDF735253EEF
        FE343AD754E8BF576BCCE979071B20E557597B435D2C2CB9CE67E95AFF00CE63
        578DF54FADDF59BAB566ACFEA37DD53843A90ED95B87F2E9A7D3A9FF00DA6237
        59FAEDF593AE6037A7F54CA191432C168FD1D6C76E68731B2EA995FEFAC2494F
        5BFE2ABFF17181FD5BFF00F3CDABDF57817F8AAFFC5C607F56FF00FCF36AF7D4
        94FF00FFD2F554924925292492494D4EA5D2FA7F55C5389D471D9958E4877A76
        091B9BF45C3F75CAB748FAB1D03A23DD674BC1AB1AC782D758D04BCB490E2CF5
        6CDF67A7B9ADFD1EE5A8924A7132FEA5FD55CCCD39D93D328B325C4B9EFDB01C
        E27739F6D6DDB5DAF73BE93EC62A37745EBBD3BAFF0051EA9D26AC4CDC4EAD5D
        0CBF1721EEA5D5BA861C6AFD2732AC8A9F8FE93B7DAC7B7FF33EA52494F37F57
        7EAA8C3E919D83D62AC5BC753CAB32EFC4A59FAB337FA6D651536C0DDFE97A0C
        B1B67A75FE93FE2FD457B07EA9FD5BE9E4BB0BA7514B9D5BEA7B9ADD5D5D9B7D
        5ADEE74B9ED76CFCF5AC924A6BD781855E0B7A736867D89B58A063B80733D303
        D3F49CC7EEDECD9EDF72A7D27EAC740E8D6D9774CC1AB16DB810FB1A25DB490E
        3587BF739956E6FF0034CFD1AD4492538989F52FEAAE166B73F17A6515E4B087
        31E1B21AE07735F556E26AADED77E7B18B6D2492530BA9AAFA9F45EC6DB4DAD2
        CB2B780E6B9AE1B5EC7B1DED731CD5C3F54FF13BF55F32D7DD88FBFA7B9DA8AE
        A707D40FE77E8EE6BECFFC1F62EED2494F977FE31B8FFF00970FFF00D871FF00
        A5D2FF00C6371FFF002E1FFF00B0E3FF004BAF5149253C5FD50FF163D3FEAD75
        23D4DD96FCDC96B5CCA2582B6B378DB63F68758E7D9B3D9F4FE83FE82ED12492
        53FFD9003842494D042100000000005500000001010000000F00410064006F00
        620065002000500068006F0074006F00730068006F0070000000130041006400
        6F00620065002000500068006F0074006F00730068006F007000200043005300
        3300000001003842494D04060000000000070008010100010100FFE10EF96874
        74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061
        636B657420626567696E3D22EFBBBF222069643D2257354D304D704365686948
        7A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E
        733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D224164
        6F626520584D5020436F726520342E312D633033362034362E3237363732302C
        204D6F6E2046656220313920323030372032323A31333A343320202020202020
        20223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F77
        77772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D
        6E7323223E203C7264663A4465736372697074696F6E207264663A61626F7574
        3D222220786D6C6E733A7861704D4D3D22687474703A2F2F6E732E61646F6265
        2E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A7861703D22687474
        703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
        3A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E7473
        2F312E312F2220786D6C6E733A70686F746F73686F703D22687474703A2F2F6E
        732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C6E
        733A746966663D22687474703A2F2F6E732E61646F62652E636F6D2F74696666
        2F312E302F2220786D6C6E733A657869663D22687474703A2F2F6E732E61646F
        62652E636F6D2F657869662F312E302F22207861704D4D3A446F63756D656E74
        49443D22757569643A3030434334453339443938444530313139324138414632
        39433536413737443622207861704D4D3A496E7374616E636549443D22757569
        643A303543433445333944393844453031313932413841463239433536413737
        443622207861703A437265617465446174653D22323031312D30362D30315431
        323A30303A30382D30333A303022207861703A4D6F64696679446174653D2232
        3031312D30362D30315431323A30323A34322D30333A303022207861703A4D65
        746164617461446174653D22323031312D30362D30315431323A30323A34322D
        30333A303022207861703A43726561746F72546F6F6C3D2241646F6265205068
        6F746F73686F7020435333204D6163696E746F7368222064633A666F726D6174
        3D22696D6167652F6A706567222070686F746F73686F703A436F6C6F724D6F64
        653D2233222070686F746F73686F703A49434350726F66696C653D2273524742
        2049454336313936362D322E31222070686F746F73686F703A486973746F7279
        3D222220746966663A4F7269656E746174696F6E3D22312220746966663A5852
        65736F6C7574696F6E3D223732303030302F31303030302220746966663A5952
        65736F6C7574696F6E3D223732303030302F31303030302220746966663A5265
        736F6C7574696F6E556E69743D22322220746966663A4E617469766544696765
        73743D223235362C3235372C3235382C3235392C3236322C3237342C3237372C
        3238342C3533302C3533312C3238322C3238332C3239362C3330312C3331382C
        3331392C3532392C3533322C3330362C3237302C3237312C3237322C3330352C
        3331352C33333433323B44433342353641463433414645383142334430453833
        453534323135374145432220657869663A506978656C5844696D656E73696F6E
        3D223233382220657869663A506978656C5944696D656E73696F6E3D22393222
        20657869663A436F6C6F7253706163653D22312220657869663A4E6174697665
        4469676573743D2233363836342C34303936302C34303936312C33373132312C
        33373132322C34303936322C34303936332C33373531302C34303936342C3336
        3836372C33363836382C33333433342C33333433372C33343835302C33343835
        322C33343835352C33343835362C33373337372C33373337382C33373337392C
        33373338302C33373338312C33373338322C33373338332C33373338342C3337
        3338352C33373338362C33373339362C34313438332C34313438342C34313438
        362C34313438372C34313438382C34313439322C34313439332C34313439352C
        34313732382C34313732392C34313733302C34313938352C34313938362C3431
        3938372C34313938382C34313938392C34313939302C34313939312C34313939
        322C34313939332C34313939342C34313939352C34313939362C34323031362C
        302C322C342C352C362C372C382C392C31302C31312C31322C31332C31342C31
        352C31362C31372C31382C32302C32322C32332C32342C32352C32362C32372C
        32382C33303B3637353042423231453833413635333445413532453634413531
        434433344138222F3E203C2F7264663A5244463E203C2F783A786D706D657461
        3E20202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        20203C3F787061636B657420656E643D2277223F3EFFE20C584943435F50524F
        46494C4500010100000C484C696E6F021000006D6E74725247422058595A2007
        CE00020009000600310000616373704D53465400000000494543207352474200
        00000000000000000000000000F6D6000100000000D32D485020200000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000011637072740000015000000033646573630000018400
        00006C77747074000001F000000014626B707400000204000000147258595A00
        000218000000146758595A0000022C000000146258595A000002400000001464
        6D6E640000025400000070646D6464000002C400000088767565640000034C00
        00008676696577000003D4000000246C756D69000003F8000000146D65617300
        00040C0000002474656368000004300000000C725452430000043C0000080C67
        5452430000043C0000080C625452430000043C0000080C746578740000000043
        6F70797269676874202863292031393938204865776C6574742D5061636B6172
        6420436F6D70616E790000646573630000000000000012735247422049454336
        313936362D322E31000000000000000000000012735247422049454336313936
        362D322E31000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000058595A200000000000
        00F35100010000000116CC58595A200000000000000000000000000000000058
        595A200000000000006FA2000038F50000039058595A20000000000000629900
        00B785000018DA58595A2000000000000024A000000F840000B6CF6465736300
        0000000000001649454320687474703A2F2F7777772E6965632E636800000000
        000000000000001649454320687474703A2F2F7777772E6965632E6368000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000064657363000000000000002E494543203631393636
        2D322E312044656661756C742052474220636F6C6F7572207370616365202D20
        7352474200000000000000000000002E4945432036313936362D322E31204465
        6661756C742052474220636F6C6F7572207370616365202D2073524742000000
        0000000000000000000000000000000000000064657363000000000000002C52
        65666572656E63652056696577696E6720436F6E646974696F6E20696E204945
        4336313936362D322E3100000000000000000000002C5265666572656E636520
        56696577696E6720436F6E646974696F6E20696E2049454336313936362D322E
        3100000000000000000000000000000000000000000000000000007669657700
        0000000013A4FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158
        595A2000000000004C09560050000000571FE76D656173000000000000000100
        0000000000000000000000000000000000028F00000002736967200000000043
        52542063757276000000000000040000000005000A000F00140019001E002300
        28002D00320037003B00400045004A004F00540059005E00630068006D007200
        77007C00810086008B00900095009A009F00A400A900AE00B200B700BC00C100
        C600CB00D000D500DB00E000E500EB00F000F600FB01010107010D0113011901
        1F0125012B01320138013E0145014C0152015901600167016E0175017C018301
        8B0192019A01A101A901B101B901C101C901D101D901E101E901F201FA020302
        0C0214021D0226022F02380241024B0254025D02670271027A0284028E029802
        A202AC02B602C102CB02D502E002EB02F50300030B03160321032D0338034303
        4F035A03660372037E038A039603A203AE03BA03C703D303E003EC03F9040604
        130420042D043B0448045504630471047E048C049A04A804B604C404D304E104
        F004FE050D051C052B053A05490558056705770586059605A605B505C505D505
        E505F6060606160627063706480659066A067B068C069D06AF06C006D106E306
        F507070719072B073D074F076107740786079907AC07BF07D207E507F8080B08
        1F08320846085A086E0882089608AA08BE08D208E708FB09100925093A094F09
        640979098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0A
        C50ADC0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C
        430C5C0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30D
        DE0DF80E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F
        960FB30FCF0FEC1009102610431061107E109B10B910D710F511131131114F11
        6D118C11AA11C911E81207122612451264128412A312C312E313031323134313
        63138313A413C513E5140614271449146A148B14AD14CE14F015121534155615
        78159B15BD15E0160316261649166C168F16B216D616FA171D17411765178917
        AE17D217F7181B18401865188A18AF18D518FA19201945196B199119B719DD1A
        041A2A1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C
        7B1CA31CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F
        131F3E1F691F941FBF1FEA20152041206C209820C420F0211C2148217521A121
        CE21FB22272255228222AF22DD230A23382366239423C223F0241F244D247C24
        AB24DA250925382568259725C725F726272657268726B726E827182749277A27
        AB27DC280D283F287128A228D429062938296B299D29D02A022A352A682A9B2A
        CF2B022B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E
        162E4C2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A31
        8231BA31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34D835
        13354D358735C235FD3637367236AE36E937243760379C37D738143850388C38
        C839053942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653C
        A43CE33D223D613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440
        A640E74129416A41AC41EE4230427242B542F7433A437D43C044034447448A44
        CE45124555459A45DE4622466746AB46F04735477B47C04805484B489148D749
        1D496349A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D
        934DDC4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51E652
        31527C52C75313535F53AA53F65442548F54DB5528557555C2560F565C56A956
        F75744579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B955B
        E55C355C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60
        FC614F61A261F56249629C62F06343639763EB6440649464E9653D659265E766
        3D669266E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6B
        A76BFF6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E071
        3A719571F0724B72A67301735D73B87414747074CC7528758575E1763E769B76
        F8775677B37811786E78CC792A798979E77A467AA57B047B637BC27C217C817C
        E17D417DA17E017E627EC27F237F847FE5804780A8810A816B81CD8230829282
        F4835783BA841D848084E3854785AB860E867286D7873B879F8804886988CE89
        33899989FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F
        9E9006906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95C996
        34969F970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899C
        F79D649DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3
        E6A456A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB
        02AB75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B2
        4BB2C2B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9
        C2BA3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC1
        67C1E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC9
        3AC9B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD1
        3CD1BED23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D9
        6CD9F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1
        CCE253E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA
        5BEAE5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF3
        19F3A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC
        07FC98FD29FDBAFE4BFEDCFF6DFFFFFFEE002141646F62650064400000000103
        001003020306000000000000000000000000FFDB008400010101010101010101
        0101010101010101010101010101010101010101010101010101010101010101
        0101020202020202020202020203030303030303030303010101010101010101
        0101020201020203030303030303030303030303030303030303030303030303
        030303030303030303030303030303030303030303030303FFC2001108005C00
        EE03011100021101031101FFC400B90001000203010003010000000000000000
        00090A07080B0601030504010100000000000000000000000000000000100002
        01040103020405050000000000000809070405060A00010339203010371A3A40
        50803102214118382A1100000700010105020807081300000000010203040506
        0708110012131409211510F031412216B6782030612376173871A1C1D194D497
        B8405081E1F1B32425B546375777A7B7D718880A120100000000000000000000
        000000000080FFDA000C03010102110311000000BFC000000000000000000000
        0060B22E4DF43714F90003504F2C6F380085C268C0053CCC1C09242CB20000AA
        0906445A17AB3DD1868D8F3CA92DA560CCB27E61B466FD902A60727448C62D68
        7B238231E04E8F45A4CDEA00005504A881EE0FB8B8C95B43470D8C2C3C41A9F8
        E6C5116064D2FB0517CBA5947C2DC05950E08C7803BFC111C731B3AF099D0005
        50416BE39619D070A129AAE5A70A7297822BC24BF90027ED170F2A2A622366CB
        20167E38231E00EFF04471CC7CEBC27E8997C034FCFB0DBB2268965213CCEA6F
        C90F44961AA666835D4DAE21A0DF53DB1A284B49B5470463C01DFE0035F8E782
        74BE3E400003C6153426C894B3E40000001F0704F31C9DF0C8E5399A91026EE1
        DAE800000792296859D0A951B527E79A645BC8A8E931047C99B4D202F3265338
        B011505E1C9943971824F8ED74000003E82398AA79AF64EA94AA2DFE6682BC25
        D2C8653C9983CB2F922C54C0E5C47F200093E3B5D000000FE6220093334D0C12
        4439B9E48399D0DA523E4DB623D896B3FB4F820E4AC4180402584BAD80000000
        000000000000000000000000000000000000003FFFDA0008010200010500FD34
        7FFFDA0008010300010500FD347FFFDA0008010100010500FC79124D0FE24C6D
        53B1E24EA4A81598384A6ED2F4FDBD2719C63F2F01FD7D3141919B425E82E9FA
        AE4084AAE9E824772807E149B3EB791679F5BC8B3C579B1AD95AD10FD3D5B927
        890D7C75F00399E81ED7C26CD75E066A52ECCA058552F02BB17824C54C737F6A
        9586174A6B6B6145D2CF338FE5B1604144C8CAF262350D870249CEA876D6B115
        C9B4A680B4BB55B8E296ED452B7765C5E6C9A6462AD602E56F81E2BBA72CABBE
        42E36E684281C23457CE1629490220DCCD5FE7B96C7721E0B2D609C95FE6974E
        767487167F8F179AED1A5658F3EADC93C482A7D8DC8454429588516D5B2F1F1B
        446018D5A5D09EA0D0389E55AEA46AB44034E8761B10B014FAD9768AC2AFC2AB
        70DB1CBCC768930D10B9FE3E69AE347D973A932C203CBF1B597C2F0FAFAD951C
        B63B7A3FF683A3464A0686C1B20FDC70D9F2B47F0F563D43290313E31EA639A6
        4796A5FE4AFF0034BE0F86679547B520266C08D745395C619EF1729C71F46E49
        E2434DBF121CDA6BCF2B7C1AB2C2F965EAFEE545A58354E74B7B73EE6EDB8188
        7D9CD55C1C672DD58E0C3B1E4378E0EBAE88D1F65CE92FFE82EC1FD3FE96DEB7
        633F5C9B2551ED388DAAAD1B20FDC6FB1C5C6C7DFD8CDFC939AFCE6A0C6A1BE1
        B792BFCD2F83E18625521148097AFB3602B65419A07C4C5C1DA629D23482287A
        7C4DE04C686230A84A0B0D0BC612E1689116F9BE47FF005E199AF4AA739A4803
        539AEF5B5572C4511BCE91A8A1AE8A9F0D2783003E80CED80F0C4D4BE30205C0
        F5D426AD78BC8C480B78AD2C8C802C466031C629A99A5CC6723275282EB308A6
        3FD47814CD69B11D5BD2C6291D066168EA01C17C95FE697A0982A0780EA2A911
        DA658DC9F374F6246CF71B8AA3E84D89EC34D3F0C5B3766F55BDCE9EDF5E4C74
        955412EF4E46D9F6372B476EC09099844573926CD4F1B2BB4CD8434F049E5E94
        FCB7FB19F6118CC9B82E0197B1FD5E3B918B341267C0882A1832671F0900EDC4
        AA8A56D04C9A4976241E2E4CA4958757AA82CC72D9095B8BC5794191EB36B400
        1EE86702AF85BC4DBCF1E8033518A43F0C2935F236B781D60D8C3B90A433FDDD
        F0C577121ABF4E204D9FE351361279CDE5669309DBAFC129F96FF62AAA29E8E9
        FA3725377EB1AD88BF022ECB14C422EB5D3C063423AA7183D6086B2A117050C8
        398F6BFAB35E24D0E1568620A5831B950DE753D89A37C82644BBAE6B4A0AE2E5
        7E962658C665620E1E1F45B22C50A3A7E9A8A55ABD79B46257CA580C3F5D435B
        6CADF4253F2DFEC55D252DC296EDAFF269BCDD618836191CE3E23941ACB2DB3D
        2E946C177558C21B8631C1C15B5EA0F49C837B39926054B20C8F625F41262F00
        E2D8B6398463042A7E59055C8D6B1A879B1C196A4209CECD98DBADD6FB45BF9D
        78C835EC5C8CAEE72C68FD2BD1577D1307DF5E7D1307DF3E8983EFA713EEA779
        40405D74FDBF3DFFDA0008010202063F00347FFFDA0008010302063F00347FFF
        DA0008010101063F00FECF77B0725B5DA462B99B3948F8352E17D9A42162969C
        96F1C6321580A9DE732730F88D563A4D5B26AAE74D150E04EE26731576CAF3E3
        3B3AADD6510399BD176A76818E89C53319076D33359A3A444E5FA2A24732672F
        B4A2203D7B3D5F8A3C9DC876F7916C129398AE542D6D06ED071AB1924D2919EA
        0CA0475DA098A8AAC54C16771E827E28F73AF7C04A1F1FDFFCBF8539C97E4BCE
        4F40E63033D5BACAEBD62B5236C9C79396B912C743B1610F1A1E22A2A2807514
        3A874D34D24CC226EBDD034E6FDC549FB44FD02B5A44E64F3C7B7D4656993319
        77AFD7AA76B7F1A78D942883A6E35EBBC6394DCB751640C0E7B826055355327C
        3F1FEE764B873BDDF34488D90BF503DEA9D7F2EB1D8AAF5FFD64A4C5ED702567
        D994A07E91326D9E39F288BAF0505803E92A0748BF0FC7FC3DB43C973DE3C6E3
        B940E776598A82DA8C2CDD1EA757B5CBD7E49DC5CAC853D8CA3C92957F553B96
        A22CDF3923355DA63DF06E44FB863FEC3DBFFF004899D7F37EDFB0F6FF00FD22
        675FCDFB1309C1B827BAC2C441449ECBAAEB962BD50D4A2E5158315CA31B2363
        51B249BA7B2562964019C646B4F11F3C57C450A406ED9D2E87E156BEF818DFD8
        7D7FF87B4C724392131BF31D0986FDA0E668219A6855AABD77EAE562B540958D
        3A9192B41B2BA19233AB339F155072053940800428944471897E226E578936CD
        AA753E4661977B3AB1C8DEA1114AE368AACCE79A40D65A5720AE51EE57A92A8C
        90271EC6366E1A505AACD400574FB63B84F21693C8C6F79D3B23C435C9BB2E7B
        47A2D9332CEE136B89692EC86CB2F37A8D62E2F13AD30702EDFF00BAA0E49406
        A000815771D5001E1BF1A6B3BF4ACF294DBB5C63F54B8D1EB351CDA719D24918
        E5CA510D9D5E1CE849964193C54E91A420E3D429D102193003F78B6AC49A2FB0
        725B46A44A3980B78E015CA8CAD0EB3658D79E5266BB277EBA5DE9B1B2729122
        4508B0C22330DD27498B75554952AA091320C7ED57BCAB7474CDEBF82C6B7DAE
        C253ADB736B14D567D30AD0A56B369BAD26D8E2318B651D28C10952CC7924947
        3E481041C1D10F4BBB0671CA1AAEF67DC89C7D42E963A2662C71C75797E72A35
        A72DE752D91CDED4AEDC9DB96A8C5391AE02AE4CF9B9CC92691C542EC9CA2D80
        670736C468F2979B4B6AC3165256693691E09A4D612B71F25250D1AF2C13D24E
        1064C9372F1A3633A7040556493EF285E61DE779C0B9D27E2B719342E3417438
        C46B39852F4AB15E34DBBCAC6D0099548573799BAD49AD5E750EA1E7D295928E
        2B78F7E91922AEAAC9813903CE0E20659CB7A9F0D73CE4449CA6934AD2D0A65B
        B7E96D6AD8E705C6857AFC793537F4B3433E4E72B09A2534F3349249270B2852
        29DEF110D0DBD7F968E6DAE6C92D5F2E206C8E948E98D19C7348B72DAE123281
        AC2993215397564CC8A1E159DC4B77D9B8151810A090AD11C74A634D830BDBAC
        EDDFA949A9EE55EA9C6C3686F63D07D22EA0A916DA5DD2E31AE6C0842B1339F2
        72848959C094E9B4072727B6BF75E5868CF21A52EC792473BCC2990AADB752D0
        D58606A69852B55945C336ADE2E24AF510732528EE3A29155649133905D64525
        0F1963C1F9A751835E408D585997A363536820C9570A9064EC31513B81E52393
        45B81145126049557BC6314807EE944F52AA736B0BE6FDC797F7C578D7E72E38
        E4E559BE17FE75771555CE8F66692DAED66D49271B1916D025C22A2541335277
        91059C994EB9F65DC8FACEFD73BD691493E8507098A51E9F6306B560B0495653
        7B2B2579D1F3887416712B0EE8A445270BAA04444C62940C9F7E3AB5A3667CAB
        C3E2E45E366DF5F6CF44A35C29B0C8AC7EE2CFAC28E7DA258EF28376FDE03748
        F849350C4037D10100035434FCC6D9037BCF2FF5D89B6D2EE557926F2F5EB356
        E719A4FE26662249A1D46EF193E66B14E43147E41E83D040403B695FA7F71FB4
        523DBE3F10EC8F8FCE0DFD5E9DCF1BC2CEF3A43C4E9D3C4F0FBEE1C78207E83D
        DEBDFEEF5F6F7BE782E3AF1A6AEB4742B657DF176BCCF9993ED0F56B9AA82683
        EBA5FE759B28F4E4A5974C80937411450631CD4846ED514512017F0EB5F7C0C6
        FEC3EBFDA438CD9AF19F2DD4E0AC1AB5DB4A88BADEA6EEF1AE8276C9034E8575
        0C56100A20CE51AC5295E6EA981259158C0E408225FA261AD6F5BAE3D62CBB2D
        76DAA749B46C4A67B66CDB0BC630CABCC49CABCAB652E6F4A493FBFDA8AEEC32
        4E9A46377B30FDC4CCB0AEF4ED5819470DAB996C6B351A53E330CE26D023D824
        B18AAB6AD32880AEB5689393018E0A23169948538F51EA1D47DBDB9B3C83E0CF
        1933EC4F68A871BADD9C547668867276AD920C76493AE664EA4DAEA1769B99BC
        26E99B9B0A2F0AA0488820A37031133140513F29B917CB1CAEB7BA865164A266
        79B673796CB4951625ECFC3CB58ED36E9BAE8AE48DB3CA2ED5362CD824F5359B
        33203953C23ACA22A218FDF783B14E31FAD4E50F2BE56E6B5F8C959175119AEA
        B58D1EDD0731115533B9573626D5B3CB678CE601B2AE7C044F2EB346A29B5453
        6E87173D447378A521D5DE73BC179230EE017F0051DB78F5310111211C93B493
        5082A46556BB4D7077444C82759E1CC290880994A3C6D1267CD46F3834FC3984
        0140E2D5F48E58CA257E422D3BE12473905991ED3601B38201CC1D64C81D0C5E
        A21A6E832B1FE4ADBCADE44671BCCA82E4E8FD1AD937FA16639FB6555039C878
        F7D56CFD2996A528F74A49A309801431C03D42BEF814AFEB17C1DEDC8ADF7947
        C70A36F3A2D377D366154574B2CA58EAB075226694FB12EDD0A1B991FA98FA49
        D4A5917399EBC60E5D24044C11512E86EF67F5BE315311CA339A1F25B841AAD7
        68B545CE843D664E77F54572B447D59BBB32E11B0B2B36BBB5C8C4C63B36FE6C
        E82442342A4826CB8ABA5CFCA239E486F7C45E2C4520D9F1BCD543229B82CD25
        6EE956D55101236907D2B79B0CC204127741FC80944C25FA7D9856D1F4EDE2E1
        E3A3593062DDC3CCDA32467954237C0F2EA485ADF99CDA255E29E5CBE3B874F1
        670EBA9BC73A9DF3F5C7FF00F497ED447F6A4EC1EABF59E34CFDD4D557D56CBD
        A6A99CAFAEEA53356632EAC93A8DA5D02BF036AB6BA816B60971F15F031247B2
        70EC7C7728954308D460BD3638F557C8792750D82B8E46D19EF1A1871F60EC19
        3255CB8C6DA23A706059424758FCE4BAF10ED0348311922288752AA994CE1357
        1A8E9F905A450A1EADBAD2EB62BA8B2AAB3AEA77E7D676F1E2AACA286322D24A
        D0E811287748920244CA500207C1A57E9FDC7ED148FC3CD8D7712BDD8B31D3EA
        99D5712ABDF2A2F862AD15B3D974DA354A59EC04BA602EA1A58F033CE9241EB6
        326ED9A8A02CDD4497226A12B3A37FE636E9BF5722E61ABAB5653C92D46EBB55
        1EEF040748B275E7437F99B04D567CF364C4A93D8674C5EB657F3843F4EF90F8
        4725294D1E4755379C8F3ED6E0A2A48E92B270CC2FD568CB2A50728A200540F2
        9083222D1C8A7F405744DDDF674FC1AD7DF031BFB0FB076B2FDF0364FB0F8FFC
        115FF0FF008AFF00E34DDB9A5C78A047A9317FBEE21635E8504801C5C58AF14A
        5D8E8150ACB4122ED80AF2CB63AA3662898E7F08AAB8299403260628F28F00E6
        E4B58B25A6EA761A8DD6B5A3B7A2DD2E29D62EB4C633B59B553AEB58A54258EE
        AD4D26D5764662AB68C581B3868E1375DC051331319A6709212D969A9BBABE67
        C55C55E4AC04AC3BEB9BC56E96FB7DB3507D587C62C8566B6CDE5E9D9D759E91
        9A88404191E3D4DAF7552A78FED35E68E2425785DAC539A3F947091145DBE51A
        A45B2CAAC065C5040A09387B7F6F4E31CC0244401338097A893BBE895C25CE1F
        3EB3697C7AC66430AB2D6CEC261A8135BB86A3178A65B5C3BE76D7C2B02CAE4D
        97555F20B3117483624F190EF8392B96E8D8B00A7FB6AB88C470D726AE9C5222
        275A1B3CD0F32A947395884FA20E1CB5892A8A0FB44CA184444447B7A857DF02
        95FD62F83BDB95DF7BF71FF4632EEC87CBFED03827F93FD53C93E7ED5AE6BDA6
        AD352B9DCAEBDC5CE5B5116668341FAF94BCE63F39AFE9B518C7AF0A11284F23
        3F9FCC460A47508BB56EE59BA38A40E11505848A9CC79464FDE3360E17AEBCE3
        7F29025E35CBC4D032F18FDD36C61C56C5E461D531173A0FD66A264CC292CA97
        BA63641F27CBC25F97F2DA180FB7E6ED369F2E0D6E578BF0F62E15B4934C89CB
        ACE49C5D1A265929AE2543463D54E4156A6B2485D4C42B1311434B9DD0104161
        11ED41C73D2F695C624B7E435EA24EB8B4E31C577D9CDC58E59015BB9B19C636
        BD8AC597542C33069695918F328C97947CF1DA8DC16724FA099C697F780DDBFD
        3917F0695FA7F71FB4523F0F36322C4A8962D3B4FB5E755C56AF43A8B1195B45
        90F5AD368D6D966501109883A9996240C0BA55064D8AA3B78A2608B74D55CE9A
        67AD67C1C3ADBF02AD494C376B6AD5B92799DC314A5D220C146A32960728E811
        35F9FB47926EE40C9318668F9E3B50048993A1163A786F1BA88BBC774FC2328A
        164D5D7F2404093948CA1D6636B684C4A785F9A1949808E174E449F405754E25
        F674ED9FBED2678B0BFAD2D7F35C2E82D0889DD3EB2E97AB5890AED52063DB10
        4A2A180C75DF3A38880378E64E571EA09741F8FC7AFC25E3EF2B693217CCC52B
        840DF5B44C5DB6D34B7ED2D55B424D9C549B799A8CB43C97E6994D3B44E91D43
        A2722E3DE27780862A7C7BE29515E50331FAD93F797317236BB4DCA4642D5652
        3042565DECD5BA5E664CEA28CA25A3722645088268B627748061398DF3FF0007
        681E56F2430F96BA6CF02C6991849D63A8E9D558A958FA148A9215B6B335BAC5
        B22A11D95B0AA28A872A29AABB7E84398DD0043D9F275FC81F97AF697D935EE3
        B1EB5AD595D0BDB6DFB1DB8D972F91B83E50FE22F296A82AFBE0A5CD4EBD5044
        CE65158B19474637559C1FA17A3FB071578FB0F58D0E5A3C62E5F5AB7CD4F689
        A83C8E5124D278C18DB2E3232CBD522E4812219DB2844E318BA394A6551398A0
        2176C7760A640E8798E8F5D91AA5DA95666457F09618095445178C5E20224513
        300081D1592326BB75C845513915210E585E4863F804C3CD369D327B0670E344
        D26EFA1C0E6933DE57C9CB54ABF6397731EB4C43F8A068F7D285927CC164D35D
        BAC9B921560B7719F931517776C86ECF2B7213B031D64B1549FA8FAA3628DB4C
        03A693D5592899966A32998944E209AC04548064D429886314748F4E1AFE3930
        9F1375AB47D76BDD0DEE9DA5BF9798B6A760A65A194E2375736A52D916E23673
        3C855D049ABB45B00B0281D239545C15B3E3FC43CF2433DA4DCEF0EB45B3B696
        B9DC2F3252D6C7509095C33F565AE73536F9B374616BCD114DB20649B1053328
        09F8AA2A73C6736371C4E6AD9C818D92CEE5BEB1B7D4F4E80847F219612312A5
        AF235281B5C7579C163DAC2B44554C102A6E53403C629C4CA099A655CBCC3EA9
        B2D4A2DE3892AE9E64F2B0D68A7CA3B49245DC952AF1579184B9545E3D49BA44
        7231EFDB95DA691535C144CA04EC84FBEC5354B9B46CE08E13AC5AF78D186B86
        3A6ED1749A6B92B9295D9A74DC0A88A229A8F4E551250C06031BBA60AC732B7B
        C6E7ADBBCD4CD9F1E3AC4CB55D36B90EE073093095A87BC2AD016A8F805CAD15
        2113540A8101C244005004C2631AB6B72DF146F71B752A3D689A66995AB15828
        9A456E21C3872F0F0A85A2AF20C159AAF91EBC5D74E365527F1C8B95D45D340A
        B1CCA0D9B3D5F8B72B6E56D8A313485FEDDAE6A121A2B04E3651BCAB242B33F1
        F688A695121556FE0AE68B68D157CD4E745D9D74CDDDED0BC71E2E529D50F288
        29AB0D8DA42BEB359ADEFD79CB4C81A4A6E49ECEDB256665DCACE9712940A2B0
        2492642913214A1D3E0D2BF4FEE3F68A47F06736CE4DEBB4BC6B34804D4F3363
        B8CB26C8D24F48DD774940D662112AF396EB43F49B9FCA4545B67922ECC512A2
        89C7B7A65C5D223A6A87C42C4399D9437C4A872C62379EB64BC95E21D9CBEBFA
        2B468BAED0B6A9E60D88DE3A3C145D1818DEF2291CCBB97EBB9F6FC7F8FF0011
        7AD42E6F0D1D4FCDE9B67BEDAE4089F8C7635AA7C23EB0CEBC2A5D4BE219AC5C
        72A702F50EF0874EA1F2F691E4C7A76E01C28E3870F27ED96784C5A7F9392F68
        9ED5B4387A5DA97AECBCE3C5602526E081319784771CE488C2346ED5D24F1BA0
        E9E1D023BEDB2477AA755F88114DE357A7FEA46C1C5E7D7251E5805C058FEBD9
        6DEC2CB2D26D528B620944FBB0E4463DDF88A3A0588B1052325F8BF8FC7AF6D4
        D8BE6CE193D67A3DE1A3C66ED151BBA68E9B59E51170D9CB758A9AC838415209
        4E4394A629804040043B7EEFC9FBBDA85A8D35F272750D269756BF5564913914
        4A42B771836361837C92898988A26EE3245250A60110103076E5CF2378F7702D
        0764CC69B5192A35C0F5EABDAC209FCBEA544ACBE7215EBA42D8AAD266521A6D
        CA40478C9C2651381C0BDE29441C42CA73BA79AB374539155AB787F18E9B2C52
        A88AA8185B4FD4315829D686022C610149CA6253814E0207294C556FFC85D9F5
        2DC2EAA955482D1AB5EECD7D9B6EDD553C5162C5FD9A4E4968F8D4CC0009B640
        536E914A529085294003D397EF81877DB88AFC4DD337BA46A5334DD06A763A3D
        B61D6318894AD6AD90EF206763553104A72A6FA2DFAA9184040400FECED2B975
        FF0026B173D3D1AC2E564B252354CD5B74D8B8B50F6BB12B2F2C85B5802211B0
        ED947F24ABA78D6481B5665A59D8B8653318E5CBA623A673D78FBA6426AF8D65
        39668DA65C9BB17A482B2D4D7CCA91237AB2D1EFD092A904A506D8CE323BAA88
        BF6E5016EAA4ED115DA2C8AEABAF509F50EF59CD9F8F1AAECD68BCCB71FF0002
        C0792949C7691C78AB562E5315AAF0C8D02C720FDD113732502A3866D188C449
        2F1846AEDDCA3A78E953A5EB294ED9B5189E51F26BD21E6ADD4ECF390724F19D
        8A3760AB5A0F77AB62577B44A347F246BA9595AA812322B395DEAAFA4220ED9B
        BB5CCEC8B395719E6BF223D693D471A6D1C9DCD596B09C764FAEBEABE5B424EE
        283993AED699529BBE49A19B5788E1307ACE28F04C41705906C937280283FF00
        D34562FDCBBE4DEBBB871053D5709AEEAF37B5DEE6EA1166CA2136FAD31BC62F
        EFD947F6DA25BE6A7615F3B7EF1094EF1D81A24A995259B1D55780176BE59EC1
        74B959B8A18B4BD96D96B9890B0D96C32CEA93146752B3B3B2AE1D49CBCA3C3F
        D359C3855459638898E6318447B7ACB6CF3FC8ADBE635EA4F38B4DACD2F5191D
        4EECEF40A756DE3CE1CA8E2BD53B7AB3679FAD419CF7195E8D192E8374FDE4E0
        0A52F8C7EF57BD5C77EE7873A796DAFBFE0F3FDA6F150D435D72FF001F3D4EC7
        92C46B6F2BAD2912ED6DF677D2D55651A5691EE979E59B78C4F30562438A6448
        3D4C39D3EA37CD4CAAC5BBDBB467FC71C7B8BBA423976618BD3A97799EA4C6AE
        85625632CA9ACC4F64ACBA06A8322C5483860D5076EA4DE39746589EB81E9EDA
        069139CA6E637A62502E964E27EBF62686B469FAAD66C143BBC8E78E6C51732F
        A5662F13906A42C24C356AF14967CE179D18C59D3B2A6D7BF5ADEEC7EB49EA3D
        2FCF4123C9AE40D169FCA58E8299CAE68F607E8B34D9E7D6AA5CB5F8F535A27C
        22B09A672E78659450C9A1E1191559A595E3EADFEFFAAA99867F53A19F4BD5A7
        42D1A5DF06AB08CA1BEB65F2C60D9A7BF6D93BE4FCC3E762990CBB850C710EA2
        23F07367277F1868C8591DBAD5AC508A44088B05B3BDADD9B55A7271674534DA
        AED61E26D858C50520EEA4ED8AC88814E99CA5F8FC7E4ED50E12FA8516D6D72E
        CD5B8C2E1BC87AAC0495D17A5D2C565DD37CFB52AA4395DDB242BD58F10E8C2C
        942B592768B3141828C4116E4725E60D0709E6961DA4E83A353B3E8EA5679076
        6512D0A79E9761CDA5976EDE8926C985B5B8B48B68B38702BB3481BA08A87544
        854CE21F07A72FDF030EFB7115F895DDBB5D16AD5AA2AB872E5C28445BB76E89
        0555975D654C54914514C826318C205280751ED22BB8F51CE083A883B6916921
        1D2FCA0C41BAEF5A9115137CD4D5E97B9212526D9D2026214856EA15D00F4201
        FAF41FFE93EADE9AB12685F4F8E447132C78765F1F011EFA9B95CDF23B49C7A5
        2A894951E366DAA0C622286DB277578C5241BA4DA2E1265907976ED55688856A
        23D41EBF8BE4BCE9C8EC1A3D1B9255EE4473036BE3558DECCD76EF685E22762E
        AB27BD665585E398D1C18B6912C5314FDDB22C9CA2ECA554A2AABEAFCD7D23AD
        3C5D4D9D9F8A7A4C56F76782E405A392940672F5DC8F5A0CD897592BBE8DAE32
        8F609A7619A18D068066CED758E7F09D1930276CF9DE91BEFAE2F09385D708C7
        AE2274BE38D6AC5A3719EC06793D291F74B052261E5BF0281CDA31F4C26E0AE1
        BC5B8B13D2BA132EA1DC194280FA81679E91B7FB3726D9E9382F2164742B4D8C
        B26F378BDEF2B64465DF572EF51735DAE4CC0DA46219B56D0D0A8C62282E92A9
        2AD8EF0EECEF5CF1022351E68F1DB20BA61F8356732D1734D3757A754F518A9F
        CCD98D664158DCE24E550B9D9D94E251A47D1CA45B17A0E9B392149D552A8993
        D6B66231C15D46CAF3C6F1251EE8A5390AE18BE1E093A6AB948A148A10AB20A9
        4C006294C1D7DA003ECED9A643522B735AB54F4BFA6671592BB5926CD4D61BC7
        14A36B10A0E5C2E74D141B8C949A7DF39CC5214BD444400047B665C5FE4E7247
        17E30F20788960D7F31D5335E4268555C56CCD8896B375B5C448C5C3E8B2F02E
        A5936515674232408DBC570D665938456492319329BD767D5E0F616F45E174CD
        933CCDE89B65EDC96A145B35732A817417ABB99DD85B305A3E318C154A06507C
        D8B555BB7B02292A90AFDF223AE7A8F70C79F7C6BE30F3FB27ABDA35ECCEF3C3
        DE4C66B1B6FDA75889877D3711459FC92897024D2F7CD26556166B4CC4348D9D
        49D3EF3D2CA3D6683840FC36E40F2219795D8F51C620AC37279EEC4A1BEB39CA
        EE423A0EFDEEB6C83564CBF58F5A62CA7FB8D5245987BCBFC9D3221E1943E3FC
        61DAB5CB9E3254D7B272BF8E7597D073D478540AACF6DF8726F1E4FA95B85404
        E0792BDE712CF9F494233483C7936F20FD9A6570ECEC11ECF236499BA8F918F7
        4E18C8307CDD568F58BD68A9D074CDE355C89AED9D365D331144CE50390E5103
        0008087E0FA72FDF030EFB7115F8972C5F366EF58BD6EB3478CDDA29B868F1AB
        94CC8B86AE9BAC53A4BB75D1398A721CA253947A0874EBD909977E9F38422F1B
        BC7AFD34A299DA20624577FDEF1C8BC0C1D963A0DCB34C0DF996EAB63B76DECF
        0884E81D21B28C132BA06359AC078C789A2E695384A6D65A3873DD3BD7E11300
        CD8B55E524562788EDDA853B976B08A8B1CE730985DEA7C83E16E1FA069326E5
        A3C9CBD8D717AADB2CEED88A40D5CDBE7A94FEB7256F7044904D113CA28ECC76
        A995037544A5207323845C12C7B26E344DEFD9D2FEEA0A440B0A731B76815777
        1963A832BF595A367331231B36F20938870F1E1DD999307CB890825EA4360BC2
        BE42FA197A8FCCEC9C75C829180C1BEC372496D132DD5DB641518CA735B1C4DB
        E1E15FC638712B0916D9D491A18D6169E6D754E45453310A1EA03CA9E4D6110F
        C5297E7BF26CDB4E7FC608F5E2CD2191D09A2F72958C6534C60D06AC211DBB56
        F8768568AB664FC02345772D1A9972A0493D66E5C02E324F5EE72654B04E49BA
        CD21928E9C9B5943AEEE4E6EAED0A854E5DE4939399576772C94178B1CCA2DE2
        1CC630E99C56ACF17B1BADF1CF64B24DDBF4CC62BF4D8E85CFEDD66B03985772
        53321011A46CD11780AD6A341A8A1E10314E39AA6D8114DB2252572954F848DA
        D54A9F030F57ABD7219A24C21E02B9011EDE261212298A05220CA362E35A2482
        091000A9A4429400003B39D777DE15E21A069D20F10909BBC2B5E715DB05A5FB
        74146C9BCB93EA8BFAF9EE8E0ADD40209A581E09889A603D4124808BF18E130F
        CAA1F8E8E6AB2D48738745512B51F9638A8CE95D04E57D7A3B48F46BAB47CCA8
        F9751D90C80F98596514504CA1CC61657A63E9EFC7C34E47F87E5DAC8C0CB4C5
        4C4C93EF7890EE6812F34FA86F54071EC132D1AA08A3F9911147E876631312C5
        9C64545B36D1D1B1B1CD91651F1D1EC9123764C58B36C44DBB466D1B2654D249
        3294842140A5000000F865B41D0F3C94C737E96F11677BDE14EA3AA16FB0BD14
        CE0571A0C03C8D94A3E84A28A787E33C908E19A322902493F449D43B3C5B0CE7
        BE7B648C508E558F8FD6719B2525FB43FB7C9B179314FB868083F28FB0147446
        2D843E506E3F276FDAB787FF00CA768F9BD9FEEB7B7ED5DC3FFE53B47FDADEDF
        B56F0FFDBF3F99DA3D9FF2B7A75ED9E72E7963C83CF75192C4A49C59F2BCBF21
        84B30C03CBE0B170CA0ADD73B6DC584048794A7A8ECEF59C6B38D032F269B659
        478545051ABBFEF74FDEF9BFB7DFFFD9}
      Stretch = True
    end
    object QRShape19: TQRShape
      Left = 8
      Top = 776
      Width = 721
      Height = 189
      Frame.Color = clWhite
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        500.062500000000000000
        21.166666666666670000
        2053.166666666667000000
        1907.645833333333000000)
      Pen.Color = clWhite
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object bFormatoViejo: TQRStringsBand
    Left = 38
    Top = 1026
    Width = 740
    Height = 1000
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = bFormatoViejoBeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2645.833333333333000000
      1957.916666666667000000)
    Master = Owner
    Items.Strings = (
      '1')
    PrintBefore = False
    object QRShape25: TQRShape
      Left = 21
      Top = 311
      Width = 703
      Height = 160
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        423.333333333333300000
        55.562500000000000000
        822.854166666666600000
        1860.020833333333000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel1: TQRLabel
      Left = 32
      Top = 176
      Width = 93
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        465.666666666666700000
        246.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Raz'#243'n Social'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel2: TQRLabel
      Left = 32
      Top = 198
      Width = 38
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        523.875000000000000000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cuit: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel4: TQRLabel
      Left = 190
      Top = 96
      Width = 360
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        502.708333333333400000
        254.000000000000000000
        952.500000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'COTIZACION RIESGOS DEL TRABAJO - LEY 24557'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel5: TQRLabel
      Left = 59
      Top = 344
      Width = 200
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        156.104166666666700000
        910.166666666666600000
        529.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Suma Fija por Trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel6: TQRLabel
      Left = 59
      Top = 368
      Width = 243
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        156.104166666666700000
        973.666666666666900000
        642.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '(%) Porc Variable Sobre Masa Salarial'
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
    object QRLabel10: TQRLabel
      Left = 32
      Top = 397
      Width = 691
      Height = 65
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        171.979166666667000000
        84.666666666666700000
        1050.395833333330000000
        1828.270833333330000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '       Estas al'#237'cuotas incluyen los $0,60 correspondientes al Fo' +
        'ndo Fiduciario para enfermedades profesionales (Decreto N'#186'1278/0' +
        '0) y la tasa fijada por la Superintendencia de Riesgos del Traba' +
        'jo (Res. Conjunta SRT-SSN N'#186'39/98) del 3% sobre la prima total.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRImage1: TQRImage
      Left = 242
      Top = 10
      Width = 256
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        640.291666666666800000
        26.458333333333330000
        677.333333333333400000)
    end
    object QRLabel11: TQRLabel
      Left = 32
      Top = 120
      Width = 59
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        317.500000000000000000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FECHA: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel15: TQRLabel
      Left = 32
      Top = 148
      Width = 379
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        391.583333333333400000
        1002.770833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'INFORMACION SUMINISTRADA PARA EL CALCULO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel16: TQRLabel
      Left = 32
      Top = 220
      Width = 127
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        582.083333333333400000
        336.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cod. De Actividad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel17: TQRLabel
      Left = 24
      Top = 318
      Width = 175
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        63.500000000000000000
        841.375000000000000000
        463.020833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'VALOR DE ALICUOTAS:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel19: TQRLabel
      Left = 32
      Top = 242
      Width = 191
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        640.291666666666800000
        505.354166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Descripci'#243'n Actividad Real'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel20: TQRLabel
      Left = 32
      Top = 264
      Width = 202
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        698.500000000000000000
        534.458333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cantidad Total de Trabajadores'
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
    object QRLabel63: TQRLabel
      Left = 32
      Top = 286
      Width = 213
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        756.708333333333400000
        563.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Masa Salarial sujeta a Aportes'
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
    object QRDBText1: TQRDBText
      Left = 96
      Top = 120
      Width = 195
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        254.000000000000000000
        317.500000000000000000
        515.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'sr_fechanotificacioncomercial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText2: TQRDBText
      Left = 256
      Top = 176
      Width = 472
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        465.666666666666700000
        1248.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'hm_nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText3: TQRDBText
      Left = 256
      Top = 198
      Width = 472
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        523.875000000000000000
        1248.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'sr_cuit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      OnPrint = QRDBText3Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText4: TQRDBText
      Left = 256
      Top = 220
      Width = 472
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        582.083333333333400000
        1248.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'ciiu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText5: TQRDBText
      Left = 256
      Top = 242
      Width = 472
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        640.291666666666800000
        1248.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'sr_actividadreal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText6: TQRDBText
      Left = 256
      Top = 264
      Width = 472
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        698.500000000000000000
        1248.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'cantidadtrab'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText7: TQRDBText
      Left = 256
      Top = 286
      Width = 472
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        677.333333333333400000
        756.708333333333400000
        1248.833333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'masasalarial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText8: TQRDBText
      Left = 312
      Top = 368
      Width = 216
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        825.500000000000000000
        973.666666666666900000
        571.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'sr_porcentajevariablecotizado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText9: TQRDBText
      Left = 312
      Top = 344
      Width = 144
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        825.500000000000000000
        910.166666666666600000
        381.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'sr_costofijocotizado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRMemo1: TQRMemo
      Left = 32
      Top = 600
      Width = 689
      Height = 105
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        277.812500000000000000
        84.666666666666700000
        1587.500000000000000000
        1822.979166666670000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Lines.Strings = (
        
          '       Asimismo, si con posterioridad al inicio de vigencia de l' +
          'a cotizaci'#243'n existiera un cambio legislativo por el cual la resp' +
          'onsabilidad del asegurador se viera aumentada o extendida, las p' +
          'artes acuerdan entablar inmediatas negociaciones, con el objeto ' +
          'de adecuar los t'#233'rminos de la cotizaci'#243'n a la nueva situaci'#243'n pa' +
          'ra neutralizar los perjuicios que '#233'sta irrogue. Si no llegara a ' +
          'un acuerdo entre las partes en el t'#233'rmino de 30 d'#237'as de convocad' +
          'a la reuni'#243'n, la aseguradora est'#225' facultada a la rescisi'#243'n de la' +
          ' cotizaci'#243'n original (quedar'#225' sin efecto la mencionada cotizaci'#243 +
          'n).'
        ' ')
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel64: TQRLabel
      Left = 8
      Top = 934
      Width = 740
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        21.166666666666670000
        2471.208333333333000000
        1957.916666666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Provincia ART S.A.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel65: TQRLabel
      Left = 8
      Top = 951
      Width = 740
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        21.166666666666670000
        2516.187500000000000000
        1957.916666666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Carlos Pellegrini 91 piso 5 (C1009 ABA) Buenos Aires'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object memoFinal: TQRMemo
      Left = 32
      Top = 710
      Width = 689
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        127.000000000000000000
        84.666666666666680000
        1878.541666666667000000
        1822.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      Lines.Strings = (
        
          '       La presente tiene car'#225'cter informativo y no tendr'#225' valide' +
          'z %s.')
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel66: TQRLabel
      Left = 32
      Top = 494
      Width = 645
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        47.625000000000000000
        84.666666666666680000
        1307.041666666667000000
        1706.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'En funci'#243'n a las al'#237'cuotas y los datos informados resultan las s' +
        'iguientes primas estimadas a pagar:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRShape26: TQRShape
      Left = 21
      Top = 518
      Width = 703
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        55.562500000000000000
        1370.541666666670000000
        1860.020833333330000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel67: TQRLabel
      Left = 32
      Top = 522
      Width = 108
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        1381.125000000000000000
        285.750000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Cuota Anual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel68: TQRLabel
      Left = 32
      Top = 544
      Width = 129
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        1439.333333333333000000
        341.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Cuota Mensual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel69: TQRLabel
      Left = 32
      Top = 566
      Width = 169
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        84.666666666666680000
        1497.541666666667000000
        447.145833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '($) Cuota por trabajador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText10: TQRDBText
      Left = 240
      Top = 522
      Width = 78
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        635.000000000000000000
        1381.125000000000000000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'cuotaanual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText11: TQRDBText
      Left = 240
      Top = 544
      Width = 99
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        635.000000000000000000
        1439.333333333333000000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'cuotamensual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRDBText12: TQRDBText
      Left = 240
      Top = 566
      Width = 76
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333330000
        635.000000000000000000
        1497.541666666667000000
        201.083333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = Query
      DataField = 'cuotaxtrab'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  object Query: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    AfterOpen = QueryAfterOpen
    SQL.Strings = (
      
        'SELECT ac_codigo, DECODE(NVL(sr_canttrabajadores, 0), 0, hc_tote' +
        'mpleadosmayorcero, sr_canttrabajadores) cantidadtrab,'
      '       ac_codigo || '#39' - '#39' || ac_descripcion ciiu,'
      
        '       ((sr_costofijocotizado * 12 * DECODE(NVL(sr_canttrabajado' +
        'res, 0), 0, hc_totempleadosmayorcero, sr_canttrabajadores))'
      '        + (sr_porcentajevariablecotizado / 100 * 13)'
      
        '          * DECODE(NVL(sr_masasalarial, 0), 0, hc_masatotalmayor' +
        'cero, sr_masasalarial)) cuotaanual,'
      '        0 cuotainicialrc,'
      
        '       DECODE(NVL(sr_canttrabajadores, 0), 0, hc_totempleadosmay' +
        'orcero, sr_canttrabajadores)'
      '       * sr_costofinalcotizado cuotamensual,'
      '       sr_costofinalcotizado cuotaxtrab, hm_nombre,'
      
        '       DECODE(NVL(sr_masasalarial, 0), 0, hc_masatotalmayorcero,' +
        ' sr_masasalarial) masasalarial, sr_actividadreal,'
      
        '       sr_costofijocotizado, sr_cuit, sr_fechanotificacioncomerc' +
        'ial, sr_idmotivocotizacion, sr_idmotivosolicitud,'
      
        '       sr_porcentajevariablecotizado, NULL valor_rc, NULL sumaas' +
        'egurada_rc'
      
        '  FROM asr_solicitudreafiliacion asr, cac_actividad, ahc_histori' +
        'cocontrato, ahm_historicoempresa'
      ' WHERE ac_id = NVL(sr_idactividad1, hc_idactividad)'
      '   AND hc_id = sr_idhistoricocontrato'
      '   AND hm_id = sr_idhistoricoempresa'
      '   AND sr_id = :id')
    Left = 18
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
