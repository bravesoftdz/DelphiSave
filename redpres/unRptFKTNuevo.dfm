object rptFKTNuevo: TrptFKTNuevo
  Left = 0
  Top = 0
  Width = 816
  Height = 694
  IDReport = 0
  BeforePrint = QuickRepBeforePrint
  DataSet = sdqSesion
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
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
  ReportTitle = 'FisioKinesioTerapia'
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
    Height = 490
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      1296.458333333333000000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbTitle
    object qrlRelaciones: TQRMemo
      Left = 110
      Top = 410
      Width = 628
      Height = 50
      Size.Values = (
        132.291666666666700000
        291.041666666666700000
        1084.791666666667000000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrmDireccion: TQRMemo
      Left = 3
      Top = 102
      Width = 358
      Height = 18
      Size.Values = (
        47.625000000000000000
        7.937500000000000000
        269.875000000000000000
        947.208333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      Lines.Strings = (
        '                                                      ')
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
    object QRLabel1: TQRLabel
      Left = 6
      Top = 133
      Width = 116
      Height = 14
      Size.Values = (
        37.041666666666670000
        15.875000000000000000
        351.895833333333400000
        306.916666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Datos del Prestador:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 2
      Top = 224
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        592.666666666666800000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Paciente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 2
      Top = 293
      Width = 67
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        775.229166666666800000
        177.270833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Diagn'#243'stico:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 2
      Top = 276
      Width = 47
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        730.250000000000000000
        124.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Empresa'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestador: TQRLabel
      Left = 67
      Top = 147
      Width = 667
      Height = 17
      Size.Values = (
        44.979166666666670000
        177.270833333333300000
        388.937500000000000000
        1764.770833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlPaciente: TQRLabel
      Left = 110
      Top = 224
      Width = 628
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        592.666666666666800000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlEmpresa: TQRLabel
      Left = 110
      Top = 276
      Width = 628
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        730.250000000000000000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlDiagnostico: TQRLabel
      Left = 110
      Top = 293
      Width = 628
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        775.229166666666800000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
      Top = 460
      Width = 85
      Height = 16
      Size.Values = (
        42.333333333333340000
        0.000000000000000000
        1217.083333333333000000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Sesi'#243'n Nro.'
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel10: TQRLabel
      Left = 84
      Top = 460
      Width = 121
      Height = 16
      Size.Values = (
        42.333333333333340000
        222.250000000000000000
        1217.083333333333000000
        320.145833333333400000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Fecha'
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel11: TQRLabel
      Left = 204
      Top = 460
      Width = 245
      Height = 16
      Size.Values = (
        42.333333333333340000
        539.750000000000000000
        1217.083333333333000000
        648.229166666666800000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Firma del Paciente'
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel12: TQRLabel
      Left = 448
      Top = 460
      Width = 290
      Height = 16
      Size.Values = (
        42.333333333333340000
        1185.333333333333000000
        1217.083333333333000000
        767.291666666666800000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Observaciones'
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 223
      Top = 33
      Width = 511
      Height = 25
      Size.Values = (
        66.145833333333340000
        590.020833333333400000
        87.312500000000000000
        1352.020833333333000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Formulario de FKT'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 13
    end
    object QRLabel6: TQRLabel
      Left = 2
      Top = 310
      Width = 47
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        820.208333333333400000
        124.354166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlSiniestro: TQRLabel
      Left = 110
      Top = 310
      Width = 628
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        820.208333333333500000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 2
      Top = 327
      Width = 85
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        865.187500000000000000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tipo Prestaci'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlLocalidadCP: TQRLabel
      Left = 418
      Top = 164
      Width = 316
      Height = 17
      Size.Values = (
        44.979166666666670000
        1105.958333333333000000
        433.916666666666800000
        836.083333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel14: TQRLabel
      Left = 5
      Top = 164
      Width = 51
      Height = 17
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        433.916666666666700000
        134.937500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlDomicilio: TQRLabel
      Left = 67
      Top = 164
      Width = 344
      Height = 17
      Size.Values = (
        44.979166666666670000
        177.270833333333300000
        433.916666666666800000
        910.166666666666600000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape1: TQRShape
      Left = 1
      Top = 130
      Width = 738
      Height = 1
      Size.Values = (
        2.645833333333333000
        2.645833333333333000
        343.958333333333400000
        1952.625000000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape2: TQRShape
      Left = 1
      Top = 201
      Width = 738
      Height = 1
      Size.Values = (
        2.645833333333333000
        2.645833333333333000
        531.812500000000000000
        1952.625000000000000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel15: TQRLabel
      Left = 6
      Top = 147
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        15.875000000000000000
        388.937500000000000000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nombre:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel13: TQRLabel
      Left = 5
      Top = 181
      Width = 52
      Height = 17
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        478.895833333333400000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Provincia:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlProvincia: TQRLabel
      Left = 67
      Top = 181
      Width = 223
      Height = 17
      Size.Values = (
        44.979166666666670000
        177.270833333333300000
        478.895833333333400000
        590.020833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 1
      Top = 130
      Width = 1
      Height = 72
      Size.Values = (
        190.500000000000000000
        2.645833333333333000
        343.958333333333400000
        2.645833333333333000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape4: TQRShape
      Left = 738
      Top = 130
      Width = 1
      Height = 71
      Size.Values = (
        187.854166666666700000
        1952.625000000000000000
        343.958333333333400000
        2.645833333333333000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel16: TQRLabel
      Left = 294
      Top = 181
      Width = 26
      Height = 17
      Size.Values = (
        44.979166666666670000
        777.875000000000000000
        478.895833333333400000
        68.791666666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel.:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlTelefono: TQRLabel
      Left = 323
      Top = 181
      Width = 226
      Height = 17
      Size.Values = (
        44.979166666666670000
        854.604166666666800000
        478.895833333333400000
        597.958333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 2
      Top = 205
      Width = 89
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        542.395833333333400000
        235.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'N'#186' Autorizaci'#243'n:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlNroAutorizacion: TQRLabel
      Left = 110
      Top = 205
      Width = 63
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        542.395833333333400000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel19: TQRLabel
      Left = 2
      Top = 241
      Width = 102
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        637.645833333333400000
        269.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio Paciente:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlDomicilioPaciente: TQRLabel
      Left = 110
      Top = 241
      Width = 628
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        637.645833333333400000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object qrlFechaImpresion: TQRLabel
      Left = 685
      Top = 104
      Width = 52
      Height = 16
      Size.Values = (
        42.333333333333340000
        1812.395833333333000000
        275.166666666666700000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = '                 '
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
      Left = 553
      Top = 181
      Width = 23
      Height = 17
      Size.Values = (
        44.979166666666670000
        1463.145833333333000000
        478.895833333333400000
        60.854166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fax:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFax: TQRLabel
      Left = 579
      Top = 181
      Width = 154
      Height = 17
      Size.Values = (
        44.979166666666670000
        1531.937500000000000000
        478.895833333333400000
        407.458333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel22: TQRLabel
      Left = 1
      Top = 258
      Width = 77
      Height = 17
      Size.Values = (
        44.979166666666670000
        2.645833333333333000
        682.625000000000000000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel. Paciente:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlTelPaciente: TQRLabel
      Left = 110
      Top = 258
      Width = 419
      Height = 14
      Size.Values = (
        37.041666666666670000
        291.041666666666700000
        682.625000000000000000
        1108.604166666667000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '         '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel24: TQRLabel
      Left = 2
      Top = 393
      Width = 57
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        1039.812500000000000000
        150.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prestaci'#243'n'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestacion: TQRLabel
      Left = 110
      Top = 392
      Width = 628
      Height = 17
      Size.Values = (
        44.979166666666670000
        291.041666666666700000
        1037.166666666667000000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel25: TQRLabel
      Left = 197
      Top = 205
      Width = 104
      Height = 17
      Size.Values = (
        44.979166666666670000
        521.229166666666700000
        542.395833333333400000
        275.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de Solicitud:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFechaSolicitud: TQRLabel
      Left = 309
      Top = 205
      Width = 103
      Height = 17
      Size.Values = (
        44.979166666666670000
        817.562500000000000000
        542.395833333333400000
        272.520833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 
        '________________________________________________________________' +
        '_____________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
    object QRLabel27: TQRLabel
      Left = 448
      Top = 476
      Width = 290
      Height = 22
      Size.Values = (
        58.208333333333340000
        1185.333333333333000000
        1259.416666666667000000
        767.291666666666800000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Completar en cada Sesi'#243'n'
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel28: TQRLabel
      Left = 0
      Top = 476
      Width = 450
      Height = 22
      Size.Values = (
        58.208333333333340000
        0.000000000000000000
        1259.416666666667000000
        1190.625000000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel31: TQRLabel
      Left = 2
      Top = 409
      Width = 69
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        1082.145833333333000000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prestaciones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel33: TQRLabel
      Left = 2
      Top = 425
      Width = 66
      Height = 17
      Size.Values = (
        44.979166666666670000
        5.291666666666667000
        1124.479166666667000000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'relacionadas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrmemoTipoPrestacion: TQRMemo
      Left = 110
      Top = 328
      Width = 628
      Height = 64
      Size.Values = (
        169.333333333333300000
        291.041666666666700000
        867.833333333333500000
        1661.583333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlAnulado: TQRLabel
      Left = 490
      Top = 73
      Width = 246
      Height = 24
      Enabled = False
      Size.Values = (
        63.500000000000000000
        1296.458333333333000000
        193.145833333333300000
        650.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'AUTORIZACI'#211'N ANULADA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 15
    end
    object QRLabel34: TQRLabel
      Left = 541
      Top = 258
      Width = 75
      Height = 17
      Size.Values = (
        44.979166666666670000
        1431.395833333333000000
        682.625000000000000000
        198.437500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'F. Nacimiento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFNac: TQRLabel
      Left = 620
      Top = 259
      Width = 117
      Height = 14
      Size.Values = (
        37.041666666666670000
        1640.416666666667000000
        685.270833333333400000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlFNac'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 8
    end
  end
  object qriLogo: TQRImage
    Left = 40
    Top = 40
    Width = 219
    Height = 100
    Size.Values = (
      264.583333333333400000
      105.833333333333300000
      105.833333333333300000
      579.437500000000000000)
    XLColumn = 0
    AutoSize = True
  end
  object QRBand2: TQRBand
    Left = 38
    Top = 565
    Width = 740
    Height = 287
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      759.354166666666800000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbSummary
    object qrlFirmante: TQRLabel
      Left = 51
      Top = 217
      Width = 187
      Height = 17
      Size.Values = (
        44.979166666666670000
        134.937500000000000000
        574.145833333333400000
        494.770833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Firmante'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlCaracter: TQRLabel
      Left = 51
      Top = 233
      Width = 187
      Height = 15
      Size.Values = (
        39.687500000000000000
        134.937500000000000000
        616.479166666666800000
        494.770833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'Caracter'
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
      Left = 4
      Top = 63
      Width = 30
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        166.687500000000000000
        79.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Nota'
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
    object QRMemo2: TQRMemo
      Left = 35
      Top = 80
      Width = 690
      Height = 52
      Size.Values = (
        137.583333333333300000
        92.604166666666680000
        211.666666666666700000
        1825.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Lines.Strings = (
        
          'El paciente deber'#225' conformar cada sesi'#243'n realizada, en d'#237'as habi' +
          'les y consecutivos, de lo contrario la prestaci'#243'n no ser'#225' abonad' +
          'a. Al finalizar las mismas, se deber'#225' adelantar copia de este do' +
          'cumento por fax, y adjuntar el original con la facturaci'#243'n.')
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 16
      Top = 218
      Width = 31
      Height = 17
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        576.791666666666800000
        82.020833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Aval:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel18: TQRLabel
      Left = 484
      Top = 217
      Width = 56
      Height = 17
      Size.Values = (
        44.979166666666670000
        1280.583333333333000000
        574.145833333333400000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Gestion'#243':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlUsuario: TQRLabel
      Left = 543
      Top = 217
      Width = 187
      Height = 17
      Size.Values = (
        44.979166666666670000
        1436.687500000000000000
        574.145833333333400000
        494.770833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '  '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDocumento: TQRLabel
      Left = 241
      Top = 217
      Width = 187
      Height = 17
      Size.Values = (
        44.979166666666670000
        637.645833333333400000
        574.145833333333400000
        494.770833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = '  '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 8
      Top = 152
      Width = 222
      Height = 17
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        402.166666666666600000
        587.375000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prestaci'#243'n sujeta a Auditor'#237'a Posterior'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel29: TQRLabel
      Left = 4
      Top = 2
      Width = 193
      Height = 17
      Size.Values = (
        44.979166666666670000
        10.583333333333330000
        5.291666666666667000
        510.645833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Informe Final de las Sesiones:'
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
    object QRLabel30: TQRLabel
      Left = 16
      Top = 262
      Width = 117
      Height = 19
      Size.Values = (
        50.270833333333330000
        42.333333333333340000
        693.208333333333400000
        309.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Grupo de Trabajo:'
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
    object qrlGTrabajo: TQRLabel
      Left = 137
      Top = 263
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666670000
        362.479166666666700000
        695.854166666666800000
        613.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDelegacion: TQRLabel
      Left = 457
      Top = 263
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666670000
        1209.145833333333000000
        695.854166666666800000
        613.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel32: TQRLabel
      Left = 376
      Top = 263
      Width = 77
      Height = 19
      Size.Values = (
        50.270833333333330000
        994.833333333333400000
        695.854166666666800000
        203.729166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Delegaci'#243'n:'
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
    object QRShape5: TQRShape
      Left = 8
      Top = 254
      Width = 721
      Height = 9
      Size.Values = (
        23.812500000000000000
        21.166666666666670000
        672.041666666666800000
        1907.645833333333000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
  end
  object QRBand3: TQRBand
    Left = 38
    Top = 528
    Width = 740
    Height = 37
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      97.895833333333340000
      1957.916666666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRShape41: TQRShape
      Left = 0
      Top = 0
      Width = 85
      Height = 37
      Size.Values = (
        97.895833333333340000
        0.000000000000000000
        0.000000000000000000
        224.895833333333300000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRDBText1: TQRDBText
      Left = 12
      Top = 9
      Width = 62
      Height = 17
      Size.Values = (
        44.979166666666670000
        31.750000000000000000
        23.812500000000000000
        164.041666666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      Color = clWhite
      DataSet = sdqSesion
      DataField = 'ROWNUM'
      Font.Charset = DEFAULT_CHARSET
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
    object QRShape42: TQRShape
      Left = 84
      Top = 0
      Width = 121
      Height = 37
      Size.Values = (
        97.895833333333340000
        222.250000000000000000
        0.000000000000000000
        320.145833333333400000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape43: TQRShape
      Left = 204
      Top = 0
      Width = 245
      Height = 37
      Size.Values = (
        97.895833333333340000
        539.750000000000000000
        0.000000000000000000
        648.229166666666800000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape44: TQRShape
      Left = 448
      Top = 0
      Width = 290
      Height = 37
      Size.Values = (
        97.895833333333340000
        1185.333333333333000000
        0.000000000000000000
        767.291666666666800000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object QRLabel26: TQRLabel
    Left = 728
    Top = 73
    Width = 43
    Height = 25
    Size.Values = (
      66.145833333333340000
      1926.166666666667000000
      193.145833333333300000
      113.770833333333300000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'AUR'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 16
  end
  object sdqSesion: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ROWNUM'
      'FROM CTB_TABLAS'
      'WHERE ROWNUM < 10')
    Left = 470
    Top = 727
  end
  object dsSesion: TDataSource
    DataSet = sdqSesion
    Left = 498
    Top = 727
  end
  object sdqFKT: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT au_id, au_siniestro, au_orden, au_recaida, au_numauto, au' +
        '_idexpediente,'
      
        '       NVL (au_identifapro, au_identifprestador) prestador, au_u' +
        'suapro,'
      
        '       au_fechasoli, au_fechapro, NVL (au_presapro, au_pressol) ' +
        'prestacion,'
      
        '       au_estado, NVL (au_cantapro, au_cantidad) cantidad, au_av' +
        'al,'
      
        '       NVL (au_detalleapro, au_detalle) detalle, initcap(tj_nomb' +
        're) tj_nombre, tj_cuil,'
      '       art.trabajador.get_telefono(tj_id, 4) Telefono,'
      
        '       tj_documento, em_id, em_cuit, em_nombre, ca_identificador' +
        ','
      
        '       initcap(ca_descripcion) ca_descripcion, ca_domicilio, ca_' +
        'codpostal, ca_localidad, ca_codarea || '#39' '#39' || ca_telefono ca_tel' +
        'efono,'
      
        '       ca_fax, ca_direlectronica, dg_codigo || '#39' - '#39' || dg_descr' +
        'ipcion cie10,'
      
        '       on_nomenclador, on_capitulo, on_codigo, on_descripcion, g' +
        'p_nombre,'
      
        '       lg_nombre, pr_descripcion, au_siniestro || '#39'-'#39' || au_orde' +
        'n || '#39'-'#39' || au_recaida sincompleto, tj_fnacimiento'
      '  FROM art.sau_autorizaciones,'
      '       comunes.ctj_trabajador,'
      '       afi.aem_empresa,'
      '       art.cpr_prestador,'
      '       art.sex_expedientes,'
      '       afi.aco_contrato,'
      '       art.mpr_prestaciones,'
      '       art.cdg_diagnostico,'
      '       art.mgp_gtrabajo,'
      '       art.son_nomenclador,'
      '       art.dlg_delegaciones'
      ' WHERE au_id = :idautorizacion'
      
        '   AND NVL (au_identifapro, au_identifprestador) = ca_identifica' +
        'dor(+)'
      '   AND au_idexpediente = ex_id'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND NVL (au_presapro, au_pressol) = pr_codigo(+)'
      '   AND ex_diagnosticooms = dg_codigo(+)'
      '   --AND au_trabajo = gp_codigo(+)'
      '   AND ex_gtrabajo = gp_codigo(+)'
      '   AND au_pres_codigo = on_codigo(+)'
      '   AND au_pres_nomenclador = on_nomenclador(+)'
      '   AND au_pres_capitulo = on_capitulo(+)'
      '   AND ex_delegacion = lg_codigo(+)')
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idautorizacion'
        ParamType = ptInput
      end>
  end
end
