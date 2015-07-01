object rptCartaDocHeader: TrptCartaDocHeader
  Left = 0
  Top = 0
  Width = 816
  Height = 882
  IDReport = 0
  AfterPrint = QuickRepAfterPrint
  BeforePrint = QuickRepBeforePrint
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
  Page.PaperSize = Legal
  Page.Continuous = False
  Page.Values = (
    50.000000000000000000
    3556.000000000000000000
    40.000000000000000000
    2159.000000000000000000
    50.000000000000000000
    50.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 3
  PrinterSettings.OutputBin = Auto
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.UseStandardprinter = True
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
  object qrbPageHeader: TQRBand
    Left = 19
    Top = 15
    Width = 778
    Height = 441
    AlignToBottom = False
    BeforePrint = qrbPageHeaderBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      1166.812500000000000000
      2058.458333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageHeader
    object qrlDestDomicilio: TArtQRLabel
      Left = 400
      Top = 134
      Width = 300
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        354.541666666667000000
        793.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlDestDomicilioPrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDestDomicilio_Abajo: TArtQRLabel
      Left = 400
      Top = 146
      Width = 300
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        386.291666666667000000
        793.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDestNombre: TArtQRLabel
      Left = 400
      Top = 106
      Width = 297
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        280.458333333333000000
        785.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlDestNombrePrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlRemNombre: TArtQRLabel
      Left = 36
      Top = 106
      Width = 349
      Height = 17
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        280.458333333333000000
        923.395833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG'
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
    object qrlRemDomicilio: TArtQRLabel
      Left = 36
      Top = 134
      Width = 349
      Height = 17
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        354.541666666667000000
        923.395833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG'
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
    object qrlRemCPostal: TArtQRLabel
      Left = 36
      Top = 160
      Width = 95
      Height = 17
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        423.333333333333000000
        251.354166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
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
    object qrlRemLocalidad: TArtQRLabel
      Left = 136
      Top = 160
      Width = 145
      Height = 17
      Size.Values = (
        44.979166666666700000
        359.833333333333000000
        423.333333333333000000
        383.645833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII' +
        'IIIIIIIIIIIIIIII'
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
    object qrlDestProvincia: TArtQRLabel
      Left = 660
      Top = 164
      Width = 40
      Height = 11
      Size.Values = (
        29.104166666666670000
        1746.250000000000000000
        433.916666666666700000
        105.833333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlDestLocalidad: TArtQRLabel
      Left = 491
      Top = 164
      Width = 146
      Height = 11
      Size.Values = (
        29.104166666666670000
        1299.104166666667000000
        433.916666666666700000
        386.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII' +
        'IIIIIIIIIIIIIIII'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlRemLocalidad1: TArtQRLabel
      Left = 136
      Top = 420
      Width = 149
      Height = 17
      Size.Values = (
        44.979166666666700000
        359.833333333333000000
        1111.250000000000000000
        394.229166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII' +
        'IIIIIIIIIIIIIIII'
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
    object qrlRemCPostal1: TArtQRLabel
      Left = 36
      Top = 420
      Width = 95
      Height = 17
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        1111.250000000000000000
        251.354166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
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
    object qrlRemDomicilio1: TArtQRLabel
      Left = 36
      Top = 393
      Width = 349
      Height = 17
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        1039.812500000000000000
        923.395833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG'
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
    object qrlRemNombre1: TArtQRLabel
      Left = 36
      Top = 364
      Width = 349
      Height = 17
      Size.Values = (
        44.979166666666700000
        95.250000000000000000
        963.083333333333000000
        923.395833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG'
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
    object qrlDestNombre1: TArtQRLabel
      Left = 400
      Top = 364
      Width = 297
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        963.083333333333000000
        785.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlDestNombre1Print
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDestDomicilio1: TArtQRLabel
      Left = 400
      Top = 393
      Width = 313
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        1039.812500000000000000
        828.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      OnPrint = qrlDestDomicilio1Print
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDestLocalidad1: TArtQRLabel
      Left = 491
      Top = 424
      Width = 150
      Height = 11
      Size.Values = (
        29.104166666666670000
        1299.104166666667000000
        1121.833333333333000000
        396.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII' +
        'IIIIIIIIIIIIIIII'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlDestProvincia1: TArtQRLabel
      Left = 660
      Top = 424
      Width = 82
      Height = 11
      Size.Values = (
        29.104166666666670000
        1746.250000000000000000
        1121.833333333333000000
        216.958333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlNumero: TArtQRLabel
      Left = 331
      Top = 9
      Width = 92
      Height = 16
      Size.Values = (
        42.333333333333330000
        875.770833333333300000
        23.812500000000000000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '3779301000007'
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
    object qrlNumero1: TArtQRLabel
      Left = 151
      Top = 320
      Width = 92
      Height = 16
      Size.Values = (
        42.333333333333330000
        399.520833333333300000
        846.666666666666700000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '3779301000007'
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
    object qrlBarras2: TArtQRLabel
      Left = 39
      Top = 276
      Width = 346
      Height = 46
      Size.Values = (
        121.708333333333300000
        103.187500000000000000
        730.250000000000000000
        915.458333333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoStretch = True
      Caption = '*3779301000007*'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = '3 of 9 Barcode'
      Font.Style = []
      OnPrint = qrlBarrasPrint
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 30
    end
    object qrlBarras1: TArtQRLabel
      Left = 429
      Top = 4
      Width = 346
      Height = 46
      Size.Values = (
        121.708333333333300000
        1135.062500000000000000
        10.583333333333330000
        915.458333333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Caption = '*3779301000007*'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = '3 of 9 Barcode'
      Font.Style = []
      OnPrint = qrlBarrasPrint
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 30
    end
    object qrlContrato: TQRLabel
      Left = 36
      Top = 4
      Width = 110
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        10.583333333333330000
        291.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Contrato: 11111'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlSector: TQRLabel
      Left = 220
      Top = 4
      Width = 54
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        582.083333333333300000
        10.583333333333330000
        142.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'SECTOR'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRAngledLabel1: TQRAngledLabel
      Left = 701
      Top = 154
      Width = 12
      Height = 118
      Enabled = False
      Size.Values = (
        312.208333333333300000
        1854.729166666667000000
        407.458333333333300000
        31.750000000000000000)
      XLColumn = 0
      Angle = 90
      Caption = 'MOTIVO DE NO ENTREGA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 7
    end
    object QRAngledLabel2: TQRAngledLabel
      Left = 714
      Top = 264
      Width = 11
      Height = 71
      Enabled = False
      Size.Values = (
        187.854166666666700000
        1889.125000000000000000
        698.500000000000000000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'NO HAY NUMERO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 6
    end
    object QRAngledLabel3: TQRAngledLabel
      Left = 724
      Top = 296
      Width = 11
      Height = 37
      Enabled = False
      Size.Values = (
        97.895833333333330000
        1915.583333333333000000
        783.166666666666700000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'MUDADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 6
    end
    object QRAngledLabel4: TQRAngledLabel
      Left = 734
      Top = 249
      Width = 11
      Height = 87
      Enabled = False
      Size.Values = (
        230.187500000000000000
        1942.041666666667000000
        658.812500000000000000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'SE NIEGA A RECIBIR'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 6
    end
    object QRAngledLabel5: TQRAngledLabel
      Left = 745
      Top = 296
      Width = 11
      Height = 38
      Enabled = False
      Size.Values = (
        100.541666666666700000
        1971.145833333333000000
        783.166666666666700000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'EN OBRA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 6
    end
    object QRAngledLabel6: TQRAngledLabel
      Left = 756
      Top = 274
      Width = 11
      Height = 61
      Enabled = False
      Size.Values = (
        161.395833333333300000
        2000.250000000000000000
        724.958333333333300000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'DESHABITADO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 6
    end
    object QRAngledLabel7: TQRAngledLabel
      Left = 711
      Top = 180
      Width = 11
      Height = 31
      Enabled = False
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        82.020833333333330000
        1881.187500000000000000
        476.250000000000000000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'BALDIO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 6
    end
    object QRAngledLabel8: TQRAngledLabel
      Left = 724
      Top = 115
      Width = 11
      Height = 97
      Enabled = False
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        256.645833333333300000
        1915.583333333333000000
        304.270833333333300000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'DATOS INSUFICIENTES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 6
    end
    object QRAngledLabel9: TQRAngledLabel
      Left = 734
      Top = 151
      Width = 11
      Height = 60
      Enabled = False
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        158.750000000000000000
        1942.041666666667000000
        399.520833333333300000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'NO CONTESTA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 6
    end
    object QRAngledLabel10: TQRAngledLabel
      Left = 745
      Top = 166
      Width = 11
      Height = 45
      Enabled = False
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        119.062500000000000000
        1971.145833333333000000
        439.208333333333300000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'FALLECIDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 6
    end
    object QRAngledLabel11: TQRAngledLabel
      Left = 755
      Top = 150
      Width = 11
      Height = 62
      Enabled = False
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        164.041666666666700000
        1997.604166666667000000
        396.875000000000000000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'DESCONOCIDO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 6
    end
    object QRAngledLabel12: TQRAngledLabel
      Left = 765
      Top = 105
      Width = 11
      Height = 107
      Enabled = False
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Size.Values = (
        283.104166666666700000
        2024.062500000000000000
        277.812500000000000000
        29.104166666666670000)
      XLColumn = 0
      Angle = 90
      Caption = 'NOTIFICACION DE VISITA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 6
    end
    object QRImage1: TQRImage
      Left = 697
      Top = 81
      Width = 82
      Height = 268
      Enabled = False
      Size.Values = (
        709.083333333333400000
        1844.145833333333000000
        214.312500000000000000
        216.958333333333400000)
      XLColumn = 0
      AutoSize = True
    end
    object QRImage2: TQRImage
      Left = 400
      Top = 274
      Width = 30
      Height = 81
      Enabled = False
      Size.Values = (
        214.312500000000000000
        1058.333333333333000000
        724.958333333333300000
        79.375000000000000000)
      XLColumn = 0
      AutoSize = True
    end
    object qrlDestNombre_Abajo: TArtQRLabel
      Left = 400
      Top = 118
      Width = 297
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        312.208333333333000000
        785.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDestNombre1_Abajo: TArtQRLabel
      Left = 400
      Top = 376
      Width = 297
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        994.833333333333000000
        785.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDestDomicilio1_Abajo: TArtQRLabel
      Left = 400
      Top = 405
      Width = 313
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        1071.562500000000000000
        828.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlRegistroCodFirma: TQRLabel
      Left = 36
      Top = 36
      Width = 130
      Height = 17
      Size.Values = (
        44.979166666666670000
        95.250000000000000000
        95.250000000000000000
        343.958333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C'#243'd. Firma: xxxx/xx'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlOrden: TQRLabel
      Left = 284
      Top = 36
      Width = 110
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666700000
        751.416666666667000000
        95.250000000000000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'NRODEORDEN'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDelegacion: TQRLabel
      Left = 160
      Top = 52
      Width = 369
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666700000
        423.333333333333000000
        137.583333333333000000
        976.312500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'DELEGACION'
      Color = clWhite
      Transparent = False
      WordWrap = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlRemProvincia: TArtQRLabel
      Left = 308
      Top = 160
      Width = 77
      Height = 17
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        423.333333333333000000
        203.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlRemProvincia1: TArtQRLabel
      Left = 308
      Top = 420
      Width = 77
      Height = 17
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        1111.250000000000000000
        203.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlDestCPostal: TArtQRLabel
      Left = 400
      Top = 160
      Width = 85
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        423.333333333333000000
        224.895833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
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
    object qrlDestCPostal1: TArtQRLabel
      Left = 400
      Top = 420
      Width = 85
      Height = 17
      Size.Values = (
        44.979166666666700000
        1058.333333333330000000
        1111.250000000000000000
        224.895833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
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
    object qrlLeyendaAcuse: TQRLabel
      Left = 283
      Top = 69
      Width = 490
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        748.770833333333400000
        182.562500000000000000
        1296.458333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'LEYENDAACUSE'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRPSFranqueo1A: TQRPShape
      Left = 556
      Top = 60
      Width = 114
      Height = 41
      Size.Values = (
        108.479166666666700000
        1471.083333333333000000
        158.750000000000000000
        301.625000000000000000)
      XLColumn = 0
      Pen.Width = 2
      Shape = qrpsRectangle
      VertAdjust = 0
      FixBottomPosition = False
      StretchHeightWithBand = False
    end
    object QRLFranqueo5A: TQRLabel
      Left = 577
      Top = 65
      Width = 92
      Height = 11
      Size.Values = (
        29.104166666666670000
        1526.645833333333000000
        171.979166666666700000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'FRANQUEO A PAGAR'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRPSFranqueo3A: TQRPShape
      Left = 572
      Top = 60
      Width = 4
      Height = 41
      Size.Values = (
        108.479166666666700000
        1513.416666666667000000
        158.750000000000000000
        10.583333333333330000)
      XLColumn = 0
      Pen.Width = 2
      Shape = qrpsVertLine
      VertAdjust = 0
      FixBottomPosition = False
      StretchHeightWithBand = False
    end
    object QRLFranqueo4A: TQRLabel
      Left = 577
      Top = 86
      Width = 92
      Height = 11
      Size.Values = (
        29.104166666666670000
        1526.645833333333000000
        227.541666666666700000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = '12658'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRPSFranqueo2A: TQRPShape
      Left = 574
      Top = 76
      Width = 96
      Height = 11
      Size.Values = (
        29.104166666666670000
        1518.708333333333000000
        201.083333333333300000
        254.000000000000000000)
      XLColumn = 0
      Pen.Width = 2
      Shape = qrpsHorLine
      VertAdjust = 0
      FixBottomPosition = False
      StretchHeightWithBand = False
    end
    object QRPSFranqueo1B: TQRPShape
      Left = 556
      Top = 304
      Width = 114
      Height = 41
      Size.Values = (
        108.479166666666700000
        1471.083333333333000000
        804.333333333333300000
        301.625000000000000000)
      XLColumn = 0
      Pen.Width = 2
      Shape = qrpsRectangle
      VertAdjust = 0
      FixBottomPosition = False
      StretchHeightWithBand = False
    end
    object QRLFranqueo5B: TQRLabel
      Left = 577
      Top = 309
      Width = 92
      Height = 11
      Size.Values = (
        29.104166666666670000
        1526.645833333333000000
        817.562500000000000000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'FRANQUEO A PAGAR'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRPSFranqueo3B: TQRPShape
      Left = 572
      Top = 304
      Width = 4
      Height = 41
      Size.Values = (
        108.479166666666700000
        1513.416666666667000000
        804.333333333333300000
        10.583333333333330000)
      XLColumn = 0
      Pen.Width = 2
      Shape = qrpsVertLine
      VertAdjust = 0
      FixBottomPosition = False
      StretchHeightWithBand = False
    end
    object QRLFranqueo4B: TQRLabel
      Left = 577
      Top = 330
      Width = 92
      Height = 11
      Size.Values = (
        29.104166666666670000
        1526.645833333333000000
        873.125000000000000000
        243.416666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = '12658'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRPSFranqueo2B: TQRPShape
      Left = 574
      Top = 320
      Width = 96
      Height = 11
      Size.Values = (
        29.104166666666670000
        1518.708333333333000000
        846.666666666666700000
        254.000000000000000000)
      XLColumn = 0
      Pen.Width = 2
      Shape = qrpsHorLine
      VertAdjust = 0
      FixBottomPosition = False
      StretchHeightWithBand = False
    end
    object QRALFranqueo6A: TQRAngledLabel
      Left = 558
      Top = 63
      Width = 41
      Height = 130
      Size.Values = (
        343.958333333333300000
        1476.375000000000000000
        166.687500000000000000
        108.479166666666700000)
      XLColumn = 0
      Angle = 90
      AutoSize = False
      Caption = '---'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 7
    end
    object QRALFranqueo6B: TQRAngledLabel
      Left = 558
      Top = 307
      Width = 41
      Height = 130
      Size.Values = (
        343.958333333333300000
        1476.375000000000000000
        812.270833333333300000
        108.479166666666700000)
      XLColumn = 0
      Angle = 90
      AutoSize = False
      Caption = '---'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      FontSize = 7
    end
  end
  object qrbSummary: TQRBand
    Left = 19
    Top = 521
    Width = 778
    Height = 1
    AfterPrint = qrbSummaryAfterPrint
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      2.645833333333333000
      2058.458333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbSummary
  end
  object qrbPageFooter: TQRBand
    Left = 19
    Top = 522
    Width = 778
    Height = 130
    AlignToBottom = True
    BeforePrint = qrbPageFooterBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      343.958333333333400000
      2058.458333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageFooter
    object qriFirma: TQRImage
      Left = 525
      Top = -37
      Width = 245
      Height = 100
      Size.Values = (
        264.583333333333000000
        1389.062500000000000000
        -97.895833333333300000
        648.229166666667000000)
      XLColumn = 0
      AutoSize = True
      Center = True
    end
    object qrlFirmante: TArtQRLabel
      Left = 525
      Top = 64
      Width = 245
      Height = 17
      Size.Values = (
        44.979166666666700000
        1389.062500000000000000
        169.333333333333000000
        648.229166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlDocumento: TArtQRLabel
      Left = 525
      Top = 84
      Width = 245
      Height = 17
      Size.Values = (
        44.979166666666700000
        1389.062500000000000000
        222.250000000000000000
        648.229166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlCaracter: TArtQRLabel
      Left = 525
      Top = 104
      Width = 245
      Height = 17
      Size.Values = (
        44.979166666666700000
        1389.062500000000000000
        275.166666666667000000
        648.229166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlOrdenPie: TQRLabel
      Left = 308
      Top = 92
      Width = 110
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666700000
        814.916666666667000000
        243.416666666667000000
        291.041666666667000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'NRODEORDEN'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmInfoPie: TQRRichText
      Left = 55
      Top = 125
      Width = 687
      Height = 615
      Enabled = False
      Size.Values = (
        1627.187500000000000000
        145.520833333333300000
        330.729166666666700000
        1817.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AutoStretch = True
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
    end
    object qrlDelegacionPie: TQRLabel
      Left = 299
      Top = 108
      Width = 131
      Height = 17
      Enabled = False
      Size.Values = (
        44.979166666666670000
        791.104166666666800000
        285.750000000000000000
        346.604166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'DELEGACION'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object qrbPageHeader2: TQRChildBand
    Left = 19
    Top = 456
    Width = 778
    Height = 65
    AlignToBottom = False
    BeforePrint = qrbPageHeader2BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      171.979166666666700000
      2058.458333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    ParentBand = qrbPageHeader
    PrintOrder = cboAfterParent
    object qrLogo: TQRImage
      Left = 36
      Top = 0
      Width = 165
      Height = 65
      Size.Values = (
        171.979166666666700000
        95.250000000000000000
        0.000000000000000000
        436.562499999999900000)
      XLColumn = 0
      Center = True
      Stretch = True
    end
  end
end
