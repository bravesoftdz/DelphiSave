object frmInvRptSolicitudCustodia: TfrmInvRptSolicitudCustodia
  Left = 253
  Top = 88
  Caption = 'frmInvRptSolicitudCustodia'
  ClientHeight = 882
  ClientWidth = 1297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrSolicitudCustodia: TQuickRep
    Left = 56
    Top = 8
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
    ReportTitle = 'Solicitud Custodia PF'
    SnapToGrid = True
    Units = MM
    Zoom = 150
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 57
      Top = 57
      Width = 1111
      Height = 377
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        664.986111111111100000
        1959.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 4
        Top = 284
        Width = 1105
        Height = 27
        Size.Values = (
          47.625000000000000000
          7.055555555555556000
          500.944444444444400000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 4
        Top = 310
        Width = 1105
        Size.Values = (
          114.652777777777800000
          7.055555555555556000
          546.805555555555600000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 4
        Top = 169
        Width = 1105
        Height = 92
        Size.Values = (
          162.277777777777800000
          7.055555555555556000
          298.097222222222200000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 323
        Top = 58
        Width = 465
        Height = 30
        Size.Values = (
          52.916666666666670000
          569.736111111111100000
          102.305555555555600000
          820.208333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'SOLICITUD DE CUSTODIA PLAZO FIJOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qriLogo: TQRImage
        Left = 860
        Top = 4
        Width = 245
        Height = 96
        Size.Values = (
          169.333333333333300000
          1516.062500000000000000
          7.937500000000000000
          431.270833333333400000)
        XLColumn = 0
        Stretch = True
      end
      object QRLabel1: TQRLabel
        Left = 7
        Top = 112
        Width = 179
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          197.555555555555600000
          315.736111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lugar: Buenos Aires'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 7
        Top = 173
        Width = 819
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          305.152777777777800000
          1444.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Datos del Cliente'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 832
        Top = 173
        Width = 270
        Height = 25
        Size.Values = (
          44.097222222222220000
          1467.555555555556000000
          305.152777777777800000
          476.250000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo de Operaci'#243'n'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 7
        Top = 204
        Width = 145
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          359.833333333333300000
          255.763888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Denominaci'#243'n:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlDenominacion: TQRLabel
        Left = 158
        Top = 204
        Width = 466
        Height = 25
        Size.Values = (
          44.097222222222220000
          278.694444444444400000
          359.833333333333300000
          821.972222222222200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Denominaci'#243'n:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 7
        Top = 231
        Width = 145
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          407.458333333333300000
          255.763888888888900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cuenta:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlCuenta: TQRLabel
        Left = 158
        Top = 231
        Width = 466
        Height = 25
        Size.Values = (
          44.097222222222220000
          278.694444444444400000
          407.458333333333300000
          821.972222222222200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cuenta:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 835
        Top = 204
        Width = 101
        Height = 25
        Size.Values = (
          44.097222222222220000
          1472.847222222222000000
          359.833333333333300000
          178.152777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Entrega'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 835
        Top = 231
        Width = 101
        Height = 25
        Size.Values = (
          44.097222222222220000
          1472.847222222222000000
          407.458333333333300000
          178.152777777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Retiro'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 1055
        Top = 202
        Width = 27
        Height = 27
        Size.Values = (
          47.625000000000000000
          1860.902777777778000000
          356.305555555555600000
          47.625000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlEntrega: TQRLabel
        Left = 1060
        Top = 204
        Width = 17
        Height = 25
        Size.Values = (
          44.097222222222220000
          1869.722222222222000000
          359.833333333333300000
          29.986111111111110000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlEntrega'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 1055
        Top = 230
        Width = 27
        Height = 27
        Size.Values = (
          47.625000000000000000
          1860.902777777778000000
          405.694444444444400000
          47.625000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlRetiro: TQRLabel
        Left = 1060
        Top = 231
        Width = 17
        Height = 25
        Size.Values = (
          44.097222222222220000
          1869.722222222222000000
          407.458333333333300000
          29.986111111111110000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlRetiro'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = 4
        Top = 195
        Width = 1105
        Height = 5
        Size.Values = (
          8.819444444444444000
          7.055555555555556000
          343.958333333333300000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 825
        Top = 169
        Width = 9
        Height = 92
        Size.Values = (
          162.277777777777800000
          1455.208333333333000000
          298.097222222222200000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 4
        Top = 285
        Width = 1105
        Height = 25
        Size.Values = (
          44.097222222222220000
          7.055555555555556000
          502.708333333333300000
          1949.097222222222000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'DETALLE PLAZOS FIJOS'
        Color = clSilver
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 7
        Top = 332
        Width = 159
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          585.611111111111100000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Afectaci'#243'n'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 174
        Top = 332
        Width = 351
        Height = 25
        Size.Values = (
          44.097222222222220000
          306.916666666666700000
          585.611111111111100000
          619.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Entidad Emisora'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 532
        Top = 332
        Width = 165
        Height = 25
        Size.Values = (
          44.097222222222220000
          938.388888888888900000
          585.611111111111100000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'N'#186' PF'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 703
        Top = 332
        Width = 124
        Height = 25
        Size.Values = (
          44.097222222222220000
          1240.013888888889000000
          585.611111111111100000
          218.722222222222200000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Vencimiento'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 832
        Top = 316
        Width = 272
        Height = 25
        Size.Values = (
          44.097222222222220000
          1467.555555555556000000
          557.388888888888900000
          479.777777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Moneda'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 832
        Top = 347
        Width = 72
        Height = 25
        Size.Values = (
          44.097222222222220000
          1467.555555555556000000
          612.069444444444400000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '$ / U$S'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 914
        Top = 347
        Width = 191
        Height = 25
        Size.Values = (
          44.097222222222220000
          1612.194444444444000000
          612.069444444444400000
          336.902777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Capital Inicial'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape8: TQRShape
        Left = 829
        Top = 341
        Width = 279
        Height = 5
        Size.Values = (
          8.819444444444444000
          1462.263888888889000000
          601.486111111111100000
          492.125000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 825
        Top = 312
        Width = 9
        Height = 62
        Size.Values = (
          109.361111111111100000
          1455.208333333333000000
          550.333333333333300000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlFecha: TQRLabel
        Left = 882
        Top = 112
        Width = 222
        Height = 25
        Size.Values = (
          44.097222222222220000
          1555.750000000000000000
          197.555555555555600000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape17: TQRShape
        Left = 695
        Top = 311
        Width = 9
        Height = 62
        Size.Values = (
          109.361111111111100000
          1225.902777777778000000
          548.569444444444400000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 524
        Top = 311
        Width = 9
        Height = 62
        Size.Values = (
          109.361111111111100000
          924.277777777777800000
          548.569444444444400000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 165
        Top = 311
        Width = 9
        Height = 62
        Size.Values = (
          109.361111111111100000
          291.041666666666700000
          548.569444444444400000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 904
        Top = 345
        Width = 9
        Height = 29
        Size.Values = (
          51.152777777777780000
          1594.555555555556000000
          608.541666666666700000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object DetailBand1: TQRBand
      Left = 57
      Top = 434
      Width = 1111
      Height = 29
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        51.152777777777780000
        1959.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 7
        Top = 2
        Width = 159
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          3.527777777777778000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CUENTA'
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
        Left = 174
        Top = 2
        Width = 351
        Height = 25
        Size.Values = (
          44.097222222222220000
          306.916666666666700000
          3.527777777777778000
          619.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'ENTIDAD_EMISORA'
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
        Left = 532
        Top = 2
        Width = 165
        Height = 25
        Size.Values = (
          44.097222222222220000
          938.388888888888900000
          3.527777777777778000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'NRO_PF'
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
        Left = 703
        Top = 2
        Width = 124
        Height = 25
        Size.Values = (
          44.097222222222220000
          1240.013888888889000000
          3.527777777777778000
          218.722222222222200000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'VENCIMIENTO'
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
      object QRDBText5: TQRDBText
        Left = 832
        Top = 2
        Width = 72
        Height = 25
        Size.Values = (
          44.097222222222220000
          1467.555555555556000000
          3.527777777777778000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'MONEDA'
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
        Left = 914
        Top = 2
        Width = 191
        Height = 25
        Size.Values = (
          44.097222222222220000
          1612.194444444444000000
          3.527777777777778000
          336.902777777777800000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CAPITAL_INICIAL'
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
    end
    object SummaryBand1: TQRBand
      Left = 57
      Top = 463
      Width = 1111
      Height = 524
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        924.277777777777800000
        1959.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape10: TQRShape
        Left = 4
        Top = 13
        Width = 1105
        Height = 112
        Size.Values = (
          197.555555555555600000
          7.055555555555556000
          22.930555555555560000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRMemo1: TQRMemo
        Left = 9
        Top = 153
        Width = 1096
        Height = 44
        Size.Values = (
          77.611111111111110000
          15.875000000000000000
          269.875000000000000000
          1933.222222222222000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'De tratarse de un retiro, por favor completar los siguientes dat' +
            'os:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmAutorizados: TQRMemo
        Left = 9
        Top = 176
        Width = 1096
        Height = 67
        Size.Values = (
          118.180555555555600000
          15.875000000000000000
          310.444444444444400000
          1933.222222222222000000)
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
        Lines.Strings = (
          'Autorizamos al portador...')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRMemo2: TQRMemo
        Left = 9
        Top = 19
        Width = 1096
        Height = 105
        Size.Values = (
          185.208333333333300000
          15.875000000000000000
          33.513888888888890000
          1933.222222222222000000)
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
        Lines.Strings = (
          
            'IMPORTANTE: Certifico que la documentaci'#243'n adjunta y cuyo detall' +
            'e figura en la presente planilla es aut'#233'ntica y que tanto los Ce' +
            'rtificados de Plazo Fijo como las operaciones subyacentes no tie' +
            'ne oposici'#243'n legal ni vicios ocultos a la fecha del presente; no' +
            ' existiendo circunstancia alguna que impida su custodia por part' +
            'e de Banco Patagonia S.A.'
          
            'Se deja constancia que el Banco Patagonia S.A. suministrar'#225' a la' +
            ' Superintendencia de Seguros de la Naci'#243'n la informaci'#243'n conteni' +
            'da en la presente planilla, que ha sido suministrada por la Comp' +
            'a'#241#237'a, siendo exclusiva responsabilidad de la Compa'#241#237'a la veracid' +
            'ad de los datos consignados.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape11: TQRShape
        Left = 829
        Top = 337
        Width = 279
        Height = 5
        Size.Values = (
          8.819444444444444000
          1462.263888888889000000
          594.430555555555600000
          492.125000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 829
        Top = 345
        Width = 279
        Height = 25
        Size.Values = (
          44.097222222222220000
          1462.263888888889000000
          608.541666666666700000
          492.125000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma y Aclaraci'#243'n'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape12: TQRShape
        Left = 4
        Top = 399
        Width = 1105
        Height = 122
        Size.Values = (
          215.194444444444400000
          7.055555555555556000
          703.791666666666700000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 7
        Top = 404
        Width = 1097
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          712.611111111111100000
          1934.986111111111000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'USO EXCLUSIVO DE BANCO PATAGONIA S.A. (SUCURSAL)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape14: TQRShape
        Left = 825
        Top = 427
        Width = 9
        Height = 93
        Size.Values = (
          164.041666666666700000
          1455.208333333333000000
          753.180555555555600000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 4
        Top = 426
        Width = 1105
        Height = 5
        Size.Values = (
          8.819444444444444000
          7.055555555555556000
          751.416666666666700000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 4
        Top = 489
        Width = 1105
        Height = 5
        Size.Values = (
          8.819444444444444000
          7.055555555555556000
          862.541666666666700000
          1949.097222222222000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 7
        Top = 495
        Width = 274
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          873.125000000000000000
          483.305555555555600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'RECIBI'#211'/CONTROL'#211
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape16: TQRShape
        Left = 280
        Top = 427
        Width = 9
        Height = 93
        Size.Values = (
          164.041666666666700000
          493.888888888888900000
          753.180555555555600000
          15.875000000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 291
        Top = 495
        Width = 533
        Height = 25
        Size.Values = (
          44.097222222222220000
          513.291666666666700000
          873.125000000000000000
          940.152777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CONTABILIZ'#211
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 834
        Top = 495
        Width = 274
        Height = 25
        Size.Values = (
          44.097222222222220000
          1471.083333333333000000
          873.125000000000000000
          483.305555555555600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CONTROL'#211
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '')
    Left = 48
    Top = 20
  end
end
