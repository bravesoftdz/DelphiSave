object qrAnalisis: TqrAnalisis
  Left = 0
  Top = 0
  Width = 816
  Height = 1344
  Frame.DrawTop = True
  Frame.DrawBottom = True
  Frame.DrawLeft = True
  Frame.DrawRight = True
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
  Page.PaperSize = Legal
  Page.Continuous = False
  Page.Values = (
    100.000000000000000000
    3556.000000000000000000
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
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  PrevInitialZoom = qrZoomToFit
  PreviewDefaultSaveType = stQRP
  PreviewLeft = 0
  PreviewTop = 0
  object PageHeaderBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 1139
    AlignToBottom = False
    Color = clWhite
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
      3013.604166666667000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageHeader
    object QRLabelEx31: TQRLabelEx
      Left = 9
      Top = 1042
      Width = 359
      Height = 38
      Enabled = False
      Size.Values = (
        100.541666666667000000
        23.812500000000000000
        2756.958333333330000000
        949.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'TARIFAS GEN'#201'RICAS DEL MERCADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 343
      Top = 1062
      Width = 24
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        907.520833333333400000
        2809.875000000000000000
        63.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CNA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 296
      Top = 1044
      Width = 71
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        783.166666666666800000
        2762.250000000000000000
        187.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CONSOLIDAR'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrComp4: TQRLabelEx
      Left = 615
      Top = 1042
      Width = 114
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        1627.187500000000000000
        2756.958333333330000000
        301.625000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp3: TQRLabelEx
      Left = 508
      Top = 1042
      Width = 107
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        1344.083333333330000000
        2756.958333333330000000
        283.104166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp2: TQRLabelEx
      Left = 438
      Top = 1042
      Width = 70
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        1158.875000000000000000
        2756.958333333330000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp1: TQRLabelEx
      Left = 368
      Top = 1042
      Width = 70
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        973.666666666667000000
        2756.958333333330000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp8: TQRLabelEx
      Left = 615
      Top = 1061
      Width = 114
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        1627.187500000000000000
        2807.229166666670000000
        301.625000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp8'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp7: TQRLabelEx
      Left = 508
      Top = 1061
      Width = 107
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        1344.083333333330000000
        2807.229166666670000000
        283.104166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp6: TQRLabelEx
      Left = 438
      Top = 1061
      Width = 70
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        1158.875000000000000000
        2807.229166666670000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrComp5: TQRLabelEx
      Left = 368
      Top = 1061
      Width = 70
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        973.666666666667000000
        2807.229166666670000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComp5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel36: TQRLabelEx
      Left = 24
      Top = 485
      Width = 357
      Height = 251
      Size.Values = (
        664.104166666667000000
        63.500000000000000000
        1283.229166666670000000
        944.562500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Detalle Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlTop
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx5: TQRLabelEx
      Left = 36
      Top = 670
      Width = 29
      Height = 19
      Enabled = False
      Size.Values = (
        50.270833333333300000
        95.250000000000000000
        1772.708333333330000000
        76.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Autosize = True
      Caption = 'Total'
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
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 5
      Top = 145
      Width = 131
      Height = 18
      Size.Values = (
        47.625000000000000000
        13.229166666666670000
        383.645833333333400000
        346.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Datos de la empresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 16
      Top = 168
      Width = 125
      Height = 16
      Size.Values = (
        42.333333333333340000
        42.333333333333340000
        444.500000000000000000
        330.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de Trabajadores'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 16
      Top = 184
      Width = 81
      Height = 15
      Size.Values = (
        39.687500000000000000
        42.333333333333340000
        486.833333333333400000
        214.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Salario Promedio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 16
      Top = 200
      Width = 92
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        529.166666666666700000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Per'#237'odos Cubiertos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 5
      Top = 216
      Width = 89
      Height = 18
      Size.Values = (
        47.625000000000000000
        13.229166666666670000
        571.500000000000000000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestralidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 16
      Top = 237
      Width = 109
      Height = 15
      Size.Values = (
        39.687500000000000000
        42.333333333333340000
        627.062500000000000000
        288.395833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de Siniestros'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 16
      Top = 269
      Width = 153
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        711.729166666666800000
        404.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de Siniestros con baja'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 16
      Top = 285
      Width = 100
      Height = 16
      Size.Values = (
        42.333333333333340000
        42.333333333333340000
        754.062500000000000000
        264.583333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de Muertes'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 16
      Top = 333
      Width = 92
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        881.062500000000000000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestros in itinere'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 16
      Top = 381
      Width = 156
      Height = 16
      Size.Values = (
        42.333333333333340000
        42.333333333333340000
        1008.062500000000000000
        412.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de IPP menores al 50%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 384
      Top = 237
      Width = 162
      Height = 17
      Size.Values = (
        44.979166666666670000
        1016.000000000000000000
        627.062500000000000000
        428.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de IPP entre 50% y 66%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 384
      Top = 253
      Width = 169
      Height = 15
      Size.Values = (
        39.687500000000000000
        1016.000000000000000000
        669.395833333333400000
        447.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de Incapacidades Totales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 384
      Top = 317
      Width = 143
      Height = 16
      Size.Values = (
        42.333333333333340000
        1016.000000000000000000
        838.729166666666800000
        378.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de d'#237'as de baja ART'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 384
      Top = 285
      Width = 154
      Height = 17
      Size.Values = (
        44.979166666666670000
        1016.000000000000000000
        754.062500000000000000
        407.458333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de d'#237'as de baja totales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel31: TQRLabel
      Left = 384
      Top = 168
      Width = 24
      Height = 16
      Size.Values = (
        42.333333333333340000
        1016.000000000000000000
        444.500000000000000000
        63.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nivel'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel32: TQRLabel
      Left = 384
      Top = 184
      Width = 108
      Height = 15
      Size.Values = (
        39.687500000000000000
        1016.000000000000000000
        486.833333333333400000
        285.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Masa Salarial Mensual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel33: TQRLabel
      Left = 384
      Top = 333
      Width = 120
      Height = 15
      Size.Values = (
        39.687500000000000000
        1016.000000000000000000
        881.062500000000000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tasa de incidencia anual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel34: TQRLabel
      Left = 16
      Top = 301
      Width = 143
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        796.395833333333400000
        378.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de muertes in itinere'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel35: TQRLabel
      Left = 376
      Top = 381
      Width = 174
      Height = 16
      Size.Values = (
        42.333333333333340000
        994.833333333333400000
        1008.062500000000000000
        460.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Costo M'#233'dico (m'#243'dulo) por siniestro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini1: TQRLabelEx
      Left = 274
      Top = 237
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        627.062500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 260
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          687.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini1'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 260
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          687.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini1'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 259
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          685.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 259
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          685.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini2: TQRLabelEx
      Left = 274
      Top = 269
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        711.729166666667000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 276
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          730.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini2'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 276
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          730.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini2'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 275
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          727.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 275
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          727.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini3: TQRLabelEx
      Left = 274
      Top = 285
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        754.062500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 292
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          772.583333333333000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini3'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 292
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          772.583333333333000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini3'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 291
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          769.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 291
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          769.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini4: TQRLabelEx
      Left = 274
      Top = 333
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        881.062500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 308
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          814.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini4'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 308
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          814.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini4'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 307
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          812.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 307
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          812.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini6: TQRLabelEx
      Left = 274
      Top = 381
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        1008.062500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 340
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          899.583333333333000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini6'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 340
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          899.583333333333000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini6'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 339
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          896.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 339
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          896.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini7: TQRLabelEx
      Left = 618
      Top = 237
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        627.062500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 356
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          941.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini7'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 356
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          941.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini7'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 355
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          939.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 355
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          939.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini8: TQRLabelEx
      Left = 618
      Top = 253
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        669.395833333333000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini8'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 372
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          984.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini8'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 372
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          984.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini8'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 371
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          981.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 371
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          981.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini9: TQRLabelEx
      Left = 618
      Top = 317
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        838.729166666667000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini9'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 388
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1026.583333333330000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini9'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 388
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1026.583333333330000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini9'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 387
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1023.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 387
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1023.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrSini10: TQRLabelEx
      Left = 618
      Top = 285
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        754.062500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini10'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 404
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1068.916666666670000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini10'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 404
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1068.916666666670000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini10'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 403
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1066.270833333330000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 403
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1066.270833333330000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRLabel37: TQRLabelEx
      Left = 506
      Top = 485
      Width = 219
      Height = 24
      Size.Values = (
        63.500000000000000000
        1338.791666666670000000
        1283.229166666670000000
        579.437500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Tarifarios'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel38: TQRLabelEx
      Left = 506
      Top = 509
      Width = 110
      Height = 25
      Size.Values = (
        66.145833333333300000
        1338.791666666670000000
        1346.729166666670000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Aprobado en SSN'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel39: TQRLabelEx
      Left = 615
      Top = 509
      Width = 110
      Height = 25
      Size.Values = (
        66.145833333333300000
        1627.187500000000000000
        1346.729166666670000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Comercial (10 tbj)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel43: TQRLabelEx
      Left = 390
      Top = 618
      Width = 335
      Height = 24
      Size.Values = (
        63.500000000000000000
        1031.875000000000000000
        1635.125000000000000000
        886.354166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Informaci'#243'n de Mercado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel441: TQRLabelEx
      Left = 500
      Top = 641
      Width = 115
      Height = 20
      Size.Values = (
        52.916666666666700000
        1322.916666666670000000
        1695.979166666670000000
        304.270833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Prima como % salario'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrDatos4: TQRLabelEx
      Left = 618
      Top = 168
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        444.500000000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDatos4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrDatos5: TQRLabelEx
      Left = 618
      Top = 184
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        486.833333333333000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDatos5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrSini11: TQRLabelEx
      Left = 618
      Top = 333
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        881.062500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini11'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrSini12: TQRLabelEx
      Left = 274
      Top = 301
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        796.395833333333000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini12'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrSini13: TQRLabelEx
      Left = 618
      Top = 381
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        1008.062500000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini13'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel1: TQRLabelEx
      Left = 50
      Top = 2
      Width = 641
      Height = 33
      Size.Values = (
        87.312500000000000000
        132.291666666667000000
        5.291666666666670000
        1695.979166666670000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'COTIZACION Y ANALISIS DE SINIESTRALIDAD'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlTop
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 20
    end
    object qrDatos1: TQRLabelEx
      Left = 274
      Top = 168
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        444.500000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDatos1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Style = bsClear
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrDatos2: TQRLabelEx
      Left = 274
      Top = 184
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        486.833333333333000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDatos2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrDatos3: TQRLabelEx
      Left = 274
      Top = 200
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        529.166666666667000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDatos3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel40: TQRLabelEx
      Left = 390
      Top = 534
      Width = 120
      Height = 24
      Size.Values = (
        63.500000000000000000
        1031.875000000000000000
        1412.875000000000000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Suma Fija'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel41: TQRLabelEx
      Left = 390
      Top = 558
      Width = 120
      Height = 24
      Size.Values = (
        63.500000000000000000
        1031.875000000000000000
        1476.375000000000000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Porcentaje Variable'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel42: TQRLabelEx
      Left = 390
      Top = 582
      Width = 120
      Height = 24
      Size.Values = (
        63.500000000000000000
        1031.875000000000000000
        1539.875000000000000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Costo por Persona'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrTari1: TQRLabelEx
      Left = 506
      Top = 534
      Width = 110
      Height = 24
      Size.Values = (
        63.500000000000000000
        1338.791666666670000000
        1412.875000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrTari1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrTari3: TQRLabelEx
      Left = 506
      Top = 558
      Width = 110
      Height = 24
      Size.Values = (
        63.500000000000000000
        1338.791666666670000000
        1476.375000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrTari3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrTari5: TQRLabelEx
      Left = 506
      Top = 582
      Width = 110
      Height = 24
      Size.Values = (
        63.500000000000000000
        1338.791666666670000000
        1539.875000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrTari5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrTari2: TQRLabelEx
      Left = 615
      Top = 534
      Width = 110
      Height = 24
      Size.Values = (
        63.500000000000000000
        1627.187500000000000000
        1412.875000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrTari2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrTari4: TQRLabelEx
      Left = 615
      Top = 558
      Width = 110
      Height = 24
      Size.Values = (
        63.500000000000000000
        1627.187500000000000000
        1476.375000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrTari4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrTari6: TQRLabelEx
      Left = 615
      Top = 582
      Width = 110
      Height = 24
      Size.Values = (
        63.500000000000000000
        1627.187500000000000000
        1539.875000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrTari6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel60: TQRLabel
      Left = 36
      Top = 524
      Width = 92
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1386.416666666667000000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Costo M'#233'dico Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel61: TQRLabel
      Left = 36
      Top = 542
      Width = 105
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1434.041666666667000000
        277.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Indemnizaci'#243'n por ILT'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel62: TQRLabel
      Left = 36
      Top = 560
      Width = 139
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1481.666666666667000000
        367.770833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Indemnizaci'#243'n por ILP < 50%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel63: TQRLabel
      Left = 36
      Top = 578
      Width = 164
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1529.291666666667000000
        433.916666666666800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Indemnizaci'#243'n por ILP 50% y 66%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel64: TQRLabel
      Left = 36
      Top = 596
      Width = 139
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1576.916666666667000000
        367.770833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Indemnizaci'#243'n por ILP > 66%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel65: TQRLabel
      Left = 36
      Top = 614
      Width = 132
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1624.541666666667000000
        349.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Indemnizaci'#243'n por mortales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel66: TQRLabel
      Left = 36
      Top = 632
      Width = 107
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1672.166666666667000000
        283.104166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Reservas IBNR-IBNER'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel67: TQRLabel
      Left = 36
      Top = 650
      Width = 146
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        1719.791666666667000000
        386.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Gastos Administrativos (40%)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel68: TQRLabel
      Left = 240
      Top = 506
      Width = 24
      Height = 17
      Size.Values = (
        44.979166666666670000
        635.000000000000000000
        1338.791666666667000000
        63.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel69: TQRLabel
      Left = 311
      Top = 506
      Width = 60
      Height = 17
      Size.Values = (
        44.979166666666670000
        822.854166666666600000
        1338.791666666667000000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Por Persona'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle9: TQRLabel
      Left = 301
      Top = 525
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1389.062500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle9'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle1: TQRLabel
      Left = 213
      Top = 525
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1389.062500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle10: TQRLabel
      Left = 301
      Top = 543
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1436.687500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle10'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle2: TQRLabel
      Left = 213
      Top = 543
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1436.687500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle11: TQRLabel
      Left = 301
      Top = 561
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1484.312500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle11'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle3: TQRLabel
      Left = 213
      Top = 561
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1484.312500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle12: TQRLabel
      Left = 301
      Top = 579
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1531.937500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle12'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle4: TQRLabel
      Left = 213
      Top = 579
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1531.937500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle13: TQRLabel
      Left = 301
      Top = 597
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1579.562500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle13'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle5: TQRLabel
      Left = 213
      Top = 597
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1579.562500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle14: TQRLabel
      Left = 301
      Top = 615
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1627.187500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle14'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle6: TQRLabel
      Left = 213
      Top = 615
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1627.187500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle15: TQRLabel
      Left = 301
      Top = 633
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1674.812500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle15'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle7: TQRLabel
      Left = 213
      Top = 633
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1674.812500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle16: TQRLabel
      Left = 301
      Top = 651
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        796.395833333333000000
        1722.437500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle16'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle8: TQRLabel
      Left = 213
      Top = 651
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        563.562500000000000000
        1722.437500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrDetalle8'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrDetalle17: TQRLabelEx
      Left = 213
      Top = 670
      Width = 75
      Height = 19
      Size.Values = (
        50.270833333333300000
        563.562500000000000000
        1772.708333333330000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDetalle17'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrDetalle18: TQRLabelEx
      Left = 301
      Top = 670
      Width = 75
      Height = 19
      Size.Values = (
        50.270833333333300000
        796.395833333333000000
        1772.708333333330000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDetalle18'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel86: TQRLabel
      Left = 36
      Top = 694
      Width = 127
      Height = 19
      Size.Values = (
        50.270833333333330000
        95.250000000000000000
        1836.208333333333000000
        336.020833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Estimaci'#243'n de la tarifa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrDetalle19: TQRLabelEx
      Left = 301
      Top = 694
      Width = 75
      Height = 19
      Size.Values = (
        50.270833333333300000
        796.395833333333000000
        1836.208333333330000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDetalle19'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clSilver
      Pen.Width = 3
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx12: TQRLabelEx
      Left = 24
      Top = 741
      Width = 357
      Height = 18
      Size.Values = (
        47.625000000000000000
        63.500000000000000000
        1960.562500000000000000
        944.562500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Situaci'#243'n Financiera'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel87: TQRLabel
      Left = 36
      Top = 765
      Width = 77
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        2024.062500000000000000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Status Fidelitas:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel88: TQRLabel
      Left = 36
      Top = 791
      Width = 67
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        2092.854166666667000000
        177.270833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Status BCRA:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object lbEstadoFidelitas: TQRLabel
      Left = 120
      Top = 765
      Width = 81
      Height = 17
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        2024.062500000000000000
        214.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lbEstadoFidelitas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object lbStatusBCRA: TQRLabel
      Left = 120
      Top = 791
      Width = 69
      Height = 17
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        2092.854166666667000000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lbStatusBCRA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel44: TQRLabelEx
      Left = 390
      Top = 641
      Width = 111
      Height = 20
      Size.Values = (
        52.916666666666700000
        1031.875000000000000000
        1695.979166666670000000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Prima X c'#225'pita'
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx16: TQRLabelEx
      Left = 7
      Top = 838
      Width = 727
      Height = 22
      Size.Values = (
        58.208333333333300000
        18.520833333333300000
        2217.208333333330000000
        1923.520833333330000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'COSTO DE CARTERA (final)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx17: TQRLabelEx
      Left = 7
      Top = 860
      Width = 240
      Height = 19
      Size.Values = (
        50.270833333333300000
        18.520833333333300000
        2275.416666666670000000
        635.000000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Raz'#243'n Social'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx18: TQRLabelEx
      Left = 494
      Top = 860
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2275.416666666670000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Trabajadores'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx19: TQRLabelEx
      Left = 248
      Top = 860
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        656.166666666667000000
        2275.416666666670000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx20: TQRLabelEx
      Left = 314
      Top = 860
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        830.791666666667000000
        2275.416666666670000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx21: TQRLabelEx
      Left = 380
      Top = 860
      Width = 113
      Height = 19
      Size.Values = (
        50.270833333333300000
        1005.416666666670000000
        2275.416666666670000000
        298.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Salario Promedio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx22: TQRLabelEx
      Left = 614
      Top = 860
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2275.416666666670000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Costo por persona'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart1: TQRLabelEx
      Left = 7
      Top = 879
      Width = 240
      Height = 19
      Size.Values = (
        50.270833333333300000
        18.520833333333300000
        2325.687500000000000000
        635.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrCart1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart2: TQRLabelEx
      Left = 248
      Top = 879
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        656.166666666667000000
        2325.687500000000000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart3: TQRLabelEx
      Left = 314
      Top = 879
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        830.791666666667000000
        2325.687500000000000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart4: TQRLabelEx
      Left = 380
      Top = 879
      Width = 113
      Height = 19
      Size.Values = (
        50.270833333333300000
        1005.416666666670000000
        2325.687500000000000000
        298.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart5: TQRLabelEx
      Left = 494
      Top = 879
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2325.687500000000000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart6: TQRLabelEx
      Left = 614
      Top = 879
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2325.687500000000000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx29: TQRLabelEx
      Left = 494
      Top = 955
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2526.770833333330000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Costo Lineal'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart25: TQRLabelEx
      Left = 614
      Top = 955
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2526.770833333330000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart25'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 16
      Top = 48
      Width = 102
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        127.000000000000000000
        269.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'RAZ'#211'N SOCIAL:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 16
      Top = 64
      Width = 35
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        169.333333333333300000
        92.604166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CUIT:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 16
      Top = 80
      Width = 31
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        211.666666666666700000
        82.020833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CIIU:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrEnc1: TQRLabel
      Left = 140
      Top = 48
      Width = 478
      Height = 17
      Size.Values = (
        44.979166666666700000
        370.416666666667000000
        127.000000000000000000
        1264.708333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrEnc1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrEnc2: TQRLabel
      Left = 140
      Top = 64
      Width = 478
      Height = 17
      Size.Values = (
        44.979166666666700000
        370.416666666667000000
        169.333333333333000000
        1264.708333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrEnc2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrEnc3: TQRLabel
      Left = 140
      Top = 80
      Width = 478
      Height = 17
      Size.Values = (
        44.979166666666700000
        370.416666666667000000
        211.666666666667000000
        1264.708333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrEnc3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel101: TQRLabel
      Left = 14
      Top = 1048
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        37.041666666666700000
        2772.833333333330000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Observaciones:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrObs1: TQRMemo
      Left = 95
      Top = 1047
      Width = 632
      Height = 44
      Size.Values = (
        116.416666666667000000
        251.354166666667000000
        2770.187500000000000000
        1672.166666666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '1'
        '2'
        '3')
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrCart7: TQRLabelEx
      Left = 7
      Top = 898
      Width = 240
      Height = 19
      Size.Values = (
        50.270833333333300000
        18.520833333333300000
        2375.958333333330000000
        635.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrCart7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart8: TQRLabelEx
      Left = 248
      Top = 898
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        656.166666666667000000
        2375.958333333330000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart8'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart9: TQRLabelEx
      Left = 314
      Top = 898
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        830.791666666667000000
        2375.958333333330000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart9'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart10: TQRLabelEx
      Left = 380
      Top = 898
      Width = 113
      Height = 19
      Size.Values = (
        50.270833333333300000
        1005.416666666670000000
        2375.958333333330000000
        298.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart10'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart11: TQRLabelEx
      Left = 494
      Top = 898
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2375.958333333330000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart11'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart12: TQRLabelEx
      Left = 614
      Top = 898
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2375.958333333330000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart12'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart13: TQRLabelEx
      Left = 7
      Top = 917
      Width = 240
      Height = 19
      Size.Values = (
        50.270833333333300000
        18.520833333333300000
        2426.229166666670000000
        635.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrCart13'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart14: TQRLabelEx
      Left = 248
      Top = 917
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        656.166666666667000000
        2426.229166666670000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart14'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart15: TQRLabelEx
      Left = 314
      Top = 917
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        830.791666666667000000
        2426.229166666670000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart15'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart16: TQRLabelEx
      Left = 380
      Top = 917
      Width = 113
      Height = 19
      Size.Values = (
        50.270833333333300000
        1005.416666666670000000
        2426.229166666670000000
        298.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart16'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart17: TQRLabelEx
      Left = 494
      Top = 917
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2426.229166666670000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart17'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart18: TQRLabelEx
      Left = 614
      Top = 917
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2426.229166666670000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart18'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart19: TQRLabelEx
      Left = 7
      Top = 936
      Width = 240
      Height = 19
      Size.Values = (
        50.270833333333300000
        18.520833333333300000
        2476.500000000000000000
        635.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrCart19'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart20: TQRLabelEx
      Left = 248
      Top = 936
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        656.166666666667000000
        2476.500000000000000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart20'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart21: TQRLabelEx
      Left = 314
      Top = 936
      Width = 65
      Height = 19
      Size.Values = (
        50.270833333333300000
        830.791666666667000000
        2476.500000000000000000
        171.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart21'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart22: TQRLabelEx
      Left = 380
      Top = 936
      Width = 113
      Height = 19
      Size.Values = (
        50.270833333333300000
        1005.416666666670000000
        2476.500000000000000000
        298.979166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart22'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart23: TQRLabelEx
      Left = 494
      Top = 936
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2476.500000000000000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart23'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart24: TQRLabelEx
      Left = 614
      Top = 936
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2476.500000000000000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart24'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx2: TQRLabelEx
      Left = 137
      Top = 1003
      Width = 231
      Height = 19
      Size.Values = (
        50.270833333333300000
        362.479166666667000000
        2653.770833333330000000
        611.187500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'ART ACTUAL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx3: TQRLabelEx
      Left = 368
      Top = 1003
      Width = 70
      Height = 19
      Size.Values = (
        50.270833333333300000
        973.666666666667000000
        2653.770833333330000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '$'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx4: TQRLabelEx
      Left = 438
      Top = 1003
      Width = 70
      Height = 19
      Size.Values = (
        50.270833333333300000
        1158.875000000000000000
        2653.770833333330000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx6: TQRLabelEx
      Left = 508
      Top = 1003
      Width = 107
      Height = 19
      Size.Values = (
        50.270833333333300000
        1344.083333333330000000
        2653.770833333330000000
        283.104166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Salario Promedio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx7: TQRLabelEx
      Left = 615
      Top = 1003
      Width = 114
      Height = 19
      Size.Values = (
        50.270833333333300000
        1627.187500000000000000
        2653.770833333330000000
        301.625000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Costo por persona'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrActual1: TQRLabelEx
      Left = 137
      Top = 1022
      Width = 231
      Height = 19
      Size.Values = (
        50.270833333333300000
        362.479166666667000000
        2704.041666666670000000
        611.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrActual1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrActual2: TQRLabelEx
      Left = 368
      Top = 1022
      Width = 70
      Height = 19
      Size.Values = (
        50.270833333333300000
        973.666666666667000000
        2704.041666666670000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrActual2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrActual3: TQRLabelEx
      Left = 438
      Top = 1022
      Width = 70
      Height = 19
      Size.Values = (
        50.270833333333300000
        1158.875000000000000000
        2704.041666666670000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrActual3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrActual4: TQRLabelEx
      Left = 508
      Top = 1022
      Width = 107
      Height = 19
      Size.Values = (
        50.270833333333300000
        1344.083333333330000000
        2704.041666666670000000
        283.104166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrActual4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrActual5: TQRLabelEx
      Left = 615
      Top = 1022
      Width = 114
      Height = 19
      Size.Values = (
        50.270833333333300000
        1627.187500000000000000
        2704.041666666670000000
        301.625000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrActual5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx1: TQRLabelEx
      Left = 582
      Top = 720
      Width = 149
      Height = 20
      Size.Values = (
        52.916666666666700000
        1539.875000000000000000
        1905.000000000000000000
        394.229166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Estado Actual'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel45: TQRLabel
      Left = 583
      Top = 742
      Width = 80
      Height = 17
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        1963.208333333330000000
        211.666666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'No Regularizada'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel46: TQRLabel
      Left = 583
      Top = 778
      Width = 116
      Height = 17
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        2058.458333333330000000
        306.916666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Regular. pago de deuda'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel47: TQRLabel
      Left = 583
      Top = 760
      Width = 116
      Height = 17
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        2010.833333333330000000
        306.916666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Regular. de Oficio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabelEx8: TQRLabelEx
      Left = 626
      Top = 41
      Width = 110
      Height = 25
      Size.Values = (
        66.145833333333300000
        1656.291666666670000000
        108.479166666667000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Cotizaci'#243'n Nro.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrNroCotizacion: TQRLabelEx
      Left = 626
      Top = 66
      Width = 110
      Height = 25
      Size.Values = (
        66.145833333333300000
        1656.291666666670000000
        174.625000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrNroCotizacion'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx9: TQRLabelEx
      Left = 494
      Top = 974
      Width = 119
      Height = 19
      Size.Values = (
        50.270833333333300000
        1307.041666666670000000
        2577.041666666670000000
        314.854166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Costo Ponderado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrCart26: TQRLabelEx
      Left = 614
      Top = 974
      Width = 120
      Height = 19
      Size.Values = (
        50.270833333333300000
        1624.541666666670000000
        2577.041666666670000000
        317.500000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrCart26'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx10: TQRLabelEx
      Left = 462
      Top = 690
      Width = 103
      Height = 25
      Size.Values = (
        66.145833333333300000
        1222.375000000000000000
        1825.625000000000000000
        272.520833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Comisi'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrComi1: TQRLabelEx
      Left = 565
      Top = 690
      Width = 86
      Height = 25
      Size.Values = (
        66.145833333333300000
        1494.895833333330000000
        1825.625000000000000000
        227.541666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrComi1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrResc1: TQRLabelEx
      Left = 706
      Top = 744
      Width = 25
      Height = 17
      Size.Values = (
        44.979166666666700000
        1867.958333333330000000
        1968.500000000000000000
        66.145833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrResc2: TQRLabelEx
      Left = 706
      Top = 762
      Width = 25
      Height = 17
      Size.Values = (
        44.979166666666700000
        1867.958333333330000000
        2016.125000000000000000
        66.145833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrResc3: TQRLabelEx
      Left = 706
      Top = 780
      Width = 25
      Height = 17
      Size.Values = (
        44.979166666666700000
        1867.958333333330000000
        2063.750000000000000000
        66.145833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel49: TQRLabel
      Left = 16
      Top = 112
      Width = 49
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        296.333333333333400000
        129.645833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CANAL:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrEnc5: TQRLabel
      Left = 140
      Top = 112
      Width = 262
      Height = 17
      Size.Values = (
        44.979166666666700000
        370.416666666667000000
        296.333333333333000000
        693.208333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrEnc5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel50: TQRLabel
      Left = 583
      Top = 796
      Width = 116
      Height = 17
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        2106.083333333330000000
        306.916666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Afiliaci'#243'n Vigente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrResc4: TQRLabelEx
      Left = 706
      Top = 798
      Width = 25
      Height = 17
      Size.Values = (
        44.979166666666700000
        1867.958333333330000000
        2111.375000000000000000
        66.145833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabel52: TQRLabel
      Left = 16
      Top = 96
      Width = 113
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        254.000000000000000000
        298.979166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ACTIVIDAD REAL:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrEnc4: TQRLabel
      Left = 140
      Top = 96
      Width = 478
      Height = 17
      Size.Values = (
        44.979166666666700000
        370.416666666667000000
        254.000000000000000000
        1264.708333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrEnc4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabelEx11: TQRLabelEx
      Left = 6
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        15.875000000000000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '1996'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx14: TQRLabelEx
      Left = 298
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        788.458333333333000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '2000'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx15: TQRLabelEx
      Left = 79
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        209.020833333333000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '1997'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx23: TQRLabelEx
      Left = 152
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        402.166666666667000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '1998'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx24: TQRLabelEx
      Left = 225
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        595.312500000000000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '1999'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx25: TQRLabelEx
      Left = 371
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        981.604166666667000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '2001'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol1: TQRLabelEx
      Left = 6
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        15.875000000000000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol2: TQRLabelEx
      Left = 79
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        209.020833333333000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol3: TQRLabelEx
      Left = 152
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        402.166666666667000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol4: TQRLabelEx
      Left = 225
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        595.312500000000000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol5: TQRLabelEx
      Left = 298
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        788.458333333333000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol6: TQRLabelEx
      Left = 371
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        981.604166666667000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol9: TQRLabelEx
      Left = 6
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        15.875000000000000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol9'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol10: TQRLabelEx
      Left = 79
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        209.020833333333000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol10'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol11: TQRLabelEx
      Left = 152
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        402.166666666667000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol11'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol12: TQRLabelEx
      Left = 225
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        595.312500000000000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol12'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol13: TQRLabelEx
      Left = 298
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        788.458333333333000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol13'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol14: TQRLabelEx
      Left = 371
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        981.604166666667000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol14'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel48: TQRLabel
      Left = 36
      Top = 714
      Width = 250
      Height = 19
      Size.Values = (
        50.270833333333330000
        95.250000000000000000
        1889.125000000000000000
        661.458333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Estimaci'#243'n de la tarifa (gtos. Adm=$2.8xTbj)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrDetalle20: TQRLabelEx
      Left = 301
      Top = 714
      Width = 75
      Height = 19
      Size.Values = (
        50.270833333333300000
        796.395833333333000000
        1889.125000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrDetalle20'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clSilver
      Pen.Width = 3
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 5
      Top = 398
      Width = 583
      Height = 18
      Size.Values = (
        47.625000000000000000
        13.229166666666670000
        1053.041666666667000000
        1542.520833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 
        'Evoluci'#243'n anual de incidencia y Costo Siniestral (seg'#250'n c'#225'lculo ' +
        'estimado en ILP y Mortales)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabelEx26: TQRLabelEx
      Left = 444
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1174.750000000000000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '2002'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol7: TQRLabelEx
      Left = 444
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1174.750000000000000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol15: TQRLabelEx
      Left = 444
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1174.750000000000000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol15'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx51: TQRLabelEx
      Left = 517
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1367.895833333330000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '2003'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol8: TQRLabelEx
      Left = 517
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1367.895833333330000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol8'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol16: TQRLabelEx
      Left = 517
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1367.895833333330000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol16'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx55: TQRLabelEx
      Left = 590
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1561.041666666670000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '2004'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol17: TQRLabelEx
      Left = 590
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1561.041666666670000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol17'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol18: TQRLabelEx
      Left = 590
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1561.041666666670000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol18'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 583
      Top = 814
      Width = 116
      Height = 17
      Size.Values = (
        44.979166666666700000
        1542.520833333330000000
        2153.708333333330000000
        306.916666666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Nueva al R'#233'gimen'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrResc5: TQRLabelEx
      Left = 706
      Top = 816
      Width = 25
      Height = 17
      Size.Values = (
        44.979166666666700000
        1867.958333333330000000
        2159.000000000000000000
        66.145833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx27: TQRLabelEx
      Left = 9
      Top = 1003
      Width = 128
      Height = 19
      Size.Values = (
        50.270833333333300000
        23.812500000000000000
        2653.770833333330000000
        338.666666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'PRECIO COMPETENCIA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 16
      Top = 128
      Width = 61
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        338.666666666666700000
        161.395833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ENTIDAD:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrEnc6: TQRLabel
      Left = 140
      Top = 128
      Width = 262
      Height = 17
      Size.Values = (
        44.979166666666700000
        370.416666666667000000
        338.666666666667000000
        693.208333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrEnc6'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabelEx28: TQRLabelEx
      Left = 9
      Top = 1022
      Width = 128
      Height = 19
      Size.Values = (
        50.270833333333300000
        23.812500000000000000
        2704.041666666670000000
        338.666666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'SEGUN SOLICITUD'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabelEx30: TQRLabelEx
      Left = 427
      Top = 720
      Width = 143
      Height = 20
      Size.Values = (
        52.916666666666700000
        1129.770833333330000000
        1905.000000000000000000
        378.354166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Ultima ART'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrNombreART: TQRLabel
      Left = 427
      Top = 742
      Width = 142
      Height = 17
      Size.Values = (
        44.979166666666700000
        1129.770833333330000000
        1963.208333333330000000
        375.708333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Provincia ART...'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabelEx32: TQRLabelEx
      Left = 663
      Top = 421
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1754.187500000000000000
        1113.895833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '2005'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol19: TQRLabelEx
      Left = 663
      Top = 439
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1754.187500000000000000
        1161.520833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol19'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object qrEvol20: TQRLabelEx
      Left = 663
      Top = 457
      Width = 73
      Height = 19
      Size.Values = (
        50.270833333333300000
        1754.187500000000000000
        1209.145833333330000000
        193.145833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrEvol20'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object lbCiiuExcluido: TQRLabel
      Left = 50
      Top = 82
      Width = 41
      Height = 13
      Size.Values = (
        34.395833333333340000
        132.291666666666700000
        216.958333333333400000
        108.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '(excluido)'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabelEx34: TQRLabelEx
      Left = 614
      Top = 641
      Width = 111
      Height = 20
      Size.Values = (
        52.916666666666700000
        1624.541666666670000000
        1695.979166666670000000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Salario promedio'
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
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object lbPrimaXCapita: TQRLabelEx
      Left = 390
      Top = 660
      Width = 111
      Height = 20
      Size.Values = (
        52.916666666666700000
        1031.875000000000000000
        1746.250000000000000000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Por persona'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object lbPrimaSalario: TQRLabelEx
      Left = 500
      Top = 660
      Width = 115
      Height = 20
      Size.Values = (
        52.916666666666700000
        1322.916666666670000000
        1746.250000000000000000
        304.270833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrTari7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object lbSalarioPromedio: TQRLabelEx
      Left = 614
      Top = 660
      Width = 111
      Height = 20
      Size.Values = (
        52.916666666666700000
        1624.541666666670000000
        1746.250000000000000000
        293.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrTari7'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 14
      Top = 1094
      Width = 75
      Height = 33
      Size.Values = (
        87.312500000000000000
        37.041666666666700000
        2894.541666666670000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Observaciones '#193'rea Comercial:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrObsComercial: TQRMemo
      Left = 95
      Top = 1093
      Width = 632
      Height = 44
      Size.Values = (
        116.416666666667000000
        251.354166666667000000
        2891.895833333330000000
        1672.166666666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '1'
        '2'
        '3')
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel26: TQRLabel
      Left = 16
      Top = 253
      Width = 149
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        669.395833333333400000
        394.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad de Siniestros sin baja'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini14: TQRLabelEx
      Left = 274
      Top = 253
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        669.395833333333000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini14'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 276
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          730.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini2'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 276
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          730.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini2'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 275
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          727.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 275
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          727.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRLabel27: TQRLabel
      Left = 16
      Top = 317
      Width = 214
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        838.729166666666800000
        566.208333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acc. de trabajo, enf. prof. y reagravaciones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini15: TQRLabelEx
      Left = 274
      Top = 317
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        838.729166666667000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini15'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 308
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          814.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini4'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 308
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          814.916666666667000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini4'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 307
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          812.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 307
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          812.270833333333000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRLabel28: TQRLabel
      Left = 16
      Top = 349
      Width = 154
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        923.395833333333400000
        407.458333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestros sin especificar el tipo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini16: TQRLabelEx
      Left = 274
      Top = 349
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        923.395833333333000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini16'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 324
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          857.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini5'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 324
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          857.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini5'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 323
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          854.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 323
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          854.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRLabel29: TQRLabel
      Left = 16
      Top = 365
      Width = 131
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        965.729166666666800000
        346.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestros con incapacidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini17: TQRLabelEx
      Left = 274
      Top = 365
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666700000
        724.958333333333000000
        965.729166666667000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini17'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 324
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          857.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini5'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 324
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          857.250000000000000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini5'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 323
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          854.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 323
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          854.604166666667000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRLabel30: TQRLabel
      Left = 384
      Top = 269
      Width = 127
      Height = 16
      Size.Values = (
        42.333333333333340000
        1016.000000000000000000
        711.729166666666800000
        336.020833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Sin especificar porcentaje'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini18: TQRLabelEx
      Left = 618
      Top = 269
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        711.729166666667000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini18'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 388
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1026.583333333330000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini9'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 388
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1026.583333333330000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini9'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 387
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1023.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 387
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1023.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRLabel51: TQRLabel
      Left = 384
      Top = 301
      Width = 110
      Height = 16
      Size.Values = (
        42.333333333333340000
        1016.000000000000000000
        796.395833333333400000
        291.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'A cargo del empleador'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrSini19: TQRLabelEx
      Left = 618
      Top = 301
      Width = 90
      Height = 17
      Size.Values = (
        44.979166666666700000
        1635.125000000000000000
        796.395833333333000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrSini19'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      Layout = tlCenter
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 8
      object TQRLabel
        Left = 233
        Top = 388
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1026.583333333330000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini9'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRLabel
        Left = 233
        Top = 388
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          1026.583333333330000000
          216.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrSini9'
        Color = clRed
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object TQRShape
        Left = 232
        Top = 387
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1023.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Brush.Color = clRed
        Pen.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object TQRShape
        Left = 232
        Top = 387
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666700000
          613.833333333333000000
          1023.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object DetailBand1: TQRBand
    Left = 38
    Top = 1177
    Width = 740
    Height = 114
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      301.625000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRLabelEx66: TQRLabelEx
      Left = 360
      Top = 42
      Width = 376
      Height = 43
      Size.Values = (
        113.770833333333000000
        952.500000000000000000
        111.125000000000000000
        994.833333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlTop
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx33: TQRLabelEx
      Left = 3
      Top = 23
      Width = 89
      Height = 19
      Size.Values = (
        50.270833333333300000
        7.937500000000000000
        60.854166666666700000
        235.479166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Suma Fija'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrCobrar1: TQRLabelEx
      Left = 92
      Top = 23
      Width = 70
      Height = 19
      Size.Values = (
        50.270833333333300000
        243.416666666667000000
        60.854166666666700000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrCobrar1'
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
      Layout = tlTop
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrCobrar2: TQRLabelEx
      Left = 92
      Top = 42
      Width = 70
      Height = 19
      Size.Values = (
        50.270833333333300000
        243.416666666667000000
        111.125000000000000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrCobrar2'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx45: TQRLabelEx
      Left = 3
      Top = 42
      Width = 89
      Height = 19
      Size.Values = (
        50.270833333333300000
        7.937500000000000000
        111.125000000000000000
        235.479166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Porc. Variable'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx46: TQRLabelEx
      Left = 3
      Top = 61
      Width = 89
      Height = 26
      Size.Values = (
        68.791666666666700000
        7.937500000000000000
        161.395833333333000000
        235.479166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Por Persona'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx57: TQRLabelEx
      Left = 3
      Top = 4
      Width = 159
      Height = 19
      Size.Values = (
        50.270833333333300000
        7.937500000000000000
        10.583333333333300000
        420.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'TARIFA A COBRAR'
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
      Layout = tlTop
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrCobrar3: TQRLabelEx
      Left = 92
      Top = 61
      Width = 70
      Height = 26
      Size.Values = (
        68.791666666666700000
        243.416666666667000000
        161.395833333333000000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'qrCobrar3'
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
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx59: TQRLabelEx
      Left = 360
      Top = 4
      Width = 376
      Height = 19
      Size.Values = (
        50.270833333333300000
        952.500000000000000000
        10.583333333333300000
        994.833333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'AUTORIZO'
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
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx60: TQRLabelEx
      Left = 174
      Top = 4
      Width = 183
      Height = 19
      Size.Values = (
        50.270833333333300000
        460.375000000000000000
        10.583333333333300000
        484.187500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'CONFECCIONO'
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
      Layout = tlCenter
      Brush.Color = clBtnFace
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx61: TQRLabelEx
      Left = 174
      Top = 23
      Width = 89
      Height = 19
      Size.Values = (
        50.270833333333300000
        460.375000000000000000
        60.854166666666700000
        235.479166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Fecha'
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
      Layout = tlTop
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx62: TQRLabelEx
      Left = 263
      Top = 23
      Width = 94
      Height = 19
      Size.Values = (
        50.270833333333300000
        695.854166666667000000
        60.854166666666700000
        248.708333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Firma'
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
      Layout = tlTop
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrFecha1: TQRLabelEx
      Left = 174
      Top = 42
      Width = 89
      Height = 19
      Size.Values = (
        50.270833333333300000
        460.375000000000000000
        111.125000000000000000
        235.479166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrFecha1'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object QRLabelEx64: TQRLabelEx
      Left = 263
      Top = 42
      Width = 94
      Height = 43
      Size.Values = (
        113.770833333333000000
        695.854166666667000000
        111.125000000000000000
        248.708333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
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
      Layout = tlTop
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object lbAutorizoArea: TQRLabelEx
      Left = 360
      Top = 23
      Width = 376
      Height = 19
      Size.Values = (
        50.270833333333300000
        952.500000000000000000
        60.854166666666700000
        994.833333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'T'#233'cnica'
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
      Layout = tlTop
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrFirma1: TQRTansparentImage
      Left = 264
      Top = 25
      Width = 91
      Height = 58
      Size.Values = (
        153.458333333333000000
        698.500000000000000000
        66.145833333333300000
        240.770833333333000000)
      XLColumn = 0
      Picture.Data = {07544269746D617000000000}
      Transparent = True
    end
    object qrUsu1: TQRLabelEx
      Left = 263
      Top = 85
      Width = 94
      Height = 19
      Size.Values = (
        50.270833333333300000
        695.854166666667000000
        224.895833333333000000
        248.708333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrUsu1'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrUsu2: TQRLabelEx
      Left = 360
      Top = 85
      Width = 376
      Height = 19
      Size.Values = (
        50.270833333333300000
        952.500000000000000000
        224.895833333333000000
        994.833333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'qrUsu2'
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
      Layout = tlCenter
      Brush.Color = clWindow
      Shape = qrsRectangle
      VertAdjust = 0
      Espacio = 0
      FontSize = 10
    end
    object qrFirma2: TQRTansparentImage
      Left = 363
      Top = 25
      Width = 370
      Height = 58
      Size.Values = (
        153.458333333333000000
        960.437500000000000000
        66.145833333333300000
        978.958333333333000000)
      XLColumn = 0
      Picture.Data = {07544269746D617000000000}
      Transparent = True
    end
  end
  object sdqCS: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ROUND(SUM(cs_cantidadtrabajador * cs_periodocubierto)'
      
        '             / DECODE(SUM(cs_periodocubierto), 0, 9999999999999,' +
        ' SUM(cs_periodocubierto))) AS cs_promediotrabajadores,'
      
        '       SUM(cs_periodocubierto) AS cs_periodocubierto, SUM(cs_can' +
        'tsiniestro) AS cs_cantsiniestro,'
      
        '       SUM(cs_cantsiniestroconbaja) AS cs_cantsiniestroconbaja, ' +
        'SUM(cs_cantmuerte) AS cs_cantmuerte,'
      
        '       SUM(cs_cantsiniestroleve) AS cs_cantsiniestroleve, SUM(cs' +
        '_cantsiniestrograve) AS cs_cantsiniestrograve,'
      
        '       SUM(cs_cantipp50) AS cs_cantipp50, SUM(cs_cantipp5066) AS' +
        ' cs_cantipp5066,'
      
        '       SUM(cs_cantincapacidadtotal) AS cs_cantincapacidadtotal, ' +
        'SUM(cs_cantdiasbajaart) AS cs_cantdiasbajaart,'
      
        '       SUM(cs_cantmuerteinitinere) AS cs_cantmuerteinitinere, SU' +
        'M(cs_cantdiasilt) AS cs_cantdiasilt,'
      
        '       SUM(cs_salariocubierto) / COUNT(*) AS cs_salariocubierto,' +
        ' SUM(cs_cantsiniestrosinbaja) AS cs_cantsiniestrosinbaja,'
      
        '       SUM(cs_cantsiniestroinitinere) AS cs_cantsiniestroinitine' +
        're, SUM(cs_cantsiniestrosintipo) AS cs_cantsiniestrosintipo,'
      
        '       SUM(cs_cantsiniestroconincapacidad) AS cs_cantsiniestroco' +
        'nincapacidad,'
      
        '       SUM(cs_cantsiniestrosinporcentaje) AS cs_cantsiniestrosin' +
        'porcentaje, SUM(cs_diasiltempleador) AS cs_diasiltempleador,'
      '       SUM(cs_cantaccidentetrabajo) AS cs_cantaccidentetrabajo'
      '  FROM acs_cotizacionsiniestro'
      ' WHERE cs_idcotizacion = :ID')
    Left = 28
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqConsultaHistorico: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      
        '  FROM cac_actividad, afi.aca_canal, com.xen_entidad, atc_tarifa' +
        'cobrar, afi.aco_cotizacion, afi.asc_solicitudcotizacion'
      ' WHERE co_id = sc_idcotizacion'
      '   AND co_id = tc_idcotizacion'
      '   AND tc_id = (SELECT MAX(tc_id)'
      '                  FROM atc_tarifacobrar'
      '                 WHERE tc_idcotizacion = :ID)'
      '   AND co_idactividad = ac_id'
      '   AND sc_identidad = en_id(+)'
      '   AND sc_canal = ca_id(+)'
      '   AND co_id = :id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
  end
  object sdqDetalles: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ROUND(SUM(cs_cantidadtrabajador * cs_periodocubierto)'
      
        '             / NVL(SUM(DECODE(cs_periodocubierto, 0, 1, cs_perio' +
        'docubierto)), 1)) AS cant_trabajadores,'
      
        '       SUM(cs_salariocubierto) / DECODE(COUNT(*), 0, 1, COUNT(*)' +
        ') AS salariopromedio, SUM(cs_periodocubierto) AS periodo_cub,'
      
        '       ROUND(SUM(cs_cantsiniestro * co_costomedico), 2) AS costo' +
        '_medico_total,'
      
        '       ROUND(SUM(cs_cantdiasbajaart) *(SUM(cs_salariocubierto) /' +
        ' DECODE(COUNT(*), 0, 1, COUNT(*))) / 30.4 * 1.33, 2) AS ilt,'
      '       ROUND(SUM(cs_cantidadtrabajador * cs_periodocubierto)'
      
        '             / NVL(SUM(DECODE(cs_periodocubierto, 0, 1, cs_perio' +
        'docubierto)), 1))'
      '       * SUM(cs_periodocubierto) AS factor'
      '  FROM acs_cotizacionsiniestro, aco_cotizacion'
      ' WHERE cs_idcotizacion = co_id'
      '   AND co_id = :id'
      '   AND cs_anio < 2004')
    Left = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
  end
end
