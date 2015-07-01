object rptResolucionSRT51: TrptResolucionSRT51
  Left = 0
  Top = 0
  Caption = 'rptResolucionSRT51'
  ClientHeight = 653
  ClientWidth = 897
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
    Left = 56
    Top = -208
    Width = 816
    Height = 1056
    IDReport = 0
    DataSet = sdqEmpresa
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
      Height = 399
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1055.687500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape1: TQRShape
        Left = 0
        Top = 138
        Width = 453
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          365.125000000000000000
          1198.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 98
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          259.291666666666700000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 118
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          312.208333333333400000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 78
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          206.375000000000000000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 292
        Top = 82
        Width = 148
        Height = 15
        Size.Values = (
          39.687500000000000000
          772.583333333333300000
          216.958333333333300000
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
        Top = 102
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          269.875000000000000000
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
        Top = 122
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          322.791666666666700000
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
        Top = 138
        Width = 288
        Height = 21
        Size.Values = (
          55.562500000000000000
          1195.916666666667000000
          365.125000000000000000
          762.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 158
        Width = 305
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          418.041666666666700000
          806.979166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 304
        Top = 158
        Width = 281
        Height = 21
        Size.Values = (
          55.562500000000000000
          804.333333333333200000
          418.041666666666700000
          743.479166666666800000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 584
        Top = 158
        Width = 156
        Height = 21
        Size.Values = (
          55.562500000000000000
          1545.166666666667000000
          418.041666666666700000
          412.750000000000100000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 178
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          470.958333333333400000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 217
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          574.145833333333400000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 4
        Top = 141
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          373.062500000000000000
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
        Top = 161
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          425.979166666666700000
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
        Top = 181
        Width = 123
        Height = 15
        Size.Values = (
          39.687500000000000000
          806.979166666666700000
          478.895833333333300000
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
        Top = 221
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          584.729166666666700000
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
        Top = 161
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          814.916666666666700000
          425.979166666666700000
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
        Top = 161
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          1555.750000000000000000
          425.979166666666700000
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
        Top = 141
        Width = 95
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          373.062500000000000000
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
        Top = 290
        Width = 740
        Height = 49
        Size.Values = (
          129.645833333333300000
          0.000000000000000000
          767.291666666666800000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 124
        Top = 292
        Width = 518
        Height = 15
        Size.Values = (
          39.687500000000000000
          328.083333333333300000
          772.583333333333300000
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
        Top = 312
        Width = 427
        Height = 15
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          825.500000000000000000
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
        Top = 338
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          894.291666666666800000
          1957.916666666667000000)
        XLColumn = 0
        Brush.Color = clGradientInactiveCaption
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 0
        Top = 358
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          947.208333333333400000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 623
        Top = 358
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          947.208333333333400000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 301
        Top = 341
        Width = 180
        Height = 15
        Size.Values = (
          39.687500000000000000
          796.395833333333300000
          902.229166666666700000
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
        Top = 361
        Width = 295
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          955.145833333333300000
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
        Top = 101
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          267.229166666666700000
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
        Top = 121
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          320.145833333333300000
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
        Top = 140
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          370.416666666666700000
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
        Top = 160
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          423.333333333333300000
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
        Top = 161
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1018.645833333333000000
          425.979166666666700000
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
        Top = 141
        Width = 94
        Height = 15
        Size.Values = (
          39.687500000000000000
          1463.145833333333000000
          373.062500000000000000
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
        Top = 160
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          423.333333333333300000
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
        Top = 219
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          179.916666666666700000
          579.437500000000000000
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
        Top = 360
        Width = 146
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          952.500000000000000000
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
        Top = 237
        Width = 740
        Height = 54
        Size.Values = (
          142.875000000000000000
          0.000000000000000000
          627.062500000000000000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 4
        Top = 242
        Width = 195
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          640.291666666666700000
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
        Left = 197
        Top = 239
        Width = 540
        Height = 49
        Size.Values = (
          129.645833333333300000
          521.229166666666700000
          632.354166666666800000
          1428.750000000000000000)
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
        Top = 197
        Width = 740
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          521.229166666666700000
          1957.916666666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel44: TQRLabel
        Left = 4
        Top = 200
        Width = 87
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          529.166666666666700000
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
        Top = 199
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          526.520833333333300000
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
        Top = 1
        Width = 337
        Height = 35
        Size.Values = (
          92.604166666666680000
          52.916666666666660000
          2.645833333333333000
          891.645833333333200000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object lblcuit: TQRLabel
        Left = 39
        Top = 3
        Width = 299
        Height = 15
        Size.Values = (
          39.687500000000000000
          103.187500000000000000
          7.937500000000000000
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
      object qrlbResolucion: TQRLabel
        Left = 45
        Top = 19
        Width = 288
        Height = 15
        Size.Values = (
          39.687500000000000000
          119.062500000000000000
          50.270833333333330000
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
      object QRLabel58: TQRLabel
        Left = 667
        Top = 704
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1764.770833333333000000
          1862.666666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRShape11: TQRShape
        Left = 0
        Top = 378
        Width = 624
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1000.125000000000000000
          1651.000000000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape71: TQRShape
        Left = 623
        Top = 378
        Width = 117
        Height = 21
        Size.Values = (
          55.562500000000000000
          1648.354166666667000000
          1000.125000000000000000
          309.562500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 645
        Top = 380
        Width = 147
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          1005.416666666667000000
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
      object QRLabel1: TQRLabel
        Left = 5
        Top = 381
        Width = 240
        Height = 15
        Size.Values = (
          39.687500000000000000
          13.229166666666670000
          1008.062500000000000000
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
      object qrlBarras: TArtQRLabel
        Left = 20
        Top = 39
        Width = 317
        Height = 21
        Size.Values = (
          55.562500000000000000
          52.916666666666660000
          103.187500000000000000
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
        Top = 61
        Width = 317
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666660000
          161.395833333333300000
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
      Top = 437
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
      Top = 456
      Width = 740
      Height = 550
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1455.208333333333000000
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
          791.104166666666700000
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
        Top = 223
        Width = 37
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          590.020833333333300000
          97.895833333333330000)
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
          590.020833333333300000
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
          590.020833333333300000
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
          735.541666666666700000
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
        Left = 18
        Top = 264
        Width = 698
        Height = 36
        Size.Values = (
          95.250000000000000000
          47.625000000000000000
          698.500000000000000000
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
          
            '         De acuerdo a lo dispuesto en el Art. 3 de la resoluci'#243'n' +
            ' S.R.T. N'#186' 51/97 y en base a la informaci'#243'n recibida, aprobamos ' +
            'el  Plan  de  Seguridad para  obras  repetitivas.  Cumplimos  en' +
            '  informarles,  que  a  fin  de verificar  la  implementaci'#243'n de' +
            'l Programa  de  Seguridad  proponemos, en  principio, que  perso' +
            'nal t'#233'cnico de PROVINCIA ART visite la  obra de  acuerdo  al  si' +
            'guiente cronograma.'
          '')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRShape45: TQRShape
        Left = 0
        Top = 304
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          804.333333333333200000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 124
        Top = 304
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          804.333333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 171
        Top = 307
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          452.437500000000000000
          812.270833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRShape46: TQRShape
        Left = 247
        Top = 304
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          804.333333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape39: TQRShape
        Left = 0
        Top = 325
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          859.895833333333400000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape41: TQRShape
        Left = 124
        Top = 325
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          859.895833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Left = 247
        Top = 325
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          859.895833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Left = 0
        Top = 346
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          915.458333333333200000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 124
        Top = 346
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          915.458333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape54: TQRShape
        Left = 247
        Top = 346
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          915.458333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Left = 0
        Top = 367
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          971.020833333333400000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Left = 124
        Top = 367
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          971.020833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape60: TQRShape
        Left = 247
        Top = 367
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          971.020833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object lblfirmaprofart: TQRLabel
        Left = 88
        Top = 493
        Width = 120
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          1304.395833333333000000
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
      object QRLabel54: TQRLabel
        Left = 47
        Top = 478
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          124.354166666666700000
          1264.708333333333000000
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
      object QRLabel55: TQRLabel
        Left = 515
        Top = 477
        Width = 205
        Height = 14
        Size.Values = (
          37.041666666666670000
          1362.604166666667000000
          1262.062500000000000000
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
        Left = 584
        Top = 491
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          1299.104166666667000000
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
        Top = 531
        Width = 517
        Height = 14
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          1404.937500000000000000
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
      object QRShape64: TQRShape
        Left = 0
        Top = 388
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1026.583333333333000000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape65: TQRShape
        Left = 124
        Top = 388
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          1026.583333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape66: TQRShape
        Left = 247
        Top = 388
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          1026.583333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrLabelVisita2: TQRLabel
        Left = 163
        Top = 329
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          870.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita8: TQRLabel
        Left = 163
        Top = 350
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          926.041666666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita14: TQRLabel
        Left = 163
        Top = 370
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          978.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita20: TQRLabel
        Left = 163
        Top = 392
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          1037.166666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRShape43: TQRShape
        Left = 370
        Top = 304
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          804.333333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 370
        Top = 325
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          859.895833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 370
        Top = 346
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          915.458333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Left = 370
        Top = 388
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          1026.583333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Left = 370
        Top = 367
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          971.020833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrLabelVisita4: TQRLabel
        Left = 407
        Top = 329
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          870.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRLabel47: TQRLabel
        Left = 415
        Top = 307
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1098.020833333333000000
          812.270833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita10: TQRLabel
        Left = 407
        Top = 350
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          926.041666666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita16: TQRLabel
        Left = 407
        Top = 370
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          978.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita22: TQRLabel
        Left = 407
        Top = 392
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          1037.166666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRShape55: TQRShape
        Left = 493
        Top = 304
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          804.333333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Left = 493
        Top = 325
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          859.895833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape57: TQRShape
        Left = 493
        Top = 346
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          915.458333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 493
        Top = 367
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          971.020833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape61: TQRShape
        Left = 493
        Top = 388
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          1026.583333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape62: TQRShape
        Left = 616
        Top = 304
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          804.333333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape63: TQRShape
        Left = 616
        Top = 325
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          859.895833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape67: TQRShape
        Left = 616
        Top = 346
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          915.458333333333200000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape68: TQRShape
        Left = 616
        Top = 367
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          971.020833333333400000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape69: TQRShape
        Left = 616
        Top = 388
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          1026.583333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel49: TQRLabel
        Left = 292
        Top = 307
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          772.583333333333300000
          812.270833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita3: TQRLabel
        Left = 284
        Top = 329
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          751.416666666666700000
          870.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita9: TQRLabel
        Left = 284
        Top = 350
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          751.416666666666700000
          926.041666666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita15: TQRLabel
        Left = 284
        Top = 370
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          751.416666666666700000
          978.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita21: TQRLabel
        Left = 284
        Top = 392
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          751.416666666666700000
          1037.166666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRLabel38: TQRLabel
        Left = 43
        Top = 307
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          113.770833333333300000
          812.270833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita1: TQRLabel
        Left = 35
        Top = 329
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          870.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita7: TQRLabel
        Left = 35
        Top = 350
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          926.041666666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita13: TQRLabel
        Left = 35
        Top = 370
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          978.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita19: TQRLabel
        Left = 35
        Top = 392
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          1037.166666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRLabel50: TQRLabel
        Left = 547
        Top = 307
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1447.270833333333000000
          812.270833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita5: TQRLabel
        Left = 539
        Top = 329
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1426.104166666667000000
          870.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita11: TQRLabel
        Left = 539
        Top = 350
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1426.104166666667000000
          926.041666666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita17: TQRLabel
        Left = 539
        Top = 370
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1426.104166666667000000
          978.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita23: TQRLabel
        Left = 539
        Top = 392
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1426.104166666667000000
          1037.166666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita6: TQRLabel
        Left = 659
        Top = 329
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1743.604166666667000000
          870.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita12: TQRLabel
        Left = 659
        Top = 350
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1743.604166666667000000
          926.041666666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita18: TQRLabel
        Left = 659
        Top = 370
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1743.604166666667000000
          978.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita24: TQRLabel
        Left = 659
        Top = 392
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1743.604166666667000000
          1037.166666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
        Left = 89
        Top = 468
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          235.479166666666700000
          1238.250000000000000000
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
      object QRShape74: TQRShape
        Left = 0
        Top = 409
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1082.145833333333000000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape75: TQRShape
        Left = 124
        Top = 409
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          1082.145833333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape76: TQRShape
        Left = 247
        Top = 409
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          1082.145833333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape77: TQRShape
        Left = 0
        Top = 430
        Width = 125
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1137.708333333333000000
          330.729166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape78: TQRShape
        Left = 124
        Top = 430
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          328.083333333333400000
          1137.708333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape79: TQRShape
        Left = 247
        Top = 430
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          653.520833333333400000
          1137.708333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrLabelVisita26: TQRLabel
        Left = 163
        Top = 412
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          1090.083333333333000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita32: TQRLabel
        Left = 163
        Top = 434
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          431.270833333333300000
          1148.291666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRShape80: TQRShape
        Left = 370
        Top = 430
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          1137.708333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape81: TQRShape
        Left = 370
        Top = 409
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          978.958333333333200000
          1082.145833333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrLabelVisita28: TQRLabel
        Left = 407
        Top = 412
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          1090.083333333333000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita34: TQRLabel
        Left = 407
        Top = 434
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          1148.291666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRShape82: TQRShape
        Left = 493
        Top = 409
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          1082.145833333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape83: TQRShape
        Left = 493
        Top = 430
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1304.395833333333000000
          1137.708333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape84: TQRShape
        Left = 616
        Top = 409
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          1082.145833333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape85: TQRShape
        Left = 616
        Top = 430
        Width = 124
        Height = 22
        Size.Values = (
          58.208333333333340000
          1629.833333333333000000
          1137.708333333333000000
          328.083333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrLabelVisita27: TQRLabel
        Left = 284
        Top = 412
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          751.416666666666700000
          1090.083333333333000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita33: TQRLabel
        Left = 284
        Top = 434
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          751.416666666666700000
          1148.291666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita25: TQRLabel
        Left = 35
        Top = 412
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          1090.083333333333000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita31: TQRLabel
        Left = 35
        Top = 434
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          92.604166666666670000
          1148.291666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita29: TQRLabel
        Left = 539
        Top = 412
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1426.104166666667000000
          1090.083333333333000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita35: TQRLabel
        Left = 539
        Top = 434
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1426.104166666667000000
          1148.291666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita30: TQRLabel
        Left = 659
        Top = 412
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1743.604166666667000000
          1090.083333333333000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object qrLabelVisita36: TQRLabel
        Left = 659
        Top = 434
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1743.604166666667000000
          1148.291666666667000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
        Left = 667
        Top = 307
        Width = 34
        Height = 15
        Size.Values = (
          39.687500000000000000
          1764.770833333333000000
          812.270833333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
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
      object QRLabel45: TQRLabel
        Left = 7
        Top = 514
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          1359.958333333333000000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Preventor:'
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
      object QRDBText5: TQRDBText
        Left = 91
        Top = 513
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          240.770833333333300000
          1357.312500000000000000
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
      '            WHERE pv_codigo = es_provincia) AS domicilio_estab,'
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
      '            WHERE pv_codigo = dc_provincia) AS domicilio,'
      
        '       NVL (es_telefonos, dc_telefonos) telefono, ac_descripcion' +
        ','
      '       (SELECT it_nombre'
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
      '--   AND aes.es_fechabaja IS NULL'
      '--   AND co_estado = '#39'1'#39
      '   AND em_cuit = :cuit'
      '   AND es_nroestableci = :estableci'
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
      '       ao_fecharecepcion, ps_requierefechaanexo, ps_fechaanexo,'
      
        '       TO_CHAR (ps_fechaaprobado, '#39'DD "de" Month "de" YYYY'#39') AS ' +
        'fechaaprobado,'
      '       (   ct_contacto'
      '        || '#39' '#39
      '        || NVL (ct_telefonos,'
      
        '                art.afi.get_telefonos ('#39'ATN_TELEFONOCONTACTO'#39', c' +
        't_id)'
      '               )'
      '       ) AS ct_contacto,'
      '       oc_descripcion, ao_observaciones,'
      
        '       ART.archivo.get_codbarrasclave ('#39'CAR'#39', ar_nrorecepcion) c' +
        'odbarrasclave'
      '  FROM hys.har_avisoobranrorecepcion,'
      '       hys.hps_programaseguridad,'
      '       afi.act_contacto,'
      '       hys.hoc_obrascomitente,'
      '       art.pao_avisoobra'
      ' WHERE ar_cuit = ps_cuit(+)'
      '   AND ar_estableci = ps_establecimiento(+)'
      '   AND ar_cuit = :cuit'
      '   AND ao_cuit(+) = ar_cuit'
      '   AND ao_estableci(+) = ar_estableci'
      '   AND ao_tipo(+) = :tipo'
      '   AND ar_estableci = :estableci'
      '   AND ps_contacto = ct_id(+)'
      '   AND oc_id(+) = ao_comitente')
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
      end>
  end
end
