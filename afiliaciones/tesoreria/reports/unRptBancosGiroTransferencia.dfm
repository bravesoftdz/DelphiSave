object frmRptBancosGiroTransferencia: TfrmRptBancosGiroTransferencia
  Left = 202
  Top = 0
  Caption = 'Giros y Transferencias Bancarias'
  ClientHeight = 1028
  ClientWidth = 1383
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
  object qrBancosGiroTransferencia: TQuickRep
    Left = 56
    Top = 16
    Width = 1224
    Height = 1584
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
      70.000000000000000000
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
    Zoom = 150
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object TitleBand1: TQRBand
      Left = 85
      Top = 28
      Width = 1099
      Height = 669
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1180.041666666667000000
        1938.513888888889000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 9
        Top = 8
        Width = 228
        Height = 26
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
      object QRLabel2: TQRLabel
        Left = 9
        Top = 98
        Width = 674
        Height = 30
        Size.Values = (
          52.916666666666670000
          15.875000000000000000
          171.979166666666700000
          1187.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'BANCO DE LA NACION ARGENTINA  '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlGirosTransf: TQRLabel
        Left = 9
        Top = 166
        Width = 674
        Height = 30
        Size.Values = (
          52.916666666666670000
          15.875000000000000000
          292.805555555555600000
          1188.861111111111000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sector Convenio y Jubilaciones'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel4: TQRLabel
        Left = 9
        Top = 214
        Width = 674
        Height = 26
        Size.Values = (
          45.861111111111110000
          15.875000000000000000
          377.472222222222200000
          1188.861111111111000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'A quien corresponda'
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
      object qrmSolicitud: TQRMemo
        Left = 8
        Top = 297
        Width = 1082
        Height = 367
        Size.Values = (
          647.347222222222200000
          14.111111111111110000
          523.875000000000000000
          1908.527777777778000000)
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
        Left = 851
        Top = 6
        Width = 244
        Height = 96
        Size.Values = (
          169.039351851851900000
          1500.775462962963000000
          10.289351851851850000
          430.682870370370400000)
        XLColumn = 0
        Stretch = True
      end
      object qrNroTransferencia: TQRLabel
        Left = 8
        Top = 40
        Width = 447
        Height = 25
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
        Left = 768
        Top = 123
        Width = 323
        Height = 37
        Size.Values = (
          64.675925925925930000
          1355.254629629630000000
          217.546296296296300000
          570.324074074074100000)
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
        Left = 768
        Top = 163
        Width = 323
        Height = 25
        Size.Values = (
          44.097222222222220000
          1355.254629629630000000
          288.101851851851900000
          570.324074074074100000)
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
      object QRLabel1: TQRLabel
        Left = 9
        Top = 132
        Width = 674
        Height = 30
        Size.Values = (
          52.916666666666670000
          15.875000000000000000
          232.833333333333300000
          1187.979166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sucursal Plaza de Mayo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel7: TQRLabel
        Left = 388
        Top = 249
        Width = 703
        Height = 26
        Size.Values = (
          45.861111111111110000
          684.388888888888900000
          439.208333333333300000
          1240.013888888889000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Asunto: Convenio de Pagos por Ventanilla Nro. 0037'
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
    end
    object SummaryBand1: TQRBand
      Left = 85
      Top = 759
      Width = 1099
      Height = 357
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        629.708333333333300000
        1938.513888888889000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object qrlTextoInf: TQRLabel
        Left = 9
        Top = 64
        Width = 1079
        Height = 26
        Size.Values = (
          45.567129629629630000
          16.168981481481480000
          113.182870370370400000
          1903.530092592593000000)
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
        Left = 9
        Top = 165
        Width = 540
        Height = 26
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
        Left = 9
        Top = 256
        Width = 540
        Height = 26
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
          '.................'
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
        Left = 558
        Top = 165
        Width = 519
        Height = 26
        Size.Values = (
          45.567129629629630000
          984.837962962963000000
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
      object qrlCUITART: TQRLabel
        Left = 749
        Top = 255
        Width = 345
        Height = 25
        Size.Values = (
          44.097222222222220000
          1321.446759259259000000
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
        Left = 749
        Top = 280
        Width = 345
        Height = 25
        Size.Values = (
          44.097222222222220000
          1321.446759259259000000
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
        Left = 749
        Top = 330
        Width = 345
        Height = 25
        Size.Values = (
          44.097222222222220000
          1321.446759259259000000
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
      object qrlPciaART: TQRLabel
        Left = 749
        Top = 305
        Width = 345
        Height = 25
        Size.Values = (
          44.097222222222220000
          1321.446759259259000000
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
      Left = 85
      Top = 697
      Width = 1099
      Height = 30
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1938.513888888889000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRShape5: TQRShape
        Left = 5
        Top = 0
        Width = 1088
        Height = 32
        Size.Values = (
          55.856481481481480000
          8.819444444444444000
          0.000000000000000000
          1919.699074074074000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 8
        Top = 7
        Width = 125
        Height = 23
        Size.Values = (
          41.157407407407410000
          14.699074074074080000
          11.759259259259260000
          220.486111111111100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Orden de Pago'
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
        Left = 138
        Top = 7
        Width = 143
        Height = 23
        Size.Values = (
          41.157407407407410000
          244.004629629629600000
          11.759259259259260000
          252.824074074074100000)
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
      object QRLabel10: TQRLabel
        Left = 587
        Top = 7
        Width = 268
        Height = 23
        Size.Values = (
          41.157407407407410000
          1034.814814814815000000
          11.759259259259260000
          471.840277777777800000)
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
      object QRLabel11: TQRLabel
        Left = 861
        Top = 7
        Width = 85
        Height = 23
        Size.Values = (
          41.157407407407410000
          1518.414351851852000000
          11.759259259259260000
          149.930555555555600000)
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
      object qrlTitSucCuenta: TQRLabel
        Left = 289
        Top = 7
        Width = 291
        Height = 23
        Size.Values = (
          41.157407407407410000
          510.057870370370400000
          11.759259259259260000
          512.997685185185200000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'SUCURSAL'
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
        Left = 951
        Top = 7
        Width = 138
        Height = 23
        Size.Values = (
          41.157407407407410000
          1677.164351851852000000
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
        Left = 135
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          238.125000000000000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 286
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          504.178240740740700000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 857
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          1512.534722222222000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 947
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          1671.284722222222000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 583
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          1028.935185185185000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object DetailBand1: TQRBand
      Left = 85
      Top = 727
      Width = 1099
      Height = 32
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        56.444444444444440000
        1938.513888888889000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape6: TQRShape
        Left = 5
        Top = 0
        Width = 1088
        Height = 32
        Size.Values = (
          55.856481481481480000
          8.819444444444444000
          0.000000000000000000
          1919.699074074074000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 8
        Top = 7
        Width = 125
        Height = 23
        Size.Values = (
          41.157407407407410000
          14.699074074074080000
          11.759259259259260000
          220.486111111111100000)
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
        Left = 138
        Top = 7
        Width = 143
        Height = 23
        Size.Values = (
          41.157407407407410000
          244.004629629629600000
          11.759259259259260000
          252.824074074074100000)
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
        Left = 587
        Top = 7
        Width = 268
        Height = 23
        Size.Values = (
          41.157407407407410000
          1034.814814814815000000
          11.759259259259260000
          471.840277777777800000)
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
        Left = 861
        Top = 7
        Width = 85
        Height = 23
        Size.Values = (
          41.157407407407410000
          1518.414351851852000000
          11.759259259259260000
          149.930555555555600000)
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
        Left = 289
        Top = 7
        Width = 291
        Height = 23
        Size.Values = (
          41.157407407407410000
          510.057870370370400000
          11.759259259259260000
          512.997685185185200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'SUCURSAL'
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
        Left = 951
        Top = 7
        Width = 138
        Height = 23
        Size.Values = (
          41.157407407407410000
          1677.164351851852000000
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
        Left = 135
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          238.125000000000000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 286
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          504.178240740740700000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 857
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          1512.534722222222000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 947
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          1671.284722222222000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 583
        Top = 2
        Width = 2
        Height = 28
        Size.Values = (
          49.976851851851850000
          1028.935185185185000000
          2.939814814814815000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object PageFooterBand1: TQRBand
      Left = 85
      Top = 1116
      Width = 1099
      Height = 60
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1938.513888888889000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel6: TQRLabel
        Left = 988
        Top = 8
        Width = 52
        Height = 25
        Size.Values = (
          44.097222222222220000
          1743.310185185185000000
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
        Left = 1047
        Top = 8
        Width = 48
        Height = 25
        Size.Values = (
          44.097222222222220000
          1846.203703703704000000
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
