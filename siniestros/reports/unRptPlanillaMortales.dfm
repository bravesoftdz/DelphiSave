object rptPlanillaMortales: TrptPlanillaMortales
  Left = 500
  Top = 80
  Caption = 'rptPlanillaMortales'
  ClientHeight = 694
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptPlanilla: TQuickRep
    Left = 0
    Top = 0
    Width = 571
    Height = 739
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
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
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
    Zoom = 70
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRLabel2: TQRLabel
      Left = 45
      Top = 84
      Width = 36
      Height = 13
      Size.Values = (
        49.136904761904760000
        170.089285714285700000
        317.500000000000000000
        136.071428571428600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestro'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 45
      Top = 98
      Width = 46
      Height = 13
      Size.Values = (
        49.136904761904760000
        170.089285714285700000
        370.416666666666700000
        173.869047619047600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha acc.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 45
      Top = 112
      Width = 44
      Height = 13
      Size.Values = (
        49.136904761904760000
        170.089285714285700000
        423.333333333333300000
        166.309523809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Empleador'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 45
      Top = 126
      Width = 50
      Height = 13
      Size.Values = (
        49.136904761904760000
        170.089285714285700000
        476.250000000000000000
        188.988095238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Damnificado'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 45
      Top = 140
      Width = 54
      Height = 13
      Size.Values = (
        49.136904761904760000
        170.089285714285700000
        529.166666666666700000
        204.107142857142900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha recep.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 45
      Top = 160
      Width = 253
      Height = 15
      Size.Values = (
        56.696428571428570000
        170.089285714285700000
        604.761904761904800000
        956.279761904761900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Evaluaci'#243'n del siniestro por el '#225'rea de an'#225'lisis y gesti'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 11
    end
    object QRShape1: TQRShape
      Left = 45
      Top = 174
      Width = 482
      Height = 191
      Size.Values = (
        722.312500000000000000
        169.333333333333300000
        656.166666666666800000
        1822.979166666667000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel8: TQRLabel
      Left = 52
      Top = 178
      Width = 53
      Height = 13
      Size.Values = (
        49.136904761904760000
        196.547619047619000000
        672.797619047619000000
        200.327380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Breve rese'#241'a'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmResena: TQRMemo
      Left = 56
      Top = 196
      Width = 454
      Height = 40
      Size.Values = (
        150.812500000000000000
        211.666666666666700000
        740.833333333333400000
        1717.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 52
      Top = 239
      Width = 46
      Height = 13
      Size.Values = (
        49.136904761904760000
        196.547619047619000000
        903.363095238095200000
        173.869047619047600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Conclusi'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmConclusion: TQRMemo
      Left = 56
      Top = 256
      Width = 454
      Height = 40
      Size.Values = (
        150.812500000000000000
        211.666666666666700000
        968.375000000000000000
        1717.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 9
    end
    object QRLabel11: TQRLabel
      Left = 56
      Top = 369
      Width = 32
      Height = 13
      Size.Values = (
        49.136904761904760000
        211.666666666666700000
        1394.732142857143000000
        120.952380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 56
      Top = 384
      Width = 26
      Height = 13
      Size.Values = (
        49.136904761904760000
        211.666666666666700000
        1451.428571428571000000
        98.273809523809520000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape2: TQRShape
      Left = 45
      Top = 420
      Width = 482
      Height = 79
      Size.Values = (
        298.979166666666700000
        169.333333333333300000
        1587.500000000000000000
        1822.979166666667000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape3: TQRShape
      Left = 280
      Top = 420
      Width = 1
      Height = 79
      Size.Values = (
        298.979166666666700000
        1058.333333333333000000
        1587.500000000000000000
        2.645833333333333000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel13: TQRLabel
      Left = 45
      Top = 405
      Width = 127
      Height = 15
      Size.Values = (
        56.696428571428570000
        170.089285714285700000
        1530.803571428571000000
        480.029761904761900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Evaluaci'#243'n por '#225'rea m'#233'dica'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 11
    end
    object QRLabel14: TQRLabel
      Left = 286
      Top = 405
      Width = 159
      Height = 15
      Size.Values = (
        56.696428571428570000
        1081.011904761905000000
        1530.803571428571000000
        600.982142857142900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Evaluaci'#243'n por gerencia de legales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 11
    end
    object qrmAMedica: TQRMemo
      Left = 52
      Top = 424
      Width = 223
      Height = 69
      Size.Values = (
        261.937500000000000000
        198.437500000000000000
        1603.375000000000000000
        844.020833333333500000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrmLegales: TQRMemo
      Left = 285
      Top = 424
      Width = 237
      Height = 69
      Size.Values = (
        261.937500000000000000
        1076.854166666667000000
        1603.375000000000000000
        894.291666666666800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 52
      Top = 300
      Width = 133
      Height = 13
      Size.Values = (
        49.136904761904760000
        196.547619047619000000
        1133.928571428571000000
        502.708333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Sugerencia estudio investigaci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmSugerencia: TQRMemo
      Left = 56
      Top = 316
      Width = 454
      Height = 40
      Size.Values = (
        150.812500000000000000
        211.666666666666700000
        1195.916666666667000000
        1717.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 9
    end
    object qrlSiniestro: TQRLabel
      Left = 106
      Top = 84
      Width = 46
      Height = 13
      Size.Values = (
        49.136904761904760000
        400.654761904761900000
        317.500000000000000000
        173.869047619047600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlSiniestro'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFAcc: TQRLabel
      Left = 106
      Top = 98
      Width = 32
      Height = 13
      Size.Values = (
        49.136904761904760000
        400.654761904761900000
        370.416666666666700000
        120.952380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFAcc'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlEmpleador: TQRLabel
      Left = 106
      Top = 112
      Width = 54
      Height = 13
      Size.Values = (
        49.136904761904760000
        400.654761904761900000
        423.333333333333300000
        204.107142857142900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlEmpleador'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDamnificado: TQRLabel
      Left = 106
      Top = 126
      Width = 60
      Height = 13
      Size.Values = (
        49.136904761904760000
        400.654761904761900000
        476.250000000000000000
        226.785714285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlDamnificado'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFRecep: TQRLabel
      Left = 106
      Top = 140
      Width = 42
      Height = 13
      Size.Values = (
        49.136904761904760000
        400.654761904761900000
        529.166666666666700000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFRecep'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFirmaAyG: TQRLabel
      Left = 91
      Top = 369
      Width = 52
      Height = 13
      Size.Values = (
        49.136904761904760000
        343.958333333333300000
        1394.732142857143000000
        196.547619047619000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFirmaAyG'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaAyG: TQRLabel
      Left = 91
      Top = 384
      Width = 54
      Height = 13
      Size.Values = (
        49.136904761904760000
        343.958333333333300000
        1451.428571428571000000
        204.107142857142900000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaAyG'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 56
      Top = 505
      Width = 32
      Height = 13
      Size.Values = (
        49.136904761904760000
        211.666666666666700000
        1908.779761904762000000
        120.952380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 56
      Top = 519
      Width = 26
      Height = 13
      Size.Values = (
        49.136904761904760000
        211.666666666666700000
        1961.696428571429000000
        98.273809523809520000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFirmaAmed: TQRLabel
      Left = 91
      Top = 505
      Width = 57
      Height = 13
      Size.Values = (
        49.136904761904760000
        343.958333333333300000
        1908.779761904762000000
        215.446428571428600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFirmaAmed'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaAMed: TQRLabel
      Left = 91
      Top = 519
      Width = 60
      Height = 13
      Size.Values = (
        49.136904761904760000
        343.958333333333300000
        1961.696428571429000000
        226.785714285714300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaAMed'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel24: TQRLabel
      Left = 294
      Top = 505
      Width = 32
      Height = 13
      Size.Values = (
        49.136904761904760000
        1111.250000000000000000
        1908.779761904762000000
        120.952380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel25: TQRLabel
      Left = 294
      Top = 519
      Width = 26
      Height = 13
      Size.Values = (
        49.136904761904760000
        1111.250000000000000000
        1961.696428571429000000
        98.273809523809520000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFirmaLegales: TQRLabel
      Left = 329
      Top = 505
      Width = 65
      Height = 13
      Size.Values = (
        49.136904761904760000
        1243.541666666667000000
        1908.779761904762000000
        245.684523809523800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFirmaLegales'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaLegales: TQRLabel
      Left = 329
      Top = 519
      Width = 67
      Height = 13
      Size.Values = (
        49.136904761904760000
        1243.541666666667000000
        1961.696428571429000000
        253.244047619047600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaLegales'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel22: TQRLabel
      Left = 45
      Top = 545
      Width = 246
      Height = 15
      Size.Values = (
        56.696428571428570000
        170.089285714285700000
        2059.970238095238000000
        929.821428571428600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Conclusi'#243'n final Gerencia de Prestaciones y Servicios'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 11
    end
    object QRShape4: TQRShape
      Left = 45
      Top = 562
      Width = 482
      Height = 48
      Size.Values = (
        181.901041666666700000
        168.671875000000000000
        2123.281250000000000000
        1822.317708333333000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrmPyS: TQRMemo
      Left = 52
      Top = 565
      Width = 469
      Height = 39
      Size.Values = (
        148.828125000000000000
        198.437500000000000000
        2136.510416666667000000
        1772.708333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 56
      Top = 615
      Width = 32
      Height = 13
      Size.Values = (
        49.136904761904760000
        211.666666666666700000
        2324.553571428571000000
        120.952380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFirmaPys: TQRLabel
      Left = 91
      Top = 615
      Width = 50
      Height = 13
      Size.Values = (
        49.136904761904760000
        343.958333333333300000
        2324.553571428571000000
        188.988095238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFirmaPys'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel27: TQRLabel
      Left = 56
      Top = 630
      Width = 26
      Height = 13
      Size.Values = (
        49.136904761904760000
        211.666666666666700000
        2381.250000000000000000
        98.273809523809520000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaPyS: TQRLabel
      Left = 91
      Top = 630
      Width = 53
      Height = 13
      Size.Values = (
        49.136904761904760000
        343.958333333333300000
        2381.250000000000000000
        200.327380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaPyS'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object TitleBand1: TQRBand
      Left = 26
      Top = 26
      Width = 518
      Height = 52
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        196.547619047619000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 148
        Top = 24
        Width = 232
        Height = 23
        Size.Values = (
          86.934523809523810000
          559.404761904761900000
          90.714285714285710000
          876.904761904761900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cobertura de acc. mortales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object qriLogo: TQRImage
        Left = 401
        Top = 4
        Width = 114
        Height = 45
        Size.Values = (
          170.089285714285700000
          1515.684523809524000000
          15.119047619047620000
          430.892857142857100000)
        XLColumn = 0
        Stretch = True
      end
    end
    object QRLabel15: TQRLabel
      Left = 166
      Top = 384
      Width = 29
      Height = 13
      Size.Values = (
        49.136904761904760000
        627.440476190476200000
        1451.428571428571000000
        109.613095238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlAccionAyG: TQRLabel
      Left = 201
      Top = 384
      Width = 57
      Height = 13
      Size.Values = (
        49.136904761904760000
        759.732142857142900000
        1451.428571428571000000
        215.446428571428600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlAccionAyG'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel26: TQRLabel
      Left = 166
      Top = 519
      Width = 29
      Height = 13
      Size.Values = (
        49.136904761904760000
        627.440476190476200000
        1961.696428571429000000
        109.613095238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlAccionAmed: TQRLabel
      Left = 201
      Top = 519
      Width = 62
      Height = 13
      Size.Values = (
        49.136904761904760000
        759.732142857142900000
        1961.696428571429000000
        234.345238095238100000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlAccionAmed'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel29: TQRLabel
      Left = 411
      Top = 519
      Width = 29
      Height = 13
      Size.Values = (
        49.136904761904760000
        1553.482142857143000000
        1961.696428571429000000
        109.613095238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlAccionLegales: TQRLabel
      Left = 446
      Top = 519
      Width = 70
      Height = 13
      Size.Values = (
        49.136904761904760000
        1685.773809523810000000
        1961.696428571429000000
        264.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlAccionLegales'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel31: TQRLabel
      Left = 166
      Top = 630
      Width = 29
      Height = 13
      Size.Values = (
        49.136904761904760000
        627.440476190476200000
        2381.250000000000000000
        109.613095238095200000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlAccionPyS: TQRLabel
      Left = 201
      Top = 630
      Width = 53
      Height = 13
      Size.Values = (
        49.136904761904760000
        759.732142857142900000
        2381.250000000000000000
        200.327380952381000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaPyS'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object QRLabel16: TQRLabel
    Left = 85
    Top = 741
    Width = 37
    Height = 19
    Size.Values = (
      50.270833333333330000
      224.895833333333300000
      1960.562500000000000000
      97.895833333333340000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fecha'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRLabel17: TQRLabel
    Left = 135
    Top = 741
    Width = 86
    Height = 19
    Size.Values = (
      50.270833333333330000
      357.187500000000000000
      1960.562500000000000000
      227.541666666666700000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'qrlFechaAMed'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRLabel18: TQRLabel
    Left = 425
    Top = 741
    Width = 37
    Height = 19
    Size.Values = (
      50.270833333333330000
      1124.479166666667000000
      1960.562500000000000000
      97.895833333333340000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fecha'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object QRLabel19: TQRLabel
    Left = 475
    Top = 741
    Width = 96
    Height = 19
    Size.Values = (
      50.270833333333330000
      1256.770833333333000000
      1960.562500000000000000
      254.000000000000000000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'qrlFechaLegales'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 10
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ha_breveresenia, ha_conclusion, ha_sugerencia, ha_observa' +
        'ciones, trunc(ha_fechaalta) ha_fechaalta, ha_usualta, se_nombre,' +
        ' am_descripcion'
      
        '  FROM din.dcm_casosmortales, din.dha_historicoacciones b, art.u' +
        'se_usuarios, din.dam_accionesmortales'
      ' WHERE cm_id = :idcaso'
      '   AND ha_idcaso = cm_id'
      '   AND ha_idsector = :idsector'
      '   AND ha_id = (SELECT MAX(ha_id)'
      '                  FROM din.dha_historicoacciones'
      '                 WHERE ha_idsector = b.ha_idsector'
      '                   AND ha_idcaso = b.ha_idcaso)'
      '   AND se_usuario = ha_usualta'
      '   AND ha_idaccion = am_id')
    Left = 8
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcaso'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsector'
        ParamType = ptInput
      end>
  end
  object sdqSiniestro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT art.siniestro.get_siniestrocompleto(cm_idexpediente) sini' +
        'estro, ex_fechaaccidente, '
      '             tj_nombre, em_nombre, ex_fecharecepcion, ex_id'
      
        '  FROM din.dcm_casosmortales, art.sex_expedientes, comunes.ctj_t' +
        'rabajador, afi.aem_empresa'
      ' WHERE cm_id = :idcaso'
      '   AND ex_id = cm_idexpediente'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_cuit = em_cuit')
    Left = 56
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcaso'
        ParamType = ptInput
      end>
  end
end
