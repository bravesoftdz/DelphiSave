object QrDetalleLote: TQrDetalleLote
  Left = -4
  Top = -4
  Width = 1448
  Height = 880
  Caption = 'Lote de Envio de Documentaci'#243'n'
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
      100.012500000000000000
      2794.000000000000000000
      100.012500000000000000
      2159.000000000000000000
      66.145833333333340000
      60.854166666666680000
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
      Left = 25
      Top = 284
      Width = 768
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
        2032.000000000000000000)
      BandType = rbDetail
      object QRShape2: TQRShape
        Left = 0
        Top = -1
        Width = 766
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
          2026.708333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsVert1Valores: TQRShape
        Left = 52
        Top = 0
        Width = 6
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          138.906250000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert3Valores: TQRShape
        Left = 370
        Top = 0
        Width = 6
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          980.281250000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert1Periodos: TQRShape
        Left = 323
        Top = 0
        Width = 6
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          855.927083333333200000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrNumeroItem: TQRDBText
        Left = 3
        Top = 3
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          7.937500000000000000
          7.937500000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'DA_SEQ_LOTE'
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
      object qrdbDocumento: TQRDBText
        Left = 58
        Top = 3
        Width = 201
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          153.458333333333300000
          7.937500000000000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'TD_DESCRIPCION'
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
      object qrdbHojas: TQRDBText
        Left = 328
        Top = 3
        Width = 43
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          869.156250000000000000
          7.937500000000000000
          112.447916666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'DA_HOJAS'
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
        Left = 602
        Top = 0
        Width = 6
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1591.468750000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrdbCodigoDocumento: TQRDBText
        Left = 377
        Top = 3
        Width = 226
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          997.479166666666800000
          7.937500000000000000
          596.635416666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'CLAVE'
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
      object QRShape7: TQRShape
        Left = 700
        Top = 0
        Width = 6
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1850.760416666667000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText2: TQRDBText
        Left = 706
        Top = 3
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1867.958333333333000000
          7.937500000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'DA_NROACUSECORREO'
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
      object QRDBText1: TQRDBText
        Left = 607
        Top = 3
        Width = 94
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1606.020833333333000000
          7.937500000000000000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'DA_CODIGODOCUMENTO'
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
      object QRDBText3: TQRDBText
        Left = 264
        Top = 3
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          698.500000000000000000
          7.937500000000000000
          157.427083333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'TD_CODIGO'
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
      object QRShape5: TQRShape
        Left = 258
        Top = 0
        Width = 6
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          682.625000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrbTituloPeriodos: TQRBand
      Left = 25
      Top = 175
      Width = 768
      Height = 40
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
        105.833333333333300000
        2032.000000000000000000)
      BandType = rbTitle
      object qrlLoteEnvioDocumentacion: TQRLabel
        Left = 0
        Top = 5
        Width = 765
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          13.229166666666670000
          2024.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Lote de Env'#237'o de Documentaci'#243'n'
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
        Top = 22
        Width = 765
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          58.208333333333340000
          2024.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'TA_DESCRIPCION'
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
      Left = 25
      Top = 38
      Width = 768
      Height = 137
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
        362.479166666666700000
        2032.000000000000000000)
      BandType = rbPageHeader
      object QRShape3: TQRShape
        Left = 657
        Top = 73
        Width = 106
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          47.625000000000000000
          1738.312500000000000000
          193.145833333333300000
          280.458333333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlAnio: TQRLabel
        Left = 722
        Top = 75
        Width = 39
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1910.291666666667000000
          198.437500000000000000
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
        Left = 691
        Top = 76
        Width = 23
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          201.083333333333300000
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
        Left = 661
        Top = 76
        Width = 21
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1748.895833333334000000
          201.083333333333300000
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
        Left = 682
        Top = 73
        Width = 9
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1804.458333333333000000
          193.145833333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsSeparadorFecha2: TQRShape
        Left = 717
        Top = 73
        Width = 4
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1897.062500000000000000
          193.145833333333300000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlNumero: TQRLabel
        Left = 593
        Top = 23
        Width = 168
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666680000
          1568.979166666667000000
          60.854166666666680000
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
      object qrlPagina: TQRLabel
        Left = 592
        Top = 51
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          134.937500000000000000
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
      object qrCodigoBarras: TQRLabel
        Left = 497
        Top = 95
        Width = 266
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          1314.979166666667000000
          251.354166666666700000
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
      object qrFirmaReimpresion: TQRLabel
        Left = 480
        Top = 3
        Width = 281
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1270.000000000000000000
          7.937500000000000000
          743.479166666666800000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrFirmaReimpresion'
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
      object qriLogo: TQRImage
        Left = 7
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
          18.520833333333330000
          13.229166666666670000
          431.270833333333400000)
        Stretch = True
      end
    end
    object qrgValores: TQRGroup
      Left = 25
      Top = 215
      Width = 768
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
        2032.000000000000000000)
      Expression = 'sdqValoresYPeriodos.TIPO'
      FooterBand = qrbGroupFooterPeriodos
      Master = qrpLote
      ReprintOnNewPage = True
      object qrlDescripcionValores: TQRLabel
        Left = 2
        Top = 19
        Width = 322
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          50.270833333333330000
          851.958333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Los siguientes documentos se adjuntan para su env'#237'o a '
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
      object qrlDescripcionDestinoLote: TQRLabel
        Left = 326
        Top = 19
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          862.541666666666900000
          50.270833333333330000
          447.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'opcion destino'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qcbValoresYPeriodos: TQRChildBand
      Left = 25
      Top = 264
      Width = 768
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
        2032.000000000000000000)
      ParentBand = qrgValores
      object qrsFondoTitulos: TQRShape
        Left = 0
        Top = 0
        Width = 766
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
          2026.708333333333000000)
        Brush.Color = 15461355
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsVert1HeaderValores: TQRShape
        Left = 52
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.976851851851850000
          138.171296296296300000
          0.000000000000000000
          16.168981481481480000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert3HeaderValores: TQRShape
        Left = 371
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.976851851851850000
          980.428240740740700000
          0.000000000000000000
          16.168981481481480000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert2HeaderValores: TQRShape
        Left = 323
        Top = 1
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.976851851851850000
          855.486111111111000000
          2.939814814814815000
          16.168981481481480000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrNumero: TQRLabel
        Left = 3
        Top = 4
        Width = 50
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          7.937500000000000000
          10.583333333333330000
          132.291666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#250'mero'
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
      object qrlDocumento: TQRLabel
        Left = 58
        Top = 4
        Width = 201
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          153.458333333333300000
          10.583333333333330000
          531.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Documento'
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
        Left = 377
        Top = 3
        Width = 226
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          997.479166666666800000
          7.937500000000000000
          596.635416666666800000)
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
        Left = 602
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.976851851851850000
          1591.909722222222000000
          0.000000000000000000
          16.168981481481480000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlLabelOpcionDestino: TQRLabel
        Left = 328
        Top = 3
        Width = 43
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          869.156250000000000000
          7.937500000000000000
          112.447916666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hojas'
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
        Left = 699
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.976851851851850000
          1850.613425925926000000
          0.000000000000000000
          16.168981481481480000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 706
        Top = 4
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1867.958333333333000000
          10.583333333333330000
          156.104166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' Correo'
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
        Left = 607
        Top = 4
        Width = 94
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          36.747685185185190000
          1606.608796296296000000
          10.289351851851850000
          248.414351851851900000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' Documento'
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
      object QRLabel4: TQRLabel
        Left = 264
        Top = 4
        Width = 59
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          698.500000000000000000
          10.583333333333330000
          157.427083333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#243'd. Doc.'
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
      object QRShape4: TQRShape
        Left = 258
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          682.625000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrbGroupFooterPeriodos: TQRBand
      Left = 25
      Top = 308
      Width = 768
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
        2032.000000000000000000)
      BandType = rbGroupFooter
      object QRShape1: TQRShape
        Left = 373
        Top = -1
        Width = 231
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          987.777777777777800000
          -2.939814814814815000
          611.481481481481500000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsRectTotalValores: TQRShape
        Left = 326
        Top = -1
        Width = 47
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          863.864583333333200000
          -2.645833333333333000
          125.677083333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qreSumaHojas: TQRExpr
        Left = 328
        Top = 3
        Width = 43
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          869.156250000000000000
          7.937500000000000000
          112.447916666666700000)
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
        Expression = 'SUM(sdqConsulta.DA_HOJAS)'
        Mask = '#,###'
        FontSize = 8
      end
      object qreConteoRegistro: TQRExpr
        Left = 377
        Top = 3
        Width = 225
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          36.747685185185190000
          998.067129629629700000
          7.349537037037038000
          595.312500000000000000)
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
        Left = 253
        Top = 3
        Width = 69
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          36.747685185185190000
          668.807870370370400000
          7.349537037037037000
          182.268518518518500000)
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
      Left = 25
      Top = 344
      Width = 768
      Height = 216
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
        571.500000000000000000
        2032.000000000000000000)
      BandType = rbPageFooter
      object qrsLineaFirma: TQRShape
        Left = 489
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
          1293.812500000000000000
          195.791666666666700000
          547.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlFirmaConforme: TQRLabel
        Left = 419
        Top = 91
        Width = 347
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1108.604166666667000000
          240.770833333333300000
          918.104166666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Firma Usuario'
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
      object qrlSectorFirmaConforme: TQRLabel
        Left = 419
        Top = 109
        Width = 347
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1108.604166666667000000
          288.395833333333400000
          918.104166666666800000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Sector Firma Usuario'
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
      'SELECT da_id, da_numero,'
      '       da_opciondestino,'
      
        '       DECODE(da_opciondestino, '#39'D'#39', '#39'Digitalizaci'#243'n'#39', '#39'G'#39', '#39'Gua' +
        'rda'#39', '#39'A'#39', '#39'Archivo ART'#39', '#39'S'#39', '#39'Sin Papel'#39', '#39'U'#39', '#39'Digit. por Usu' +
        'ario'#39') da_descripdestino,'
      '       td_codigo, td_descripcion,'
      '       da_usualta, da_fechalta,'
      
        '       da_hojas, archivo.get_observacdetallearchivo(da_id, ar_ti' +
        'po) observaciones, da_lote,'
      '       da_seq_lote, da_tipoalta, da_usubaja, da_fechabaja'
      '       ar_id, ar_tipo, ta_descripcion, ta_fechabaja,'
      '       DECODE (ar_tipoubicacion,'
      '               '#39'D'#39', '#39'Delegaci'#243'n'#39','
      '               '#39'L'#39', '#39'Lugar'#39','
      '               '#39'S'#39', '#39'Sector'#39','
      '               '#39'U'#39', '#39'Usuario'#39','
      '               '#39'G'#39', '#39'Administradora'#39
      '              ) tipoubicacion, ar_ubicacion,'
      '       art.archivo.getubicacionnombre (ar_tipoubicacion,'
      '                                       ar_ubicacion'
      '                                      ) ubicacion,'
      '       ar_fechamovimiento, ar_caja, ar_receptor, ar_emisor,'
      '       archivo.getdescripcionclave (tc_id, ar_clave) clave,'
      '       da_codigodocumento, da_nroacusecorreo'
      '  FROM rar_archivo r, rta_tipoarchivo t, rtc_tipoclave c,'
      '       rda_detallearchivo d, rtd_tipodocumento td, rlo_lote'
      ' WHERE ar_tipo = ta_id'
      '   AND ta_formulario = tc_clave'
      '   AND da_idarchivo = ar_id'
      '   AND da_idtipodocumento = td_id'
      '   AND da_lote = lo_id'
      '   AND lo_id = :lo_id'
      
        '   AND (da_fechabaja IS NULL OR archivo.is_permitir_detallearch_' +
        'baja(ta_id) = '#39'S'#39')'
      '   AND lo_fechabaja IS NULL'
      'ORDER BY da_seq_lote'
      ''
      '')
    Left = 7
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'lo_id'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 8
    Top = 40
  end
end
