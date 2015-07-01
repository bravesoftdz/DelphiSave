object rptPedidoEntregaNuevo: TrptPedidoEntregaNuevo
  Left = 0
  Top = 0
  Width = 855
  Height = 796
  IDReport = 0
  DataSet = sdqPedidoEntrega
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
  ReportTitle = 'Pedido de Entrega'
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
    Width = 779
    Height = 955
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      2526.770833333333000000
      2061.104166666667000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbTitle
    object qriLogo: TQRImage
      Left = 505
      Top = 0
      Width = 233
      Height = 98
      Size.Values = (
        259.291666666666700000
        1336.145833333333000000
        0.000000000000000000
        616.479166666666800000)
      XLColumn = 0
    end
    object qrlTitulo: TQRLabel
      Left = 15
      Top = 9
      Width = 471
      Height = 34
      Size.Values = (
        89.958333333333340000
        39.687500000000000000
        23.812500000000000000
        1246.187500000000000000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Pedido de Entrega'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 14
    end
    object QRLabel2: TQRLabel
      Left = 14
      Top = 165
      Width = 48
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        436.562500000000000000
        127.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Se'#241'ores'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestador: TQRLabel
      Left = 14
      Top = 183
      Width = 73
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        484.187500000000000000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlPrestador'
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
    object qrlPrestDireccion: TQRLabel
      Left = 14
      Top = 201
      Width = 96
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        531.812500000000000000
        254.000000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlPrestDireccion'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestCPLocalidad: TQRLabel
      Left = 14
      Top = 219
      Width = 115
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        579.437500000000000000
        304.270833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlPrestCPLocalidad'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestProvincia: TQRLabel
      Left = 14
      Top = 237
      Width = 94
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        627.062500000000000000
        248.708333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlPrestProvincia'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestTelefono: TQRLabel
      Left = 14
      Top = 255
      Width = 10
      Height = 17
      Size.Values = (
        44.979166666666670000
        37.041666666666670000
        674.687500000000000000
        26.458333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '   '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel8: TQRLabel
      Left = 415
      Top = 153
      Width = 23
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        404.812500000000000000
        60.854166666666680000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Ref.'
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
    object QRLabel9: TQRLabel
      Left = 415
      Top = 170
      Width = 52
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        449.791666666666700000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Paciente:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel10: TQRLabel
      Left = 415
      Top = 239
      Width = 69
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        632.354166666666800000
        182.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestro N'#186':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel12: TQRLabel
      Left = 40
      Top = 406
      Width = 289
      Height = 17
      Size.Values = (
        44.979166666666670000
        105.833333333333300000
        1074.208333333333000000
        764.645833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Por medio de la presente se autoriza la provisi'#243'n de:'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrmDescripciones: TQRMemo
      Left = 40
      Top = 423
      Width = 685
      Height = 69
      Size.Values = (
        182.562500000000000000
        105.833333333333300000
        1119.187500000000000000
        1812.395833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlPaciente: TQRLabel
      Left = 505
      Top = 170
      Width = 63
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        449.791666666666700000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlPaciente'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlSiniestro: TQRLabel
      Left = 505
      Top = 239
      Width = 64
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        632.354166666666800000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlSiniestro'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlabMarca: TQRLabel
      Left = 40
      Top = 516
      Width = 37
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1365.250000000000000000
        97.895833333333320000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Marca:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlabOrigen: TQRLabel
      Left = 440
      Top = 517
      Width = 41
      Height = 16
      Size.Values = (
        42.333333333333340000
        1164.166666666667000000
        1367.895833333333000000
        108.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Origen:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFecCirEnt: TQRLabel
      Left = 40
      Top = 539
      Width = 165
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1426.104166666667000000
        436.562500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha de Cirug'#237'a y/o Entrega: '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlMarca: TQRLabel
      Left = 94
      Top = 516
      Width = 13
      Height = 16
      Size.Values = (
        42.333333333333340000
        248.708333333333300000
        1365.250000000000000000
        34.395833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '    '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlOrigen: TQRLabel
      Left = 494
      Top = 518
      Width = 13
      Height = 16
      Size.Values = (
        42.333333333333340000
        1307.041666666667000000
        1370.541666666667000000
        34.395833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '    '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlTurno: TQRLabel
      Left = 212
      Top = 539
      Width = 7
      Height = 16
      Size.Values = (
        42.333333333333340000
        560.916666666666700000
        1426.104166666667000000
        18.520833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '  '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel19: TQRLabel
      Left = 40
      Top = 605
      Width = 109
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1600.729166666667000000
        288.395833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Valor adjudicado: $ '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlImpoApro: TQRLabel
      Left = 157
      Top = 605
      Width = 68
      Height = 16
      Size.Values = (
        42.333333333333340000
        415.395833333333400000
        1600.729166666667000000
        179.916666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlImpoApro'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlEntregarEn: TQRLabel
      Left = 40
      Top = 630
      Width = 68
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1666.875000000000000000
        179.916666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Entregar en:'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlentregar: TQRLabel
      Left = 113
      Top = 630
      Width = 612
      Height = 16
      Size.Values = (
        42.333333333333340000
        298.979166666666700000
        1666.875000000000000000
        1619.250000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlentregar'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlMaterialDe: TQRLabel
      Left = 8
      Top = 333
      Width = 64
      Height = 16
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        881.062500000000000000
        169.333333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Material de:'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 42
      Top = 825
      Width = 73
      Height = 16
      Size.Values = (
        42.333333333333340000
        111.125000000000000000
        2182.812500000000000000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Atentamente,'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlImpoAproLetras: TQRLabel
      Left = 231
      Top = 605
      Width = 478
      Height = 16
      Size.Values = (
        42.333333333333340000
        611.187500000000000000
        1600.729166666667000000
        1264.708333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrlImpoAproLetras'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlCaracter: TQRLabel
      Left = 43
      Top = 866
      Width = 22
      Height = 16
      Size.Values = (
        42.333333333333340000
        113.770833333333300000
        2291.291666666667000000
        58.208333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '       '
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
    object qrlabHora: TQRLabel
      Left = 372
      Top = 539
      Width = 31
      Height = 16
      Size.Values = (
        42.333333333333340000
        984.250000000000000000
        1426.104166666667000000
        82.020833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Hora:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlHora: TQRLabel
      Left = 408
      Top = 539
      Width = 7
      Height = 16
      Size.Values = (
        42.333333333333340000
        1079.500000000000000000
        1426.104166666667000000
        18.520833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '  '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlDescPrestacion: TQRLabel
      Left = 89
      Top = 333
      Width = 103
      Height = 16
      Size.Values = (
        42.333333333333340000
        235.479166666666700000
        881.062500000000000000
        272.520833333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlDescPrestacion'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 415
      Top = 256
      Width = 86
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        677.333333333333400000
        227.541666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Autorizaci'#243'n N'#186':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlNumAuto: TQRLabel
      Left = 505
      Top = 256
      Width = 66
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        677.333333333333400000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlNumAuto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 171
      Top = 45
      Width = 66
      Height = 17
      Size.Values = (
        44.979166666666670000
        452.437500000000000000
        119.062500000000000000
        174.625000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Pedido N'#186':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlNroPedido: TQRLabel
      Left = 245
      Top = 44
      Width = 83
      Height = 17
      Size.Values = (
        44.979166666666670000
        648.229166666666800000
        116.416666666666700000
        219.604166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlNroPedido'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 7
      Top = 844
      Width = 31
      Height = 16
      Size.Values = (
        42.333333333333340000
        18.520833333333330000
        2233.083333333333000000
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
    object qrlDocumento: TQRLabel
      Left = 42
      Top = 884
      Width = 79
      Height = 16
      Size.Values = (
        42.333333333333340000
        111.125000000000000000
        2338.916666666667000000
        209.020833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlDocumento'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlUsuarioApro: TQRLabel
      Left = 532
      Top = 846
      Width = 10
      Height = 16
      Size.Values = (
        42.333333333333340000
        1407.583333333333000000
        2238.375000000000000000
        26.458333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '   '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFechaImpresion: TQRLabel
      Left = 663
      Top = 127
      Width = 73
      Height = 16
      Size.Values = (
        42.333333333333340000
        1754.187500000000000000
        336.020833333333400000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taRightJustify
      AlignToBand = False
      Caption = '                        '
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
    object qrmPrestSolicitante: TQRMemo
      Left = 40
      Top = 654
      Width = 7
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1730.375000000000000000
        18.520833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoStretch = True
      Color = clWhite
      Lines.Strings = (
        '  ')
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 9
    end
    object qrlPrestFax: TQRLabel
      Left = 14
      Top = 274
      Width = 10
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        724.958333333333200000
        26.458333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '   '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestAudPosterior: TQRLabel
      Left = 8
      Top = 911
      Width = 221
      Height = 16
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        2410.354166666667000000
        584.729166666666800000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prestaci'#243'n sujeta a Auditor'#237'a posterior'
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
    object qrlMatPrestacion: TQRLabel
      Left = 8
      Top = 352
      Width = 60
      Height = 16
      Size.Values = (
        42.333333333333340000
        21.166666666666670000
        931.333333333333500000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Prestaci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlPrestacion: TQRLabel
      Left = 89
      Top = 352
      Width = 16
      Height = 16
      Size.Values = (
        42.333333333333340000
        235.479166666666700000
        931.333333333333500000
        42.333333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '     '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel14: TQRLabel
      Left = 415
      Top = 273
      Width = 88
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        722.312500000000000000
        232.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha Solicitud:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFechaSolicitud: TQRLabel
      Left = 505
      Top = 273
      Width = 52
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        722.312500000000000000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '                 '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlabGTrabajo: TQRLabel
      Left = 9
      Top = 931
      Width = 117
      Height = 17
      Size.Values = (
        44.979166666666670000
        23.812500000000000000
        2463.270833333333000000
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
      Left = 132
      Top = 932
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666670000
        349.250000000000000000
        2465.916666666667000000
        613.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDelegacion: TQRLabel
      Left = 457
      Top = 931
      Width = 232
      Height = 17
      Size.Values = (
        44.979166666666670000
        1209.145833333333000000
        2463.270833333333000000
        613.833333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Caption = 'qrlDelegacion'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlabDelegacion: TQRLabel
      Left = 376
      Top = 931
      Width = 73
      Height = 17
      Size.Values = (
        44.979166666666670000
        994.833333333333400000
        2463.270833333333000000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Delegaci'#243'n'
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
    object qrsShape: TQRShape
      Left = 8
      Top = 925
      Width = 721
      Height = 9
      Size.Values = (
        23.812500000000000000
        21.166666666666670000
        2447.395833333333000000
        1907.645833333333000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel16: TQRLabel
      Left = 415
      Top = 187
      Width = 56
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        494.770833333333400000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Domicilio:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel17: TQRLabel
      Left = 415
      Top = 205
      Width = 58
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        542.395833333333400000
        153.458333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Localidad:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel18: TQRLabel
      Left = 415
      Top = 222
      Width = 52
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        587.375000000000000000
        137.583333333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tel'#233'fono:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlDomicilio: TQRLabel
      Left = 505
      Top = 187
      Width = 4
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        494.770833333333400000
        10.583333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlLocalidad: TQRLabel
      Left = 505
      Top = 205
      Width = 4
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        542.395833333333400000
        10.583333333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = ' '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlTelefono: TQRLabel
      Left = 505
      Top = 222
      Width = 43
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        587.375000000000000000
        113.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '159789'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrmDireccion: TQRMemo
      Left = 3
      Top = 112
      Width = 358
      Height = 43
      Size.Values = (
        113.770833333333300000
        7.937500000000000000
        296.333333333333400000
        947.208333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
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
    object qrlRelaciones: TQRMemo
      Left = 89
      Top = 372
      Width = 625
      Height = 31
      Size.Values = (
        82.020833333333340000
        235.479166666666700000
        984.249999999999900000
        1653.645833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 8
    end
    object qrlPrestaciones: TQRLabel
      Left = 8
      Top = 372
      Width = 73
      Height = 30
      Size.Values = (
        79.375000000000000000
        21.166666666666670000
        984.249999999999900000
        193.145833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Prestaciones relacionadas'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlAnulado: TQRLabel
      Left = 490
      Top = 99
      Width = 246
      Height = 24
      Enabled = False
      Size.Values = (
        63.500000000000000000
        1296.458333333333000000
        261.937500000000000000
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
    object qrlPrestMail: TQRLabel
      Left = 14
      Top = 292
      Width = 13
      Height = 16
      Size.Values = (
        42.333333333333340000
        37.041666666666670000
        772.583333333333400000
        34.395833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '    '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlDirEntrega: TQRLabel
      Left = 38
      Top = 676
      Width = 19
      Height = 16
      Size.Values = (
        42.333333333333340000
        100.541666666666700000
        1788.583333333333000000
        50.270833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '      '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlTelAut: TQRLabel
      Left = 38
      Top = 699
      Width = 16
      Height = 16
      Size.Values = (
        42.333333333333340000
        100.541666666666700000
        1849.437500000000000000
        42.333333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '     '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlRecibe: TQRLabel
      Left = 38
      Top = 719
      Width = 16
      Height = 16
      Size.Values = (
        42.333333333333340000
        100.541666666666700000
        1902.354166666667000000
        42.333333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '     '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFirmaUsuario: TQRLabel
      Left = 43
      Top = 845
      Width = 19
      Height = 16
      Size.Values = (
        42.333333333333340000
        113.770833333333300000
        2235.729166666667000000
        50.270833333333330000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '      '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrmObservImpresion: TQRMemo
      Left = 36
      Top = 737
      Width = 681
      Height = 32
      Size.Values = (
        84.666666666666680000
        95.250000000000000000
        1949.979166666667000000
        1801.812500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 9
    end
    object qrlMontoBruto: TQRLabel
      Left = 40
      Top = 564
      Width = 82
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1492.250000000000000000
        216.958333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Monto Bruto: $ '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlIVA: TQRLabel
      Left = 40
      Top = 584
      Width = 34
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1545.166666666667000000
        89.958333333333320000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'IVA: $ '
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlmbruto: TQRLabel
      Left = 130
      Top = 564
      Width = 54
      Height = 16
      Size.Values = (
        42.333333333333340000
        343.958333333333400000
        1492.250000000000000000
        142.875000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlmbruto'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlmiva: TQRLabel
      Left = 84
      Top = 584
      Width = 41
      Height = 16
      Size.Values = (
        42.333333333333340000
        222.250000000000000000
        1545.166666666667000000
        108.479166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlmiva'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel1: TQRLabel
      Left = 415
      Top = 291
      Width = 80
      Height = 16
      Size.Values = (
        42.333333333333340000
        1098.020833333333000000
        769.937500000000000000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha Nacim.:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object qrlFNac: TQRLabel
      Left = 505
      Top = 291
      Width = 44
      Height = 16
      Size.Values = (
        42.333333333333340000
        1336.145833333333000000
        769.937500000000000000
        116.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFNac'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRMemo1: TQRMemo
      Left = 40
      Top = 496
      Width = 685
      Height = 16
      Size.Values = (
        42.333333333333340000
        105.833333333333300000
        1312.333333333333000000
        1812.395833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        
          'Remitir a la casilla controldeinsumos@provart.com.ar, en 48/72hs' +
          '., conformidad de aceptaci'#243'n del m'#233'dico, y posterior fecha de en' +
          'trega de los materiales.')
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 7
    end
  end
  object qrmRequisitos: TQRMemo
    Left = 82
    Top = 816
    Width = 653
    Height = 33
    Size.Values = (
      87.312500000000000000
      216.958333333333400000
      2159.000000000000000000
      1727.729166666667000000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      
        'PARA SU LIQUIDACI'#211'N SE DEBERA ADJUNTAR A LA FACTURA CERTIFICADO ' +
        'DE IMPLANTE COMPLETO Y FIRMADO'
      
        'POR EL MEDICO, STICKERS Y PARTE QUIR'#218'RGICO, SUJETO A AUDITORIA Y' +
        ' PAGO DE LO QUE SE UTILICE')
    ParentFont = False
    Transparent = False
    FullJustify = False
    MaxBreakChars = 0
    FontSize = 9
  end
  object QRLabel11: TQRLabel
    Left = 453
    Top = 347
    Width = 52
    Height = 16
    Size.Values = (
      42.333333333333340000
      1198.562500000000000000
      918.104166666666800000
      137.583333333333300000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Empresa'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 9
  end
  object qrlEmpresa: TQRLabel
    Left = 543
    Top = 347
    Width = 66
    Height = 16
    Size.Values = (
      42.333333333333340000
      1436.687500000000000000
      918.104166666666800000
      174.625000000000000000)
    XLColumn = 0
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'qrlEmpresa'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FontSize = 9
  end
  object sdqPedidoEntrega: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT NVL (au_impoapro, au_importe) importe,'
      '       solicitado.ca_descripcion pressol, au_identifprestador,'
      
        '       solicitado.ca_domicilio domsol, solicitado.ca_codpostal c' +
        'psol,'
      
        '       solicitado.ca_localidad locsol, solicitado.ca_provincia p' +
        'rovsol,'
      
        '       solicitado.ca_telefono telsol, au_identifapro, aprobado.c' +
        'a_descripcion,'
      
        '       aprobado.ca_domicilio, aprobado.ca_localidad, aprobado.ca' +
        '_codarea || '#39' '#39' || aprobado.ca_telefono ca_telefono, '
      
        '       aprobado.ca_fax, aprobado.ca_identificador, aprobado.ca_d' +
        'irelectronica, '
      
        '       aprobado.ca_codpostal, au_implante, au_idexpediente, au_f' +
        'echasoli,'
      
        '       au_siniestro, au_orden, au_recaida, au_numauto, au_estado' +
        ', tj_nombre, tj_cuil,'
      '       art.trabajador.get_telefono(tj_id, 4) Telefono,'
      '       tj_documento, au_id,'
      
        '       au_siniestro || '#39'-'#39' || au_orden || '#39'-'#39' || au_recaida sini' +
        'estrocomp,'
      '       NVL (au_cantapro, au_cantidad) cantidad,'
      
        '       REPLACE(NVL (au_detalleapro, au_detalle), CHR(10), '#39'; '#39' )' +
        ' detalle, on_capitulo, on_codigo,'
      
        '       on_descripcion, pr_descripcion, au_turno, au_turnohora, a' +
        'u_aval,'
      
        '       au_usuapro, nvl(au_observacionesimpresion, au_observacion' +
        'es) observaciones, '
      '       gp_nombre, lg_nombre, au_nropedido,'
      '       art.utiles.armar_domicilio (tj_calle,'
      '                                   tj_numero,'
      '                                   tj_piso,'
      '                                   tj_departamento'
      '                                  ) domiciliopaciente,'
      '       art.utiles.armar_localidad (tj_cpostal,'
      '                                   tj_cpostala,'
      '                                   tj_localidad,'
      '                                   tj_provincia'
      '                                  ) localidadpaciente,'
      
        '       au_presapro, AU_OBSERVACIONESIMPRESION, PR_REQUISITOSPEDE' +
        'NT, em_nombre, tj_fnacimiento, ex_id'
      '  FROM art.sau_autorizaciones,'
      '       art.cpr_prestador solicitado,'
      '       art.cpr_prestador aprobado,'
      '       comunes.ctj_trabajador,'
      '       art.mpr_prestaciones,'
      '       art.mgp_gtrabajo,'
      '       art.son_nomenclador,'
      '       art.dlg_delegaciones,'
      '       art.sex_expedientes,'
      '       afi.aco_contrato,'
      '       afi.aem_empresa'
      ' WHERE au_id = :idautorizacion'
      '   AND au_identifprestador = solicitado.ca_identificador(+)'
      
        '   AND NVL (au_identifapro, au_identifprestador) = aprobado.ca_i' +
        'dentificador(+)'
      '   AND au_idexpediente = ex_id'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_gtrabajo = gp_codigo(+)'
      '   AND ex_delegacion = lg_codigo'
      '   AND au_pres_codigo = on_codigo(+)'
      '   AND au_pres_nomenclador = on_nomenclador(+)'
      '   AND au_pres_capitulo = on_capitulo(+)'
      '   AND NVL (au_presapro, au_pressol) = pr_codigo(+)'
      '   AND ex_contrato = co_contrato'
      '   AND co_idempresa = em_id')
    Left = 4
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idautorizacion'
        ParamType = ptInput
      end>
  end
  object sdqImplante: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'select im_codigo, im_marca, im_empresa, im_origen, im_fbaja, pa_' +
        'descripcion'
      'from mim_implantes, cpa_paises '
      'where im_origen = pa_codigo (+)'
      'and im_codigo = :codimplante')
    Left = 40
    Top = 5
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codimplante'
        ParamType = ptInput
      end>
  end
end
