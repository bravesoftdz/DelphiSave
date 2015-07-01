object rptVolante: TrptVolante
  Left = 0
  Top = 0
  Width = 816
  Height = 1056
  IDReport = 0
  DataSet = sdqConsulta
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
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  PrevInitialZoom = qrZoomToFit
  PreviewDefaultSaveType = stQRP
  PreviewLeft = 0
  PreviewTop = 0
  object QRBand1: TQRBand
    Left = 38
    Top = 38
    Width = 740
    Height = 317
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = True
    ParentFont = False
    Size.Values = (
      838.729166666666800000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRLabel5: TQRLabel
      Left = 0
      Top = 16
      Width = 736
      Height = 25
      Size.Values = (
        66.145833333333300000
        0.000000000000000000
        42.333333333333300000
        1947.333333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '  '
      Color = 16053492
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRShape7: TQRShape
      Left = 0
      Top = 28
      Width = 117
      Height = 1
      Size.Values = (
        2.645833333333330000
        0.000000000000000000
        74.083333333333300000
        309.562500000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrdbNroVolante: TQRDBText
      Left = 4
      Top = 4
      Width = 105
      Height = 26
      Size.Values = (
        68.791666666666700000
        10.583333333333300000
        10.583333333333300000
        277.812500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VOLANTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 16
    end
    object QRLabel1: TQRLabel
      Left = 137
      Top = 20
      Width = 101
      Height = 14
      Size.Values = (
        37.041666666666670000
        362.479166666666700000
        52.916666666666670000
        267.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de Recepci'#243'n:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 240
      Top = 20
      Width = 70
      Height = 14
      Size.Values = (
        37.041666666666700000
        635.000000000000000000
        52.916666666666700000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_FECHARECEPCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 340
      Top = 20
      Width = 109
      Height = 14
      Size.Values = (
        37.041666666666670000
        899.583333333333400000
        52.916666666666670000
        288.395833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de Vencimiento:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText15: TQRDBText
      Left = 452
      Top = 20
      Width = 70
      Height = 14
      Size.Values = (
        37.041666666666700000
        1195.916666666670000000
        52.916666666666700000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_VENCIMIENTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 0
      Top = 72
      Width = 736
      Height = 57
      Size.Values = (
        150.812500000000000000
        0.000000000000000000
        190.500000000000000000
        1947.333333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '  '
      Color = 16053492
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 5
      Top = 92
      Width = 25
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        243.416666666666700000
        66.145833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CUIT'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 80
      Top = 92
      Width = 90
      Height = 14
      Size.Values = (
        37.041666666666700000
        211.666666666667000000
        243.416666666667000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'CA_CLAVE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 4
      Top = 108
      Width = 61
      Height = 14
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        285.750000000000000000
        161.395833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Raz'#243'n Social'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText3: TQRDBText
      Left = 80
      Top = 108
      Width = 653
      Height = 14
      Size.Values = (
        37.041666666666700000
        211.666666666667000000
        285.750000000000000000
        1727.729166666670000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'CA_DESCRIPCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 5
      Top = 76
      Width = 62
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        201.083333333333300000
        164.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Identificador'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 80
      Top = 76
      Width = 90
      Height = 14
      Size.Values = (
        37.041666666666700000
        211.666666666667000000
        201.083333333333000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_PRESTADOR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 0
      Top = 56
      Width = 736
      Height = 14
      Size.Values = (
        37.041666666666700000
        0.000000000000000000
        148.166666666667000000
        1947.333333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '  Prestador'
      Color = 12829635
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 0
      Top = 144
      Width = 736
      Height = 14
      Size.Values = (
        37.041666666666700000
        0.000000000000000000
        381.000000000000000000
        1947.333333333330000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = 12829635
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 0
      Top = 160
      Width = 736
      Height = 84
      Size.Values = (
        222.250000000000000000
        0.000000000000000000
        423.333333333333300000
        1947.333333333334000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '  '
      Color = 16053492
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 5
      Top = 164
      Width = 18
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        433.916666666666700000
        47.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nro'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 48
      Top = 164
      Width = 108
      Height = 14
      Size.Values = (
        37.041666666666670000
        127.000000000000000000
        433.916666666666800000
        285.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'FACTURA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 5
      Top = 180
      Width = 39
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        476.250000000000000000
        103.187500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Importe'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrdbMonto: TQRDBText
      Left = 48
      Top = 180
      Width = 90
      Height = 14
      Size.Values = (
        37.041666666666670000
        127.000000000000000000
        476.250000000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_MONTOBRUTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OnPrint = qrdbMontoPrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel13: TQRLabel
      Left = 160
      Top = 164
      Width = 30
      Height = 14
      Size.Values = (
        37.041666666666670000
        423.333333333333300000
        433.916666666666700000
        79.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 211
      Top = 164
      Width = 90
      Height = 14
      Size.Values = (
        37.041666666666670000
        558.270833333333400000
        433.916666666666800000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_FECHAFACTURA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 5
      Top = 228
      Width = 51
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        603.250000000000000000
        134.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Observac.'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 64
      Top = 228
      Width = 673
      Height = 14
      Size.Values = (
        37.041666666666670000
        169.333333333333300000
        603.250000000000000000
        1780.645833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_OBSERVACIONES'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 532
      Top = 253
      Width = 193
      Height = 62
      Size.Values = (
        164.041666666666700000
        1407.583333333333000000
        669.395833333333400000
        510.645833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'CODBARRAS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -53
      Font.Name = 'Codigo de Barras'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 40
    end
    object QRDBText10: TQRDBText
      Left = 534
      Top = 293
      Width = 193
      Height = 17
      Size.Values = (
        44.979166666666670000
        1412.875000000000000000
        775.229166666666800000
        510.645833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VOLANTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 5
      Top = 196
      Width = 53
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        518.583333333333400000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Delegaci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 64
      Top = 196
      Width = 245
      Height = 14
      Size.Values = (
        37.041666666666670000
        169.333333333333300000
        518.583333333333400000
        648.229166666666800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'LG_NOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 200
      Top = 76
      Width = 102
      Height = 14
      Size.Values = (
        37.041666666666670000
        529.166666666666700000
        201.083333333333300000
        269.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'C'#243'digo de Asistencial'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 308
      Top = 76
      Width = 117
      Height = 14
      Size.Values = (
        37.041666666666700000
        814.916666666667000000
        201.083333333333000000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'CA_ASISTENCIAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 4
      Top = 296
      Width = 79
      Height = 11
      Size.Values = (
        29.104166666666670000
        10.583333333333330000
        783.166666666666800000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario de Impresi'#243'n:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlUsuario: TQRLabel
      Left = 88
      Top = 296
      Width = 35
      Height = 11
      Size.Values = (
        29.104166666666670000
        232.833333333333400000
        783.166666666666800000
        92.604166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '%USER%'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      OnPrint = qrlUsuarioPrint
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRLabel18: TQRLabel
      Left = 557
      Top = 20
      Width = 71
      Height = 14
      Size.Values = (
        37.041666666666670000
        1473.729166666667000000
        52.916666666666670000
        187.854166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de Alta:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 632
      Top = 20
      Width = 70
      Height = 14
      Size.Values = (
        37.041666666666700000
        1672.166666666670000000
        52.916666666666700000
        185.208333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_FECHALTA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrdbTipoComprobante: TQRDBText
      Left = 8
      Top = 144
      Width = 103
      Height = 14
      Size.Values = (
        37.041666666666670000
        21.166666666666670000
        381.000000000000000000
        272.520833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Color = 12829635
      DataSet = sdqConsulta
      DataField = 'TIPCOMPROBANTE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 5
      Top = 212
      Width = 56
      Height = 14
      Size.Values = (
        37.041666666666670000
        13.229166666666670000
        560.916666666666700000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Beneficiario'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText13: TQRDBText
      Left = 64
      Top = 212
      Width = 673
      Height = 14
      Size.Values = (
        37.041666666666670000
        169.333333333333300000
        560.916666666666800000
        1780.645833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_CHEQUENOMBRE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 4
      Top = 285
      Width = 64
      Height = 11
      Size.Values = (
        29.104166666666670000
        10.583333333333330000
        754.062500000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario de Carga:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object qrlUsuCarga: TQRLabel
      Left = 88
      Top = 285
      Width = 4
      Height = 11
      Size.Values = (
        29.104166666666670000
        232.833333333333400000
        754.062500000000000000
        10.583333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Tahoma'
      Font.Style = []
      OnPrint = qrlUsuCargaPrint
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 6
    end
    object QRLabel21: TQRLabel
      Left = 160
      Top = 180
      Width = 47
      Height = 14
      Size.Values = (
        37.041666666666670000
        423.333333333333300000
        476.250000000000000000
        124.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Imp. IVA:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 212
      Top = 180
      Width = 90
      Height = 14
      Size.Values = (
        37.041666666666670000
        560.916666666666800000
        476.250000000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_MONTOIVA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OnPrint = qrdbMontoPrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 307
      Top = 164
      Width = 68
      Height = 14
      Size.Values = (
        37.041666666666670000
        812.270833333333400000
        433.916666666666700000
        179.916666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Refacturaci'#243'n'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText16: TQRDBText
      Left = 381
      Top = 164
      Width = 25
      Height = 14
      Size.Values = (
        37.041666666666670000
        1008.062500000000000000
        433.916666666666800000
        66.145833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_REFACTURACION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlLetraVolante: TQRLabel
      Left = 402
      Top = 245
      Width = 52
      Height = 59
      Size.Values = (
        156.104166666666700000
        1063.625000000000000000
        648.229166666666800000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'L'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OnPrint = rint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 36
    end
    object QRLabel23: TQRLabel
      Left = 437
      Top = 76
      Width = 66
      Height = 14
      Size.Values = (
        37.041666666666670000
        1156.229166666667000000
        201.083333333333300000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'CBU / Cuenta'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText17: TQRDBText
      Left = 507
      Top = 76
      Width = 221
      Height = 14
      Size.Values = (
        37.041666666666700000
        1341.437500000000000000
        201.083333333333000000
        584.729166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'CBU'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRDBText18: TQRDBText
      Left = 380
      Top = 180
      Width = 90
      Height = 14
      Size.Values = (
        37.041666666666670000
        1005.416666666667000000
        476.250000000000000000
        238.125000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_MONTOPERCEPCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OnPrint = qrdbMontoPrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 308
      Top = 180
      Width = 67
      Height = 14
      Size.Values = (
        37.041666666666670000
        814.916666666666800000
        476.250000000000000000
        177.270833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Imp. Percep.:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 480
      Top = 180
      Width = 29
      Height = 14
      Size.Values = (
        37.041666666666670000
        1270.000000000000000000
        476.250000000000000000
        76.729166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Total:'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRDBText19: TQRDBText
      Left = 516
      Top = 180
      Width = 101
      Height = 14
      Size.Values = (
        37.041666666666670000
        1365.250000000000000000
        476.250000000000000000
        267.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      DataSet = sdqConsulta
      DataField = 'VO_MONTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OnPrint = qrdbMontoPrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlPrestReferente: TQRLabel
      Left = 463
      Top = 245
      Width = 52
      Height = 59
      Size.Values = (
        156.104166666666700000
        1225.020833333333000000
        648.229166666666800000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'C'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OnPrint = qrlPrestReferentePrint
      ParentFont = False
      Transparent = True
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 36
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT '#39'*'#39' || SUBSTR('#39'00000000'#39', 1, 8 - LENGTH(TO_CHAR(vo_volant' +
        'e))) || TO_CHAR(vo_volante) || '#39'*'#39' codbarras,'
      
        '       SUBSTR('#39'00000000'#39', 1, 8 - LENGTH(TO_CHAR(vo_volante))) ||' +
        ' TO_CHAR(vo_volante) volante,'
      
        '       vo_facturatipo || '#39'-'#39' || vo_facturaestable || '#39'-'#39' || vo_f' +
        'acturanro factura, '
      
        '       vo_volante, vo_prestador, vo_facturatipo, vo_facturaestab' +
        'le, vo_facturanro, '
      
        '       vo_fechafactura, vo_montobruto, vo_vencimiento, vo_observ' +
        'aciones, vo_fecharecepcion,'
      
        '       vo_fechalta, ca_clave, ca_descripcion, ca_asistencial, lg' +
        '_nombre, '
      
        '       tb_descripcion tipcomprobante, vo_chequenombre, vo_montop' +
        'ercepcion, '
      
        '       vo_usualta, vo_refacturacion, vo_estado, vo_estadopend, v' +
        'o_montoiva, vo_monto,'
      
        '       DECODE(cp_idsucursal, NULL, art.utiles.iif_char(cp_cbu1, ' +
        'NULL, NULL, cp_cbu1 || '#39'-'#39' || cp_cbu2), cp_nrocuenta) cbu,'
      '       ca_esreferente'
      
        '  FROM svo_volantes, cpr_prestador, dlg_delegaciones, ctb_tablas' +
        ', ccp_cuentapago'
      ' WHERE ca_identificador = vo_prestador'
      '   AND lg_codigo(+) = vo_delegacion'
      '   AND tb_clave(+) = '#39'TCOMP'#39
      '   AND tb_codigo(+) = ca_tipocomprobante'
      '   AND ca_identificador = cp_idacreedor(+)'
      '   AND cp_tipoacreedor(+) = '#39'CA'#39
      '   AND cp_fechabaja(+) IS NULL'
      '   AND vo_volante = :pvolante')
    Left = 8
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pVolante'
        ParamType = ptInput
        Value = '38'
      end>
  end
end
