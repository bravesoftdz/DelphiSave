object rptResolucionSRT: TrptResolucionSRT
  Left = 63
  Top = 60
  Caption = 'Resoluci'#243'n S.R.T.'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrResolucion: TQuickRep
    Left = -16
    Top = -12
    Width = 816
    Height = 1056
    IDReport = 0
    DataSet = sdqVisitas
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
      Top = 104
      Width = 740
      Height = 342
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        904.875000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object lblcuit: TQRLabel
        Left = 319
        Top = -1
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          -2.645833333333333000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'APROBACI'#211'N'
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
      object QRLabel1: TQRLabel
        Left = 140
        Top = 12
        Width = 467
        Height = 15
        Size.Values = (
          39.687500000000000000
          370.416666666666700000
          31.750000000000000000
          1235.604166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROGRAMA DE SEGURIDAD PARA OBRAS REPETITIVAS Y DE CORTA DURACI'#211'N'
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
        Left = 267
        Top = 25
        Width = 194
        Height = 15
        Size.Values = (
          39.687500000000000000
          706.437500000000000000
          66.145833333333330000
          513.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RESOLUCI'#211'N S.R.T. N'#186' 319/99'
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
      object QRShape1: TQRShape
        Left = 0
        Top = 100
        Width = 453
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          264.583333333333400000
          1198.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 60
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          158.750000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 80
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          211.666666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 40
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          105.833333333333300000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 292
        Top = 44
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          772.583333333333300000
          116.416666666666700000
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
        Top = 65
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          171.979166666666700000
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
        Top = 85
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          224.895833333333300000
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
        Top = 100
        Width = 288
        Height = 21
        Size.Values = (
          55.562500000000000000
          1195.916666666667000000
          264.583333333333400000
          762.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 120
        Width = 305
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          317.500000000000000000
          806.979166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 304
        Top = 120
        Width = 281
        Height = 21
        Size.Values = (
          55.562500000000000000
          804.333333333333200000
          317.500000000000000000
          743.479166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 584
        Top = 120
        Width = 156
        Height = 21
        Size.Values = (
          55.562500000000000000
          1545.166666666667000000
          317.500000000000000000
          412.750000000000100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 140
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          370.416666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 160
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          423.333333333333300000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 0
        Top = 180
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          476.250000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 4
        Top = 104
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          275.166666666666700000
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
        Top = 124
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          328.083333333333300000
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
        Top = 143
        Width = 123
        Height = 15
        Size.Values = (
          39.687500000000000000
          806.979166666666700000
          378.354166666666700000
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
        Top = 164
        Width = 131
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          433.916666666666700000
          346.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Direcci'#243'n del Obrador:'
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
      object QRLabel10: TQRLabel
        Left = 4
        Top = 183
        Width = 183
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          484.187500000000000000
          484.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel'#233'fono para coordinar visitas:'
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
        Top = 123
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          814.916666666666700000
          325.437500000000000000
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
        Top = 123
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          1555.750000000000000000
          325.437500000000000000
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
        Top = 103
        Width = 95
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          272.520833333333300000
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
        Top = 257
        Width = 740
        Height = 45
        Size.Values = (
          119.062500000000000000
          0.000000000000000000
          679.979166666666800000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 124
        Top = 262
        Width = 518
        Height = 15
        Size.Values = (
          39.687500000000000000
          328.083333333333300000
          693.208333333333300000
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
        Top = 282
        Width = 427
        Height = 15
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          746.125000000000000000
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
        Top = 301
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          796.395833333333400000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 0
        Top = 321
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          849.312499999999900000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 623
        Top = 321
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          849.312499999999900000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 301
        Top = 304
        Width = 180
        Height = 15
        Size.Values = (
          39.687500000000000000
          796.395833333333300000
          804.333333333333300000
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
        Top = 324
        Width = 295
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          857.250000000000000000
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
        Top = 63
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          166.687500000000000000
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
        Top = 83
        Width = 668
        Height = 17
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          219.604166666666700000
          1767.416666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        Top = 102
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          269.875000000000000000
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
        Top = 122
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          322.791666666666700000
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
        Left = 385
        Top = 123
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1018.645833333333000000
          325.437500000000000000
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
        Left = 556
        Top = 103
        Width = 94
        Height = 15
        Size.Values = (
          39.687500000000000000
          1471.083333333333000000
          272.520833333333300000
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
        Top = 122
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          322.791666666666700000
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
        Left = 148
        Top = 162
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          391.583333333333300000
          428.625000000000000000
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
      object qrTelEstablecimiento: TQRDBText
        Left = 192
        Top = 182
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          481.541666666666700000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'TELEFONO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrFechaPS: TQRDBText
        Left = 645
        Top = 323
        Width = 146
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          854.604166666666700000
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
        Top = 200
        Width = 740
        Height = 58
        Size.Values = (
          153.458333333333300000
          0.000000000000000000
          529.166666666666800000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 4
        Top = 204
        Width = 195
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          539.750000000000000000
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
      object lbObraDesc: TQRLabel
        Left = 198
        Top = 204
        Width = 535
        Height = 48
        Size.Values = (
          127.000000000000000000
          523.875000000000000000
          539.750000000000000000
          1415.520833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lbObraDesc'
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
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 66
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        174.625000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
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
      object QRSysData1: TQRSysData
        Left = 6
        Top = 4
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          10.583333333333330000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = 'Hoja '
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object lbCantPag: TQRLabel
        Left = 65
        Top = 4
        Width = 6
        Height = 17
        Size.Values = (
          44.979166666666670000
          171.979166666666700000
          10.583333333333330000
          15.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '/'
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
      object qrlBarras: TArtQRLabel
        Left = 6
        Top = 23
        Width = 317
        Height = 24
        Size.Values = (
          63.500000000000000000
          15.875000000000000000
          60.854166666666680000
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
        Left = 6
        Top = 48
        Width = 317
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          127.000000000000000000
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
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 446
      Width = 740
      Height = 20
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbTitle
      PrintOrder = cboAfterParent
      object QRShape39: TQRShape
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
      object QRShape40: TQRShape
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
      object QRLabel38: TQRLabel
        Left = 4
        Top = 2
        Width = 378
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          5.291666666666667000
          1000.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Fecha de presentaci'#243'n de la solicitud de Extensi'#243'n del Programa:' +
          ' '
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
        Top = 1
        Width = 109
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          2.645833333333333000
          288.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'ps_fechaextension'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object ChildBand2: TQRChildBand
      Left = 38
      Top = 486
      Width = 740
      Height = 482
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1275.291666666667000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = cbFechaAnexo
      PrintOrder = cboAfterParent
      object QRShape17: TQRShape
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
      object QRShape18: TQRShape
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
      object QRShape19: TQRShape
        Left = 0
        Top = 19
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          50.270833333333330000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 623
        Top = 19
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          50.270833333333330000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 0
        Top = 39
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          103.187500000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 623
        Top = 39
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          103.187500000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 0
        Top = 59
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          156.104166666666700000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 623
        Top = 59
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          156.104166666666700000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 0
        Top = 79
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          209.020833333333300000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 623
        Top = 79
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          209.020833333333300000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 0
        Top = 99
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          261.937500000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 623
        Top = 99
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          261.937500000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 0
        Top = 119
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          314.854166666666700000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 623
        Top = 119
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          314.854166666666700000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 0
        Top = 139
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          367.770833333333400000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 623
        Top = 139
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          367.770833333333400000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 623
        Top = 159
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          420.687500000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 0
        Top = 159
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          420.687500000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 4
        Top = 2
        Width = 141
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          5.291666666666667000
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
        Top = 22
        Width = 117
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          58.208333333333330000
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
        Top = 42
        Width = 156
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          111.125000000000000000
          412.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Procedimientos de trabajo:'
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
        Top = 62
        Width = 118
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          164.041666666666700000
          312.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Riesgos Potenciales:'
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
        Top = 82
        Width = 246
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          216.958333333333300000
          650.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descripci'#243'n de la asignaci'#243'n de las tareas:'
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
        Top = 102
        Width = 172
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          269.875000000000000000
          455.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Organizaci'#243'n de la seguridad:'
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
        Top = 122
        Width = 124
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          322.791666666666700000
          328.083333333333400000)
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
        Top = 142
        Width = 157
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          375.708333333333400000
          415.395833333333400000)
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
        Top = 162
        Width = 264
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          428.625000000000000000
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
        Top = 2
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          5.291666666666667000
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
        Top = 22
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          58.208333333333330000
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
        Top = 42
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          111.125000000000000000
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
        Top = 62
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          164.041666666666700000
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
        Top = 82
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          216.958333333333300000
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
        Top = 102
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          269.875000000000000000
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
        Top = 122
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333334000000
          322.791666666666700000
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
        Top = 142
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333334000000
          375.708333333333400000
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
        Top = 162
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333334000000
          428.625000000000000000
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
        Top = 183
        Width = 169
        Height = 15
        Size.Values = (
          39.687500000000000000
          791.104166666666800000
          484.187500000000000000
          447.145833333333400000)
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
        Top = 219
        Width = 265
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          579.437500000000000000
          701.145833333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 264
        Top = 219
        Width = 253
        Height = 21
        Size.Values = (
          55.562500000000000000
          698.500000000000000000
          579.437500000000000000
          669.395833333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 516
        Top = 219
        Width = 224
        Height = 21
        Size.Values = (
          55.562500000000000000
          1365.250000000000000000
          579.437500000000000000
          592.666666666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 0
        Top = 239
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          632.354166666666800000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 3
        Top = 222
        Width = 118
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          587.375000000000000000
          312.208333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inicio del programa:'
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
        Left = 268
        Top = 222
        Width = 113
        Height = 15
        Size.Values = (
          39.687500000000000000
          709.083333333333400000
          587.375000000000000000
          298.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Final del programa:'
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
        Left = 520
        Top = 222
        Width = 128
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          587.375000000000000000
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
        Top = 242
        Width = 215
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          640.291666666666800000
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
        Left = 128
        Top = 221
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          584.729166666666800000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'fecha_inicio'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrFechaFinal: TQRDBText
        Left = 385
        Top = 221
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          1018.645833333333000000
          584.729166666666800000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqAvisoObra
        DataField = 'fechafindeobra'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrCantPersonal: TQRDBText
        Left = 652
        Top = 221
        Width = 164
        Height = 17
        Size.Values = (
          44.979166666666670000
          1725.083333333334000000
          584.729166666666800000
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
        Top = 241
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          592.666666666666800000
          637.645833333333400000
          1357.312500000000000000)
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
        Top = 201
        Width = 705
        Height = 14
        Size.Values = (
          37.041666666666670000
          37.041666666666670000
          531.812500000000000000
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
        Left = 18
        Top = 262
        Width = 698
        Height = 50
        Size.Values = (
          132.291666666666700000
          47.625000000000000000
          693.208333333333400000
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
        Left = 43
        Top = 370
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          113.770833333333300000
          978.958333333333400000
          542.395833333333400000)
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
        Left = 84
        Top = 385
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          222.250000000000000000
          1018.645833333333000000
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
      object QRMemo1: TQRMemo
        Left = 480
        Top = 410
        Width = 241
        Height = 67
        Size.Values = (
          177.270833333333300000
          1270.000000000000000000
          1084.791666666667000000
          637.645833333333400000)
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
          'PROVINCIA A.R.T.'
          'Carlos Pellegrini 91 - (1009) Buenos Aires'
          'Centro de atenci'#243'n al cliente:'
          'Tel.: 4819-2800 (L'#237'neas Rotativas)'
          'Fax: 4819-2888')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRLabel55: TQRLabel
        Left = 511
        Top = 367
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          1352.020833333333000000
          971.020833333333400000
          542.395833333333400000)
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
        Left = 580
        Top = 381
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          1008.062500000000000000
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
      object QRDBText2: TQRDBText
        Left = 85
        Top = 360
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          224.895833333333300000
          952.500000000000000000
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
      object QRLabel44: TQRLabel
        Left = 8
        Top = 455
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          1203.854166666667000000
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
      object QRDBText4: TQRDBText
        Left = 92
        Top = 454
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          243.416666666666700000
          1201.208333333333000000
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
    end
    object cbFechaAnexo: TQRChildBand
      Left = 38
      Top = 466
      Width = 740
      Height = 20
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand1
      PrintOrder = cboAfterParent
      object QRShape41: TQRShape
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
      object QRShape42: TQRShape
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
      object QRDBText3: TQRDBText
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
  end
  object sdqEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
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
      '               )'
      '       || '#39' - '#39
      '       || (SELECT pv_descripcion'
      '             FROM cpv_provincias'
      '            WHERE pv_codigo = es_provincia)'
      ' AS domicilio_estab,'
      '       dc_telefonos, aem.em_cuit,'
      
        '       (aco.co_contrato || '#39'/'#39' || es_nroestableci) AS co_contrat' +
        'o,'
      '       ac_relacion, aes.es_nroestableci, aes.es_nombre,'
      '          art.afi.armar_domicilio (dc_calle,'
      '                                   dc_numero,'
      '                                   dc_piso,'
      '                                   dc_departamento,'
      '                                   dc_localidad'
      '                                  )'
      '       || '#39' - '#39
      '       || (SELECT pv_descripcion'
      '             FROM cpv_provincias'
      '            WHERE pv_codigo = dc_provincia)'
      ' as domicilio,'
      
        '       NVL (es_telefonos, dc_telefonos) telefono, ac_descripcion' +
        ','
      ' (SELECT it_nombre'
      '          FROM art.pit_firmantes'
      
        '         WHERE it_codigo = art.hys.get_preventor_estab(aem.em_cu' +
        'it, '
      
        '                                       es_nroestableci, SYSDATE)' +
        ') preventor'
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
      '   AND aes.es_fechabaja IS NULL'
      '   AND co_estado = '#39'1'#39
      '   AND em_cuit = :cuit'
      '   AND es_nroestableci = :estableci'
      ''
      '')
    Left = 86
    Top = 65534
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
  object sdqVisitas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ROWNUM, fv_fecha'
      '  FROM hys.hfv_fechasvisitas'
      ' WHERE fv_cuit = :cuit'
      '  AND fv_estableci = :estableci'
      'order by fv_fecha')
    Left = 114
    Top = 65534
    ParamData = <
      item
        DataType = ftString
        Name = 'cuit'
        ParamType = ptInput
        Value = '30523561444'
      end
      item
        DataType = ftSmallint
        Name = 'estableci'
        ParamType = ptInput
        Value = '1'
      end>
  end
  object sdqAvisoObra: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ar_nrorecepcion || '#39' CAR'#39' AS ao_recepcion, ps_fecharecepc' +
        'ion,'
      '       ps_requierefechaanexo, ps_fechaanexo,'
      
        '       TO_CHAR (ps_fechaaprobado, '#39'DD "de" Month "de" YYYY'#39') AS ' +
        'fechaaprobado,'
      '       NVL (ps_fechaextension,'
      '            NVL (ps_fechainicio, ao_fechainicio)'
      '           ) AS fecha_inicio,'
      '       ADD_MONTHS (NVL (ps_fechaextension,'
      '                        NVL (ps_fechainicio, ao_fechainicio)'
      '                       ),'
      '                   6'
      '                  ) fechafindeobra,'
      '       ps_canttrabajadores,'
      '       (   ct_contacto'
      '        || '#39' '#39
      '        || NVL (ct_telefonos,'
      
        '                art.afi.get_telefonos ('#39'ATN_TELEFONOCONTACTO'#39', c' +
        't_id)'
      '               )'
      '       ) AS ct_contacto,'
      '       ps_fechaextension, hps.*,'
      
        '       art.archivo.get_codbarrasclave ('#39'CAR'#39', ar_nrorecepcion) c' +
        'odbarrasclave'
      '  FROM hys.har_avisoobranrorecepcion,'
      '       art.pao_avisoobra,'
      '       hys.hps_programaseguridad hps,'
      '       afi.act_contacto'
      ' WHERE ar_cuit = ps_cuit'
      '   AND ar_estableci = ps_establecimiento'
      '   and ao_estableci(+) = ar_estableci '
      '   and ao_cuit(+)= ar_cuit'
      '   AND ar_cuit = :cuit'
      '   AND ar_estableci = :estableci'
      '   AND ao_tipo(+) = :tipo'
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
    Top = 65534
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
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
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
