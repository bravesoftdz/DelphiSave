object Rpt531: TRpt531
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
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
    0.000000000000000000
    2794.000000000000000000
    25.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 2
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
  object QRBCabecera: TQRBand
    Left = 38
    Top = 9
    Width = 740
    Height = 207
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      547.687500000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbTitle
    object QRLabel9: TQRLabel
      Left = 12
      Top = 81
      Width = 63
      Height = 15
      Size.Values = (
        39.687500000000000000
        31.750000000000000000
        214.312500000000000000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'EXPEDIENTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 11
      Top = 96
      Width = 84
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        254.000000000000000000
        222.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'N'#186' LIQUIDACI'#211'N'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 126
      Top = 81
      Width = 53
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        214.312500000000000000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoStretch = True
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'SINIESTRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 126
      Top = 96
      Width = 66
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        254.000000000000000000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_NUMLIQUI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrdbContrato: TQRDBText
      Left = 126
      Top = 117
      Width = 88
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        309.562500000000000000
        232.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'EX_CONTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 126
      Top = 147
      Width = 64
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        388.937500000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'EM_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrdbCuit: TQRDBText
      Left = 126
      Top = 132
      Width = 88
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        349.250000000000000000
        232.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'CUIT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlCuit: TQRLabel
      Left = 11
      Top = 132
      Width = 38
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        349.250000000000000000
        100.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'C.U.I.T.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlEmpDep: TQRLabel
      Left = 11
      Top = 147
      Width = 52
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        388.937500000000000000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'EMPRESA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlContrato: TQRLabel
      Left = 11
      Top = 117
      Width = 89
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        309.562500000000000000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'CONTRATO NRO.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 11
      Top = 183
      Width = 78
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        484.187500000000000000
        206.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ACCIDENTADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 126
      Top = 183
      Width = 61
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        484.187500000000000000
        161.395833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'TJ_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 126
      Top = 167
      Width = 23
      Height = 15
      Size.Values = (
        39.687500000000000000
        333.375000000000000000
        441.854166666666700000
        60.854166666666660000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'CUIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel15: TQRLabel
      Left = 11
      Top = 168
      Width = 38
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        444.500000000000000000
        100.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C.U.I.L.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 440
      Top = 168
      Width = 99
      Height = 15
      Size.Values = (
        39.687500000000000000
        1164.166666666667000000
        444.500000000000000000
        261.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'FECHA ACCIDENTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 579
      Top = 168
      Width = 36
      Height = 15
      Size.Values = (
        39.687500000000000000
        1531.937500000000000000
        444.500000000000000000
        95.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoStretch = True
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'FHACC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 440
      Top = 183
      Width = 125
      Height = 15
      Size.Values = (
        39.687500000000000000
        1164.166666666667000000
        484.187500000000000000
        330.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'FECHA FALLECIMIENTO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 579
      Top = 183
      Width = 86
      Height = 15
      Size.Values = (
        39.687500000000000000
        1531.937500000000000000
        484.187500000000000000
        227.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'EX_ALTAMEDICA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 440
      Top = 77
      Width = 99
      Height = 15
      Size.Values = (
        39.687500000000000000
        1164.166666666667000000
        203.729166666666700000
        261.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'FECHA DE EMISI'#211'N'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 440
      Top = 91
      Width = 114
      Height = 15
      Size.Values = (
        39.687500000000000000
        1164.166666666667000000
        240.770833333333300000
        301.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'TIPO DE LIQUIDACI'#211'N'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 579
      Top = 93
      Width = 126
      Height = 15
      Size.Values = (
        39.687500000000000000
        1531.937500000000000000
        246.062500000000000000
        333.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Anticipo de Renta Vitalicia'
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
    object QRDBText4: TQRDBText
      Left = 579
      Top = 78
      Width = 74
      Height = 15
      Size.Values = (
        39.687500000000000000
        1531.937500000000000000
        206.375000000000000000
        195.791666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_FPROCESO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 12
      Top = 49
      Width = 556
      Height = 17
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        129.645833333333300000
        1471.083333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'INDEMNIZACION POR ANTICIPO DE RENTA VITALICIA'
      Color = clScrollBar
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
    object QRLabel44: TQRLabel
      Left = 440
      Top = 151
      Width = 89
      Height = 15
      Size.Values = (
        39.687500000000000000
        1164.166666666667000000
        399.520833333333300000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'TIPO ACCIDENTE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText26: TQRDBText
      Left = 579
      Top = 151
      Width = 79
      Height = 15
      Size.Values = (
        39.687500000000000000
        1531.937500000000000000
        399.520833333333300000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoStretch = True
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'TIPOACCIDENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object QRBTitulos1: TQRBand
    Left = 38
    Top = 216
    Width = 740
    Height = 31
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBCabecera
    Size.Values = (
      82.020833333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupHeader
    object QRShape1: TQRShape
      Left = 8
      Top = 0
      Width = 449
      Height = 31
      Size.Values = (
        81.028645833333300000
        21.497395833333300000
        0.000000000000000000
        1187.317708333330000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel1: TQRLabel
      Left = 11
      Top = 15
      Width = 44
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        39.687500000000000000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 104
      Top = 15
      Width = 24
      Height = 15
      Size.Values = (
        39.687500000000000000
        275.166666666666700000
        39.687500000000000000
        63.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'D'#237'as'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 157
      Top = 15
      Width = 110
      Height = 15
      Size.Values = (
        39.687500000000000000
        415.395833333333300000
        39.687500000000000000
        291.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Informado Empresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel6: TQRLabel
      Left = 386
      Top = 15
      Width = 39
      Height = 15
      Size.Values = (
        39.687500000000000000
        1021.291666666667000000
        39.687500000000000000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'MOPRE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 13
      Top = 1
      Width = 439
      Height = 15
      Size.Values = (
        39.687500000000000000
        34.726562500000000000
        3.307291666666670000
        1160.859375000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Remuneraciones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel45: TQRLabel
      Left = 278
      Top = 15
      Width = 88
      Height = 15
      Size.Values = (
        39.687500000000000000
        735.541666666666600000
        39.687500000000000000
        232.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Informado D.G.I.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape12: TQRShape
      Left = 468
      Top = 5
      Width = 264
      Height = 23
      Size.Values = (
        60.854166666666680000
        1238.250000000000000000
        13.229166666666670000
        698.500000000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel24: TQRLabel
      Left = 473
      Top = 8
      Width = 149
      Height = 17
      Size.Values = (
        44.979166666666670000
        1251.479166666667000000
        21.166666666666670000
        394.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'R'#233'gimen de jubilaci'#243'n:'
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
    object QRDBText16: TQRDBText
      Left = 626
      Top = 12
      Width = 11
      Height = 11
      Size.Values = (
        29.104166666666670000
        1656.291666666667000000
        31.750000000000000000
        29.104166666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqConsulta4
      DataField = 'JU'
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
  object QRSubDetail1: TQRSubDetail
    Left = 38
    Top = 247
    Width = 740
    Height = 16
    AfterPrint = QRSubDetail1AfterPrint
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBTitulos1
    Size.Values = (
      42.333333333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Master = Owner
    DataSet = sdqConsulta1
    FooterBand = QRFooter1
    HeaderBand = QRBTitulos1
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText2: TQRDBText
      Left = 64
      Top = 0
      Width = 64
      Height = 16
      Size.Values = (
        42.333333333333340000
        169.333333333333300000
        0.000000000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqConsulta1
      DataField = 'RS_DIASPER'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 182
      Top = 0
      Width = 66
      Height = 16
      Size.Values = (
        42.333333333333340000
        481.541666666666700000
        0.000000000000000000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqConsulta1
      DataField = 'RS_IMPOMES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 359
      Top = 0
      Width = 75
      Height = 16
      Size.Values = (
        42.333333333333340000
        949.854166666666600000
        0.000000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqConsulta1
      DataField = 'RS_IMPOAMPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 14
      Top = 0
      Width = 69
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        0.000000000000000000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqConsulta1
      DataField = 'RS_PERSALA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 452
      Top = -1
      Width = 9
      Height = 19
      Size.Values = (
        50.270833333333300000
        1195.916666666670000000
        -2.645833333333330000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape2: TQRShape
      Left = 4
      Top = -2
      Width = 9
      Height = 21
      Size.Values = (
        55.562500000000000000
        10.583333333333300000
        -5.291666666666670000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText30: TQRDBText
      Left = 283
      Top = 0
      Width = 66
      Height = 16
      Size.Values = (
        42.333333333333340000
        748.770833333333400000
        0.000000000000000000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      DataSet = sdqConsulta1
      DataField = 'NR_REMIMSS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object QRFooter1: TQRBand
    Left = 38
    Top = 263
    Width = 740
    Height = 23
    AlignToBottom = False
    BeforePrint = QRFooter1BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRSubDetail1
    Size.Values = (
      60.854166666666660000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupFooter
    object QRShape4: TQRShape
      Left = 8
      Top = 0
      Width = 449
      Height = 20
      Size.Values = (
        52.916666666666700000
        21.166666666666700000
        0.000000000000000000
        1187.979166666670000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel8: TQRLabel
      Left = 11
      Top = 1
      Width = 42
      Height = 15
      Size.Values = (
        39.687500000000000000
        29.104166666666670000
        2.645833333333333000
        111.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Totales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object TotDias: TQRLabel
      Left = 104
      Top = 1
      Width = 24
      Height = 15
      Size.Values = (
        39.687500000000000000
        275.166666666666700000
        2.645833333333333000
        63.500000000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'd'#237'as'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object TotEmpresa: TQRLabel
      Left = 158
      Top = 1
      Width = 88
      Height = 15
      Size.Values = (
        39.687500000000000000
        418.041666666666700000
        2.645833333333333000
        232.833333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'Informado D.G.I.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object TotMOPRE: TQRLabel
      Left = 394
      Top = 1
      Width = 39
      Height = 15
      Size.Values = (
        39.687500000000000000
        1042.458333333333000000
        2.645833333333333000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'MOPRE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object TotDGI: TQRLabel
      Left = 260
      Top = 1
      Width = 88
      Height = 15
      Size.Values = (
        39.687500000000000000
        687.916666666666600000
        2.645833333333333000
        232.833333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = 'Informado D.G.I.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
  end
  object QRBTitulos2: TQRBand
    Left = 38
    Top = 286
    Width = 740
    Height = 42
    AfterPrint = QRBTitulos2AfterPrint
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBCabecera
    Size.Values = (
      111.125000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupHeader
    object QRShape5: TQRShape
      Left = 8
      Top = 0
      Width = 449
      Height = 42
      Size.Values = (
        111.125000000000000000
        21.166666666666700000
        0.000000000000000000
        1187.979166666670000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel18: TQRLabel
      Left = 14
      Top = 24
      Width = 53
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        63.500000000000000000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Anticipo'
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
    object QRLabel23: TQRLabel
      Left = 279
      Top = 24
      Width = 50
      Height = 17
      Size.Values = (
        44.979166666666670000
        738.187500000000000000
        63.500000000000000000
        132.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Importe'
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
    object QRLabel25: TQRLabel
      Left = 13
      Top = 2
      Width = 439
      Height = 17
      Size.Values = (
        44.979166666666700000
        34.395833333333300000
        5.291666666666670000
        1161.520833333330000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'ANTICIPOS LIQUIDADOS'
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
    object QRShape10: TQRShape
      Left = 10
      Top = 21
      Width = 446
      Height = 1
      Size.Values = (
        2.645833333333330000
        26.458333333333300000
        55.562500000000000000
        1180.041666666670000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape11: TQRShape
      Left = 133
      Top = 21
      Width = 9
      Height = 20
      Size.Values = (
        52.916666666666700000
        351.895833333333000000
        55.562500000000000000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object QRSubDetail2: TQRSubDetail
    Left = 38
    Top = 328
    Width = 740
    Height = 17
    AlignToBottom = False
    BeforePrint = QRSubDetail2BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBTitulos2
    Size.Values = (
      44.979166666666670000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Master = Owner
    DataSet = sdqConsulta3
    FooterBand = QRFooter2
    HeaderBand = QRBTitulos2
    PrintBefore = False
    PrintIfEmpty = False
    object QRDBText17: TQRDBText
      Left = 156
      Top = 0
      Width = 297
      Height = 17
      Size.Values = (
        44.979166666666700000
        412.750000000000000000
        0.000000000000000000
        785.812500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta3
      DataField = 'IMPORPERI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRShape7: TQRShape
      Left = 452
      Top = -1
      Width = 9
      Height = 19
      Size.Values = (
        50.270833333333300000
        1195.916666666670000000
        -2.645833333333330000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape6: TQRShape
      Left = 4
      Top = -1
      Width = 9
      Height = 19
      Size.Values = (
        50.270833333333300000
        10.583333333333300000
        -2.645833333333330000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape9: TQRShape
      Left = 133
      Top = -1
      Width = 9
      Height = 20
      Size.Values = (
        52.916666666666700000
        351.895833333333000000
        -2.645833333333330000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText15: TQRDBText
      Left = 14
      Top = 0
      Width = 84
      Height = 17
      Size.Values = (
        44.979166666666700000
        37.041666666666700000
        0.000000000000000000
        222.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta3
      DataField = 'LE_NUMLIQUI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object QRFooter2: TQRBand
    Left = 38
    Top = 345
    Width = 740
    Height = 28
    AlignToBottom = False
    BeforePrint = QRFooter2BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      74.083333333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupFooter
    object QRShape8: TQRShape
      Left = 8
      Top = 0
      Width = 449
      Height = 21
      Size.Values = (
        55.562500000000000000
        21.166666666666700000
        0.000000000000000000
        1187.979166666670000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel20: TQRLabel
      Left = 14
      Top = 1
      Width = 47
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        2.645833333333333000
        124.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Totales'
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
    object lblTotalRemun: TQRLabel
      Left = 152
      Top = 2
      Width = 297
      Height = 17
      Size.Values = (
        44.979166666666700000
        402.166666666667000000
        5.291666666666670000
        785.812500000000000000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
  end
  object QRBTitulos3: TQRBand
    Left = 38
    Top = 373
    Width = 740
    Height = 113
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      298.979166666666700000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupHeader
    object QRShape14: TQRShape
      Left = 8
      Top = 73
      Width = 724
      Height = 39
      Size.Values = (
        103.187500000000000000
        21.166666666666670000
        193.145833333333300000
        1915.583333333333000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel28: TQRLabel
      Left = 13
      Top = 76
      Width = 716
      Height = 17
      Size.Values = (
        44.979166666666670000
        34.395833333333340000
        201.083333333333300000
        1894.416666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Beneficiarios de la Indemnizaci'#243'n por Fallecimiento'
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
    object QRShape15: TQRShape
      Left = 9
      Top = 93
      Width = 723
      Height = 1
      Size.Values = (
        2.645833333333333000
        23.812500000000000000
        246.062500000000000000
        1912.937500000000000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape16: TQRShape
      Left = 382
      Top = 94
      Width = 3
      Height = 19
      Size.Values = (
        50.270833333333330000
        1010.708333333333000000
        248.708333333333300000
        7.937500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel26: TQRLabel
      Left = 13
      Top = 95
      Width = 181
      Height = 15
      Size.Values = (
        39.687500000000000000
        34.395833333333340000
        251.354166666666700000
        478.895833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Nombre y Apellido'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel27: TQRLabel
      Left = 421
      Top = 95
      Width = 60
      Height = 15
      Size.Values = (
        39.687500000000000000
        1113.895833333333000000
        251.354166666666700000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Car'#225'cter'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 532
      Top = 95
      Width = 91
      Height = 15
      Size.Values = (
        39.687500000000000000
        1407.583333333333000000
        251.354166666666700000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'F. Nacimiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel32: TQRLabel
      Left = 650
      Top = 95
      Width = 71
      Height = 15
      Size.Values = (
        39.687500000000000000
        1719.791666666667000000
        251.354166666666700000
        187.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '% Corresp.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape25: TQRShape
      Left = 516
      Top = 94
      Width = 9
      Height = 19
      Size.Values = (
        50.270833333333330000
        1365.250000000000000000
        248.708333333333300000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape26: TQRShape
      Left = 632
      Top = 94
      Width = 9
      Height = 19
      Size.Values = (
        50.270833333333330000
        1672.166666666667000000
        248.708333333333300000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel46: TQRLabel
      Left = 285
      Top = 95
      Width = 94
      Height = 15
      Size.Values = (
        39.687500000000000000
        754.062500000000000000
        251.354166666666700000
        248.708333333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Nro. Documento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape39: TQRShape
      Left = 271
      Top = 94
      Width = 9
      Height = 19
      Size.Values = (
        50.270833333333330000
        717.020833333333400000
        248.708333333333300000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape13: TQRShape
      Left = 8
      Top = 4
      Width = 724
      Height = 42
      Size.Values = (
        111.125000000000000000
        21.166666666666670000
        10.583333333333330000
        1915.583333333333000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel33: TQRLabel
      Left = 13
      Top = 8
      Width = 79
      Height = 17
      Size.Values = (
        44.979166666666670000
        34.395833333333340000
        21.166666666666670000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Base Diaria:'
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
    object QRLabel34: TQRLabel
      Left = 12
      Top = 26
      Width = 96
      Height = 17
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        68.791666666666680000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Base Mensual:'
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
    object QRShape18: TQRShape
      Left = 279
      Top = 5
      Width = 1
      Height = 40
      Size.Values = (
        105.833333333333300000
        738.187500000000000000
        13.229166666666670000
        2.645833333333333000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel36: TQRLabel
      Left = 285
      Top = 8
      Width = 91
      Height = 17
      Size.Values = (
        44.979166666666670000
        754.062500000000000000
        21.166666666666670000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Fecha Desde:'
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
    object QRLabel35: TQRLabel
      Left = 456
      Top = 8
      Width = 86
      Height = 17
      Size.Values = (
        44.979166666666670000
        1206.500000000000000000
        21.166666666666670000
        227.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Fecha Hasta:'
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
    object QRLabel38: TQRLabel
      Left = 625
      Top = 9
      Width = 79
      Height = 17
      Size.Values = (
        44.979166666666670000
        1653.645833333333000000
        23.812500000000000000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Per'#237'odo'
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
    object QRLabel37: TQRLabel
      Left = 284
      Top = 25
      Width = 97
      Height = 17
      Size.Values = (
        44.979166666666670000
        751.416666666666800000
        66.145833333333340000
        256.645833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'F. Nacimiento:'
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
    object QRLabel39: TQRLabel
      Left = 500
      Top = 25
      Width = 40
      Height = 17
      Size.Values = (
        44.979166666666670000
        1322.916666666667000000
        66.145833333333340000
        105.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Edad:'
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
    object QRDBText27: TQRDBText
      Left = 376
      Top = 10
      Width = 73
      Height = 15
      Size.Values = (
        39.687500000000000000
        994.833333333333400000
        26.458333333333330000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_FECHADES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText28: TQRDBText
      Left = 543
      Top = 10
      Width = 75
      Height = 15
      Size.Values = (
        39.687500000000000000
        1436.687500000000000000
        26.458333333333330000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_FECHAHAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText32: TQRDBText
      Left = 380
      Top = 27
      Width = 85
      Height = 15
      Size.Values = (
        39.687500000000000000
        1005.416666666667000000
        71.437500000000000000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'TJ_FNACIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText33: TQRDBText
      Left = 543
      Top = 27
      Width = 57
      Height = 15
      Size.Values = (
        39.687500000000000000
        1436.687500000000000000
        71.437500000000000000
        150.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'EDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object LblBDiaria: TQRLabel
      Left = 109
      Top = 10
      Width = 79
      Height = 17
      Size.Values = (
        44.979166666666670000
        288.395833333333400000
        26.458333333333330000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Base Diaria:'
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
    object LblBMensual: TQRLabel
      Left = 109
      Top = 28
      Width = 96
      Height = 17
      Size.Values = (
        44.979166666666670000
        288.395833333333400000
        74.083333333333340000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Base Mensual:'
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
    object qrlPeriodo: TQRLabel
      Left = 626
      Top = 26
      Width = 102
      Height = 17
      Size.Values = (
        44.979166666666670000
        1656.291666666667000000
        68.791666666666680000
        269.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Periodo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      OnPrint = qrlPeriodoPrint
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape34: TQRShape
      Left = 8
      Top = 45
      Width = 724
      Height = 22
      Size.Values = (
        58.208333333333340000
        21.166666666666670000
        119.062500000000000000
        1915.583333333333000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText25: TQRDBText
      Left = 12
      Top = 48
      Width = 69
      Height = 17
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        127.000000000000000000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_FORMULA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
  end
  object QRSubDetail3: TQRSubDetail
    Left = 38
    Top = 486
    Width = 740
    Height = 19
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBTitulos1
    Size.Values = (
      50.270833333333330000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Master = Owner
    DataSet = SDQDetail
    FooterBand = QRFooter3
    HeaderBand = QRBTitulos3
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText18: TQRDBText
      Left = 388
      Top = 2
      Width = 125
      Height = 15
      Size.Values = (
        39.687500000000000000
        1026.583333333330000000
        5.291666666666670000
        330.729166666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQDetail
      DataField = 'TB_DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText19: TQRDBText
      Left = 530
      Top = 2
      Width = 98
      Height = 15
      Size.Values = (
        39.687500000000000000
        1402.291666666670000000
        5.291666666666670000
        259.291666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQDetail
      DataField = 'EB_FECHANACIMIENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText20: TQRDBText
      Left = 648
      Top = 2
      Width = 74
      Height = 15
      Size.Values = (
        39.687500000000000000
        1714.500000000000000000
        5.291666666666670000
        195.791666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQDetail
      DataField = 'EBPORCENTAJE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText21: TQRDBText
      Left = 14
      Top = 1
      Width = 259
      Height = 15
      Size.Values = (
        39.687500000000000000
        37.041666666666700000
        2.645833333333330000
        685.270833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQDetail
      DataField = 'EB_NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRShape21: TQRShape
      Left = 632
      Top = 0
      Width = 9
      Height = 21
      Size.Values = (
        55.562500000000000000
        1672.166666666667000000
        0.000000000000000000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape22: TQRShape
      Left = 516
      Top = 0
      Width = 9
      Height = 21
      Size.Values = (
        55.562500000000000000
        1365.250000000000000000
        0.000000000000000000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape23: TQRShape
      Left = 382
      Top = 0
      Width = 3
      Height = 21
      Size.Values = (
        55.562500000000000000
        1010.708333333333000000
        0.000000000000000000
        7.937500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape20: TQRShape
      Left = 727
      Top = -1
      Width = 9
      Height = 20
      Size.Values = (
        52.916666666666660000
        1923.520833333334000000
        -2.645833333333333000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape19: TQRShape
      Left = 8
      Top = -2
      Width = 1
      Height = 22
      Size.Values = (
        58.208333333333340000
        21.166666666666670000
        -5.291666666666667000
        2.645833333333333000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText31: TQRDBText
      Left = 285
      Top = 2
      Width = 94
      Height = 15
      Size.Values = (
        39.687500000000000000
        754.062500000000000000
        5.291666666666670000
        248.708333333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQDetail
      DataField = 'EB_DOCUMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRShape38: TQRShape
      Left = 271
      Top = 0
      Width = 9
      Height = 21
      Size.Values = (
        55.562500000000000000
        717.020833333333400000
        0.000000000000000000
        23.812500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
  end
  object QRBand1: TQRBand
    Left = 38
    Top = 527
    Width = 740
    Height = 19
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
    BandType = rbGroupHeader
    object QRShape27: TQRShape
      Left = 8
      Top = 0
      Width = 413
      Height = 18
      Size.Values = (
        47.955729166666700000
        21.497395833333300000
        0.000000000000000000
        1093.059895833330000000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape29: TQRShape
      Left = 278
      Top = 0
      Width = 3
      Height = 20
      Size.Values = (
        52.916666666666700000
        734.218750000000000000
        0.000000000000000000
        8.268229166666670000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel31: TQRLabel
      Left = 9
      Top = 1
      Width = 268
      Height = 15
      Size.Values = (
        39.687500000000000000
        23.812500000000000000
        2.645833333333333000
        709.083333333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Concepto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel40: TQRLabel
      Left = 276
      Top = 1
      Width = 143
      Height = 15
      Size.Values = (
        39.687500000000000000
        730.250000000000000000
        2.645833333333333000
        378.354166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape33: TQRShape
      Left = 275
      Top = 0
      Width = 3
      Height = 18
      Size.Values = (
        47.625000000000000000
        727.604166666666800000
        0.000000000000000000
        7.937500000000000000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object QRSubDetail4: TQRSubDetail
    Left = 38
    Top = 546
    Width = 740
    Height = 18
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Master = Owner
    DataSet = SDQHeader
    FooterBand = QRBand2
    HeaderBand = QRBand1
    PrintBefore = False
    PrintIfEmpty = True
    object QRShape31: TQRShape
      Left = 8
      Top = 0
      Width = 413
      Height = 18
      Size.Values = (
        47.625000000000000000
        21.166666666666670000
        0.000000000000000000
        1092.729166666667000000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText22: TQRDBText
      Left = 276
      Top = 1
      Width = 143
      Height = 17
      Size.Values = (
        44.979166666666670000
        730.250000000000000000
        2.645833333333333000
        378.354166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_IMPORPERI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlConcepto: TQRLabel
      Left = 9
      Top = 1
      Width = 268
      Height = 17
      Size.Values = (
        44.979166666666670000
        23.812500000000000000
        2.645833333333333000
        709.083333333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Anticipo de Renta Vitalicia'
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
    object QRShape35: TQRShape
      Left = 275
      Top = 0
      Width = 3
      Height = 18
      Size.Values = (
        47.625000000000000000
        727.604166666666800000
        0.000000000000000000
        7.937500000000000000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 564
    Width = 740
    Height = 26
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      68.791666666666660000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupFooter
    object QRShape32: TQRShape
      Left = 8
      Top = 0
      Width = 413
      Height = 20
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        0.000000000000000000
        1092.729166666667000000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText34: TQRDBText
      Left = 276
      Top = 2
      Width = 143
      Height = 16
      Size.Values = (
        42.333333333333340000
        730.250000000000000000
        5.291666666666667000
        378.354166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_IMPORPERI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 9
      Top = 1
      Width = 268
      Height = 17
      Size.Values = (
        44.979166666666670000
        23.812500000000000000
        2.645833333333333000
        709.083333333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape36: TQRShape
      Left = 275
      Top = 0
      Width = 3
      Height = 18
      Size.Values = (
        47.625000000000000000
        727.604166666666800000
        0.000000000000000000
        7.937500000000000000)
      XLColumn = 0
      Pen.Width = 15
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object QRBand3: TQRBand
    Left = 38
    Top = 591
    Width = 740
    Height = 222
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      587.375000000000000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupFooter
    object QRLabel30: TQRLabel
      Left = 14
      Top = 25
      Width = 102
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        66.145833333333340000
        269.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CHEQUE A NOMBRE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText23: TQRDBText
      Left = 132
      Top = 25
      Width = 605
      Height = 16
      Size.Values = (
        42.333333333333340000
        349.250000000000000000
        66.145833333333340000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_CHEQUENOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel41: TQRLabel
      Left = 14
      Top = 61
      Width = 95
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        161.395833333333300000
        251.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ENVIO DE FONDOS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText24: TQRDBText
      Left = 132
      Top = 7
      Width = 605
      Height = 16
      Size.Values = (
        42.333333333333340000
        349.250000000000000000
        18.520833333333330000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_COMENTARIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel42: TQRLabel
      Left = 14
      Top = 115
      Width = 84
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        304.270833333333300000
        222.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'LIQUIDADO POR'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText29: TQRDBText
      Left = 132
      Top = 79
      Width = 605
      Height = 16
      Size.Values = (
        42.333333333333340000
        349.250000000000000000
        209.020833333333300000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'DIRECCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel47: TQRLabel
      Left = 14
      Top = 97
      Width = 73
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        256.645833333333300000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'BENEFICIARIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel48: TQRLabel
      Left = 14
      Top = 79
      Width = 98
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        209.020833333333300000
        259.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'ENVIO DE RECIBOS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText36: TQRDBText
      Left = 14
      Top = 148
      Width = 91
      Height = 59
      Size.Values = (
        156.104166666666700000
        37.041666666666670000
        391.583333333333300000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoStretch = True
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'CBARRA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -51
      Font.Name = 'c39t'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 38
    end
    object QRDBText37: TQRDBText
      Left = 14
      Top = 202
      Width = 68
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        534.458333333333300000
        179.916666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoStretch = True
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'CBARRADET'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object lblBeneficiario: TQRLabel
      Left = 132
      Top = 97
      Width = 605
      Height = 16
      Size.Values = (
        42.333333333333340000
        349.250000000000000000
        256.645833333333400000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'lblBeneficiario'
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
    object qrsHijos: TQRShape
      Left = 425
      Top = 142
      Width = 146
      Height = 73
      Size.Values = (
        193.145833333333300000
        1124.479166666667000000
        375.708333333333400000
        386.291666666666700000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape28: TQRShape
      Left = 429
      Top = 193
      Width = 138
      Height = 3
      Size.Values = (
        7.937500000000000000
        1135.062500000000000000
        510.645833333333300000
        365.125000000000000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel11: TQRLabel
      Left = 430
      Top = 198
      Width = 137
      Height = 14
      Size.Values = (
        37.041666666666670000
        1137.708333333333000000
        523.875000000000000000
        362.479166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Revisado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape30: TQRShape
      Left = 586
      Top = 142
      Width = 146
      Height = 73
      Size.Values = (
        193.145833333333300000
        1550.458333333333000000
        375.708333333333400000
        386.291666666666700000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape37: TQRShape
      Left = 590
      Top = 193
      Width = 138
      Height = 3
      Size.Values = (
        7.937500000000000000
        1561.041666666667000000
        510.645833333333300000
        365.125000000000000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel12: TQRLabel
      Left = 591
      Top = 198
      Width = 137
      Height = 14
      Size.Values = (
        37.041666666666670000
        1563.687500000000000000
        523.875000000000000000
        362.479166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Aprobado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 14
      Top = 7
      Width = 91
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        18.520833333333330000
        240.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'OBSERVACIONES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 132
      Top = 43
      Width = 605
      Height = 16
      Size.Values = (
        42.333333333333340000
        349.250000000000000000
        113.770833333333300000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'FORMAPAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel43: TQRLabel
      Left = 14
      Top = 43
      Width = 90
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        113.770833333333300000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'FORMA DE PAGO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 132
      Top = 61
      Width = 605
      Height = 16
      Size.Values = (
        42.333333333333340000
        349.250000000000000000
        161.395833333333300000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = SDQHeader
      DataField = 'LE_ENVIOFONDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlUsuario: TQRLabel
      Left = 132
      Top = 115
      Width = 605
      Height = 17
      Size.Values = (
        44.979166666666670000
        349.250000000000000000
        304.270833333333400000
        1600.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrlUsuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object QRSubDetail5: TQRSubDetail
    Left = 38
    Top = 590
    Width = 740
    Height = 1
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBTitulos1
    Size.Values = (
      2.645833333333333000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Master = Owner
    DataSet = SDQDetail
    FooterBand = QRBand3
    PrintBefore = False
    PrintIfEmpty = True
  end
  object QRFooter3: TQRBand
    Left = 38
    Top = 505
    Width = 740
    Height = 22
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRSubDetail2
    Size.Values = (
      58.208333333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupFooter
    object QRShape17: TQRShape
      Left = 9
      Top = 1
      Width = 723
      Height = 1
      Size.Values = (
        1.889880952380950000
        22.678571428571400000
        3.779761904761900000
        1912.559523809520000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape24: TQRShape
      Left = 10
      Top = 0
      Width = 723
      Height = 1
      Size.Values = (
        2.645833333333330000
        26.458333333333300000
        0.000000000000000000
        1912.937500000000000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
  end
  object qriLogo: TQRImage
    Left = 611
    Top = 12
    Width = 163
    Height = 64
    Size.Values = (
      169.333333333333300000
      1616.604166666667000000
      31.750000000000000000
      431.270833333333400000)
    XLColumn = 0
    Stretch = True
  end
  object dsConsulta1: TDataSource
    DataSet = sdqConsulta1
    Left = 78
    Top = 17
  end
  object sdqConsulta1: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqConsulta1AfterScroll
    SQL.Strings = (
      ''
      '')
    Left = 49
    Top = 17
  end
  object dsConsulta3: TDataSource
    DataSet = sdqConsulta3
    Left = 141
    Top = 18
  end
  object sdqConsulta3: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqConsulta3AfterScroll
    SQL.Strings = (
      '')
    Left = 112
    Top = 18
  end
  object dsConsulta4: TDataSource
    DataSet = sdqConsulta4
    Left = 205
    Top = 16
  end
  object sdqConsulta4: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      ''
      '')
    Left = 176
    Top = 16
  end
  object SDQHeader: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = SDQHeaderAfterScroll
    SQL.Strings = (
      ''
      '')
    Left = 240
    Top = 17
  end
  object DSHeader: TDataSource
    Left = 269
    Top = 17
  end
  object DSDetail: TDataSource
    DataSet = SDQHeader
    Left = 334
    Top = 17
  end
  object SDQDetail: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '')
    Left = 305
    Top = 17
  end
end
