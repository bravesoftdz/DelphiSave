object frmValImpresionRecibo: TfrmValImpresionRecibo
  Left = -1
  Top = 29
  Caption = 'frmValImpresionRecibo'
  ClientHeight = 582
  ClientWidth = 804
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
  object qrpRecibo: TQuickRep
    Left = 1
    Top = 0
    Width = 816
    Height = 1056
    IDReport = 0
    DataSet = sdqValoresYPeriodos
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
    ReportTitle = 'Recibo'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbDetailValoresYPeriodos: TQRBand
      Left = 38
      Top = 315
      Width = 740
      Height = 20
      AlignToBottom = False
      BeforePrint = qrbDetailValoresYPeriodosBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qrsRectValores: TQRShape
        Left = 19
        Top = 0
        Width = 700
        Height = 20
        Size.Values = (
          52.916666666666700000
          50.270833333333300000
          0.000000000000000000
          1852.083333333330000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrsVert2Periodos: TQRShape
        Left = 588
        Top = 1
        Width = 8
        Height = 18
        Size.Values = (
          47.625000000000000000
          1555.750000000000000000
          2.645833333333330000
          21.166666666666700000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert1Valores: TQRShape
        Left = 121
        Top = 0
        Width = 6
        Height = 19
        Size.Values = (
          50.270833333333300000
          320.145833333333000000
          0.000000000000000000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert3Valores: TQRShape
        Left = 588
        Top = 0
        Width = 8
        Height = 19
        Size.Values = (
          50.270833333333300000
          1555.750000000000000000
          0.000000000000000000
          21.166666666666700000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert1Periodos: TQRShape
        Left = 313
        Top = 0
        Width = 6
        Height = 19
        Size.Values = (
          50.270833333333300000
          828.145833333333000000
          0.000000000000000000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert2Valores: TQRShape
        Left = 232
        Top = 0
        Width = 6
        Height = 19
        Size.Values = (
          50.270833333333300000
          613.833333333333000000
          0.000000000000000000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrdbImportePeriodo: TQRDBText
        Left = 596
        Top = 1
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666700000
          1576.916666666670000000
          2.645833333333330000
          320.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'IMPORTEPERIODO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbConcepto: TQRDBText
        Left = 23
        Top = 1
        Width = 566
        Height = 17
        Size.Values = (
          44.979166666666700000
          60.854166666666700000
          2.645833333333330000
          1497.541666666670000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'CONCEPTOPERIODO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbTipo: TQRDBText
        Left = 23
        Top = 1
        Width = 98
        Height = 18
        Size.Values = (
          47.625000000000000000
          60.854166666666700000
          2.645833333333330000
          259.291666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'TIPOVALOR'
        OnPrint = qrdbTipoPrint
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbNroCheque: TQRDBText
        Left = 128
        Top = 1
        Width = 105
        Height = 18
        Size.Values = (
          47.625000000000000000
          338.666666666667000000
          2.645833333333330000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'NROCHEQUEVALOR'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbBanco: TQRDBText
        Left = 319
        Top = 1
        Width = 272
        Height = 18
        Size.Values = (
          47.625000000000000000
          844.020833333333000000
          2.645833333333330000
          719.666666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'BANCOVALOR'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbImporte: TQRDBText
        Left = 595
        Top = 1
        Width = 121
        Height = 18
        Size.Values = (
          47.625000000000000000
          1574.270833333330000000
          2.645833333333330000
          320.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'IMPORTEVALOR'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbFechaCheque: TQRDBText
        Left = 238
        Top = 1
        Width = 75
        Height = 18
        Size.Values = (
          47.625000000000000000
          629.708333333333000000
          2.645833333333330000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqValoresYPeriodos
        DataField = 'FECHACHEQUE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object qrbTituloPeriodos: TQRBand
      Left = 38
      Top = 169
      Width = 740
      Height = 78
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        206.375000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object qrlDescripcionPeriodos: TQRLabel
        Left = 20
        Top = 1
        Width = 700
        Height = 73
        Size.Values = (
          193.145833333333000000
          52.916666666666700000
          2.645833333333330000
          1852.083333333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlDescripcionPeriodos'
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
    end
    object qrbHeader: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 131
      AlignToBottom = False
      BeforePrint = qrbHeaderBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        346.604166666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlDireccionART: TQRLabel
        Left = 19
        Top = 69
        Width = 437
        Height = 17
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          182.562500000000000000
          1156.229166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlDireccionART'
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
      object qrlTelefonoART: TQRLabel
        Left = 19
        Top = 87
        Width = 437
        Height = 17
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          230.187500000000000000
          1156.229166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlTelefonoART'
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
      object QRShape1: TQRShape
        Left = 549
        Top = 56
        Width = 170
        Height = 58
        Size.Values = (
          153.458333333333000000
          1452.562500000000000000
          148.166666666667000000
          449.791666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 549
        Top = 69
        Width = 170
        Height = 13
        Size.Values = (
          34.395833333333300000
          1452.562500000000000000
          182.562500000000000000
          449.791666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlLugar: TQRLabel
        Left = 552
        Top = 58
        Width = 165
        Height = 17
        Size.Values = (
          44.979166666666700000
          1460.500000000000000000
          153.458333333333000000
          436.562500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlLugar'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 601
        Top = 76
        Width = 9
        Height = 38
        Size.Values = (
          100.541666666667000000
          1590.145833333330000000
          201.083333333333000000
          23.812500000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 657
        Top = 76
        Width = 9
        Height = 38
        Size.Values = (
          100.541666666667000000
          1738.312500000000000000
          201.083333333333000000
          23.812500000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlDia: TQRLabel
        Left = 552
        Top = 85
        Width = 51
        Height = 21
        Size.Values = (
          55.562500000000000000
          1460.500000000000000000
          224.895833333333000000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '01'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlMes: TQRLabel
        Left = 609
        Top = 85
        Width = 50
        Height = 21
        Size.Values = (
          55.562500000000000000
          1611.312500000000000000
          224.895833333333000000
          132.291666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '01'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlAnio: TQRLabel
        Left = 666
        Top = 85
        Width = 49
        Height = 21
        Size.Values = (
          55.562500000000000000
          1762.125000000000000000
          224.895833333333000000
          129.645833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '01'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlNumero: TQRLabel
        Left = 284
        Top = 8
        Width = 434
        Height = 25
        Size.Values = (
          66.145833333333300000
          751.416666666667000000
          21.166666666666700000
          1148.291666666670000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumero'
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
      object qrlPagina: TQRLabel
        Left = 548
        Top = 36
        Width = 169
        Height = 17
        Size.Values = (
          44.979166666666700000
          1449.916666666670000000
          95.250000000000000000
          447.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlPagina'
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
      object qriLogo: TQRImage
        Left = 58
        Top = 2
        Width = 163
        Height = 64
        Size.Values = (
          169.333333333333300000
          153.458333333333300000
          5.291666666666667000
          431.270833333333400000)
        XLColumn = 0
        Stretch = True
      end
    end
    object qrgValores: TQRGroup
      Left = 38
      Top = 247
      Width = 740
      Height = 48
      AlignToBottom = False
      BeforePrint = qrgValoresBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDetailValoresYPeriodos
      Size.Values = (
        127.000000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sdqValoresYPeriodos.TIPO'
      FooterBand = qrbGroupFooterPeriodos
      Master = qrpRecibo
      ReprintOnNewPage = True
      object qrlDescripcionValores: TQRLabel
        Left = 19
        Top = 19
        Width = 699
        Height = 18
        Size.Values = (
          47.625000000000000000
          50.270833333333300000
          50.270833333333300000
          1849.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'con los siguientes valores:'
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
    end
    object qcbValoresYPeriodos: TQRChildBand
      Left = 38
      Top = 295
      Width = 740
      Height = 20
      AlignToBottom = False
      BeforePrint = qcbValoresYPeriodosBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgValores
      PrintOrder = cboAfterParent
      object qrsRectHeaderPeriodos: TQRShape
        Left = 19
        Top = 0
        Width = 700
        Height = 20
        Size.Values = (
          52.916666666666700000
          50.270833333333300000
          0.000000000000000000
          1852.083333333330000000)
        XLColumn = 0
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlHeaderImportePeriodo: TQRLabel
        Left = 596
        Top = 2
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666700000
          1576.916666666670000000
          5.291666666666670000
          320.145833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'IMPORTE'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlHeaderConcepto: TQRLabel
        Left = 22
        Top = 2
        Width = 573
        Height = 17
        Size.Values = (
          44.979166666666700000
          58.208333333333300000
          5.291666666666670000
          1516.062500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CONCEPTO'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrsVert1HeaderValores: TQRShape
        Left = 121
        Top = 0
        Width = 6
        Height = 19
        Size.Values = (
          50.270833333333300000
          320.145833333333000000
          0.000000000000000000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert3HeaderValores: TQRShape
        Left = 588
        Top = 0
        Width = 8
        Height = 19
        Size.Values = (
          50.270833333333300000
          1555.750000000000000000
          0.000000000000000000
          21.166666666666700000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert2HeaderValores: TQRShape
        Left = 313
        Top = 1
        Width = 6
        Height = 19
        Size.Values = (
          50.270833333333300000
          828.145833333333000000
          2.645833333333330000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsVert4HeaderValores: TQRShape
        Left = 232
        Top = 1
        Width = 6
        Height = 19
        Size.Values = (
          50.270833333333300000
          613.833333333333000000
          2.645833333333330000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlHeaderTipo: TQRLabel
        Left = 23
        Top = 1
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666700000
          60.854166666666700000
          2.645833333333330000
          259.291666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'TIPO'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlHeaderNro: TQRLabel
        Left = 128
        Top = 1
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666700000
          338.666666666667000000
          2.645833333333330000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'NUMERO'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlHeaderBanco: TQRLabel
        Left = 319
        Top = 1
        Width = 272
        Height = 17
        Size.Values = (
          44.979166666666700000
          844.020833333333000000
          2.645833333333330000
          719.666666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'BANCO'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlHeaderImporteValor: TQRLabel
        Left = 595
        Top = 1
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666700000
          1574.270833333330000000
          2.645833333333330000
          320.145833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'IMPORTE'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlHeaderFecha: TQRLabel
        Left = 238
        Top = 1
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666700000
          629.708333333333000000
          2.645833333333330000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'FECHA'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object qrbGroupFooterPeriodos: TQRBand
      Left = 38
      Top = 335
      Width = 740
      Height = 167
      AlignToBottom = False
      BeforePrint = qrbGroupFooterPeriodosBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        441.854166666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrsRectTotalValores: TQRShape
        Left = 592
        Top = 0
        Width = 127
        Height = 20
        Size.Values = (
          52.916666666666700000
          1566.333333333330000000
          0.000000000000000000
          336.020833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlTotalValores: TQRLabel
        Left = 413
        Top = 3
        Width = 175
        Height = 17
        Size.Values = (
          44.979166666666700000
          1092.729166666670000000
          7.937500000000000000
          463.020833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTAL'
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
      object qreSumaImporteValores: TQRExpr
        Left = 596
        Top = 1
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666700000
          1576.916666666670000000
          2.645833333333330000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(sdqValoresYPeriodos.IMPORTEVALOR)'
        Mask = '$ #,###.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlAdicional: TQRLabel
        Left = 12
        Top = 24
        Width = 75
        Height = 18
        Size.Values = (
          47.625000000000000000
          31.750000000000000000
          63.500000000000000000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlAdicional'
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
      object qreSumaImportePeriodos: TQRExpr
        Left = 595
        Top = 1
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666700000
          1574.270833333330000000
          2.645833333333330000
          320.145833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(sdqValoresYPeriodos.IMPORTEPERIODO)'
        Mask = '$ #,###.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrReemp10: TQRLabelEx
        Left = 19
        Top = 51
        Width = 574
        Height = 19
        Size.Values = (
          50.270833333333300000
          50.270833333333300000
          134.937500000000000000
          1518.708333333330000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'CONCEPTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp20: TQRLabelEx
        Left = 19
        Top = 69
        Width = 574
        Height = 19
        Size.Values = (
          50.270833333333300000
          50.270833333333300000
          182.562500000000000000
          1518.708333333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '  Gastos Administrativos'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp30: TQRLabelEx
        Left = 19
        Top = 87
        Width = 574
        Height = 19
        Size.Values = (
          50.270833333333300000
          50.270833333333300000
          230.187500000000000000
          1518.708333333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '  Inter'#233's por mora'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp11: TQRLabelEx
        Left = 592
        Top = 51
        Width = 126
        Height = 19
        Size.Values = (
          50.270833333333300000
          1566.333333333330000000
          134.937500000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'IMPORTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp21: TQRLabelEx
        Left = 592
        Top = 69
        Width = 126
        Height = 19
        Size.Values = (
          50.270833333333300000
          1566.333333333330000000
          182.562500000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'IMPORTE'
        Color = clWhite
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp31: TQRLabelEx
        Left = 592
        Top = 87
        Width = 126
        Height = 19
        Size.Values = (
          50.270833333333300000
          1566.333333333330000000
          230.187500000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'IMPORTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp51: TQRLabelEx
        Left = 592
        Top = 141
        Width = 126
        Height = 19
        Size.Values = (
          50.270833333333330000
          1566.333333333333000000
          373.062500000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'IMPORTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp50: TQRLabel
        Left = 413
        Top = 142
        Width = 175
        Height = 17
        Size.Values = (
          44.979166666666670000
          1092.729166666667000000
          375.708333333333400000
          463.020833333333400000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TOTAL'
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
      object qrReemp40: TQRLabelEx
        Left = 19
        Top = 105
        Width = 574
        Height = 19
        Size.Values = (
          50.270833333333300000
          50.270833333333300000
          277.812500000000000000
          1518.708333333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '  Inter'#233's por financiaci'#243'n'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp41: TQRLabelEx
        Left = 592
        Top = 105
        Width = 126
        Height = 19
        Size.Values = (
          50.270833333333300000
          1566.333333333330000000
          277.812500000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'IMPORTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp44: TQRLabelEx
        Left = 19
        Top = 123
        Width = 574
        Height = 19
        Size.Values = (
          50.270833333333330000
          50.270833333333330000
          325.437500000000000000
          1518.708333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '  Redondeo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object qrReemp45: TQRLabelEx
        Left = 592
        Top = 123
        Width = 126
        Height = 19
        Size.Values = (
          50.270833333333330000
          1566.333333333333000000
          325.437500000000000000
          333.375000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'IMPORTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 502
      Width = 740
      Height = 217
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        574.145833333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrlFirmante: TQRLabel
        Left = 491
        Top = 84
        Width = 207
        Height = 17
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          222.250000000000000000
          547.687500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'PROVINCIA ART S.A.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 491
        Top = 74
        Width = 207
        Height = 13
        Size.Values = (
          34.395833333333330000
          1299.104166666667000000
          195.791666666666700000
          547.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 112
        Top = 5
        Width = 172
        Height = 77
        Size.Values = (
          203.729166666666700000
          296.333333333333300000
          13.229166666666670000
          455.083333333333300000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlCuit: TQRLabel
        Left = 120
        Top = 9
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          23.812500000000000000
          418.041666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlCuit'
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
      object qrlIngresosBrutos: TQRLabel
        Left = 120
        Top = 28
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          74.083333333333300000
          418.041666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlIngresosBrutos'
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
      object qrlIVA: TQRLabel
        Left = 120
        Top = 46
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          121.708333333333000000
          418.041666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlIVA'
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
      object qrlInicioActividades: TQRLabel
        Left = 120
        Top = 64
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          169.333333333333000000
          418.041666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlInicioActividades'
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
      object QRLabel1: TQRLabel
        Left = 8
        Top = 130
        Width = 718
        Height = 49
        Size.Values = (
          129.645833333333000000
          21.166666666666700000
          343.958333333333000000
          1899.708333333330000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          '        La Empresa est'#225' exceptuada de la obligaci'#243'n de emitir co' +
          'mprobantes, de acuerdo a lo establecido por la Resoluci'#243'n Genera' +
          'l N'#186' 1.415 AFIP en Anexo I, Apartado A), Inciso D).'
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
      object qrLeyenda: TQRLabel
        Left = 0
        Top = 180
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          476.250000000000000000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'qrLeyenda'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlNombreFirmante: TQRLabel
        Left = 455
        Top = 53
        Width = 281
        Height = 17
        Size.Values = (
          44.979166666666670000
          1203.854166666667000000
          140.229166666666700000
          743.479166666666800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNombreFirmante'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object sdqValoresYPeriodos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqValoresYPeriodosAfterOpen
    Left = 7
    Top = 11
  end
end
