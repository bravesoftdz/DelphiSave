object rptParteEgreso: TrptParteEgreso
  Tag = 1
  Left = 0
  Top = 0
  Width = 1142
  Height = 1478
  IDReport = 0
  DataSet = sdqReporte
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
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
  Page.PaperSize = Letter
  Page.Continuous = False
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    150.000000000000000000
    150.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 2
  PrinterSettings.OutputBin = Auto
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 1
  PrinterSettings.LastPage = 1
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
  ReportTitle = 'Parte de Egreso'
  SnapToGrid = True
  Units = MM
  Zoom = 140
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  PrevInitialZoom = qrZoomToFit
  PreviewDefaultSaveType = stQRP
  PreviewLeft = 0
  PreviewTop = 0
  object qrHeader: TQRBand
    Left = 79
    Top = 53
    Width = 983
    Height = 122
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      230.565476190476200000
      1857.752976190476000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageHeader
    object QRShape5: TQRShape
      Left = 475
      Top = 2
      Width = 504
      Height = 118
      Size.Values = (
        223.005952380952400000
        897.693452380952600000
        3.779761904761905000
        952.500000000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel1: TQRLabel
      Left = 487
      Top = 7
      Width = 481
      Height = 51
      Size.Values = (
        96.383928571428570000
        920.372023809523800000
        13.229166666666670000
        909.032738095238300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'CONSTANCIA DE ALTA M'#201'DICA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 20
    end
    object QRLabel44: TQRLabel
      Left = 489
      Top = 64
      Width = 371
      Height = 51
      Size.Values = (
        96.383928571428570000
        924.151785714285800000
        120.952380952381000000
        701.145833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '/ FIN DE TRATAMIENTO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 20
    end
    object QRLabel45: TQRLabel
      Left = 1
      Top = 33
      Width = 466
      Height = 64
      Size.Values = (
        120.952380952381000000
        1.889880952380953000
        62.366071428571420000
        880.684523809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'ART: _____________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 28
    end
    object qrlART: TQRLabel
      Left = 114
      Top = 22
      Width = 350
      Height = 58
      Size.Values = (
        109.613095238095200000
        215.446428571428500000
        41.577380952380950000
        661.458333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Provincia ART S.A.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 18
    end
  end
  object qrTitle: TQRBand
    Left = 79
    Top = 175
    Width = 983
    Height = 25
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.247023809523810000
      1857.752976190476000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbTitle
    object QRLabel2: TQRLabel
      Left = 1
      Top = 3
      Width = 108
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        5.669642857142857000
        204.107142857142800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'N'#176' DE SINIESTRO:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 115
      Top = 3
      Width = 195
      Height = 19
      Size.Values = (
        35.907738095238090000
        217.336309523809500000
        5.669642857142857000
        368.526785714285700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'SINIESTRO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
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
  object qrbEmpresa: TQRChildBand
    Left = 79
    Top = 324
    Width = 983
    Height = 55
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      103.943452380952400000
      1857.752976190476000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbTrabajador
    PrintOrder = cboAfterParent
    object QRLabel50: TQRLabel
      Left = 1
      Top = 29
      Width = 87
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        54.806547619047620000
        164.419642857142800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Raz'#243'n Social:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel49: TQRLabel
      Left = 706
      Top = 29
      Width = 35
      Height = 19
      Size.Values = (
        35.907738095238090000
        1334.255952380952000000
        54.806547619047620000
        66.145833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CUIT:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText31: TQRDBText
      Left = 89
      Top = 29
      Width = 614
      Height = 19
      Size.Values = (
        35.907738095238090000
        168.199404761904800000
        54.806547619047620000
        1160.386904761905000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EMPRESA_NOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText51: TQRDBText
      Left = 745
      Top = 29
      Width = 232
      Height = 19
      Size.Values = (
        35.907738095238090000
        1407.961309523810000000
        54.806547619047620000
        438.452380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CUIT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlDatosEmpDep: TQRLabel
      Left = 1
      Top = 3
      Width = 980
      Height = 22
      Size.Values = (
        41.577380952380950000
        1.889880952380953000
        5.669642857142857000
        1852.083333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' DATOS DEL EMPLEADOR'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
  end
  object qrbTrabajador: TQRChildBand
    Left = 79
    Top = 200
    Width = 983
    Height = 124
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      234.345238095238100000
      1857.752976190476000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrTitle
    PrintOrder = cboAfterParent
    object QRLabel19: TQRLabel
      Left = 1
      Top = 27
      Width = 126
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        51.026785714285720000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Apellido y Nombre:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 1
      Top = 75
      Width = 39
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        141.741071428571400000
        73.705357142857140000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Calle:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 357
      Top = 99
      Width = 56
      Height = 19
      Size.Values = (
        35.907738095238090000
        674.687500000000000000
        187.098214285714300000
        105.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel. Fijo:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 619
      Top = 27
      Width = 83
      Height = 19
      Size.Values = (
        35.907738095238090000
        1169.836309523810000000
        51.026785714285720000
        156.860119047619000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CUIL/DNI N'#176':'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel78: TQRLabel
      Left = 272
      Top = 99
      Width = 22
      Height = 19
      Size.Values = (
        35.907738095238090000
        514.047619047619000000
        187.098214285714300000
        41.577380952380950000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CP:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel79: TQRLabel
      Left = 1
      Top = 99
      Width = 67
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        187.098214285714300000
        126.622023809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Provincia:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText19: TQRDBText
      Left = 129
      Top = 27
      Width = 77
      Height = 20
      Size.Values = (
        37.797619047619050000
        243.794642857142800000
        51.026785714285720000
        145.520833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TJ_NOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText20: TQRDBText
      Left = 43
      Top = 75
      Width = 359
      Height = 20
      Size.Values = (
        37.797619047619050000
        81.264880952380970000
        141.741071428571400000
        678.467261904762000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'tj_calle'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText79: TQRDBText
      Left = 296
      Top = 99
      Width = 60
      Height = 20
      Size.Values = (
        37.797619047619050000
        559.404761904761900000
        187.098214285714300000
        113.392857142857100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TJ_CPOSTAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 1
      Top = 51
      Width = 144
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        96.383928571428570000
        272.142857142857200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de Nacimiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText26: TQRDBText
      Left = 149
      Top = 51
      Width = 98
      Height = 20
      Size.Values = (
        37.797619047619050000
        281.592261904761900000
        96.383928571428570000
        185.208333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'tj_fnacimiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel30: TQRLabel
      Left = 272
      Top = 51
      Width = 42
      Height = 18
      Size.Values = (
        34.017857142857150000
        514.047619047619000000
        96.383928571428570000
        79.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Sexo:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape12: TQRShape
      Left = 892
      Top = 16
      Width = 15
      Height = 91
      Size.Values = (
        171.979166666666700000
        1685.773809523810000000
        30.238095238095240000
        28.348214285714280000)
      XLColumn = 0
      Pen.Style = psClear
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText80: TQRDBText
      Left = 69
      Top = 99
      Width = 161
      Height = 19
      Size.Values = (
        35.907738095238090000
        130.401785714285700000
        187.098214285714300000
        304.270833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TRABAJADOR_PROVINCIA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText25: TQRDBText
      Left = 704
      Top = 26
      Width = 31
      Height = 20
      Size.Values = (
        37.797619047619050000
        1330.476190476191000000
        49.136904761904770000
        58.586309523809540000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CUIL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel28: TQRLabel
      Left = 1
      Top = 3
      Width = 980
      Height = 22
      Size.Values = (
        41.577380952380950000
        1.889880952380953000
        5.669642857142857000
        1852.083333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' DATOS DEL TRABAJADOR'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRShape2: TQRShape
      Left = 332
      Top = 50
      Width = 21
      Height = 21
      Size.Values = (
        39.687500000000000000
        627.440476190476200000
        94.494047619047620000
        39.687500000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText11: TQRDBText
      Left = 335
      Top = 51
      Width = 15
      Height = 19
      Size.Values = (
        35.907738095238090000
        633.110119047619100000
        96.383928571428570000
        28.348214285714280000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'sexo_M'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRShape6: TQRShape
      Left = 373
      Top = 50
      Width = 21
      Height = 21
      Size.Values = (
        39.687500000000000000
        704.925595238095200000
        94.494047619047620000
        39.687500000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText34: TQRDBText
      Left = 376
      Top = 51
      Width = 15
      Height = 19
      Size.Values = (
        35.907738095238090000
        710.595238095238000000
        96.383928571428570000
        28.348214285714280000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'sexo_F'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel31: TQRLabel
      Left = 316
      Top = 51
      Width = 14
      Height = 18
      Size.Values = (
        34.017857142857150000
        597.202380952380900000
        96.383928571428570000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'M'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel32: TQRLabel
      Left = 361
      Top = 51
      Width = 10
      Height = 18
      Size.Values = (
        34.017857142857150000
        682.247023809523800000
        96.383928571428570000
        18.898809523809530000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'F'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel46: TQRLabel
      Left = 404
      Top = 75
      Width = 29
      Height = 19
      Size.Values = (
        35.907738095238090000
        763.511904761904800000
        141.741071428571400000
        54.806547619047620000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nro:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText29: TQRDBText
      Left = 434
      Top = 75
      Width = 56
      Height = 20
      Size.Values = (
        37.797619047619050000
        820.208333333333500000
        141.741071428571400000
        105.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'tj_numero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel64: TQRLabel
      Left = 494
      Top = 75
      Width = 34
      Height = 19
      Size.Values = (
        35.907738095238090000
        933.601190476190600000
        141.741071428571400000
        64.255952380952380000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Piso:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText30: TQRDBText
      Left = 528
      Top = 75
      Width = 26
      Height = 19
      Size.Values = (
        35.907738095238090000
        997.857142857142800000
        141.741071428571400000
        49.136904761904770000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'tj_piso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText35: TQRDBText
      Left = 605
      Top = 75
      Width = 26
      Height = 19
      Size.Values = (
        35.907738095238090000
        1143.377976190476000000
        141.741071428571400000
        49.136904761904770000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'tj_departamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel65: TQRLabel
      Left = 558
      Top = 75
      Width = 46
      Height = 19
      Size.Values = (
        35.907738095238090000
        1054.553571428571000000
        141.741071428571400000
        86.934523809523810000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Depto:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel112: TQRLabel
      Left = 633
      Top = 75
      Width = 70
      Height = 19
      Size.Values = (
        35.907738095238090000
        1196.294642857143000000
        141.741071428571400000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Localidad:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText36: TQRDBText
      Left = 706
      Top = 75
      Width = 274
      Height = 19
      Size.Values = (
        35.907738095238090000
        1334.255952380952000000
        141.741071428571400000
        517.827380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'tj_localidad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText37: TQRDBText
      Left = 413
      Top = 99
      Width = 288
      Height = 19
      Size.Values = (
        35.907738095238090000
        780.520833333333400000
        187.098214285714300000
        544.285714285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'TelFijo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel77: TQRLabel
      Left = 705
      Top = 99
      Width = 66
      Height = 19
      Size.Values = (
        35.907738095238090000
        1332.366071428571000000
        187.098214285714300000
        124.732142857142800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel.M'#243'vil:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText21: TQRDBText
      Left = 774
      Top = 99
      Width = 205
      Height = 19
      Size.Values = (
        35.907738095238090000
        1462.767857142857000000
        187.098214285714300000
        387.425595238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'Celular'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
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
  object qrbPrestador: TQRChildBand
    Left = 79
    Top = 379
    Width = 983
    Height = 986
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      1863.422619047619000000
      1857.752976190476000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbEmpresa
    PrintOrder = cboAfterParent
    object QRLabel16: TQRLabel
      Left = 1
      Top = 26
      Width = 269
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        49.136904761904770000
        508.377976190476200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Nombre del Establecimiento Asistencial:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 1
      Top = 51
      Width = 39
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        96.383928571428570000
        73.705357142857140000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Calle:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 706
      Top = 50
      Width = 70
      Height = 19
      Size.Values = (
        35.907738095238090000
        1334.255952380952000000
        94.494047619047620000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Localidad:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel54: TQRLabel
      Left = 706
      Top = 25
      Width = 35
      Height = 19
      Size.Values = (
        35.907738095238090000
        1334.255952380952000000
        47.247023809523810000
        66.145833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CUIT:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel55: TQRLabel
      Left = 1
      Top = 75
      Width = 67
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        141.741071428571400000
        126.622023809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Provincia:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel56: TQRLabel
      Left = 296
      Top = 74
      Width = 22
      Height = 19
      Size.Values = (
        35.907738095238090000
        559.404761904761900000
        139.851190476190500000
        41.577380952380950000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CP:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText16: TQRDBText
      Left = 43
      Top = 50
      Width = 251
      Height = 19
      Size.Values = (
        35.907738095238090000
        81.264880952380970000
        94.494047619047620000
        474.360119047619100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ca_calle'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText18: TQRDBText
      Left = 69
      Top = 74
      Width = 226
      Height = 19
      Size.Values = (
        35.907738095238090000
        130.401785714285700000
        139.851190476190500000
        427.113095238095300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestador_provincia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText52: TQRDBText
      Left = 319
      Top = 74
      Width = 69
      Height = 19
      Size.Values = (
        35.907738095238090000
        602.872023809523800000
        139.851190476190500000
        130.401785714285700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ca_codpostal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel60: TQRLabel
      Left = 392
      Top = 74
      Width = 25
      Height = 19
      Size.Values = (
        35.907738095238090000
        740.833333333333400000
        139.851190476190500000
        47.247023809523810000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel61: TQRLabel
      Left = 706
      Top = 74
      Width = 28
      Height = 19
      Size.Values = (
        35.907738095238090000
        1334.255952380952000000
        139.851190476190500000
        52.916666666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fax:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel62: TQRLabel
      Left = 1
      Top = 99
      Width = 35
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        187.098214285714300000
        66.145833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Mail:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape14: TQRShape
      Left = 873
      Top = 26
      Width = 15
      Size.Values = (
        122.842261904761900000
        1649.866071428572000000
        49.136904761904770000
        28.348214285714280000)
      XLColumn = 0
      Pen.Style = psClear
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText59: TQRDBText
      Left = 39
      Top = 98
      Width = 939
      Height = 19
      Size.Values = (
        35.907738095238090000
        73.705357142857140000
        185.208333333333300000
        1774.598214285715000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ca_direlectronica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText53: TQRDBText
      Left = 745
      Top = 25
      Width = 232
      Height = 19
      Size.Values = (
        35.907738095238090000
        1407.961309523810000000
        47.247023809523810000
        438.452380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestador_cuit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 1
      Top = 3
      Width = 980
      Height = 22
      Size.Values = (
        41.577380952380950000
        1.889880952380953000
        5.669642857142857000
        1852.083333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' DATOS DEL PRESTADOR'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRDBText12: TQRDBText
      Left = 324
      Top = 50
      Width = 54
      Height = 19
      Size.Values = (
        35.907738095238090000
        612.321428571428600000
        94.494047619047620000
        102.053571428571400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ca_numero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 294
      Top = 50
      Width = 29
      Height = 19
      Size.Values = (
        35.907738095238090000
        555.625000000000000000
        94.494047619047620000
        54.806547619047620000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Nro:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 380
      Top = 50
      Width = 34
      Height = 19
      Size.Values = (
        35.907738095238090000
        718.154761904762000000
        94.494047619047620000
        64.255952380952380000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Piso:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 412
      Top = 50
      Width = 31
      Height = 19
      Size.Values = (
        35.907738095238090000
        778.630952380952600000
        94.494047619047620000
        58.586309523809540000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ca_piso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 445
      Top = 50
      Width = 46
      Height = 19
      Size.Values = (
        35.907738095238090000
        840.997023809523800000
        94.494047619047620000
        86.934523809523810000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Depto:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 492
      Top = 50
      Width = 48
      Height = 19
      Size.Values = (
        35.907738095238090000
        929.821428571428600000
        94.494047619047620000
        90.714285714285710000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'CA_Departamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText58: TQRDBText
      Left = 736
      Top = 74
      Width = 241
      Height = 19
      Size.Values = (
        35.907738095238090000
        1390.952380952381000000
        139.851190476190500000
        455.461309523809500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestador_fax'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText32: TQRDBText
      Left = 419
      Top = 74
      Width = 153
      Height = 19
      Size.Values = (
        35.907738095238090000
        791.860119047619200000
        139.851190476190500000
        289.151785714285700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRESTADOR_TELEFONO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 273
      Top = 26
      Width = 430
      Height = 19
      Size.Values = (
        35.907738095238090000
        515.937500000000000000
        49.136904761904770000
        812.648809523809700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRESTADOR_NOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText17: TQRDBText
      Left = 777
      Top = 50
      Width = 202
      Height = 19
      Size.Values = (
        35.907738095238090000
        1468.437500000000000000
        94.494047619047620000
        381.755952380952400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PRESTADOR_LOCALIDAD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel57: TQRLabel
      Left = 0
      Top = 146
      Width = 139
      Height = 19
      Size.Values = (
        35.907738095238090000
        0.000000000000000000
        275.922619047619100000
        262.693452380952400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Accidente de trabajo'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape8: TQRShape
      Left = 141
      Top = 145
      Width = 19
      Height = 20
      Size.Values = (
        37.797619047619050000
        266.473214285714300000
        274.032738095238100000
        35.907738095238090000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText48: TQRDBText
      Left = 144
      Top = 146
      Width = 13
      Height = 19
      Size.Values = (
        35.907738095238090000
        272.142857142857200000
        275.922619047619100000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_TIPO_1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel59: TQRLabel
      Left = 275
      Top = 146
      Width = 130
      Height = 19
      Size.Values = (
        35.907738095238090000
        519.717261904761900000
        275.922619047619100000
        245.684523809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Accidente in It'#237'nere'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape9: TQRShape
      Left = 407
      Top = 145
      Width = 19
      Height = 20
      Size.Values = (
        37.797619047619050000
        769.181547619047600000
        274.032738095238100000
        35.907738095238090000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText49: TQRDBText
      Left = 410
      Top = 146
      Width = 13
      Height = 19
      Size.Values = (
        35.907738095238090000
        774.851190476190500000
        275.922619047619100000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_TIPO_2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel63: TQRLabel
      Left = 549
      Top = 146
      Width = 160
      Height = 19
      Size.Values = (
        35.907738095238090000
        1037.544642857143000000
        275.922619047619100000
        302.380952380952400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Enfermedad Profesional'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape10: TQRShape
      Left = 711
      Top = 146
      Width = 19
      Height = 20
      Size.Values = (
        37.797619047619050000
        1343.705357142857000000
        275.922619047619100000
        35.907738095238090000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText50: TQRDBText
      Left = 714
      Top = 147
      Width = 13
      Height = 19
      Size.Values = (
        35.907738095238090000
        1349.375000000000000000
        277.812500000000000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_TIPO_3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel41: TQRLabel
      Left = 0
      Top = 121
      Width = 980
      Height = 22
      Size.Values = (
        41.577380952380950000
        0.000000000000000000
        228.675595238095300000
        1852.083333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' DESCRIPCI'#211'N DEL MOTIVO DE LA CONSULTA'
      Color = clNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel43: TQRLabel
      Left = 845
      Top = 146
      Width = 97
      Height = 19
      Size.Values = (
        35.907738095238090000
        1596.949404761905000000
        275.922619047619100000
        183.318452380952400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Intercurrencia'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 944
      Top = 146
      Width = 19
      Height = 20
      Size.Values = (
        37.797619047619050000
        1784.047619047619000000
        275.922619047619100000
        35.907738095238090000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText28: TQRDBText
      Left = 947
      Top = 147
      Width = 13
      Height = 19
      Size.Values = (
        35.907738095238090000
        1789.717261904762000000
        277.812500000000000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'EX_INTERCURRENCIA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText62: TQRDBText
      Left = 742
      Top = 169
      Width = 86
      Height = 19
      Size.Values = (
        35.907738095238090000
        1402.291666666667000000
        319.389880952381000000
        162.529761904761900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'fechaacc_hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel70: TQRLabel
      Left = 701
      Top = 169
      Width = 38
      Height = 19
      Size.Values = (
        35.907738095238090000
        1324.806547619048000000
        319.389880952381000000
        71.815476190476190000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hora:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText55: TQRDBText
      Left = 535
      Top = 169
      Width = 137
      Height = 19
      Size.Values = (
        35.907738095238090000
        1011.086309523810000000
        319.389880952381000000
        258.913690476190500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FECHAACC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel47: TQRLabel
      Left = 487
      Top = 169
      Width = 45
      Height = 19
      Size.Values = (
        35.907738095238090000
        920.372023809523800000
        319.389880952381000000
        85.044642857142860000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel66: TQRLabel
      Left = 1
      Top = 169
      Width = 372
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        319.389880952381000000
        703.035714285714200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha del Accidente/Primera manifestaci'#243'n invalidante:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel42: TQRLabel
      Left = 0
      Top = 193
      Width = 273
      Height = 19
      Size.Values = (
        35.907738095238090000
        0.000000000000000000
        364.747023809523800000
        515.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de inicio de la inasistencia laboral:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel107: TQRLabel
      Left = 486
      Top = 193
      Width = 45
      Height = 19
      Size.Values = (
        35.907738095238090000
        918.482142857142900000
        364.747023809523800000
        85.044642857142860000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 534
      Top = 193
      Width = 137
      Height = 19
      Size.Values = (
        35.907738095238090000
        1009.196428571429000000
        364.747023809523800000
        258.913690476190500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FecInicioInasistenciaLaboral'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel110: TQRLabel
      Left = 700
      Top = 193
      Width = 38
      Height = 19
      Size.Values = (
        35.907738095238090000
        1322.916666666667000000
        364.747023809523800000
        71.815476190476190000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hora:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 744
      Top = 193
      Width = 61
      Height = 19
      Size.Values = (
        35.907738095238090000
        1406.071428571428000000
        364.747023809523800000
        115.282738095238100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '_______'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel48: TQRLabel
      Left = 0
      Top = 217
      Width = 234
      Height = 19
      Size.Values = (
        35.907738095238090000
        0.000000000000000000
        410.104166666666800000
        442.232142857142800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de primera atenci'#243'n m'#233'dica:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel51: TQRLabel
      Left = 486
      Top = 217
      Width = 45
      Height = 19
      Size.Values = (
        35.907738095238090000
        918.482142857142900000
        410.104166666666800000
        85.044642857142860000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel52: TQRLabel
      Left = 700
      Top = 217
      Width = 38
      Height = 19
      Size.Values = (
        35.907738095238090000
        1322.916666666667000000
        410.104166666666800000
        71.815476190476190000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hora:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 534
      Top = 217
      Width = 137
      Height = 19
      Size.Values = (
        35.907738095238090000
        1009.196428571429000000
        410.104166666666800000
        258.913690476190500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FecPrimeraAtencionMedica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 744
      Top = 217
      Width = 61
      Height = 19
      Size.Values = (
        35.907738095238090000
        1406.071428571428000000
        410.104166666666800000
        115.282738095238100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '_______'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel74: TQRLabel
      Left = 1
      Top = 241
      Width = 240
      Height = 19
      Size.Values = (
        35.907738095238090000
        1.889880952380953000
        455.461309523809500000
        453.571428571428500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Descripci'#243'n del motivo de consulta:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText66: TQRDBText
      Left = 1
      Top = 261
      Width = 976
      Height = 55
      Size.Values = (
        103.943452380952400000
        1.889880952380953000
        493.258928571428600000
        1844.523809523810000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'DescrMotivoConsulta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel80: TQRLabel
      Left = 0
      Top = 317
      Width = 84
      Height = 19
      Size.Values = (
        35.907738095238090000
        0.000000000000000000
        599.092261904762000000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Diagn'#243'stico:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrdbt_Diagnostico: TQRDBText
      Left = 87
      Top = 316
      Width = 889
      Height = 21
      Size.Values = (
        39.687500000000000000
        164.419642857142800000
        597.202380952380900000
        1680.104166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'diagnostico'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel53: TQRLabel
      Left = 0
      Top = 349
      Width = 183
      Height = 19
      Size.Values = (
        35.907738095238090000
        0.000000000000000000
        659.568452380952400000
        345.848214285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Indicaciones / Tratamiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRMemo2: TQRMemo
      Left = 1
      Top = 370
      Width = 977
      Height = 64
      Size.Values = (
        120.952380952381000000
        1.889880952380953000
        699.255952380952400000
        1846.413690476191000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      Lines.Strings = (
        
          '________________________________________________________________' +
          '________________________________________________________________' +
          '___________'
        
          '________________________________________________________________' +
          '________________________________________________________________' +
          '___________'
        
          '________________________________________________________________' +
          '________________________________________________________________' +
          '___________')
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 189
      Top = 350
      Width = 791
      Height = 19
      Size.Values = (
        35.907738095238090000
        357.187500000000000000
        661.458333333333400000
        1494.895833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        '________________________________________________________________' +
        '___________________________________________________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel26: TQRLabel
      Left = 1
      Top = 431
      Width = 348
      Height = 34
      Size.Values = (
        64.255952380952380000
        1.889880952380953000
        814.538690476190500000
        657.678571428571400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'CONSTANCIA DE ALTA M'#201'DICA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 14
    end
    object QRShape1: TQRShape
      Left = 352
      Top = 435
      Width = 30
      Height = 27
      Frame.Width = 5
      Size.Values = (
        51.026785714285720000
        665.238095238095400000
        822.098214285714200000
        56.696428571428570000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel67: TQRLabel
      Left = 506
      Top = 431
      Width = 435
      Height = 33
      Size.Values = (
        62.366071428571420000
        956.279761904762000000
        814.538690476190500000
        822.098214285714200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'CONSTANCIA DE FIN DE TRATAMIENTO'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 14
    end
    object QRShape4: TQRShape
      Left = 944
      Top = 435
      Width = 30
      Height = 27
      Frame.Width = 5
      Size.Values = (
        51.026785714285720000
        1784.047619047619000000
        822.098214285714200000
        56.696428571428570000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText47: TQRDBText
      Left = 949
      Top = 438
      Width = 21
      Height = 20
      Size.Values = (
        37.797619047619050000
        1793.497023809524000000
        827.767857142857200000
        39.687500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FinTratamiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 9
    end
    object QRLabel58: TQRLabel
      Left = 0
      Top = 467
      Width = 287
      Height = 16
      Size.Values = (
        30.238095238095240000
        0.000000000000000000
        882.574404761904800000
        542.395833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tratamiento m'#233'dico asistencial pendiente:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape11: TQRShape
      Left = 256
      Top = 467
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        483.809523809523800000
        882.574404761904800000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel68: TQRLabel
      Left = 239
      Top = 467
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        451.681547619047700000
        882.574404761904800000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel69: TQRLabel
      Left = 291
      Top = 467
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        549.955357142857200000
        882.574404761904800000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape15: TQRShape
      Left = 312
      Top = 467
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        589.642857142857100000
        882.574404761904800000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel71: TQRLabel
      Left = 0
      Top = 486
      Width = 73
      Height = 16
      Size.Values = (
        30.238095238095240000
        0.000000000000000000
        918.482142857142900000
        137.961309523809600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Odontolog'#237'a'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape32: TQRShape
      Left = 72
      Top = 485
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        136.071428571428600000
        916.592261904762000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel72: TQRLabel
      Left = 118
      Top = 486
      Width = 78
      Height = 16
      Size.Values = (
        30.238095238095240000
        223.005952380952400000
        918.482142857142900000
        147.410714285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Dermatolog'#237'a'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape33: TQRShape
      Left = 197
      Top = 485
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        372.306547619047700000
        916.592261904762000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel73: TQRLabel
      Left = 239
      Top = 486
      Width = 75
      Height = 16
      Size.Values = (
        30.238095238095240000
        451.681547619047700000
        918.482142857142900000
        141.741071428571400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Psicoterapia'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape34: TQRShape
      Left = 312
      Top = 485
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        589.642857142857100000
        916.592261904762000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel75: TQRLabel
      Left = 332
      Top = 487
      Width = 105
      Height = 19
      Size.Values = (
        35.907738095238090000
        627.440476190476200000
        920.372023809523800000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '..........................................'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRDBText4: TQRDBText
      Left = 259
      Top = 467
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        489.479166666666800000
        882.574404761904800000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'Tratamiento_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText5: TQRDBText
      Left = 315
      Top = 468
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        595.312500000000000000
        884.464285714285700000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'Tratamiento_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText6: TQRDBText
      Left = 75
      Top = 486
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        141.741071428571400000
        918.482142857142900000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'pe_contpa_odontol'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText7: TQRDBText
      Left = 200
      Top = 485
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        377.976190476190500000
        916.592261904762000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'pe_contpa_dermat'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText8: TQRDBText
      Left = 314
      Top = 485
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        593.422619047619200000
        916.592261904762000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'pe_contpa_psicol'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel76: TQRLabel
      Left = -1
      Top = 508
      Width = 149
      Height = 16
      Size.Values = (
        30.238095238095240000
        -1.889880952380953000
        960.059523809524000000
        281.592261904761900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de pr'#243'xima revisi'#243'n:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel81: TQRLabel
      Left = 170
      Top = 508
      Width = 39
      Height = 16
      Size.Values = (
        30.238095238095240000
        321.279761904761900000
        960.059523809524000000
        73.705357142857140000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel82: TQRLabel
      Left = 353
      Top = 508
      Width = 83
      Height = 16
      Size.Values = (
        30.238095238095240000
        667.127976190476300000
        960.059523809524000000
        156.860119047619000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Hora:________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel83: TQRLabel
      Left = -1
      Top = 527
      Width = 149
      Height = 16
      Size.Values = (
        30.238095238095240000
        -1.889880952380953000
        995.967261904762000000
        281.592261904761900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Recalificaci'#243'n profesional:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel84: TQRLabel
      Left = 170
      Top = 527
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        321.279761904761900000
        995.967261904762000000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape35: TQRShape
      Left = 187
      Top = 527
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        353.407738095238100000
        995.967261904762000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel85: TQRLabel
      Left = 222
      Top = 527
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        419.553571428571500000
        995.967261904762000000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape36: TQRShape
      Left = 243
      Top = 527
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        459.241071428571500000
        995.967261904762000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText23: TQRDBText
      Left = 190
      Top = 527
      Width = 13
      Height = 17
      Size.Values = (
        32.127976190476190000
        359.077380952381000000
        995.967261904762000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'recalificacion_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText38: TQRDBText
      Left = 246
      Top = 527
      Width = 13
      Height = 17
      Size.Values = (
        32.127976190476190000
        464.910714285714300000
        995.967261904762000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'recalificacion_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel86: TQRLabel
      Left = -1
      Top = 546
      Width = 157
      Height = 16
      Size.Values = (
        30.238095238095240000
        -1.889880952380953000
        1031.875000000000000000
        296.711309523809600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fecha de retorno al trabajo:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRDBText39: TQRDBText
      Left = 170
      Top = 546
      Width = 121
      Height = 16
      Size.Values = (
        30.238095238095240000
        321.279761904761900000
        1031.875000000000000000
        228.675595238095300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PE_FECHAREINICIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel87: TQRLabel
      Left = 353
      Top = 546
      Width = 83
      Height = 16
      Size.Values = (
        30.238095238095240000
        667.127976190476300000
        1031.875000000000000000
        156.860119047619000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Hora:________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel88: TQRLabel
      Left = -1
      Top = 566
      Width = 157
      Height = 16
      Size.Values = (
        30.238095238095240000
        -1.889880952380953000
        1069.672619047619000000
        296.711309523809600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fin de tratamiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRDBText40: TQRDBText
      Left = 170
      Top = 566
      Width = 121
      Height = 16
      Size.Values = (
        30.238095238095240000
        321.279761904761900000
        1069.672619047619000000
        228.675595238095300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'PE_FECHAALTAMEDICA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel108: TQRLabel
      Left = 353
      Top = 566
      Width = 83
      Height = 16
      Size.Values = (
        30.238095238095240000
        667.127976190476300000
        1069.672619047619000000
        156.860119047619000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Hora:________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRDBText9: TQRDBText
      Left = 211
      Top = 508
      Width = 141
      Height = 16
      Size.Values = (
        30.238095238095240000
        398.764880952381000000
        960.059523809524000000
        266.473214285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'pe_fechareconsulta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel100: TQRLabel
      Left = 506
      Top = 467
      Width = 112
      Height = 16
      Size.Values = (
        30.238095238095240000
        956.279761904762000000
        882.574404761904800000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fin de tratamiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel109: TQRLabel
      Left = 828
      Top = 467
      Width = 83
      Height = 16
      Size.Values = (
        30.238095238095240000
        1564.821428571428000000
        882.574404761904800000
        156.860119047619000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Hora:________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel111: TQRLabel
      Left = 506
      Top = 498
      Width = 141
      Height = 16
      Size.Values = (
        30.238095238095240000
        956.279761904762000000
        941.160714285714300000
        266.473214285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Secuelas incapacitantes:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel113: TQRLabel
      Left = 696
      Top = 498
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        1315.357142857143000000
        941.160714285714300000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape45: TQRShape
      Left = 713
      Top = 498
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        1347.485119047619000000
        941.160714285714300000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel114: TQRLabel
      Left = 748
      Top = 498
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        1413.630952380952000000
        941.160714285714300000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape46: TQRShape
      Left = 769
      Top = 498
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        1453.318452380952000000
        941.160714285714300000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel115: TQRLabel
      Left = 506
      Top = 529
      Width = 149
      Height = 16
      Size.Values = (
        30.238095238095240000
        956.279761904762000000
        999.747023809524000000
        281.592261904761900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Recalificaci'#243'n profesional:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel116: TQRLabel
      Left = 696
      Top = 529
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        1315.357142857143000000
        999.747023809524000000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape47: TQRShape
      Left = 713
      Top = 529
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        1347.485119047619000000
        999.747023809524000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel117: TQRLabel
      Left = 748
      Top = 529
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        1413.630952380952000000
        999.747023809524000000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape48: TQRShape
      Left = 769
      Top = 529
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        1453.318452380952000000
        999.747023809524000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText27: TQRDBText
      Left = 715
      Top = 529
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        1351.264880952381000000
        999.747023809524000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'recalificacion_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText41: TQRDBText
      Left = 771
      Top = 530
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        1457.098214285715000000
        1001.636904761905000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'recalificacion_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel118: TQRLabel
      Left = 505
      Top = 561
      Width = 180
      Height = 16
      Size.Values = (
        30.238095238095240000
        954.389880952380900000
        1060.223214285714000000
        340.178571428571500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Prestaciones de mantenimiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel119: TQRLabel
      Left = 696
      Top = 561
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        1315.357142857143000000
        1060.223214285714000000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape49: TQRShape
      Left = 713
      Top = 561
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        1347.485119047619000000
        1060.223214285714000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel120: TQRLabel
      Left = 748
      Top = 561
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        1413.630952380952000000
        1060.223214285714000000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape50: TQRShape
      Left = 769
      Top = 561
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        1453.318452380952000000
        1060.223214285714000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText44: TQRDBText
      Left = 715
      Top = 499
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        1351.264880952381000000
        943.050595238095400000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'presupincap_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText45: TQRDBText
      Left = 771
      Top = 499
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        1457.098214285715000000
        943.050595238095400000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'presupincap_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel7: TQRLabel
      Left = 2
      Top = 589
      Width = 157
      Height = 16
      Size.Values = (
        30.238095238095240000
        3.779761904761905000
        1113.139880952381000000
        296.711309523809600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Motivo de cese de ILT:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel27: TQRLabel
      Left = 29
      Top = 609
      Width = 105
      Height = 16
      Size.Values = (
        30.238095238095240000
        54.806547619047620000
        1150.937500000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Alta M'#233'dica:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel33: TQRLabel
      Left = 29
      Top = 629
      Width = 105
      Height = 16
      Size.Values = (
        30.238095238095240000
        54.806547619047620000
        1188.735119047619000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Rechazo:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel39: TQRLabel
      Left = 29
      Top = 649
      Width = 105
      Height = 16
      Size.Values = (
        30.238095238095240000
        54.806547619047620000
        1226.532738095238000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Muerte:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel40: TQRLabel
      Left = 29
      Top = 669
      Width = 105
      Height = 16
      Size.Values = (
        30.238095238095240000
        54.806547619047620000
        1264.330357142857000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Fin de tratamiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel89: TQRLabel
      Left = 29
      Top = 689
      Width = 105
      Height = 16
      Size.Values = (
        30.238095238095240000
        54.806547619047620000
        1302.127976190476000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Por derivaci'#243'n:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel90: TQRLabel
      Left = 172
      Top = 689
      Width = 227
      Height = 16
      Size.Values = (
        30.238095238095240000
        325.059523809523800000
        1302.127976190476000000
        429.002976190476200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Tipo de derivaci'#243'n:........................................'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape7: TQRShape
      Left = 146
      Top = 609
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        275.922619047619100000
        1150.937500000000000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRShape16: TQRShape
      Left = 146
      Top = 629
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        275.922619047619100000
        1188.735119047619000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRShape17: TQRShape
      Left = 146
      Top = 649
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        275.922619047619100000
        1226.532738095238000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRShape37: TQRShape
      Left = 146
      Top = 669
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        275.922619047619100000
        1264.330357142857000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRShape38: TQRShape
      Left = 146
      Top = 689
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        275.922619047619100000
        1302.127976190476000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel8: TQRLabel
      Left = 54
      Top = 712
      Width = 117
      Height = 16
      Size.Values = (
        30.238095238095240000
        102.053571428571400000
        1345.595238095238000000
        221.116071428571400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Afecci'#243'n inculpable:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel91: TQRLabel
      Left = 193
      Top = 711
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        364.747023809523800000
        1343.705357142857000000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape39: TQRShape
      Left = 210
      Top = 711
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        396.875000000000000000
        1343.705357142857000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel92: TQRLabel
      Left = 235
      Top = 711
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        444.122023809523800000
        1343.705357142857000000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape40: TQRShape
      Left = 256
      Top = 711
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        483.809523809523800000
        1343.705357142857000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel93: TQRLabel
      Left = 281
      Top = 712
      Width = 118
      Height = 16
      Size.Values = (
        30.238095238095240000
        531.056547619047700000
        1345.595238095238000000
        223.005952380952400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '.........................................'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel94: TQRLabel
      Left = 2
      Top = 734
      Width = 157
      Height = 16
      Size.Values = (
        30.238095238095240000
        3.779761904761905000
        1387.172619047619000000
        296.711309523809600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Secuelas incapacitantes:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel95: TQRLabel
      Left = 193
      Top = 734
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        364.747023809523800000
        1387.172619047619000000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape41: TQRShape
      Left = 210
      Top = 734
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        396.875000000000000000
        1387.172619047619000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel96: TQRLabel
      Left = 235
      Top = 734
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        444.122023809523800000
        1387.172619047619000000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape42: TQRShape
      Left = 256
      Top = 734
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        483.809523809523800000
        1387.172619047619000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel97: TQRLabel
      Left = 2
      Top = 754
      Width = 180
      Height = 16
      Size.Values = (
        30.238095238095240000
        3.779761904761905000
        1424.970238095238000000
        340.178571428571500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Prestaciones de mantenimiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRLabel98: TQRLabel
      Left = 193
      Top = 754
      Width = 14
      Height = 16
      Size.Values = (
        30.238095238095240000
        364.747023809523800000
        1424.970238095238000000
        26.458333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Si'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape43: TQRShape
      Left = 210
      Top = 754
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        396.875000000000000000
        1424.970238095238000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRLabel99: TQRLabel
      Left = 235
      Top = 754
      Width = 19
      Height = 16
      Size.Values = (
        30.238095238095240000
        444.122023809523800000
        1424.970238095238000000
        35.907738095238090000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'No'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRShape44: TQRShape
      Left = 256
      Top = 754
      Width = 18
      Height = 17
      Frame.Width = 5
      Size.Values = (
        32.127976190476190000
        483.809523809523800000
        1424.970238095238000000
        34.017857142857150000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRDBText22: TQRDBText
      Left = 148
      Top = 611
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        279.702380952381000000
        1154.717261904762000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ceseilt_altamedica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText24: TQRDBText
      Left = 148
      Top = 630
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        279.702380952381000000
        1190.625000000000000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ceseilt_rechazo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText33: TQRDBText
      Left = 148
      Top = 649
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        279.702380952381000000
        1226.532738095238000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'ceseilt_defuncion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText42: TQRDBText
      Left = 212
      Top = 734
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        400.654761904762000000
        1387.172619047619000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'presupincap_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText43: TQRDBText
      Left = 258
      Top = 734
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        487.589285714285700000
        1387.172619047619000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'presupincap_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText46: TQRDBText
      Left = 149
      Top = 670
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        281.592261904761900000
        1266.220238095238000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'FinTratamiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRShape18: TQRShape
      Left = 1
      Top = 772
      Width = 473
      Height = 97
      Frame.Width = 5
      Size.Values = (
        183.318452380952400000
        1.889880952380953000
        1458.988095238095000000
        893.913690476190600000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRShape19: TQRShape
      Left = 550
      Top = 772
      Width = 431
      Height = 97
      Frame.Width = 5
      Size.Values = (
        183.318452380952400000
        1039.434523809524000000
        1458.988095238095000000
        814.538690476190500000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object qrMemoNotaAlPie1: TQRMemo
      Left = 5
      Top = 776
      Width = 459
      Height = 89
      Size.Values = (
        168.199404761904800000
        9.449404761904762000
        1466.547619047619000000
        867.455357142857100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object qrMemoNotaAlPie2: TQRMemo
      Left = 554
      Top = 774
      Width = 424
      Height = 91
      Size.Values = (
        171.979166666666700000
        1046.994047619048000000
        1462.767857142857000000
        801.309523809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
    object QRLabel3: TQRLabel
      Left = 45
      Top = 943
      Width = 286
      Height = 19
      Size.Values = (
        35.907738095238100000
        85.044642857142860000
        1782.157738095238000000
        540.505952380952400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '_________________________________________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 371
      Top = 943
      Width = 278
      Height = 19
      Size.Values = (
        35.907738095238100000
        701.145833333333200000
        1782.157738095238000000
        525.386904761904800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '_________________________________________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 699
      Top = 943
      Width = 278
      Height = 19
      Size.Values = (
        35.907738095238100000
        1321.026785714286000000
        1782.157738095238000000
        525.386904761904800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '_________________________________________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 66
      Top = 963
      Width = 245
      Height = 19
      Size.Values = (
        35.907738095238090000
        124.732142857142800000
        1819.955357142857000000
        463.020833333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Lugar y fecha de la Asistencia M'#233'dica'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 400
      Top = 963
      Width = 221
      Height = 19
      Size.Values = (
        35.907738095238090000
        755.952380952380900000
        1819.955357142857000000
        417.663690476190500000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Firma y Aclaraci'#243'n del Trabajador'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 712
      Top = 963
      Width = 253
      Height = 19
      Size.Values = (
        35.907738095238090000
        1345.595238095238000000
        1819.955357142857000000
        478.139880952381000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = 'Firma y Sello M'#233'dico c/N'#176' de Matr'#237'cula'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlFecFinTratamiento: TQRLabel
      Left = 696
      Top = 467
      Width = 126
      Height = 16
      Size.Values = (
        30.238095238095240000
        1315.357142857143000000
        882.574404761904800000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '     '
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 212
      Top = 755
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        400.654761904762000000
        1426.860119047619000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestacMantenim_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText54: TQRDBText
      Left = 258
      Top = 755
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        487.589285714285700000
        1426.860119047619000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestacMantenim_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel34: TQRLabel
      Left = 0
      Top = 969
      Width = 60
      Height = 15
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        28.348214285714280000
        0.000000000000000000
        1831.294642857143000000
        113.392857142857100000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'PM-03-F009'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRDBText57: TQRDBText
      Left = 772
      Top = 562
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        1458.988095238095000000
        1062.113095238095000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestacMantenim_no'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRDBText56: TQRDBText
      Left = 715
      Top = 562
      Width = 13
      Height = 16
      Size.Values = (
        30.238095238095240000
        1351.264880952381000000
        1062.113095238095000000
        24.568452380952380000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqReporte
      DataField = 'prestacMantenim_si'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object qrlDiagnostico_raya: TQRLabel
      Left = 90
      Top = 316
      Width = 885
      Height = 19
      Size.Values = (
        35.907738095238090000
        170.089285714285700000
        597.202380952380900000
        1672.544642857143000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        '________________________________________________________________' +
        '_______________________________________________________________'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape13: TQRShape
      Left = 2
      Top = 871
      Width = 979
      Height = 32
      Frame.Width = 5
      Size.Values = (
        60.476190476190480000
        3.779761904761905000
        1646.086309523810000000
        1850.193452380952000000)
      XLColumn = 0
      Shape = qrsRectangle
      RoundFactor = 0.500000000000000000
      VertAdjust = 0
    end
    object QRMemo1: TQRMemo
      Left = 5
      Top = 874
      Width = 968
      Height = 23
      Size.Values = (
        43.467261904761900000
        9.449404761904762000
        1651.755952380952000000
        1829.404761904762000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Calibri'
      Font.Style = []
      Lines.Strings = (
        
          'En caso de existir secuelas incapacitantes resultantes del sinie' +
          'stro, la ART/EA le informar'#225' dentro de los pr'#243'ximos 20 (veinte) ' +
          'd'#237'as h'#225'biles administrativos, la fecha de audiciencia ante la Co' +
          'misi'#243'n M'#233'dica Jurisdiccional para fijar el porcentaje de la inca' +
          'pacidad laboral permanente.')
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 6
    end
  end
  object QRBand1: TQRBand
    Left = 79
    Top = 1365
    Width = 983
    Height = 24
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      45.357142857142860000
      1857.752976190476000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageFooter
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT /* Expediente */'
      
        '       art.utiles.get_fechaformatolargo(art.actualdate) AS hoy, ' +
        'tg_descripcion AS gravedad,'
      '       pe_fechabajamedica, ex_cuit, ex_cuil,'
      
        '       decode(pe_idexpediente, NULL, '#39#39', '#39'X'#39') as existe_parteegr' +
        'eso,'
      '       decode(ex_tipo, 1, '#39'X'#39', '#39#39') as ex_tipo_1,'
      '       decode(ex_tipo, 2, '#39'X'#39', '#39#39') as ex_tipo_2,'
      '       decode(ex_tipo, 3, '#39'X'#39', '#39#39') as ex_tipo_3,'
      ''
      
        '       TO_CHAR(NVL(ex_fechamanifestacion, ex_fechaaccidente), '#39'D' +
        'D'#39') as fechaacc_dia,'
      
        '       TO_CHAR(NVL(ex_fechamanifestacion, ex_fechaaccidente), '#39'M' +
        'M'#39') as fechaacc_mes,'
      
        '       TO_CHAR(NVL(ex_fechamanifestacion, ex_fechaaccidente), '#39'Y' +
        'YYY'#39') as fechaacc_ano,'
      '       ex_horaaccidente as fechaacc_hora,'
      ''
      
        '       TO_CHAR(pe_fechareconsulta, '#39'DD'#39') as fechaproxconsulta_di' +
        'a,'
      
        '       TO_CHAR(pe_fechareconsulta, '#39'MM'#39') as fechaproxconsulta_me' +
        's,'
      
        '       TO_CHAR(pe_fechareconsulta, '#39'YYYY'#39') as fechaproxconsulta_' +
        'ano,'
      ''
      
        '       TO_CHAR(pe_fechaaltamedica, '#39'DD'#39') as pe_fechaaltamedica_d' +
        'ia,'
      
        '       TO_CHAR(pe_fechaaltamedica, '#39'MM'#39') as pe_fechaaltamedica_m' +
        'es,'
      
        '       TO_CHAR(pe_fechaaltamedica, '#39'YYYY'#39') as pe_fechaaltamedica' +
        '_ano,'
      ''
      
        '       TO_CHAR(NVL(ex_bajamedica, ex_fecharecaida), '#39'DD'#39') as pe_' +
        'fechabajamedica_dia,'
      
        '       TO_CHAR(NVL(ex_bajamedica, ex_fecharecaida), '#39'MM'#39') as pe_' +
        'fechabajamedica_mes,'
      
        '       TO_CHAR(NVL(ex_bajamedica, ex_fecharecaida), '#39'YYYY'#39') as p' +
        'e_fechabajamedica_ano,'
      ''
      '       TO_CHAR(pe_fechareinicio, '#39'DD'#39') as pe_fechareinicio_dia,'
      '       TO_CHAR(pe_fechareinicio, '#39'MM'#39') as pe_fechareinicio_mes,'
      
        '       TO_CHAR(pe_fechareinicio, '#39'YYYY'#39') as pe_fechareinicio_ano' +
        ','
      ''
      
        '       decode(pe_fechareinicio, NULL, '#39' '#39', '#39'X'#39') as regresatrabaj' +
        'o_si,'
      
        '       decode(pe_idexpediente, NULL, '#39' '#39', decode(pe_fechareinici' +
        'o, NULL, '#39'X'#39', '#39' '#39')) AS regresatrabajo_no,'
      ''
      '       decode(pe_idtipodeegreso, 9, '#39'X'#39', '#39' '#39') as por_derivacion,'
      
        '       decode(pe_idtipodeegreso, 7, '#39'X'#39', '#39' '#39') as negativa_injust' +
        'ificada,'
      ''
      
        '       decode(pe_idtipodeegreso, 2, decode(pe_automatico, '#39'N'#39', '#39 +
        'X'#39', '#39' '#39'), '#39' '#39') as ceseilt_altamedica,'
      
        '       decode(pe_idtipodeegreso, 2, decode(pe_automatico, '#39'S'#39', '#39 +
        'X'#39', '#39' '#39'), '#39' '#39') as ceseilt_rechazo,'
      
        '       art.utiles.iif_compara('#39'IN'#39', NVL(pe_idtipodeegreso, -1), ' +
        #39'(4,5,6)'#39', '#39'X'#39', '#39#39') as ceseilt_defuncion,'
      ''
      '       decode(ex_recaida, 0, '#39#39', '#39'X'#39') as reagravamiento,'
      
        '       decode(ex_recaida, 0, to_date(NULL), ex_fecharecaida) as ' +
        'fecha_reagravamiento,'
      
        '       decode(ex_recaida, 0, to_date(NULL), ex_bajamedica) as fe' +
        'cha_atencionreagravamiento,'
      
        '       art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro,'
      ''
      
        '       /*art.amebpba.calcdiashabiles(NVL(pe_fechaaltamedica, ART' +
        '.ACTUALDATE), 15) as fecha_citacion_art, */'
      '       '#39'  /  /  '#39' fecha_citacion_art,'
      ''
      '       /* Empresa */'
      
        '       art.utiles.armar_domicilio(mp_calle_post, mp_numero_post,' +
        ' mp_piso_post,'
      
        '                                  mp_departamento_post) empresa_' +
        'domicilio,'
      
        '       mp_nombre empresa_nombre, mp_telefonos empresa_telefonos,' +
        ' mp_fax_post as empresa_fax,'
      
        '       mp_localidad_post empresa_localidad, mp_cpostal_post empr' +
        'esa_cpostal,'
      
        '       cpv_cmp.pv_descripcion empresa_provincia, co_direlectroni' +
        'ca,'
      '       co_contrato, ac_codigo as ciiu,'
      ''
      '       /* Trabajador */'
      '       art.utiles.armar_domicilio(tj_calle, tj_numero, tj_piso,'
      
        '                                  tj_departamento) trabajador_do' +
        'micilio,'
      '       tj_nombre,'
      '       art.trabajador.get_telefono(tj_id, 5) Telefono,'
      '       tj_localidad, tj_cpostal,'
      
        '       cpv_ctj.pv_descripcion trabajador_provincia, tj_fnacimien' +
        'to,'
      ''
      '       (SELECT tb_descripcion'
      '          FROM art.ctb_tablas'
      '         WHERE tb_clave = '#39'SEXOS'#39
      '           AND tb_codigo = tj_sexo) as sexo,'
      '           '
      '       (SELECT tb_descripcion'
      '          FROM art.ctb_tablas'
      '         WHERE tb_clave = '#39'ESTAD'#39
      '           AND tb_codigo = tj_estadocivil) as estado_civil,'
      '           '
      '       NVL((SELECT na_descripcion'
      '              FROM cna_nacionalidad'
      
        '             WHERE na_id = tj_idnacionalidad), tj_otranacionalid' +
        'ad) as nacionalidad,'
      ''
      '       /* Prestador */'
      
        '       utiles.armar_domicilio(cpr.ca_calle, cpr.ca_numero, cpr.c' +
        'a_piso,'
      
        '                              cpr.ca_departamento) prestador_dom' +
        'icilio,'
      
        '       cpr.ca_descripcion prestador_nombre, cpr.ca_telefono pres' +
        'tador_telefono,'
      
        '       cpr.ca_clave as prestador_cuit, cpr.ca_localidad as prest' +
        'ador_localidad,'
      
        '       cpv_cmp.pv_descripcion prestador_provincia, ca_fax as pre' +
        'stador_fax,'
      '       ca_codpostal, ca_direlectronica,'
      ''
      '       /* Partes */'
      
        '       LPAD('#39' '#39', 64, '#39' '#39') || '#39'Diagn'#243'stico: '#39' || pe_diagnostico |' +
        '| '#39'. Tratamiento: '#39' || pe_trataminstitucion || '#39' '#39' || pe_tratamu' +
        'bicacion as pe_diagnostico,'
      
        '       LPAD('#39' '#39', 54, '#39' '#39') || pe_observaciones as pe_observacione' +
        's,'
      ''
      
        '       DECODE(pe_presupincapacidad, '#39'?'#39', '#39' '#39', DECODE(pe_presupin' +
        'capacidad, '#39'S'#39', '#39'X'#39', '#39'N'#39', '#39' '#39', '#39' '#39')) presupincap_si,'
      
        '       DECODE(pe_presupincapacidad, '#39'?'#39', '#39' '#39', DECODE(pe_presupin' +
        'capacidad, '#39'S'#39', '#39' '#39', '#39'N'#39', '#39'X'#39', '#39' '#39')) presupincap_no,'
      ''
      
        '       DECODE(pe_recalificacion, '#39'S'#39', '#39'X'#39', '#39'N'#39', '#39' '#39', '#39' '#39') as rec' +
        'alificacion_si,'
      
        '       DECODE(pe_recalificacion, '#39'S'#39', '#39' '#39', '#39'N'#39', '#39'X'#39', '#39' '#39') as rec' +
        'alificacion_no,'
      ''
      '       pe_fecharecepcion, pe_historiaclinica,'
      ''
      
        '       DECODE(pe_obrasocial, '#39'S'#39', '#39'Obra Social'#39', '#39'N'#39', '#39'-'#39', '#39'No s' +
        'e especifica'#39') derivado_obra_social'
      '       '
      '  FROM sex_expedientes sex, art.cpr_prestador cpr, cmp_empresas,'
      '       cac_actividad, aco_contrato, ctj_trabajador,'
      
        '       cpv_provincias cpv_cpr, cpv_provincias cpv_cmp, cpv_provi' +
        'ncias cpv_ctj,'
      
        '       SIN.stg_tipogravedad, SIN.spe_partedeegreso, SIN.sde_denu' +
        'ncia'
      ' WHERE ex_id = :idexpediente'
      '   AND cpv_cmp.pv_codigo(+) = mp_provincia_post'
      '   AND cpv_ctj.pv_codigo(+) = tj_provincia'
      '   AND cpv_cpr.pv_codigo(+) = ca_provincia'
      
        '   AND cpr.ROWID(+) = art.SIN.get_prestadorid(ex_siniestro, ex_o' +
        'rden, ex_recaida)'
      '   AND tg_codigo(+) = ex_gravedad'
      '   AND mp_cuit = ex_cuit'
      '   AND tj_cuil = ex_cuil'
      '   AND pe_idexpediente(+) = ex_id'
      '   AND de_idexpediente(+) = ex_id'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(ex_cuit,' +
        ' ex_fechaaccidente)'
      '   AND co_idactividad = ac_id')
    Left = 16
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEXPEDIENTE'
        ParamType = ptInput
        Value = 0
      end>
  end
end
