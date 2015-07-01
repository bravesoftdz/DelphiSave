object frmRptBancosGiroTransferenciaFormato2: TfrmRptBancosGiroTransferenciaFormato2
  Left = -4
  Top = -4
  Caption = 'Giros y Transferencias Bancarias'
  ClientHeight = 850
  ClientWidth = 1440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object qrBancosGiroTransferencia: TQuickRep
    Left = 24
    Top = 20
    Width = 816
    Height = 1056
    IDReport = 0
    DataSet = sdqDatos
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
      50.000000000000000000
      2159.000000000000000000
      150.000000000000000000
      60.000000000000000000
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
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object TitleBand1: TQRBand
      Left = 57
      Top = 19
      Width = 737
      Height = 230
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        608.541666666666700000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 6
        Top = 5
        Width = 152
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          13.229166666666670000
          402.166666666666600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Transparent = False
        ExportAs = exptText
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 6
        Top = 64
        Width = 449
        Height = 20
        Size.Values = (
          52.916666666666660000
          14.699074074074080000
          170.509259259259300000
          1187.685185185185000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sres. Del'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlBanco: TQRLabel
        Left = 6
        Top = 88
        Width = 449
        Height = 20
        Size.Values = (
          52.916666666666660000
          14.699074074074080000
          232.245370370370400000
          1187.685185185185000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Banco'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlDirigidoA: TQRLabel
        Left = 6
        Top = 119
        Width = 449
        Height = 20
        Size.Values = (
          52.916666666666670000
          15.875000000000000000
          314.854166666666700000
          1187.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Dirigido A'
        Color = clWhite
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
      object qrmSolicitud: TQRMemo
        Left = 6
        Top = 160
        Width = 726
        Height = 67
        Size.Values = (
          177.858796296296300000
          16.168981481481480000
          423.333333333333300000
          1919.699074074074000000)
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
      object qriLogo: TQRImage
        Left = 571
        Top = 4
        Width = 163
        Height = 64
        Size.Values = (
          169.039351851851900000
          1511.064814814815000000
          10.289351851851850000
          430.682870370370400000)
        XLColumn = 0
        Stretch = True
      end
      object qrNroTransferencia: TQRLabel
        Left = 6
        Top = 27
        Width = 298
        Height = 17
        Size.Values = (
          44.097222222222220000
          14.699074074074080000
          70.555555555555560000
          787.870370370370400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nro. Transferencia:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlBarras: TArtQRLabel
        Left = 516
        Top = 82
        Width = 216
        Height = 24
        Size.Values = (
          63.206018518518520000
          1364.074074074074000000
          217.546296296296300000
          571.793981481481500000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '**'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = '3 of 9 Barcode'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
      object qrlNumero: TQRLabel
        Left = 516
        Top = 109
        Width = 216
        Height = 17
        Size.Values = (
          45.567129629629630000
          1364.074074074074000000
          288.101851851851900000
          571.793981481481500000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumero'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    end
    object SummaryBand1: TQRBand
      Left = 57
      Top = 291
      Width = 737
      Height = 238
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        629.708333333333300000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRExpr2: TQRExpr
        Left = 591
        Top = 4
        Width = 142
        Height = 16
        Size.Values = (
          41.157407407407410000
          1562.511574074074000000
          11.759259259259260000
          376.296296296296300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = FormatMonto
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(sdqDatos.Importe)'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTextoInf: TQRLabel
        Left = 6
        Top = 43
        Width = 397
        Height = 17
        Size.Values = (
          45.567129629629630000
          16.168981481481480000
          113.182870370370400000
          1049.513888888889000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sin otro particular me despido de Ud. muy atte.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 6
        Top = 110
        Width = 360
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          291.041666666666700000
          952.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'CONFECCION'#211': ...................................................' +
          '...............'
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
        Left = 6
        Top = 171
        Width = 360
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          452.437500000000000000
          952.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'APODERADO: .....................................................' +
          '...................'
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
      object QRLabel20: TQRLabel
        Left = 383
        Top = 110
        Width = 346
        Height = 17
        Size.Values = (
          45.567129629629630000
          1012.766203703704000000
          291.041666666666700000
          915.752314814814800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'APODERADO: .....................................................' +
          '...........'
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
      object qrlCantCheques: TQRLabel
        Left = 3
        Top = 4
        Width = 299
        Height = 17
        Size.Values = (
          44.097222222222220000
          8.819444444444444000
          11.759259259259260000
          790.810185185185300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlCantCheques'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlCUITART: TQRLabel
        Left = 504
        Top = 170
        Width = 230
        Height = 17
        Size.Values = (
          44.097222222222220000
          1333.206018518519000000
          449.791666666666700000
          608.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlCUITART'
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
      object qrlDireccionART: TQRLabel
        Left = 504
        Top = 187
        Width = 230
        Height = 17
        Size.Values = (
          44.097222222222220000
          1333.206018518519000000
          493.888888888888900000
          608.541666666666700000)
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
        Left = 508
        Top = 220
        Width = 230
        Height = 17
        Size.Values = (
          44.097222222222220000
          1343.495370370370000000
          582.083333333333300000
          608.541666666666700000)
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
      object QRLabel5: TQRLabel
        Left = 500
        Top = 4
        Width = 73
        Height = 16
        Size.Values = (
          41.157407407407410000
          1322.916666666667000000
          11.759259259259260000
          194.027777777777800000)
        XLColumn = 0
        Alignment = taRightJustify
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
      object qrlPciaART: TQRLabel
        Left = 504
        Top = 203
        Width = 230
        Height = 17
        Size.Values = (
          44.097222222222220000
          1333.206018518519000000
          537.986111111111100000
          608.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlPciaART'
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
    end
    object ColumnHeaderBand1: TQRBand
      Left = 57
      Top = 249
      Width = 737
      Height = 21
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRShape5: TQRShape
        Left = 3
        Top = 0
        Width = 733
        Height = 21
        Size.Values = (
          55.856481481481480000
          7.349537037037037000
          0.000000000000000000
          1938.807870370370000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 5
        Top = 4
        Width = 196
        Height = 16
        Size.Values = (
          41.010416666666670000
          14.552083333333330000
          11.906250000000000000
          519.906250000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
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
      object QRLabel8: TQRLabel
        Left = 464
        Top = 4
        Width = 171
        Height = 16
        Size.Values = (
          41.157407407407410000
          1228.842592592593000000
          11.759259259259260000
          451.261574074074100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CONCEPTO'
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
      object QRLabel9: TQRLabel
        Left = 268
        Top = 4
        Width = 95
        Height = 16
        Size.Values = (
          41.010416666666670000
          710.406250000000000000
          11.906250000000000000
          252.677083333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'SINIESTRO'
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
      object QRLabel11: TQRLabel
        Left = 206
        Top = 4
        Width = 56
        Height = 16
        Size.Values = (
          41.010416666666670000
          546.364583333333300000
          11.906250000000000000
          149.489583333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'DOC. N'#186
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
      object qrlOP: TQRLabel
        Left = 370
        Top = 4
        Width = 90
        Height = 16
        Size.Values = (
          41.010416666666670000
          977.635416666666700000
          11.906250000000000000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'ORDEN DE PAGO'
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
        Left = 641
        Top = 4
        Width = 92
        Height = 16
        Size.Values = (
          41.157407407407410000
          1694.803240740741000000
          11.759259259259260000
          244.004629629629600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'IMPORTE'
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
      object QRShape7: TQRShape
        Left = 265
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          701.145833333333300000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 203
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          538.427083333333300000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 461
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          1219.729166666667000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 637
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          49.976851851851850000
          1684.513888888889000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 366
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          968.375000000000000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object DetailBand1: TQRBand
      Left = 57
      Top = 270
      Width = 737
      Height = 21
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape6: TQRShape
        Left = 3
        Top = 0
        Width = 733
        Height = 21
        Size.Values = (
          55.856481481481480000
          7.349537037037037000
          0.000000000000000000
          1938.807870370370000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 370
        Top = 4
        Width = 90
        Height = 16
        Size.Values = (
          41.010416666666670000
          977.635416666666700000
          11.906250000000000000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'ORDENPAGO'
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
      object QRDBText2: TQRDBText
        Left = 268
        Top = 4
        Width = 95
        Height = 16
        Size.Values = (
          41.010416666666670000
          710.406250000000000000
          11.906250000000000000
          252.677083333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
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
        Left = 5
        Top = 4
        Width = 196
        Height = 16
        Size.Values = (
          41.010416666666670000
          14.552083333333330000
          11.906250000000000000
          519.906250000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'BENEFICIARIO'
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
      object QRDBText4: TQRDBText
        Left = 206
        Top = 4
        Width = 56
        Height = 16
        Size.Values = (
          41.010416666666670000
          546.364583333333300000
          11.906250000000000000
          149.489583333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DOCUMENTO'
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
        Left = 464
        Top = 4
        Width = 171
        Height = 16
        Size.Values = (
          41.157407407407410000
          1228.842592592593000000
          11.759259259259260000
          451.261574074074100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CONCEPTO'
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
      object QRDBText9: TQRDBText
        Left = 640
        Top = 4
        Width = 92
        Height = 16
        Size.Values = (
          41.157407407407410000
          1693.333333333333000000
          11.759259259259260000
          244.004629629629600000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'IMPORTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatMonto
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape15: TQRShape
        Left = 203
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          538.427083333333300000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 265
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          701.145833333333300000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 461
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          1219.729166666667000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 637
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          49.976851851851850000
          1684.513888888889000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 366
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          968.375000000000000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object PageFooterBand1: TQRBand
      Left = 57
      Top = 529
      Width = 737
      Height = 27
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel2: TQRLabel
        Left = 662
        Top = 6
        Width = 34
        Height = 17
        Size.Values = (
          44.097222222222220000
          1752.129629629630000000
          14.699074074074070000
          91.134259259259260000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'P'#225'g.'
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
      object QRSysData2: TQRSysData
        Left = 701
        Top = 6
        Width = 32
        Height = 17
        Size.Values = (
          44.097222222222220000
          1855.023148148148000000
          14.699074074074070000
          85.254629629629630000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        FontSize = 9
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 38
    Top = 6
  end
end
