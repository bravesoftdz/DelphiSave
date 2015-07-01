object frmRptTransferenciasBAPROPagoElectr: TfrmRptTransferenciasBAPROPagoElectr
  Left = 78
  Top = 59
  Caption = 'Transferencias BAPRO'
  ClientHeight = 750
  ClientWidth = 891
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
  object qrBancosPagoElectronico: TQuickRep
    Left = 48
    Top = 40
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
    ReportTitle = 'Transferencias BAPRO - Pago Electr'#243'nico'
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
      Height = 233
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        616.479166666666700000
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
          52.916666666666670000
          16.168981481481480000
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
          52.916666666666670000
          16.168981481481480000
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
      object qrlAsunto: TQRLabel
        Left = 282
        Top = 144
        Width = 449
        Height = 20
        Size.Values = (
          52.916666666666670000
          746.712962962963000000
          380.706018518518500000
          1187.685185185185000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlAsunto'
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
        Left = 7
        Top = 185
        Width = 724
        Height = 45
        Size.Values = (
          119.062500000000000000
          17.197916666666670000
          489.479166666666700000
          1916.906250000000000000)
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
          169.333333333333300000
          1510.770833333333000000
          10.583333333333330000
          431.270833333333300000)
        XLColumn = 0
        Stretch = True
      end
      object qrlSubTitu: TQRLabel
        Left = 7
        Top = 110
        Width = 449
        Height = 20
        Size.Values = (
          52.916666666666670000
          17.638888888888890000
          291.041666666666700000
          1187.685185185185000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlSubTitu'
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
      object qrNroTransferencia: TQRLabel
        Left = 6
        Top = 24
        Width = 298
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          63.500000000000000000
          788.458333333333200000)
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
        Top = 80
        Width = 216
        Height = 24
        Size.Values = (
          63.500000000000000000
          1365.250000000000000000
          211.666666666666700000
          571.500000000000000000)
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
        Top = 107
        Width = 216
        Height = 19
        Size.Values = (
          50.270833333333330000
          1365.250000000000000000
          283.104166666666700000
          571.500000000000000000)
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
      Top = 294
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
        Left = 590
        Top = 4
        Width = 142
        Height = 16
        Size.Values = (
          41.010416666666670000
          1561.041666666667000000
          11.906250000000000000
          375.708333333333300000)
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
        Top = 41
        Width = 372
        Height = 17
        Size.Values = (
          45.567129629629630000
          16.168981481481480000
          108.773148148148100000
          984.837962962963000000)
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
        Left = 377
        Top = 110
        Width = 346
        Height = 17
        Size.Values = (
          45.567129629629630000
          996.597222222222200000
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
        Left = 504
        Top = 220
        Width = 230
        Height = 17
        Size.Values = (
          44.097222222222220000
          1333.206018518519000000
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
        Left = 499
        Top = 4
        Width = 73
        Height = 16
        Size.Values = (
          41.157407407407410000
          1321.446759259259000000
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
      Top = 252
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
      object QRShape12: TQRShape
        Left = 2
        Top = 1
        Width = 733
        Height = 21
        Size.Values = (
          55.856481481481480000
          5.879629629629630000
          1.469907407407407000
          1940.277777777778000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 98
        Top = 4
        Width = 170
        Height = 16
        Size.Values = (
          41.010416666666670000
          257.968750000000000000
          11.906250000000000000
          448.468750000000000000)
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
        Left = 512
        Top = 4
        Width = 121
        Height = 16
        Size.Values = (
          41.010416666666670000
          1355.989583333333000000
          11.906250000000000000
          320.145833333333300000)
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
        Left = 272
        Top = 4
        Width = 91
        Height = 15
        Size.Values = (
          39.687500000000000000
          719.666666666666800000
          10.583333333333330000
          240.770833333333300000)
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
      object qrlOP: TQRLabel
        Left = 4
        Top = 4
        Width = 90
        Height = 16
        Size.Values = (
          41.010416666666670000
          9.260416666666668000
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
      object QRLabel4: TQRLabel
        Left = 368
        Top = 4
        Width = 140
        Height = 16
        Size.Values = (
          41.010416666666670000
          973.666666666666800000
          11.906250000000000000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CBU'
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
      object QRShape1: TQRShape
        Left = 95
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          251.354166666666700000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 268
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          710.406250000000000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 364
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          964.406250000000000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 509
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          1348.052083333333000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 636
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          1682.750000000000000000
          1.322916666666667000
          1.322916666666667000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object DetailBand1: TQRBand
      Left = 57
      Top = 273
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
        Left = 2
        Top = 0
        Width = 733
        Height = 21
        Size.Values = (
          55.856481481481480000
          5.879629629629630000
          0.000000000000000000
          1940.277777777778000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 4
        Top = 4
        Width = 90
        Height = 16
        Size.Values = (
          41.010416666666670000
          9.260416666666668000
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
        Left = 272
        Top = 4
        Width = 91
        Height = 16
        Size.Values = (
          41.010416666666670000
          718.343750000000000000
          11.906250000000000000
          240.770833333333300000)
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
        Left = 98
        Top = 4
        Width = 170
        Height = 16
        Size.Values = (
          41.010416666666670000
          257.968750000000000000
          11.906250000000000000
          448.468750000000000000)
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
      object QRDBText6: TQRDBText
        Left = 512
        Top = 4
        Width = 121
        Height = 16
        Size.Values = (
          41.010416666666670000
          1355.989583333333000000
          11.906250000000000000
          320.145833333333300000)
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
      object QRDBText4: TQRDBText
        Left = 368
        Top = 4
        Width = 140
        Height = 16
        Size.Values = (
          41.010416666666670000
          973.666666666666800000
          11.906250000000000000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CBU'
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
      object QRShape7: TQRShape
        Left = 95
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          251.354166666666700000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 268
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          710.406250000000000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 364
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          964.406250000000000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 509
        Top = 1
        Width = 1
        Height = 19
        Size.Values = (
          50.270833333333330000
          1348.052083333333000000
          2.645833333333333000
          2.645833333333333000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 636
        Top = 2
        Width = 1
        Height = 19
        Size.Values = (
          49.976851851851850000
          1683.043981481481000000
          4.409722222222222000
          2.939814814814815000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object PageFooterBand1: TQRBand
      Left = 57
      Top = 532
      Width = 737
      Height = 26
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1949.979166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel2: TQRLabel
        Left = 663
        Top = 5
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1754.187500000000000000
          13.229166666666670000
          89.958333333333330000)
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
        Left = 702
        Top = 5
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          1857.375000000000000000
          13.229166666666670000
          84.666666666666670000)
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
