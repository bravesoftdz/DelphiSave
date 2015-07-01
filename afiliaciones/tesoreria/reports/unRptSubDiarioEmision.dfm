object rptSubDiarioEmision: TrptSubDiarioEmision
  Left = 0
  Top = 0
  Width = 1344
  Height = 816
  IDReport = 0
  AfterPrint = QuickRepAfterPrint
  BeforePrint = QuickRepBeforePrint
  DataSet = sdqReporte
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRSTRINGSBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poLandscape
  Page.PaperSize = Legal
  Page.Continuous = False
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    3556.000000000000000000
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
  object qrbTitulo: TQRBand
    Left = 38
    Top = 38
    Width = 1268
    Height = 135
    Frame.DrawBottom = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      357.187500000000000000
      3354.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageHeader
    object qrlTitulo: TQRLabel
      Left = 539
      Top = 38
      Width = 189
      Height = 20
      Size.Values = (
        52.916666666666670000
        1426.104166666667000000
        100.541666666666700000
        500.062500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = True
      Caption = 'SUBDIARIO DE EMISION'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 12
    end
    object qrlFolio: TQRLabel
      Left = 1082
      Top = 4
      Width = 33
      Height = 17
      Size.Values = (
        44.979166666666670000
        2862.791666666667000000
        10.583333333333330000
        87.312500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Folio:'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 6
      Top = 24
      Width = 303
      Height = 17
      Size.Values = (
        44.979166666666670000
        15.875000000000000000
        63.500000000000000000
        801.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Sede legal: Carlos Pellegrini 91 p.5, Capital Federal.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 2
      Top = 92
      Width = 21
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        243.416666666666700000
        55.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nro.'
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
    object QRLabel3: TQRLabel
      Left = 56
      Top = 110
      Width = 19
      Height = 17
      Size.Values = (
        44.979166666666670000
        148.166666666666700000
        291.041666666666700000
        50.270833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Est.'
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
    object QRLabel4: TQRLabel
      Left = 82
      Top = 110
      Width = 37
      Height = 17
      Size.Values = (
        44.979166666666670000
        216.958333333333300000
        291.041666666666700000
        97.895833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Per'#237'odo'
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
    object QRLabel5: TQRLabel
      Left = 134
      Top = 110
      Width = 23
      Height = 17
      Size.Values = (
        44.979166666666670000
        354.541666666666700000
        291.041666666666700000
        60.854166666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CUIT'
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
    object QRLabel6: TQRLabel
      Left = 184
      Top = 110
      Width = 64
      Height = 17
      Size.Values = (
        44.979166666666670000
        486.833333333333300000
        291.041666666666700000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Razon Social'
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
      Left = 284
      Top = 92
      Width = 43
      Height = 17
      Size.Values = (
        44.979166666666670000
        751.416666666666700000
        243.416666666666700000
        113.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad'
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
      Left = 374
      Top = 92
      Width = 27
      Height = 17
      Size.Values = (
        44.979166666666670000
        989.541666666666700000
        243.416666666666700000
        71.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Masa'
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
      Left = 439
      Top = 110
      Width = 27
      Height = 17
      Size.Values = (
        44.979166666666670000
        1161.520833333333000000
        291.041666666666700000
        71.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prima'
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
    object QRLabel10: TQRLabel
      Left = 486
      Top = 110
      Width = 37
      Height = 17
      Size.Values = (
        44.979166666666670000
        1285.875000000000000000
        291.041666666666700000
        97.895833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Bonific.'
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
      Left = 532
      Top = 110
      Width = 58
      Height = 17
      Size.Values = (
        44.979166666666670000
        1407.583333333333000000
        291.041666666666700000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tasa S.S.N.'
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
      Left = 606
      Top = 92
      Width = 46
      Height = 17
      Size.Values = (
        44.979166666666670000
        1603.375000000000000000
        243.416666666666700000
        121.708333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Servicios'
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
      Left = 660
      Top = 92
      Width = 42
      Height = 17
      Size.Values = (
        44.979166666666670000
        1746.250000000000000000
        243.416666666666700000
        111.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Derecho'
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
      Left = 782
      Top = 92
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        2069.041666666667000000
        243.416666666666700000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Deudores'
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
      Left = 846
      Top = 92
      Width = 46
      Height = 17
      Size.Values = (
        44.979166666666670000
        2238.375000000000000000
        243.416666666666700000
        121.708333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fondo de'
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
      Left = 2
      Top = 110
      Width = 37
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        291.041666666666700000
        97.895833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Afiliado'
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
      Left = 284
      Top = 110
      Width = 65
      Height = 17
      Size.Values = (
        44.979166666666670000
        751.416666666666700000
        291.041666666666700000
        171.979166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Trabajadores'
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
      Left = 374
      Top = 110
      Width = 36
      Height = 17
      Size.Values = (
        44.979166666666670000
        989.541666666666700000
        291.041666666666700000
        95.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Salarial'
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
    object QRLabel20: TQRLabel
      Left = 606
      Top = 110
      Width = 42
      Height = 17
      Size.Values = (
        44.979166666666670000
        1603.375000000000000000
        291.041666666666700000
        111.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Sociales'
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
    object QRLabel21: TQRLabel
      Left = 660
      Top = 110
      Width = 37
      Height = 17
      Size.Values = (
        44.979166666666670000
        1746.250000000000000000
        291.041666666666700000
        97.895833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Emisi'#243'n'
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
    object QRLabel22: TQRLabel
      Left = 717
      Top = 110
      Width = 34
      Height = 17
      Size.Values = (
        44.979166666666670000
        1897.062500000000000000
        291.041666666666700000
        89.958333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Admin.'
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
    object QRLabel23: TQRLabel
      Left = 782
      Top = 110
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        2069.041666666667000000
        291.041666666666700000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'por Premio'
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
    object QRLabel24: TQRLabel
      Left = 846
      Top = 110
      Width = 42
      Height = 17
      Size.Values = (
        44.979166666666670000
        2238.375000000000000000
        291.041666666666700000
        111.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Reserva'
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
    object QRLabel25: TQRLabel
      Left = 896
      Top = 110
      Width = 54
      Height = 17
      Size.Values = (
        44.979166666666670000
        2370.666666666667000000
        291.041666666666700000
        142.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hipoac'#250'sia'
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
    object QRLabel26: TQRLabel
      Left = 975
      Top = 110
      Width = 34
      Height = 17
      Size.Values = (
        44.979166666666670000
        2579.687500000000000000
        291.041666666666700000
        89.958333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Interes'
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
    object QRLabel27: TQRLabel
      Left = 1034
      Top = 92
      Width = 36
      Height = 17
      Size.Values = (
        44.979166666666670000
        2735.791666666667000000
        243.416666666666700000
        95.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Importe'
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
    object QRLabel28: TQRLabel
      Left = 1034
      Top = 110
      Width = 44
      Height = 17
      Size.Values = (
        44.979166666666670000
        2735.791666666667000000
        291.041666666666700000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Comisi'#243'n'
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
    object QRLabel29: TQRLabel
      Left = 1093
      Top = 110
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        2891.895833333333000000
        291.041666666666700000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Productor'
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
    object QRLabel30: TQRLabel
      Left = 1093
      Top = 92
      Width = 34
      Height = 17
      Size.Values = (
        44.979166666666670000
        2891.895833333333000000
        243.416666666666700000
        89.958333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Codigo'
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
      Left = 1082
      Top = 24
      Width = 49
      Height = 17
      Size.Values = (
        44.979166666666670000
        2862.791666666667000000
        63.500000000000000000
        129.645833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Per'#237'odo:'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object Folio: TQRLabel
      Left = 1119
      Top = 4
      Width = 29
      Height = 17
      Size.Values = (
        44.979166666666670000
        2960.687500000000000000
        10.583333333333330000
        76.729166666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Folio'
      Color = clWhite
      OnPrint = FolioPrint
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object Periodo: TQRLabel
      Left = 1132
      Top = 24
      Width = 45
      Height = 17
      Size.Values = (
        44.979166666666670000
        2995.083333333333000000
        63.500000000000000000
        119.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Periodo'
      Color = clWhite
      OnPrint = PeriodoPrint
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 717
      Top = 92
      Width = 42
      Height = 17
      Size.Values = (
        44.979166666666670000
        1897.062500000000000000
        243.416666666666700000
        111.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Recargo'
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
      Left = 1143
      Top = 92
      Width = 34
      Height = 17
      Size.Values = (
        44.979166666666670000
        3024.187500000000000000
        243.416666666666700000
        89.958333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Codigo'
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
      Left = 1143
      Top = 110
      Width = 61
      Height = 17
      Size.Values = (
        44.979166666666670000
        3024.187500000000000000
        291.041666666666700000
        161.395833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Organizador'
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
      Left = 1207
      Top = 110
      Width = 58
      Height = 17
      Size.Values = (
        44.979166666666670000
        3193.520833333333000000
        291.041666666666700000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Jurisdicci'#243'n'
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
  end
  object qrlProvinciaART: TQRLabel
    Left = 44
    Top = 44
    Width = 367
    Height = 17
    Size.Values = (
      44.979166666666670000
      116.416666666666700000
      116.416666666666700000
      971.020833333333300000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'PROVINCIA ASEGURADORA DE RIESGO DE TRABAJO S.A.'
    Color = clWhite
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 173
    Width = 1268
    Height = 15
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      39.687500000000000000
      3354.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 4
      Top = 2
      Width = 46
      Height = 11
      Size.Values = (
        29.986111111111110000
        10.583333333333330000
        5.291666666666667000
        121.708333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'NRO_AFILIADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText2: TQRDBText
      Left = 57
      Top = 2
      Width = 20
      Height = 11
      Size.Values = (
        29.986111111111110000
        151.694444444444400000
        5.291666666666667000
        52.916666666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EST'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 83
      Top = 2
      Width = 37
      Height = 11
      Size.Values = (
        29.986111111111110000
        220.486111111111100000
        5.291666666666667000
        97.013888888888890000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PERIODO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText4: TQRDBText
      Left = 126
      Top = 2
      Width = 20
      Height = 11
      Size.Values = (
        29.104166666666670000
        333.375000000000000000
        5.291666666666667000
        52.916666666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText5: TQRDBText
      Left = 182
      Top = 2
      Width = 96
      Height = 11
      Size.Values = (
        29.986111111111110000
        481.541666666666700000
        5.291666666666667000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'RAZON_SOCIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText6: TQRDBText
      Left = 283
      Top = 2
      Width = 49
      Height = 11
      Size.Values = (
        29.986111111111110000
        747.888888888888900000
        5.291666666666667000
        128.763888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TRABAJADORES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText7: TQRDBText
      Left = 350
      Top = 2
      Width = 63
      Height = 11
      Size.Values = (
        29.986111111111110000
        926.041666666666700000
        5.291666666666667000
        165.805555555555600000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'MASA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText8: TQRDBText
      Left = 417
      Top = 2
      Width = 57
      Height = 11
      Size.Values = (
        29.986111111111110000
        1102.430555555556000000
        5.291666666666667000
        149.930555555555600000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRIMA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText9: TQRDBText
      Left = 476
      Top = 2
      Width = 52
      Height = 11
      Size.Values = (
        29.986111111111110000
        1259.416666666667000000
        5.291666666666667000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'BONIFICACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText10: TQRDBText
      Left = 549
      Top = 2
      Width = 41
      Height = 11
      Size.Values = (
        29.986111111111110000
        1453.444444444444000000
        5.291666666666667000
        109.361111111111100000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TASA_SSN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText11: TQRDBText
      Left = 593
      Top = 2
      Width = 61
      Height = 11
      Size.Values = (
        29.986111111111110000
        1569.861111111111000000
        5.291666666666667000
        160.513888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'SERVS_SOCIALES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText12: TQRDBText
      Left = 658
      Top = 2
      Width = 43
      Height = 11
      Size.Values = (
        29.986111111111110000
        1740.958333333333000000
        5.291666666666667000
        112.888888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'D_EMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText13: TQRDBText
      Left = 721
      Top = 2
      Width = 37
      Height = 11
      Size.Values = (
        29.986111111111110000
        1906.763888888889000000
        5.291666666666667000
        97.013888888888890000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'R_ADMIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText14: TQRDBText
      Left = 762
      Top = 2
      Width = 77
      Height = 11
      Size.Values = (
        29.986111111111110000
        2016.125000000000000000
        5.291666666666667000
        204.611111111111100000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DSXPREMIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText15: TQRDBText
      Left = 843
      Top = 2
      Width = 50
      Height = 11
      Size.Values = (
        29.986111111111110000
        2229.555555555556000000
        5.291666666666667000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FDO_RESERVA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText16: TQRDBText
      Left = 896
      Top = 2
      Width = 56
      Height = 11
      Size.Values = (
        29.986111111111110000
        2370.666666666667000000
        5.291666666666667000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'HIPOACUSIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText17: TQRDBText
      Left = 955
      Top = 2
      Width = 64
      Height = 11
      Size.Values = (
        29.986111111111110000
        2525.888888888889000000
        5.291666666666667000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'INTERES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText18: TQRDBText
      Left = 1021
      Top = 2
      Width = 67
      Height = 11
      Size.Values = (
        29.986111111111110000
        2702.277777777778000000
        5.291666666666667000
        176.388888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'COMISION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      Mask = '0.00'
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText19: TQRDBText
      Left = 1093
      Top = 2
      Width = 48
      Height = 11
      Size.Values = (
        29.986111111111110000
        2892.777777777778000000
        5.291666666666667000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRODUCTOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText20: TQRDBText
      Left = 1143
      Top = 2
      Width = 61
      Height = 11
      Size.Values = (
        29.986111111111110000
        3023.305555555556000000
        5.291666666666667000
        162.277777777777800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ORGANIZADOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRDBText21: TQRDBText
      Left = 1207
      Top = 2
      Width = 58
      Height = 11
      Size.Values = (
        29.986111111111110000
        3192.638888888889000000
        5.291666666666667000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'JURISDICCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
  end
  object SummaryBand1: TQRBand
    Left = 38
    Top = 188
    Width = 1268
    Height = 49
    Frame.DrawTop = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      129.645833333333300000
      3354.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbSummary
    object QRExpr1: TQRExpr
      Left = 409
      Top = 3
      Width = 65
      Height = 12
      Size.Values = (
        31.750000000000000000
        1081.263888888889000000
        7.055555555555556000
        171.097222222222200000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.PRIMA)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr2: TQRExpr
      Left = 476
      Top = 3
      Width = 51
      Height = 12
      Size.Values = (
        31.750000000000000000
        1259.416666666667000000
        7.055555555555556000
        134.055555555555600000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.BONIFICACION)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr3: TQRExpr
      Left = 547
      Top = 3
      Width = 43
      Height = 12
      Size.Values = (
        31.750000000000000000
        1448.152777777778000000
        7.055555555555556000
        112.888888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.TASA_SSN)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr4: TQRExpr
      Left = 594
      Top = 3
      Width = 60
      Height = 12
      Size.Values = (
        31.750000000000000000
        1571.625000000000000000
        7.055555555555556000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.SERVS_SOCIALES)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr5: TQRExpr
      Left = 659
      Top = 3
      Width = 43
      Height = 12
      Size.Values = (
        31.750000000000000000
        1744.486111111111000000
        7.055555555555556000
        112.888888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.D_EMISION)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr6: TQRExpr
      Left = 714
      Top = 3
      Width = 43
      Height = 12
      Size.Values = (
        31.750000000000000000
        1889.125000000000000000
        7.055555555555556000
        112.888888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.R_ADMIN)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr7: TQRExpr
      Left = 762
      Top = 3
      Width = 77
      Height = 12
      Size.Values = (
        31.750000000000000000
        2016.125000000000000000
        7.055555555555556000
        204.611111111111100000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.DSXPREMIO)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr8: TQRExpr
      Left = 843
      Top = 3
      Width = 50
      Height = 12
      Size.Values = (
        31.750000000000000000
        2229.555555555556000000
        7.055555555555556000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.FDO_RESERVA)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr9: TQRExpr
      Left = 896
      Top = 3
      Width = 56
      Height = 12
      Size.Values = (
        31.750000000000000000
        2370.666666666667000000
        7.055555555555556000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM(sdqReporte.HIPOACUSIA)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr10: TQRExpr
      Left = 955
      Top = 3
      Width = 64
      Height = 12
      Size.Values = (
        31.750000000000000000
        2525.888888888889000000
        7.055555555555556000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM( sdqReporte.INTERES )'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRExpr11: TQRExpr
      Left = 1021
      Top = 3
      Width = 67
      Height = 12
      Size.Values = (
        31.750000000000000000
        2702.277777777778000000
        7.055555555555556000
        176.388888888888900000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      Expression = 'SUM( sdqReporte.COMISION)'
      Mask = '0.00'
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlTotalesdelMes: TQRLabel
      Left = 187
      Top = 3
      Width = 76
      Height = 15
      Size.Values = (
        39.687500000000000000
        494.770833333333300000
        7.937500000000000000
        201.083333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Totales del mes'
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
    object qrlTotalComisionesProd: TQRLabel
      Left = 866
      Top = 16
      Width = 134
      Height = 15
      Size.Values = (
        39.687500000000000000
        2291.291666666667000000
        42.333333333333330000
        354.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Total comisi'#243'n productores:'
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
    object qrlTotalComisionesInstit: TQRLabel
      Left = 866
      Top = 31
      Width = 121
      Height = 15
      Size.Values = (
        39.687500000000000000
        2291.291666666667000000
        82.020833333333330000
        320.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Total comisi'#243'n institorios:'
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
    object qrlImpTotalComisionesProd: TQRLabel
      Left = 1006
      Top = 18
      Width = 82
      Height = 11
      Size.Values = (
        29.986111111111110000
        2661.708333333333000000
        47.625000000000000000
        216.958333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrlImpTotalComisionesProd'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlImpTotalComisionesInstit: TQRLabel
      Left = 1006
      Top = 33
      Width = 82
      Height = 11
      Size.Values = (
        29.986111111111110000
        2661.708333333333000000
        88.194444444444440000
        216.958333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrlImpTotalComisionesInstit'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ED_CONTRATO NRO_AFILIADO,'
      '       ED_ESTABLECIMIENTOS EST,'
      '       TO_CHAR(TO_DATE(ED_PERIODO, '#39'YYYYMM'#39'),'#39'MM/YYYY'#39') PERIODO,'
      '       ED_CUIT CUIT,'
      '       ED_NOMBRE RAZON_SOCIAL,'
      '       ED_EMPLEADOS TRABAJADORES,'
      '       ED_MASASALARIAL MASA,'
      '       ED_PRIMA PRIMA,'
      '       0 BONIFICACION,'
      '       ED_SSN TASA_SSN,'
      '       ED_OBRASOCIAL SERVS_SOCIALES,'
      '       0 D_EMISION,'
      '       0 R_ADMIN,'
      '       ED_CUOTA DSXPREMIO,'
      '       ED_SRT FDO_RESERVA,'
      '       ED_FONDO HIPOACUSIA,'
      '       ED_INTERES INTERES,'
      '       ED_COMISION COMISION,'
      '       ED_ENTIDAD PRODUCTOR,'
      '       ED_VENDEDOR ORGANIZADOR,'
      '       PV_DESCRIPCION JURISDICCION,'
      '       ROWNUM'
      '  FROM CPV_PROVINCIAS, OED_EMISIONDETALLE'
      ' WHERE PV_CODIGO = ED_PROVINCIA'
      ' ORDER BY NRO_AFILIADO, ED_PERIODO'
      ''
      '')
    UniDirectional = True
    Left = 7
    Top = 65535
  end
end
