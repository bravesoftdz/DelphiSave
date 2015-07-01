object rptInformeGestion: TrptInformeGestion
  Left = 424
  Top = 238
  Caption = 'Reporte de Informe de Gesti'#243'n'
  ClientHeight = 690
  ClientWidth = 1221
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
  object rptEventos: TQuickRep
    Left = 8
    Top = 0
    Width = 816
    Height = 1056
    IDReport = 0
    DataSet = sdqEvento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
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
      50.000000000000000000
      2794.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      60.000000000000000000
      50.000000000000000000
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
    object Q: TQRBand
      Left = 23
      Top = 19
      Width = 774
      Height = 318
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        841.375000000000000000
        2047.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object qrlCUIT: TQRLabel
        Left = 0
        Top = 206
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          545.041666666666700000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlCUIT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlCUIL: TQRLabel
        Left = 0
        Top = 227
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          600.604166666666700000
          92.604166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlCUIL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlNombreEmpresa: TQRLabel
        Left = 341
        Top = 206
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          902.229166666666700000
          545.041666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlNombreEmpresa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlContrato: TQRLabel
        Left = 640
        Top = 206
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          1693.333333333333000000
          545.041666666666700000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlContrato'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlSiniestro: TQRLabel
        Left = 640
        Top = 227
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1693.333333333333000000
          600.604166666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlSiniestro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlNombreTrabajador: TQRLabel
        Left = 336
        Top = 227
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          600.604166666666700000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlNombreTrabajador'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlJuzgado: TQRLabel
        Left = 0
        Top = 80
        Width = 54
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          211.666666666666700000
          142.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlJuzgado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlMontoDemandado: TQRLabel
        Left = 0
        Top = 104
        Width = 99
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          275.166666666666700000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlMontoDemandado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlReservaCapital: TQRLabel
        Left = 0
        Top = 128
        Width = 86
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          338.666666666666700000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlReservaCapital'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlEstado: TQRLabel
        Left = 0
        Top = 152
        Width = 46
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          402.166666666666700000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlEstado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlJurisdiccion: TQRLabel
        Left = 384
        Top = 80
        Width = 70
        Height = 19
        Size.Values = (
          50.270833333333330000
          1016.000000000000000000
          211.666666666666700000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlJurisdiccion'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlPorIncapacidadDemanda: TQRLabel
        Left = 384
        Top = 104
        Width = 132
        Height = 19
        Size.Values = (
          50.270833333333330000
          1016.000000000000000000
          275.166666666666700000
          349.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlPorIncapacidadDemanda'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlReservaHonorarios: TQRLabel
        Left = 192
        Top = 128
        Width = 107
        Height = 19
        Size.Values = (
          50.270833333333330000
          508.000000000000000000
          338.666666666666700000
          283.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlReservaHonorarios'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTotalReserva: TQRLabel
        Left = 384
        Top = 128
        Width = 77
        Height = 19
        Size.Values = (
          50.270833333333330000
          1016.000000000000000000
          338.666666666666700000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlTotalReserva'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTTPagos: TQRLabel
        Left = 640
        Top = 128
        Width = 55
        Height = 19
        Size.Values = (
          50.270833333333330000
          1693.333333333333000000
          338.666666666666700000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlTTPagos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTTEmbargo: TQRLabel
        Left = 640
        Top = 104
        Width = 67
        Height = 19
        Size.Values = (
          50.270833333333330000
          1693.333333333333000000
          275.166666666666700000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlTTEmbargo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 0
        Width = 774
        Height = 73
        Frame.Color = 12615680
        Size.Values = (
          193.145833333333300000
          0.000000000000000000
          0.000000000000000000
          2047.875000000000000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlNroJuicio: TQRLabel
        Left = 0
        Top = 42
        Width = 77
        Height = 18
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          111.125000000000000000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlNroJuicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlCaratula: TQRLabel
        Left = 151
        Top = 32
        Width = 471
        Height = 16
        Size.Values = (
          42.333333333333330000
          399.520833333333300000
          84.666666666666670000
          1246.187500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlCaratula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -12
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object qrlExpediente: TQRLabel
        Left = 692
        Top = 32
        Width = 76
        Height = 16
        Size.Values = (
          42.333333333333330000
          1830.916666666667000000
          84.666666666666670000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlExpediente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -12
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object qrlEstudioJuridico: TQRLabel
        Left = 666
        Top = 56
        Width = 100
        Height = 16
        Size.Values = (
          42.333333333333330000
          1762.125000000000000000
          148.166666666666700000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlEstudioJuridico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -12
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 101
        Top = 8
        Width = 571
        Height = 23
        Size.Values = (
          60.854166666666670000
          267.229166666666700000
          21.166666666666670000
          1510.770833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        AutoSize = False
        AutoStretch = True
        Caption = 'LL - INFORME DE GESTI'#211'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object qrlFechaNotificacion: TQRLabel
        Left = 384
        Top = 152
        Width = 99
        Height = 19
        Size.Values = (
          50.270833333333330000
          1016.000000000000000000
          402.166666666666700000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlFechaNotificacion'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlFechaFin: TQRLabel
        Left = 640
        Top = 152
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          1693.333333333333000000
          402.166666666666700000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlFechaFin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlFechaAccidente: TQRLabel
        Left = 0
        Top = 248
        Width = 92
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          656.166666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlFechaAccidente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlEdad: TQRLabel
        Left = 384
        Top = 272
        Width = 37
        Height = 19
        Size.Values = (
          50.270833333333330000
          1016.000000000000000000
          719.666666666666700000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlEdad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlGravedad: TQRLabel
        Left = 384
        Top = 248
        Width = 61
        Height = 19
        Size.Values = (
          50.270833333333330000
          1016.000000000000000000
          656.166666666666700000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'qrlGravedad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlTipoSiniestro: TQRLabel
        Left = 0
        Top = 272
        Width = 75
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          719.666666666666700000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlTipoSiniestro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 290
        Width = 774
        Height = 24
        Frame.Color = 12615680
        Size.Values = (
          63.500000000000000000
          0.000000000000000000
          767.291666666666800000
          2047.875000000000000000)
        XLColumn = 0
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrDetalleChecks: TQRLabel
        Left = 0
        Top = 294
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          777.875000000000000000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrDetalleChecks'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 197
        Width = 777
        Height = 7
        Frame.Color = clSilver
        Size.Values = (
          18.520833333333330000
          0.000000000000000000
          521.229166666666800000
          2055.812500000000000000)
        XLColumn = 0
        Pen.Color = clSilver
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlRSPL: TQRLabel
        Left = 0
        Top = 177
        Width = 39
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          468.312500000000000000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = True
        AutoStretch = True
        Caption = 'qrlRSPL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object qrbDetalle: TQRBand
      Left = 23
      Top = 397
      Width = 774
      Height = 37
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRGroup1
      Size.Values = (
        97.895833333333330000
        2047.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qrdNroEvento: TQRDBText
        Left = 3
        Top = 2
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          5.291666666666667000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEvento
        DataField = 'fecha'
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
      object qrdDecripcionEvento: TQRDBText
        Left = 2
        Top = 17
        Width = 227
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          44.979166666666670000
          600.604166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqEvento
        DataField = 'descripcion'
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
      object qrdObservaciones: TQRDBText
        Left = 235
        Top = 2
        Width = 534
        Height = 30
        Size.Values = (
          79.375000000000000000
          621.770833333333400000
          5.291666666666667000
          1412.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqEvento
        DataField = 'observacion'
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
    end
    object QRGroup1: TQRGroup
      Left = 23
      Top = 377
      Width = 774
      Height = 20
      AlignToBottom = False
      Color = clBlack
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2047.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = rptEventos
      ReprintOnNewPage = True
      object QRLabel2: TQRLabel
        Left = 12
        Top = 1
        Width = 128
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          2.645833333333333000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'FECHA/DESCRIPCI'#211'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 303
        Top = 1
        Width = 87
        Height = 16
        Size.Values = (
          42.333333333333330000
          801.687500000000000000
          2.645833333333333000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'OBSERVACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    object ChildBand1: TQRChildBand
      Left = 23
      Top = 434
      Width = 774
      Height = 2
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2047.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbDetalle
      PrintOrder = cboAfterParent
    end
    object cbMediacion: TQRChildBand
      Left = 23
      Top = 337
      Width = 774
      Height = 40
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2047.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = Q
      PrintOrder = cboAfterParent
    end
    object SummaryBand1: TQRBand
      Left = 23
      Top = 436
      Width = 774
      Height = 31
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2047.875000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRSysData1: TQRSysData
        Left = 176
        Top = 7
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          18.520833333333330000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 12
        Top = 7
        Width = 114
        Height = 16
        Size.Values = (
          42.333333333333330000
          31.750000000000000000
          18.520833333333330000
          301.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'Fecha de Impresi'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
  end
  object fpSeleccionArchivos: TFormPanel
    Left = 395
    Top = 411
    Width = 461
    Height = 155
    HelpContext = 7
    Caption = 'Selecci'#243'n Archivos'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      461
      155)
    object bvSeparadorBotonesEventos: TBevel
      Left = 4
      Top = 118
      Width = 454
      Height = 4
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAccAceptar: TButton
      Left = 299
      Top = 126
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAccAceptarClick
    end
    object btnAccCancelar: TButton
      Left = 377
      Top = 126
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object cbEventosJuicios: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Eventos Juicios'
      TabOrder = 2
    end
    object cbTareasJuicios: TCheckBox
      Left = 8
      Top = 49
      Width = 97
      Height = 17
      Caption = 'Tareas Juicios'
      TabOrder = 3
    end
    object cbPericiasJuicios: TCheckBox
      Left = 8
      Top = 66
      Width = 97
      Height = 17
      Caption = 'Pericias Juicios'
      TabOrder = 4
    end
    object cbPagosJuicios: TCheckBox
      Left = 8
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Pagos Juicios'
      TabOrder = 5
    end
    object cbEmbargosJuicios: TCheckBox
      Left = 8
      Top = 99
      Width = 104
      Height = 17
      Caption = 'Embargos Juicios'
      TabOrder = 6
    end
    object cbSentenciaJuicios: TCheckBox
      Left = 192
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Sentencia Juicios'
      TabOrder = 7
    end
    object cbAdminstraciondeSiniestros: TCheckBox
      Left = 192
      Top = 83
      Width = 193
      Height = 17
      Caption = 'Adminstraci'#243'n de Siniestros'
      TabOrder = 8
    end
    object cbAdministraciondeIncapacidades: TCheckBox
      Left = 192
      Top = 66
      Width = 201
      Height = 17
      Caption = 'Administraci'#243'n de Incapacidades'
      TabOrder = 9
    end
    object cbAdministraciondeliquidacionesSolapaILPILT: TCheckBox
      Left = 192
      Top = 49
      Width = 246
      Height = 17
      Caption = 'Administraci'#243'n de liquidaciones Solapa ILP/ILT'
      TabOrder = 10
    end
    object cbResumen: TCheckBox
      Left = 8
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Resumen'
      TabOrder = 11
    end
  end
  object sdqEvento: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   et_fechaevento, te_descripcion, REPLACE(REPLACE(et_obse' +
        'rvaciones, CHR(10), '#39' '#39'), CHR(13), '#39' '#39') et_observaciones,'
      '         et_respuesta'
      
        '    FROM legales.let_eventojuicioentramite, legales.lte_tipoeven' +
        'to'
      '   WHERE et_idjuicioentramite = :idjuicio'
      '     AND et_idtipoevento = te_id'
      '     AND et_fechabaja IS NULL'
      'ORDER BY 1')
    Left = 19
    Top = 429
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idjuicio'
        ParamType = ptInput
      end>
  end
end
