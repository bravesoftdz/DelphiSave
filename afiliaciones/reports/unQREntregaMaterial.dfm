object QREntregaMaterial: TQREntregaMaterial
  Left = 575
  Top = 215
  Caption = 'Lote de Envio de Documentaci'#243'n a Estudio/Abogado'
  ClientHeight = 578
  ClientWidth = 800
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
  object qrpMaterial: TQuickRep
    Left = 1
    Top = 0
    Width = 816
    Height = 1056
    IDReport = 0
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
    SnapToGrid = True
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbDetailValoresYPeriodos: TQRBand
      Left = 38
      Top = 349
      Width = 740
      Height = 20
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666660000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape5: TQRShape
        Left = 0
        Top = 0
        Width = 549
        Height = 20
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          0.000000000000000000
          1452.562500000000000000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrdbDocumento: TQRDBText
        Left = 14
        Top = 2
        Width = 202
        Height = 16
        Size.Values = (
          42.333333333333340000
          37.041666666666670000
          5.291666666666667000
          534.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'ma_descripcion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
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
        Left = 390
        Top = 2
        Width = 155
        Height = 15
        Size.Values = (
          39.687500000000000000
          1031.875000000000000000
          5.291666666666667000
          410.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'cantidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 368
        Top = 0
        Width = 17
        Height = 20
        Size.Values = (
          52.916666666666660000
          973.666666666666900000
          0.000000000000000000
          44.979166666666670000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrbHeader: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 79
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        209.020833333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qriLogo: TQRImage
        Left = 576
        Top = 1
        Width = 163
        Height = 64
        Size.Values = (
          169.333333333333300000
          1524.000000000000000000
          2.645833333333333000
          431.270833333333400000)
        XLColumn = 0
        Stretch = True
      end
    end
    object qrgValores: TQRGroup
      Left = 38
      Top = 257
      Width = 740
      Height = 56
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
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
        148.166666666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sdqValoresYPeriodos.TIPO'
      FooterBand = qrbGroupFooterPeriodos
      Master = qrpMaterial
      ReprintOnNewPage = True
      object qrLeyenda: TQRLabel
        Left = 76
        Top = 8
        Width = 553
        Height = 41
        Size.Values = (
          108.479166666666700000
          201.083333333333300000
          21.166666666666670000
          1463.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'Por medio de la presente se deja constancia de haber recibido la' +
          ' documentaci'#243'n abajo detallada, de Provincia ART de acuerdo a la' +
          's normativas vigentes de la SRT.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object qcbValoresYPeriodos: TQRChildBand
      Left = 38
      Top = 313
      Width = 740
      Height = 36
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgValores
      PrintOrder = cboAfterParent
      object QRShape4: TQRShape
        Left = 0
        Top = 12
        Width = 549
        Height = 25
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          31.750000000000000000
          1452.562500000000000000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 12
        Top = 16
        Width = 146
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          42.333333333333340000
          386.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MATERIAL ENTREGADO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object qrbGroupFooterPeriodos: TQRBand
      Left = 38
      Top = 369
      Width = 740
      Height = 288
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        762.000000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRRecordatorio: TQRLabel
        Left = 4
        Top = 8
        Width = 553
        Height = 49
        Size.Values = (
          129.645833333333300000
          10.583333333333330000
          21.166666666666670000
          1463.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRRecordatorio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDisposicion: TQRLabel
        Left = 4
        Top = 64
        Width = 553
        Height = 85
        Size.Values = (
          224.895833333333300000
          10.583333333333330000
          169.333333333333300000
          1463.145833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRDisposicion'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 276
        Top = 264
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          730.250000000000000000
          698.500000000000000000
          129.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cargo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 276
        Top = 232
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          730.250000000000000000
          613.833333333333400000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Aclaraci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 276
        Top = 204
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          730.250000000000000000
          539.750000000000000000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Firma:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 276
        Top = 172
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          730.250000000000000000
          455.083333333333300000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recib'#237' Conforme'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object qrbSummaryBand: TQRBand
      Left = 38
      Top = 657
      Width = 740
      Height = 200
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        529.166666666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRDBImage1: TQRDBImage
        Left = 73
        Top = 43
        Width = 125
        Height = 109
        Size.Values = (
          289.151785714285700000
          192.767857142857100000
          113.392857142857100000
          330.729166666666700000)
        XLColumn = 0
        DataField = 'fi_firma'
        DataSet = sdqConsulta
        Stretch = True
      end
      object QRNombreFirmante: TQRDBText
        Left = 2
        Top = 151
        Width = 265
        Height = 17
        Size.Values = (
          45.357142857142850000
          5.669642857142857000
          400.654761904762000000
          701.145833333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'fi_firmante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRCaracterFirmante: TQRDBText
        Left = 2
        Top = 164
        Width = 265
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          433.916666666666700000
          701.145833333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'fi_caracter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object TitleBand1: TQRBand
      Left = 38
      Top = 117
      Width = 740
      Height = 140
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        370.416666666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object qrsFondoTitulos: TQRShape
        Left = 0
        Top = 34
        Width = 549
        Height = 64
        Size.Values = (
          169.333333333333300000
          0.000000000000000000
          89.958333333333340000
          1452.562500000000000000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object lbRazonSocial: TQRLabel
        Left = 4
        Top = 38
        Width = 92
        Height = 18
        Size.Values = (
          47.625000000000000000
          10.583333333333330000
          100.541666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RAZON SOCIAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lbCUIT: TQRLabel
        Left = 4
        Top = 58
        Width = 29
        Height = 18
        Size.Values = (
          47.625000000000000000
          10.583333333333330000
          153.458333333333300000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object lbContrato: TQRLabel
        Left = 4
        Top = 79
        Width = 69
        Height = 18
        Size.Values = (
          47.625000000000000000
          10.583333333333330000
          209.020833333333300000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CONTRATO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 108
        Top = 36
        Width = 9
        Height = 62
        Size.Values = (
          164.041666666666700000
          285.750000000000000000
          95.250000000000000000
          23.812500000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 114
        Width = 243
        Height = 18
        Size.Values = (
          47.625000000000000000
          10.583333333333330000
          301.625000000000000000
          642.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Constancia de Recepci'#243'n de Materiales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRfecha: TQRLabel
        Left = 456
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRfecha'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 52
        Width = 548
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          137.583333333333300000
          1449.916666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 73
        Width = 548
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          193.145833333333300000
          1449.916666666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 118
        Top = 38
        Width = 419
        Height = 18
        Size.Values = (
          47.625000000000000000
          312.208333333333400000
          100.541666666666700000
          1108.604166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 118
        Top = 58
        Width = 419
        Height = 18
        Size.Values = (
          47.625000000000000000
          312.208333333333400000
          153.458333333333300000
          1108.604166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'cuit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object lbNroContrato: TQRLabel
        Left = 118
        Top = 79
        Width = 88
        Height = 18
        Size.Values = (
          47.625000000000000000
          312.208333333333300000
          209.020833333333300000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lbNroContrato'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TA_DESCRIPCION TIPOCARPETA, ARCHIVO.GETDESCRIPCIONCLAVE(T' +
        'C_ID, AR_CLAVE) DESCRIPCIONCLAVE,'
      
        '       BO_NOMBRE ESTUDIOLEG, AR_OBSERVACIONES OBSERVACIONES, ACT' +
        'UALDATE FECHAALTA'
      
        '  FROM LEGALES.LBO_ABOGADO, RTC_TIPOCLAVE, RTA_TIPOARCHIVO, RAR_' +
        'ARCHIVO'
      ' WHERE AR_LOTE_ENTREGADOTERCEROS = :IdLote'
      '   AND AR_TIPO = TA_ID'
      '   AND TA_FORMULARIO = TC_CLAVE'
      '   AND AR_IDABOGADO = BO_ID'
      '')
    Left = 7
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdLote'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 8
    Top = 40
  end
end
