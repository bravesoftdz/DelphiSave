object QrDetalleLoteEstudio: TQrDetalleLoteEstudio
  Left = -10
  Top = 182
  Width = 808
  Height = 608
  Caption = 'Lote de Envio de Documentaci'#243'n a Estudio/Abogado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrpLote: TQuickRep
    Left = 1
    Top = 0
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqConsulta
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
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
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrbDetailValoresYPeriodos: TQRBand
      Left = 38
      Top = 272
      Width = 740
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1957.916666666667000000)
      BandType = rbDetail
      object QRShape2: TQRShape
        Left = 0
        Top = -1
        Width = 738
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          -2.645833333333333000
          1952.625000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsVert1Periodos: TQRShape
        Left = 204
        Top = -2
        Width = 6
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333340000
          539.750000000000000000
          -5.291666666666667000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrdbDocumento: TQRDBText
        Left = 2
        Top = 3
        Width = 202
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          5.291666666666667000
          7.937500000000000000
          534.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'TIPOCARPETA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbObservaciones: TQRDBText
        Left = 463
        Top = 3
        Width = 272
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1225.020833333333000000
          7.937500000000000000
          719.666666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'OBSERVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrsVert2Periodos: TQRShape
        Left = 454
        Top = -2
        Width = 8
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333340000
          1201.208333333333000000
          -5.291666666666667000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrdbCodigoDocumento: TQRDBText
        Left = 212
        Top = 3
        Width = 240
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          560.916666666666800000
          7.937500000000000000
          635.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'DESCRIPCIONCLAVE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbTituloPeriodos: TQRBand
      Left = 38
      Top = 161
      Width = 740
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        1957.916666666667000000)
      BandType = rbTitle
      object qrlLoteEnvioDocumentacion: TQRLabel
        Left = 0
        Top = 2
        Width = 737
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          5.291666666666667000
          1949.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Remito de Env'#237'o de Documentaci'#243'n a Estudio/Abogado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrdbTipo: TQRDBText
        Left = 0
        Top = 23
        Width = 737
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          60.854166666666680000
          1949.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'ESTUDIOLEG'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbHeader: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        325.437500000000000000
        1957.916666666667000000)
      BandType = rbPageHeader
      object QRShape3: TQRShape
        Left = 613
        Top = 57
        Width = 106
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          47.625000000000000000
          1621.895833333333000000
          150.812500000000000000
          280.458333333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlAnio: TQRLabel
        Left = 678
        Top = 59
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1793.875000000000000000
          156.104166666666700000
          103.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0001'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlMes: TQRLabel
        Left = 647
        Top = 60
        Width = 23
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1711.854166666667000000
          158.750000000000000000
          60.854166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '01'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlDia: TQRLabel
        Left = 617
        Top = 60
        Width = 21
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1632.479166666667000000
          158.750000000000000000
          55.562500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '01'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrsSeparadorFecha1: TQRShape
        Left = 638
        Top = 57
        Width = 9
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1688.041666666667000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsSeparadorFecha2: TQRShape
        Left = 673
        Top = 57
        Width = 4
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1780.645833333333000000
          150.812500000000000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlPagina: TQRLabel
        Left = 548
        Top = 35
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1449.916666666667000000
          92.604166666666680000
          447.145833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlPagina'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNumero: TQRLabel
        Left = 549
        Top = 6
        Width = 168
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666680000
          1452.562500000000000000
          15.875000000000000000
          444.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlNumero'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrCodigoBarras: TQRLabel
        Left = 452
        Top = 80
        Width = 266
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          1195.916666666667000000
          211.666666666666700000
          703.791666666666800000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = '*0200000000*'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Code39-Digits'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 28
      end
      object qriLogo: TQRImage
        Left = 4
        Top = 5
        Width = 163
        Height = 64
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          169.333333333333300000
          10.583333333333330000
          13.229166666666670000
          431.270833333333400000)
        Stretch = True
      end
    end
    object qrgValores: TQRGroup
      Left = 38
      Top = 203
      Width = 740
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDetailValoresYPeriodos
      ParentFont = False
      Size.Values = (
        129.645833333333300000
        1957.916666666667000000)
      Expression = 'sdqValoresYPeriodos.TIPO'
      FooterBand = qrbGroupFooterPeriodos
      Master = qrpLote
      ReprintOnNewPage = True
      object qrlDescripcionValores: TQRLabel
        Left = 20
        Top = 19
        Width = 322
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222230000
          52.916666666666660000
          50.711805555555560000
          851.076388888889100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Las siguientes carpetas se adjuntan para su env'#237'o:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qcbValoresYPeriodos: TQRChildBand
      Left = 38
      Top = 252
      Width = 740
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      ParentBand = qrgValores
      object qrsFondoTitulos: TQRShape
        Left = 0
        Top = 0
        Width = 738
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          0.000000000000000000
          1952.625000000000000000)
        Brush.Color = 15461355
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsVert2HeaderValores: TQRShape
        Left = 204
        Top = 1
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          539.750000000000000000
          2.645833333333333000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlDocumento: TQRLabel
        Left = 2
        Top = 4
        Width = 202
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          5.291666666666667000
          10.583333333333330000
          534.458333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo Carpeta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object qrlCodigo: TQRLabel
        Left = 212
        Top = 3
        Width = 240
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          560.916666666666800000
          7.937500000000000000
          635.000000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Clave'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object qrsSepardado10: TQRShape
        Left = 454
        Top = 0
        Width = 8
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1201.208333333333000000
          0.000000000000000000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlObservaciones: TQRLabel
        Left = 463
        Top = 4
        Width = 272
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1225.020833333333000000
          10.583333333333330000
          719.666666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Observaciones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbGroupFooterPeriodos: TQRBand
      Left = 38
      Top = 296
      Width = 740
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        1957.916666666667000000)
      BandType = rbGroupFooter
      object QRShape1: TQRShape
        Left = 207
        Top = -1
        Width = 251
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          547.687500000000000000
          -2.645833333333333000
          664.104166666666800000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qreConteoRegistro: TQRExpr
        Left = 212
        Top = 3
        Width = 240
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          560.916666666666800000
          7.937500000000000000
          635.000000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT()'
        Mask = '#,###'
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 134
        Top = 3
        Width = 69
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          354.541666666666700000
          7.937500000000000000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cantidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbSummaryBand: TQRBand
      Left = 38
      Top = 332
      Width = 740
      Height = 133
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        351.895833333333400000
        1957.916666666667000000)
      BandType = rbPageFooter
      object qrsLineaFirma: TQRShape
        Left = 159
        Top = 74
        Width = 207
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          420.687500000000000000
          195.791666666666700000
          547.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlFirmaEmite: TQRLabel
        Left = 119
        Top = 58
        Width = 281
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          314.854166666666700000
          153.458333333333300000
          743.479166666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Emite'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 490
        Top = 74
        Width = 207
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1296.458333333333000000
          195.791666666666700000
          547.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 450
        Top = 91
        Width = 281
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1190.625000000000000000
          240.770833333333300000
          743.479166666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Recibe'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 119
        Top = 91
        Width = 281
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          314.854166666666700000
          240.770833333333300000
          743.479166666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Emite'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TA_DESCRIPCION TIPOCARPETA, ARCHIVO.GETDESCRIPCIONCLAVE(T' +
        'C_ID, AR_CLAVE) DESCRIPCIONCLAVE,'
      
        '       BO_NOMBRE ESTUDIOLEG, AR_OBSERVACIONES OBSERVACIONES, ACT' +
        'UALDATE FECHAALTA'
      
        '  FROM LEGALES.LBO_ABOGADO, RTC_TIPOCLAVE, RTA_TIPOARCHIVO, RAR_' +
        'ARCHIVO'
      ' WHERE AR_LOTE_ENTREGADOTERCEROS = :IdLote'
      '   AND AR_TIPO = TA_ID'
      '   AND TA_FORMULARIO = TC_CLAVE'
      '   AND AR_IDABOGADO = BO_ID'
      '')
    Left = 7
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdLote'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 8
    Top = 40
  end
end
