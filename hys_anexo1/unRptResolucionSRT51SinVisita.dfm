object rptResolucionSRT51SinVisita: TrptResolucionSRT51SinVisita
  Left = 0
  Top = 0
  Caption = 'rptResolucionSRT51SinVisita'
  ClientHeight = 578
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrResolucion: TQuickRep
    Left = 4
    Top = 1
    Width = 816
    Height = 1056
    IDReport = 0
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
    ReportTitle = 'Formulario de Resoluci'#243'n'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbTitle: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 397
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1050.395833333333000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape1: TQRShape
        Left = 0
        Top = 136
        Width = 453
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          359.833333333333400000
          1198.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 96
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          254.000000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 116
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          306.916666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 76
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          201.083333333333300000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 292
        Top = 80
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          772.583333333333300000
          211.666666666666700000
          391.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATOS DE LA EMPRESA'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 4
        Top = 100
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          264.583333333333300000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Raz'#243'n Social:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 120
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          317.500000000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Direcci'#243'n:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 452
        Top = 136
        Width = 288
        Height = 21
        Size.Values = (
          55.562500000000000000
          1195.916666666667000000
          359.833333333333400000
          762.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 156
        Width = 305
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          412.750000000000100000
          806.979166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 304
        Top = 156
        Width = 281
        Height = 21
        Size.Values = (
          55.562500000000000000
          804.333333333333200000
          412.750000000000100000
          743.479166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 584
        Top = 156
        Width = 156
        Height = 21
        Size.Values = (
          55.562500000000000000
          1545.166666666667000000
          412.750000000000100000
          412.750000000000100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 176
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          465.666666666666800000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 215
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          568.854166666666800000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 4
        Top = 139
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          367.770833333333300000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel/Fax:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 4
        Top = 159
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          420.687500000000000000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 305
        Top = 179
        Width = 123
        Height = 15
        Size.Values = (
          39.687500000000000000
          806.979166666666700000
          473.604166666666700000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATOS DE LA OBRA'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 4
        Top = 219
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          579.437500000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Direcci'#243'n:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 308
        Top = 159
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          814.916666666666700000
          420.687500000000000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contrato N'#186':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 588
        Top = 159
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          1555.750000000000000000
          420.687500000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CIIU:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 456
        Top = 139
        Width = 95
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          367.770833333333300000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#186' de Recepci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape13: TQRShape
        Left = 0
        Top = 289
        Width = 740
        Height = 48
        Size.Values = (
          127.000000000000000000
          0.000000000000000000
          764.645833333333400000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 124
        Top = 293
        Width = 518
        Height = 15
        Size.Values = (
          39.687500000000000000
          328.083333333333300000
          775.229166666666700000
          1370.541666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'EL PROGRAMA DE SEGURIDAD CON SU APROBACION DEBERAN ENCONTRARSE E' +
          'N OBRA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 171
        Top = 313
        Width = 427
        Height = 15
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          828.145833333333300000
          1129.770833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'La aprobaci'#243'n queda sujeta a los riesgos especificados en dicho ' +
          'programa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape14: TQRShape
        Left = 0
        Top = 336
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          889.000000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 0
        Top = 356
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          941.916666666666800000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 623
        Top = 356
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          941.916666666666800000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 301
        Top = 339
        Width = 180
        Height = 15
        Size.Values = (
          39.687500000000000000
          796.395833333333300000
          896.937500000000000000
          476.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'INFORMACI'#211'N PRESENTADA'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 4
        Top = 359
        Width = 295
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          949.854166666666700000
          780.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de presentaci'#243'n del Programa de Seguridad:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrRazonSocial: TQRDBText
        Left = 88
        Top = 99
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          261.937500000000000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'EM_NOMBRE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrDireccion: TQRDBText
        Left = 69
        Top = 119
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          314.854166666666700000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'DOMICILIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrTelefono: TQRDBText
        Left = 56
        Top = 138
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          365.125000000000000000
          275.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'DC_TELEFONOS'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrCuit: TQRDBText
        Left = 43
        Top = 158
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          418.041666666666700000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'EM_CUIT'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrContrato: TQRDBText
        Left = 386
        Top = 159
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1021.291666666667000000
          420.687500000000000000
          256.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'CO_CONTRATO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrRecepcion: TQRDBText
        Left = 553
        Top = 139
        Width = 94
        Height = 15
        Size.Values = (
          39.687500000000000000
          1463.145833333333000000
          367.770833333333300000
          248.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_RECEPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrCIIU: TQRDBText
        Left = 632
        Top = 158
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          418.041666666666700000
          240.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'AC_RELACION'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrDireccionobrador: TQRDBText
        Left = 68
        Top = 217
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          179.916666666666700000
          574.145833333333300000
          306.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'DOMICILIO_ESTAB'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrFechaPS: TQRDBText
        Left = 645
        Top = 358
        Width = 146
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          947.208333333333300000
          386.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'PS_FECHARECEPCION'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 235
        Width = 740
        Height = 55
        Size.Values = (
          145.520833333333300000
          0.000000000000000000
          621.770833333333400000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 4
        Top = 240
        Width = 195
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          635.000000000000000000
          515.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Breve descripci'#243'n de la actividad:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrDescripcion: TQRDBText
        Left = 196
        Top = 238
        Width = 541
        Height = 49
        Size.Values = (
          129.645833333333300000
          518.583333333333400000
          629.708333333333400000
          1431.395833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_OBSERVACIONES'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape40: TQRShape
        Left = 0
        Top = 195
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          515.937500000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel44: TQRLabel
        Left = 4
        Top = 198
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          523.875000000000000000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Denominaci'#243'n:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 96
        Top = 197
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          521.229166666666700000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'ES_NOMBRE'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object logo: TQRImage
        Left = 575
        Top = 0
        Width = 165
        Height = 65
        Size.Values = (
          171.979166666666700000
          1521.354166666667000000
          0.000000000000000000
          436.562499999999900000)
        XLColumn = 0
        Stretch = True
      end
      object QRShape70: TQRShape
        Left = 20
        Top = 0
        Width = 337
        Height = 34
        Size.Values = (
          89.958333333333340000
          52.916666666666660000
          0.000000000000000000
          891.645833333333200000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlbResolucion: TQRLabel
        Left = 45
        Top = 18
        Width = 288
        Height = 15
        Size.Values = (
          39.687500000000000000
          119.062500000000000000
          47.625000000000000000
          762.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'EN CONSTRUCCI'#211'N RESOLUCI'#211'N S.RT. N'#186' 51/97'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 39
        Top = 2
        Width = 299
        Height = 15
        Size.Values = (
          39.687500000000000000
          103.187500000000000000
          5.291666666666667000
          791.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'APROBACI'#211'N DEL PLAN DE SEGURIDAD DE OBRAS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape71: TQRShape
        Left = 623
        Top = 376
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          994.833333333333400000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 0
        Top = 376
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          994.833333333333400000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 5
        Top = 379
        Width = 240
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          1002.770833333333000000
          635.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de presentaci'#243'n del Aviso de Obra:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 645
        Top = 378
        Width = 147
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          1000.125000000000000000
          388.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_FECHARECEPCION'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlBarras: TArtQRLabel
        Left = 20
        Top = 37
        Width = 317
        Height = 21
        Size.Values = (
          55.562500000000000000
          52.916666666666660000
          97.895833333333340000
          838.729166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '**'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = '3 of 9 Barcode'
        Font.Style = []
        OnPrint = qrlBarrasPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
      object qrlNumero: TQRLabel
        Left = 20
        Top = 59
        Width = 317
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          156.104166666666700000
          838.729166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumero'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object cbFechaAnexo: TQRChildBand
      Left = 38
      Top = 435
      Width = 740
      Height = 19
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbTitle
      PrintOrder = cboAfterParent
      object QRShape72: TQRShape
        Left = 0
        Top = -1
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          -2.645833333333333000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape73: TQRShape
        Left = 623
        Top = -1
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          -2.645833333333333000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel39: TQRLabel
        Left = 4
        Top = 2
        Width = 252
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          5.291666666666667000
          666.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de presentaci'#243'n del Anexo solicitado:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 645
        Top = 1
        Width = 114
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          2.645833333333333000
          301.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'PS_FECHAANEXO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRChildBand1: TQRChildBand
      Left = 38
      Top = 454
      Width = 740
      Height = 479
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1267.354166666667000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = cbFechaAnexo
      PrintOrder = cboAfterParent
      object QRShape17: TQRShape
        Left = 0
        Top = 0
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          0.000000000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 623
        Top = 0
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          0.000000000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 0
        Top = 20
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          52.916666666666660000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 623
        Top = 20
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          52.916666666666660000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 0
        Top = 40
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          105.833333333333300000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 623
        Top = 40
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          105.833333333333300000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 0
        Top = 60
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          158.750000000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 623
        Top = 60
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          158.750000000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 0
        Top = 80
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          211.666666666666700000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 623
        Top = 80
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          211.666666666666700000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 0
        Top = 100
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          264.583333333333400000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 623
        Top = 100
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          264.583333333333400000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 0
        Top = 120
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          317.500000000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 623
        Top = 120
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          317.500000000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 0
        Top = 140
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          370.416666666666700000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 623
        Top = 140
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          370.416666666666700000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 623
        Top = 160
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          423.333333333333300000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 0
        Top = 160
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          423.333333333333300000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 4
        Top = 3
        Width = 141
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          7.937500000000000000
          373.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Identificaci'#243'n de la ART:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 4
        Top = 23
        Width = 117
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          60.854166666666670000
          309.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Listado de Personal:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 4
        Top = 43
        Width = 136
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          113.770833333333300000
          359.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descripci'#243'n de la Obra:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 4
        Top = 64
        Width = 211
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          169.333333333333300000
          558.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descripci'#243'n de etapas constructivas:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 4
        Top = 83
        Width = 294
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          219.604166666666700000
          777.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Riesgos generales y espec'#237'ficos por etapa de obra:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 4
        Top = 103
        Width = 254
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          272.520833333333300000
          672.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Medidas de seguridad a adoptar por etapas:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 4
        Top = 123
        Width = 124
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          325.437500000000000000
          328.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Firma del empleador:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 4
        Top = 143
        Width = 157
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          378.354166666666700000
          415.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Firma del Director de obra:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 4
        Top = 163
        Width = 264
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          431.270833333333300000
          698.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Firma del responsable de Higiene y Seguridad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 652
        Top = 3
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          7.937500000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 652
        Top = 23
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          60.854166666666670000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 652
        Top = 43
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          113.770833333333300000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel31: TQRLabel
        Left = 652
        Top = 63
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          166.687500000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel32: TQRLabel
        Left = 652
        Top = 83
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          219.604166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 652
        Top = 103
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          272.520833333333300000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel34: TQRLabel
        Left = 652
        Top = 123
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          325.437500000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel35: TQRLabel
        Left = 652
        Top = 143
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          378.354166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel36: TQRLabel
        Left = 652
        Top = 163
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          431.270833333333300000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cumplido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel37: TQRLabel
        Left = 299
        Top = 184
        Width = 169
        Height = 15
        Size.Values = (
          39.687500000000000000
          791.104166666666600000
          486.833333333333300000
          447.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AVISO DE INICIO DE OBRA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape35: TQRShape
        Left = 0
        Top = 220
        Width = 192
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          582.083333333333400000
          508.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 191
        Top = 220
        Width = 253
        Height = 21
        Size.Values = (
          55.562500000000000000
          505.354166666666700000
          582.083333333333400000
          669.395833333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 441
        Top = 220
        Width = 299
        Height = 21
        Size.Values = (
          55.562500000000000000
          1166.812500000000000000
          582.083333333333400000
          791.104166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 0
        Top = 240
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          635.000000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 4
        Top = 187
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          494.770833333333300000
          97.895833333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inicio:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 198
        Top = 223
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          523.875000000000000000
          590.020833333333400000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Finalizaci'#243'n:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel42: TQRLabel
        Left = 448
        Top = 223
        Width = 128
        Height = 15
        Size.Values = (
          39.687500000000000000
          1185.333333333333000000
          590.020833333333400000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cantidad de Personal:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel43: TQRLabel
        Left = 4
        Top = 243
        Width = 215
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          642.937500000000000000
          568.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Responsable de Higiene y Seguridad:'
        Color = clGradientInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrFechaInicio: TQRDBText
        Left = 50
        Top = 222
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          132.291666666666700000
          587.375000000000000000
          285.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_FECHAINICIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrFechaFinal: TQRDBText
        Left = 278
        Top = 222
        Width = 146
        Height = 17
        Size.Values = (
          44.979166666666670000
          735.541666666666600000
          587.375000000000000000
          386.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'AO_FECHAFINDEOBRA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrCantPersonal: TQRDBText
        Left = 580
        Top = 222
        Width = 164
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          587.375000000000000000
          433.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'PS_CANTTRABAJADORES'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrResponsable: TQRDBText
        Left = 224
        Top = 242
        Width = 514
        Height = 17
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          640.291666666666800000
          1359.958333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clGradientInactiveCaption
        DataSet = sdqAvisoObra
        DataField = 'CT_CONTACTO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo2: TQRMemo
        Left = 14
        Top = 202
        Width = 705
        Height = 14
        Size.Values = (
          37.041666666666670000
          37.041666666666670000
          534.458333333333400000
          1865.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            'El aviso de obra se har'#225' conforme a lo estipulado en el Art.1'#170'Re' +
            's51/97, pudiendo la empresa dar aviso de varias obras simult'#225'nea' +
            's.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRMemo3: TQRMemo
        Left = 23
        Top = 272
        Width = 698
        Height = 50
        Size.Values = (
          132.291666666666700000
          60.854166666666680000
          719.666666666666800000
          1846.791666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            '               De acuerdo a lo dispuesto en el Art. 3 de la Reso' +
            'luci'#243'n S.R.T. N'#186' 51/97 y en base a la informaci'#243'n recibida, apro' +
            'bamos el Plan de Seguridad proponemos, en principio, que persona' +
            'l t'#233'cnico de PROVINCIA ART visite el establecimiento previa info' +
            'rmaci'#243'n de la empresa de la fecha en que se re realiazar'#225'n las t' +
            'areas, ya que por tratarse de actividades espor'#225'dicas, esta Aseg' +
            'uradora no podr'#225' confeccionar el cronograma previsto en la Res. ' +
            'S.R.T N'#186' 51/97.'
          '')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRLabel54: TQRLabel
        Left = 27
        Top = 372
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          71.437500000000000000
          984.250000000000000000
          542.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '...................................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lblfirmaprofart: TQRLabel
        Left = 68
        Top = 387
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          179.916666666666700000
          1023.937500000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Aprobaci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel55: TQRLabel
        Left = 495
        Top = 375
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          1309.687500000000000000
          992.187500000000000000
          542.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '...................................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel56: TQRLabel
        Left = 564
        Top = 389
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1492.250000000000000000
          1029.229166666667000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Firma y sello'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRMemo1: TQRMemo
        Left = 8
        Top = 440
        Width = 517
        Height = 14
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          1164.166666666667000000
          1367.895833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            'PROVINCIA A.R.T. - Carlos Pellegrini 91 - (1009) Buenos Aires Te' +
            'l.: 5166-4545 interno Fax: 4514')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText2: TQRDBText
        Left = 65
        Top = 362
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          171.979166666666700000
          957.791666666666600000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'FECHAAPROBADO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 92
        Top = 414
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          243.416666666666700000
          1095.375000000000000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'preventor'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 8
        Top = 415
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          1098.020833333333000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Preventor: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object sdqEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      ''
      'SELECT aem.em_nombre,'
      '          art.afi.armar_domicilio (es_calle,'
      '                                   es_numero,'
      '                                   es_piso,'
      '                                   es_departamento,'
      '                                   es_localidad'
      '                                  )'
      '       || NVL2 (es_telefonos,'
      
        '                '#39' Tel.'#39' || (NVL (es_codareatelefonos, '#39#39') || es_' +
        'telefonos),'
      '                '#39#39
      '               )|| '#39' - '#39
      '       || (SELECT pv_descripcion'
      '             FROM cpv_provincias'
      '            WHERE pv_codigo = es_provincia) AS domicilio_estab,'
      
        '       dc_telefonos, aem.em_cuit, (aco.co_contrato ||'#39'/'#39' ||es_nr' +
        'oestableci) as co_contrato, ac_relacion,'
      
        '       aes.es_nroestableci,aes.es_nombre, art.afi.armar_domicili' +
        'o(DC_CALLE,DC_NUMERO,'
      '                                   DC_PISO,'
      '                                   DC_DEPARTAMENTO,'
      '                                   DC_LOCALIDAD)|| '#39' - '#39
      '       || (SELECT pv_descripcion'
      '             FROM cpv_provincias'
      '            WHERE pv_codigo = dc_provincia) as domicilio,'
      '       NVL (es_telefonos, dc_telefonos) telefono,AC_DESCRIPCION'
      '  FROM afi.adc_domiciliocontrato ahdl,'
      '       afi.aem_empresa aem,'
      '       afi.aco_contrato aco,'
      '       afi.aes_establecimiento aes,'
      '       comunes.cac_actividad cac'
      ' WHERE co_contrato = art.get_vultcontrato (em_cuit)'
      '   AND ahdl.dc_contrato(+) = aco.co_contrato'
      '   AND ahdl.dc_tipo(+) = '#39'L'#39
      '   AND aem.em_id = aco.co_idempresa'
      '   AND cac.ac_id = aes.es_idactividad'
      '   AND aco.co_contrato = aes.es_contrato'
      '--   AND aes.es_fechabaja IS NULL'
      '--   AND co_estado = '#39'1'#39
      '   and em_cuit = :cuit'
      '   and es_nroestableci = :estableci'
      '')
    Left = 86
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
  object sdqAvisoObra: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ar_nrorecepcion || '#39' CAR'#39' AS ao_recepcion, ps_fecharecepc' +
        'ion,'
      '       ao_fechainicio, ao_fechafindeobra, ps_canttrabajadores,'
      '       ps_requierefechaanexo, ps_fechaanexo, ao_fecharecepcion,'
      
        '       TO_CHAR (ps_fechaaprobado, '#39'DD "de" Month "de" YYYY'#39') AS ' +
        'fechaaprobado,'
      '       (   ct_contacto'
      '        || '#39' '#39
      '        || NVL (ct_telefonos,'
      
        '                art.afi.get_telefonos ('#39'ATN_TELEFONOCONTACTO'#39', c' +
        't_id)'
      '               )'
      '       ) AS ct_contacto,'
      '       ps_observaciones,'
      
        '       art.archivo.get_codbarrasclave ('#39'CAR'#39', ar_nrorecepcion) c' +
        'odbarrasclave'
      '  FROM hys.har_avisoobranrorecepcion,'
      '  art.pao_avisoobra, '
      '       hys.hps_programaseguridad,'
      '       afi.act_contacto'
      ' WHERE ar_cuit = ps_cuit'
      '   AND ar_estableci = ps_establecimiento'
      '   AND ar_cuit = :cuit'
      '   and ao_cuit(+) = ar_cuit'
      '   and ao_estableci (+) = ar_estableci '
      '   and ao_tipo(+) = :tipo'
      '   AND ar_estableci = :estableci'
      '   AND ps_contacto = ct_id(+)'
      '   AND (   ps_fechainicio ='
      '                    (SELECT MAX (ps_fechainicio)'
      '                       FROM hys.hps_programaseguridad'
      
        '                      WHERE ps_cuit = :cuit AND ps_establecimien' +
        'to ='
      
        '                                                                ' +
        '    :estableci)'
      '        OR ps_fecharecepcion ='
      '                    (SELECT MAX (ps_fecharecepcion)'
      '                       FROM hys.hps_programaseguridad'
      
        '                      WHERE ps_cuit = :cuit AND ps_establecimien' +
        'to ='
      
        '                                                                ' +
        '    :estableci)'
      '       )')
    Left = 142
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end>
  end
end
