inherited frmListLiqDocUsuario: TfrmListLiqDocUsuario
  Left = 184
  Top = 95
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Tablero de control - Dinerarias'
  ClientHeight = 503
  ClientWidth = 1054
  Constraints.MinHeight = 115
  Constraints.MinWidth = 305
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrLiqDocUsuario: TQuickRep [0]
    Left = -4
    Top = 0
    Width = 1056
    Height = 816
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqLiqDoc
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
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Letter
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      2794.000000000000000000
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
    ReportTitle = 'Tablero de control - Dinerarias'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object TitleBand1: TQRBand
      Left = 38
      Top = 38
      Width = 980
      Height = 55
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
        145.520833333333300000
        2592.916666666667000000)
      BandType = rbTitle
      object qrlTitulo: TQRLabel
        Left = 0
        Top = 7
        Width = 979
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Frame.Width = 3
        Size.Values = (
          76.729166666666680000
          0.000000000000000000
          18.520833333333330000
          2590.270833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TABLERO DE CONTROL - DINERARIAS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object qrFechaHOY: TQRSysData
        Left = 889
        Top = 11
        Width = 88
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2352.145833333333000000
          29.104166666666670000
          232.833333333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Transparent = False
        FontSize = 10
      end
      object qrlSubTitulo: TQRLabel
        Left = 0
        Top = 32
        Width = 977
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Frame.Width = 3
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          84.666666666666680000
          2584.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SubTitulo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object pfFooterPagina: TQRBand
      Left = 38
      Top = 203
      Width = 980
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666660000
        2592.916666666667000000)
      BandType = rbPageFooter
      object QRSysData2: TQRSysData
        Left = 927
        Top = 0
        Width = 36
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2452.687500000000000000
          0.000000000000000000
          95.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Transparent = False
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 885
        Top = 0
        Width = 41
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2341.562500000000000000
          0.000000000000000000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'gina'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrImpresoPor: TQRLabel
        Left = 4
        Top = 0
        Width = 69
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          0.000000000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Impreso por'
        Color = clWhite
        OnPrint = qrImpresoPorPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrhUsuAlta: TQRGroup
      Left = 38
      Top = 93
      Width = 980
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = 13553358
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2592.916666666667000000)
      Expression = 'sdqLiqDoc.USUALTA'
      FooterBand = qrfUsuAlta
      Master = qrLiqDocUsuario
      ReprintOnNewPage = True
      object QRDBText15: TQRDBText
        Left = 3
        Top = 4
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          10.583333333333330000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = 13553358
        DataSet = sdqLiqDoc
        DataField = 'USUALTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 102
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
          269.875000000000000000
          10.583333333333330000
          156.104166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Liquidadas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 173
        Top = 4
        Width = 58
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          457.729166666666600000
          10.583333333333330000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Anuladas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 241
        Top = 4
        Width = 81
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          637.645833333333400000
          10.583333333333330000
          214.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pedidos Docum.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 332
        Top = 4
        Width = 100
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          878.416666666666800000
          10.583333333333330000
          264.583333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Docum. Digitalizada'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 443
        Top = 4
        Width = 115
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1172.104166666667000000
          10.583333333333330000
          304.270833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cartas Doc. Impresas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 566
        Top = 4
        Width = 85
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1497.541666666667000000
          10.583333333333330000
          224.895833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Acc. Seg. Casos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 659
        Top = 4
        Width = 76
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1743.604166666667000000
          10.583333333333330000
          201.083333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Casos Cod. 02'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 746
        Top = 4
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1973.791666666667000000
          10.583333333333330000
          166.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Doc. Recib.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 820
        Top = 4
        Width = 72
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2169.583333333333000000
          10.583333333333330000
          190.500000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Liq. a Revisi'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 905
        Top = 4
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2394.479166666667000000
          10.583333333333330000
          166.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Sin. Liquid.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object qrhFProceso: TQRGroup
      Left = 38
      Top = 117
      Width = 980
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2592.916666666667000000)
      Expression = 'sdqLiqDoc.FPROCESO'
      FooterBand = qrfFProceso
      Master = qrLiqDocUsuario
      ReprintOnNewPage = True
    end
    object qrbTitle: TQRBand
      Left = 38
      Top = 135
      Width = 980
      Height = 18
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
        47.625000000000000000
        2592.916666666667000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 10
        Top = 2
        Width = 81
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          26.458333333333330000
          5.291666666666667000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'FALTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 102
        Top = 2
        Width = 57
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          269.875000000000000000
          5.291666666666667000
          150.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALLIQUIDACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 174
        Top = 2
        Width = 55
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          460.375000000000000000
          5.291666666666667000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALLIQANULADAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 244
        Top = 2
        Width = 77
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          645.583333333333400000
          5.291666666666667000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALPEDIDOSINFO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 343
        Top = 2
        Width = 86
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          907.520833333333400000
          5.291666666666667000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALDOCDIGITALIZAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 468
        Top = 2
        Width = 86
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1238.250000000000000000
          5.291666666666667000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALCARTASDOC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 568
        Top = 2
        Width = 79
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1502.833333333333000000
          5.291666666666667000
          209.020833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALACCSEGCASOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 661
        Top = 2
        Width = 74
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1748.895833333334000000
          5.291666666666667000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALCASOSCODACC02'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 749
        Top = 2
        Width = 58
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1981.729166666667000000
          5.291666666666667000
          153.458333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALDOCRECPORUSU'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 822
        Top = 2
        Width = 67
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2174.875000000000000000
          5.291666666666667000
          177.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALLIQAREVISION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 907
        Top = 2
        Width = 58
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2399.770833333333000000
          5.291666666666667000
          153.458333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqLiqDoc
        DataField = 'TOTALSINLIQPORUSU'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrfUsuAlta: TQRBand
      Left = 38
      Top = 159
      Width = 980
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
        52.916666666666660000
        2592.916666666667000000)
      BandType = rbGroupFooter
      object QRExpr3: TQRExpr
        Left = 101
        Top = 3
        Width = 57
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          267.229166666666700000
          7.937500000000000000
          150.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALLIQUIDACIONES)'
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 176
        Top = 3
        Width = 53
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          465.666666666666800000
          7.937500000000000000
          140.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALLIQANULADAS)'
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 84
        Top = 0
        Width = 897
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          222.250000000000000000
          0.000000000000000000
          2373.312500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRExpr5: TQRExpr
        Left = 245
        Top = 3
        Width = 74
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          648.229166666666800000
          7.937500000000000000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALPEDIDOSINFO)'
        FontSize = 8
      end
      object QRExpr7: TQRExpr
        Left = 342
        Top = 3
        Width = 86
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          904.875000000000000000
          7.937500000000000000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALDOCDIGITALIZAR)'
        FontSize = 8
      end
      object QRExpr9: TQRExpr
        Left = 468
        Top = 3
        Width = 86
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1238.250000000000000000
          7.937500000000000000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALCARTASDOC)'
        FontSize = 8
      end
      object QRExpr11: TQRExpr
        Left = 568
        Top = 3
        Width = 77
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1502.833333333333000000
          7.937500000000000000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALACCSEGCASOS)'
        FontSize = 8
      end
      object QRExpr13: TQRExpr
        Left = 661
        Top = 3
        Width = 73
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1748.895833333334000000
          7.937500000000000000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALCASOSCODACC02)'
        FontSize = 8
      end
      object QRExpr14: TQRExpr
        Left = 749
        Top = 3
        Width = 56
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1981.729166666667000000
          7.937500000000000000
          148.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALDOCRECPORUSU)'
        FontSize = 8
      end
      object QRExpr15: TQRExpr
        Left = 822
        Top = 3
        Width = 66
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2174.875000000000000000
          7.937500000000000000
          174.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALLIQAREVISION)'
        FontSize = 8
      end
      object QRExpr16: TQRExpr
        Left = 908
        Top = 3
        Width = 56
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2402.416666666667000000
          7.937500000000000000
          148.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALSINLIQPORUSU)'
        FontSize = 8
      end
    end
    object qrfFProceso: TQRBand
      Left = 38
      Top = 153
      Width = 980
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        15.875000000000000000
        2592.916666666667000000)
      BandType = rbGroupFooter
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 179
      Width = 980
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
        2592.916666666667000000)
      BandType = rbSummary
      object QRLabel3: TQRLabel
        Left = 10
        Top = 8
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          21.166666666666670000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Totales:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRExpr1: TQRExpr
        Left = 100
        Top = 8
        Width = 58
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          264.583333333333400000
          21.166666666666670000
          153.458333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALLIQUIDACIONES)'
        FontSize = 9
      end
      object QRExpr2: TQRExpr
        Left = 176
        Top = 8
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          465.666666666666800000
          21.166666666666670000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALLIQANULADAS)'
        FontSize = 9
      end
      object QRExpr6: TQRExpr
        Left = 245
        Top = 8
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          648.229166666666800000
          21.166666666666670000
          193.145833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALPEDIDOSINFO)'
        FontSize = 9
      end
      object QRExpr8: TQRExpr
        Left = 341
        Top = 8
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          902.229166666666800000
          21.166666666666670000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALDOCDIGITALIZAR)'
        FontSize = 9
      end
      object QRExpr10: TQRExpr
        Left = 467
        Top = 8
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1235.604166666667000000
          21.166666666666670000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALCARTASDOC)'
        FontSize = 9
      end
      object QRExpr12: TQRExpr
        Left = 569
        Top = 8
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1505.479166666667000000
          21.166666666666670000
          198.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALACCSEGCASOS)'
        FontSize = 9
      end
      object QRExpr17: TQRExpr
        Left = 662
        Top = 8
        Width = 72
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1751.541666666667000000
          21.166666666666670000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALCASOSCODACC02)'
        FontSize = 9
      end
      object QRExpr18: TQRExpr
        Left = 750
        Top = 8
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1984.375000000000000000
          21.166666666666670000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALDOCRECPORUSU)'
        FontSize = 9
      end
      object QRExpr19: TQRExpr
        Left = 824
        Top = 8
        Width = 63
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2180.166666666667000000
          21.166666666666670000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALLIQAREVISION)'
        FontSize = 9
      end
      object QRExpr20: TQRExpr
        Left = 908
        Top = 8
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2402.416666666667000000
          21.166666666666670000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Color = clWhite
        Master = qrLiqDocUsuario
        ParentFont = False
        ResetAfterPrint = True
        Transparent = True
        WordWrap = True
        Expression = 'SUM(sdqLiqDoc.TOTALSINLIQPORUSU)'
        FontSize = 9
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 8
  end
  inherited XPMenu: TXPMenu
    Left = 36
  end
  inherited ilByN: TImageList
    Left = 8
  end
  inherited ilColor: TImageList
    Left = 36
  end
  inherited IconosXP: TImageList
    Left = 64
  end
  object sdqLiqDoc: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT USUALTA, FALTA,'
      '       SUM(TOTLIQUIDACIONES) TOTALLIQUIDACIONES,'
      '       SUM(TOTLIQANULADAS) TOTALLIQANULADAS,'
      '       SUM(TOTPEDIDOSINFO) TOTALPEDIDOSINFO,'
      '       SUM(TOTDOCSDA) + SUM(TOTDOCRDA) TOTALDOCDIGITALIZAR,'
      '       SUM(TOTCARTASDOC) TOTALCARTASDOC'
      'FROM'
      '  (SELECT LE_USUALTA USUALTA, LE_FPROCESO FALTA,'
      '          COUNT(*) TOTLIQUIDACIONES,'
      
        '          SUM(DECODE(INSTR('#39'AX'#39', LE_ESTADO), 0, 0, 1)) TOTLIQANU' +
        'LADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          0 TOTCARTASDOC'
      '     FROM USE_USUARIOS, SLE_LIQUIEMPSIN, SEX_EXPEDIENTES'
      '    WHERE LE_FPROCESO BETWEEN :FDESDE AND :FHASTA'
      '      AND EX_SINIESTRO = LE_SINIESTRO'
      '      AND EX_ORDEN = LE_ORDEN'
      '      AND EX_RECAIDA = LE_RECAIDA'
      '      AND NVL(EX_CAUSAFIN,'#39'0'#39') NOT IN ('#39'95'#39', '#39'99'#39')'
      '      AND LE_USUALTA = SE_USUARIO'
      '      AND (SE_SECTOR = '#39'PRESDIN'#39
      '        OR LE_USUALTA = '#39'AUTOMATICO'#39')'
      '    GROUP BY LE_USUALTA, LE_FPROCESO'
      '    UNION ALL '
      '    SELECT PR_USUALTA USUALTA, PR_FECHALTA FALTA,'
      '          COUNT(*) TOTLIQUIDACIONES,'
      
        '          SUM(DECODE(INSTR('#39'AXZ'#39', PR_ESTADO), 0, 0, 1)) TOTLIQAN' +
        'ULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          0 TOTCARTASDOC'
      '     FROM USE_USUARIOS, SPR_PAGOEXPESIN, SEX_EXPEDIENTES'
      '    WHERE PR_FECHALTA BETWEEN :FDESDE AND :FHASTA'
      '      AND EX_SINIESTRO = PR_SINIESTRO'
      '      AND EX_ORDEN = PR_ORDEN'
      '      AND EX_RECAIDA = PR_RECAIDA'
      '      AND NVL(EX_CAUSAFIN,'#39'0'#39') NOT IN ('#39'95'#39', '#39'99'#39')'
      '      AND PR_USUALTA = SE_USUARIO'
      '      AND (SE_SECTOR = '#39'PRESDIN'#39
      '        OR PR_USUALTA = '#39'AUTOMATICO'#39')'
      '    GROUP BY PR_USUALTA, PR_FECHALTA'
      '   UNION ALL'
      '   SELECT PI_USUALTA USUALTA, PI_FECHAALTA FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          COUNT(*) TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          0 TOTCARTASDOC'
      '     FROM USE_USUARIOS, MPI_PEDIDOINFO'
      '    WHERE PI_CODDOCUMENTO <> '#39'0'#39
      '      AND PI_FECHAALTA BETWEEN :FDESDE AND :FHASTA'
      '      AND PI_USUALTA = SE_USUARIO'
      '      AND SE_SECTOR = '#39'PRESDIN'#39
      '    GROUP BY PI_USUALTA, PI_FECHAALTA'
      '   UNION ALL'
      '   SELECT DA_USUALTA USUALTA, TRUNC(DA_FECHALTA) FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          SUM(DA_HOJAS) TOTDOCRDA,'
      '          0 TOTCARTASDOC'
      '    FROM USE_USUARIOS, ARCHIVO.RDA_DETALLEARCHIVO'
      '    WHERE DA_FECHABAJA IS NULL'
      '      AND DA_OPCIONDESTINO = '#39'D'#39
      '      AND DA_FECHALTA >= :FDESDE'
      '      AND DA_FECHALTA < :FHASTA + 1'
      '      AND DA_USUALTA = SE_USUARIO'
      '      AND '#39#39' || SE_SECTOR = '#39'PRESDIN'#39
      '      AND NVL(DA_TIPOALTA, '#39' '#39') <> '#39'A'#39
      '    GROUP BY DA_USUALTA, TRUNC(DA_FECHALTA)'
      '   UNION ALL'
      '   SELECT CA_USUALTA USUALTA, CA_FECHAALTA FALTA,'
      '          0 TOTLIQUIDACIONES,'
      '          0 TOTLIQANULADAS,'
      '          0 TOTPEDIDOSINFO,'
      '          0 TOTDOCSDA,'
      '          0 TOTDOCRDA,'
      '          COUNT(*) TOTCARTASDOC'
      '     FROM USE_USUARIOS, CCA_CARTA'
      '    WHERE CA_FECHAIMPRESION IS NOT NULL'
      '      AND CA_FECHAALTA >= :FDESDE'
      '      AND CA_FECHAALTA < :FHASTA + 1'
      '      AND CA_USUALTA = SE_USUARIO'
      '      AND SE_SECTOR = '#39'PRESDIN'#39
      '    GROUP BY CA_USUALTA, CA_FECHAALTA)'
      ' GROUP BY USUALTA, FALTA'
      ' ORDER BY USUALTA, FALTA'
      '')
    Left = 100
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FHASTA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FDESDE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FHASTA'
        ParamType = ptInput
      end>
  end
end
