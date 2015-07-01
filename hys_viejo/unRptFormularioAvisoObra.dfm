object rptFormularioAvisodeObra: TrptFormularioAvisodeObra
  Left = 513
  Top = 76
  Caption = 'rptFormularioAvisodeObra'
  ClientHeight = 731
  ClientWidth = 1297
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
  object qrResolucion: TQuickRep
    Left = 32
    Top = -392
    Width = 816
    Height = 1344
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
    Page.PaperSize = Legal
    Page.Continuous = False
    Page.Values = (
      50.000000000000000000
      3556.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      50.000000000000000000
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
    ReportTitle = 'Formulario de Resoluci'#243'n'
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbTitle: TQRBand
      Left = 19
      Top = 84
      Width = 778
      Height = 1143
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        3024.187500000000000000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape32: TQRShape
        Left = 8
        Top = 1090
        Width = 757
        Height = 32
        Size.Values = (
          84.666666666666680000
          21.166666666666670000
          2883.958333333333000000
          2002.895833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 0
        Top = 598
        Width = 778
        Height = 60
        Size.Values = (
          158.750000000000000000
          0.000000000000000000
          1582.208333333333000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 0
        Top = 293
        Width = 778
        Height = 109
        Size.Values = (
          288.395833333333400000
          0.000000000000000000
          775.229166666666800000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object d: TQRShape
        Left = 0
        Top = 127
        Width = 778
        Height = 161
        Size.Values = (
          425.979166666666700000
          0.000000000000000000
          336.020833333333400000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 21
        Width = 778
        Height = 81
        Size.Values = (
          214.312500000000000000
          0.000000000000000000
          55.562500000000000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 4
        Top = 24
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          63.500000000000000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Raz'#243'n Social'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 4
        Top = 44
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          116.416666666666700000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Domicilio Legal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 0
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          0.000000000000000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel14: TQRLabel
        Left = 8
        Top = 2
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          5.291666666666667000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DATOS DE LA EMPRESA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 4
        Top = 64
        Width = 27
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          169.333333333333300000
          71.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C.P.A.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 83
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          219.604166666666700000
          74.083333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C.I.I.U.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 415
        Top = 24
        Width = 31
        Height = 16
        Size.Values = (
          42.333333333333330000
          1098.020833333333000000
          63.500000000000000000
          82.020833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C.U.I.T.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 396
        Top = 44
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          1047.750000000000000000
          116.416666666666700000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Localidad:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 592
        Top = 44
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          116.416666666666700000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 592
        Top = 64
        Width = 44
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          169.333333333333300000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telefono'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 41
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          108.479166666666700000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 61
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          161.395833333333300000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 0
        Top = 81
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          214.312500000000000000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object edRazonSocial: TQRLabel
        Left = 71
        Top = 24
        Width = 76
        Height = 16
        Size.Values = (
          42.333333333333330000
          187.854166666666700000
          63.500000000000000000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edRazonSocial'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edDomicilioLegal: TQRLabel
        Left = 88
        Top = 44
        Width = 92
        Height = 16
        Size.Values = (
          42.333333333333330000
          232.833333333333300000
          116.416666666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edDomicilioLegal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edCUIT: TQRLabel
        Left = 452
        Top = 24
        Width = 37
        Height = 16
        Size.Values = (
          42.333333333333330000
          1195.916666666667000000
          63.500000000000000000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edCUIT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edProvincia: TQRLabel
        Left = 644
        Top = 44
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1703.916666666667000000
          116.416666666666700000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edProvincia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edTelefono: TQRLabel
        Left = 643
        Top = 64
        Width = 134
        Height = 16
        Size.Values = (
          42.333333333333330000
          1701.270833333333000000
          169.333333333333300000
          354.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '1234567890123456789'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edCIIU: TQRLabel
        Left = 39
        Top = 83
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          103.187500000000000000
          219.604166666666700000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edCIIU'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edLocalidad: TQRLabel
        Left = 453
        Top = 44
        Width = 64
        Height = 16
        Size.Values = (
          42.333333333333330000
          1198.562500000000000000
          116.416666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edLocalidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edCPA: TQRLabel
        Left = 38
        Top = 64
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          100.541666666666700000
          169.333333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edCPA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 591
        Top = 24
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333330000
          1563.687500000000000000
          63.500000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contrato N'#176
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edContrato: TQRLabel
        Left = 652
        Top = 23
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333330000
          1725.083333333333000000
          60.854166666666670000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edContrato'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel35: TQRLabel
        Left = 592
        Top = 84
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          222.250000000000000000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Can.Emp.Adm'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 156
        Top = 64
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          412.750000000000000000
          169.333333333333300000
          84.666666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'E-mail'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edMail: TQRLabel
        Left = 195
        Top = 64
        Width = 36
        Height = 16
        Size.Values = (
          42.333333333333330000
          515.937500000000000000
          169.333333333333300000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edMail'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object lbactividad: TQRLabel
        Left = 157
        Top = 83
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          415.395833333333300000
          219.604166666666700000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Actividad (C.I.I.U.)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edActividad: TQRLabel
        Left = 246
        Top = 83
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333330000
          650.875000000000000000
          219.604166666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edActividad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 4
        Top = 130
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          343.958333333333300000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Calle/Ruta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 4
        Top = 150
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          396.875000000000000000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Localidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 0
        Top = 106
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          280.458333333333400000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 8
        Top = 108
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          285.750000000000000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DATOS DE LA OBRA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 4
        Top = 170
        Width = 186
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          449.791666666666700000
          492.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descripci'#243'n detallada del tipo de obra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 372
        Top = 150
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          984.250000000000000000
          396.875000000000000000
          124.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 592
        Top = 150
        Width = 27
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          396.875000000000000000
          71.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C.P.A.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 147
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          388.937500000000000000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 167
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          441.854166666666700000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 187
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          494.770833333333400000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object edCalle: TQRLabel
        Left = 61
        Top = 130
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          161.395833333333300000
          343.958333333333300000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edCalle'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edLocalidadObra: TQRLabel
        Left = 57
        Top = 150
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333330000
          150.812500000000000000
          396.875000000000000000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edLocalidadObra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edCPAObra: TQRLabel
        Left = 625
        Top = 150
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333330000
          1653.645833333333000000
          396.875000000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edCPAObra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edProvinciaObra: TQRLabel
        Left = 424
        Top = 150
        Width = 88
        Height = 16
        Size.Values = (
          42.333333333333330000
          1121.833333333333000000
          396.875000000000000000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edProvinciaObra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edDescripcionObra1: TQRLabel
        Left = 198
        Top = 170
        Width = 577
        Height = 16
        Size.Values = (
          42.333333333333330000
          523.875000000000000000
          449.791666666666700000
          1526.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel37: TQRLabel
        Left = 591
        Top = 130
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          1563.687500000000000000
          343.958333333333300000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#176'/Km.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edNroObra: TQRLabel
        Left = 632
        Top = 129
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333330000
          1672.166666666667000000
          341.312500000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edNroObra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 4
        Top = 209
        Width = 207
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          552.979166666666700000
          547.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Responsable de Hig. y Seg. (Nombre y Tel)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape11: TQRShape
        Left = 0
        Top = 207
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          547.687500000000000000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object edRespHigySeg1: TQRLabel
        Left = 223
        Top = 209
        Width = 92
        Height = 16
        Size.Values = (
          42.333333333333330000
          590.020833333333300000
          552.979166666666700000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edRespHigySeg1'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 227
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          600.604166666666800000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel55: TQRLabel
        Left = 4
        Top = 229
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          605.895833333333300000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Comitente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape13: TQRShape
        Left = 0
        Top = 246
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          650.875000000000000000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object edComitente: TQRLabel
        Left = 62
        Top = 229
        Width = 69
        Height = 16
        Size.Values = (
          42.333333333333330000
          164.041666666666700000
          605.895833333333300000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edComitente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel57: TQRLabel
        Left = 3
        Top = 249
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          7.937500000000000000
          658.812500000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Subcontratista'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel59: TQRLabel
        Left = 325
        Top = 229
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          859.895833333333300000
          605.895833333333300000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contratista Principal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edContratistaPrincipal: TQRLabel
        Left = 432
        Top = 229
        Width = 121
        Height = 16
        Size.Values = (
          42.333333333333330000
          1143.000000000000000000
          605.895833333333300000
          320.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edContratistaPrincipal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape14: TQRShape
        Left = 0
        Top = 265
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          701.145833333333400000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel67: TQRLabel
        Left = 4
        Top = 267
        Width = 149
        Height = 16
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          706.437500000000000000
          394.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de inicio de los trabajos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape16: TQRShape
        Left = 0
        Top = 265
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          701.145833333333400000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object edFechaInicioTrabajo: TQRLabel
        Left = 159
        Top = 267
        Width = 112
        Height = 17
        Size.Values = (
          44.979166666666670000
          420.687500000000000000
          706.437500000000000000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edFechaInicioTrabajo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel69: TQRLabel
        Left = 400
        Top = 268
        Width = 152
        Height = 16
        Size.Values = (
          42.333333333333330000
          1058.333333333333000000
          709.083333333333300000
          402.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha estimada de finalizaci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edFechaEstimadaFinalizacion: TQRLabel
        Left = 558
        Top = 267
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666670000
          1476.375000000000000000
          706.437500000000000000
          418.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edFechaEstimadaFinalizacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 313
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          828.145833333333200000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 8
        Top = 315
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          833.437500000000000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OBRAS DE INGENIER'#205'A CIVIL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel70: TQRLabel
        Left = 4
        Top = 295
        Width = 107
        Height = 16
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          780.520833333333300000
          283.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Superficie a construir:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edSuperficieaConstruir: TQRLabel
        Left = 126
        Top = 295
        Width = 123
        Height = 17
        Size.Values = (
          44.979166666666670000
          333.375000000000000000
          780.520833333333300000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edSuperficieaConstruir'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel72: TQRLabel
        Left = 400
        Top = 296
        Width = 95
        Height = 16
        Size.Values = (
          42.333333333333330000
          1058.333333333333000000
          783.166666666666700000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#250'mero de plantas:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edNumeroPlantas: TQRLabel
        Left = 511
        Top = 295
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          1352.020833333333000000
          780.520833333333300000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edNumeroPlantas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbCaminos: TQRCheckBox
        Left = 8
        Top = 355
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          939.270833333333400000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbCalles: TQRCheckBox
        Left = 8
        Top = 339
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          896.937500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbPuentes: TQRCheckBox
        Left = 8
        Top = 371
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          981.604166666666800000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbObrasHidraulicas: TQRCheckBox
        Left = 8
        Top = 387
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1023.937500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel12: TQRLabel
        Left = 24
        Top = 337
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          891.645833333333300000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Calles'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 24
        Top = 353
        Width = 42
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          933.979166666666700000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Caminos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 24
        Top = 369
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          976.312500000000000000
          108.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Puentes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel39: TQRLabel
        Left = 24
        Top = 385
        Width = 86
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1018.645833333333000000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Obras Hidr'#225'ulicas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbTuneles: TQRCheckBox
        Left = 288
        Top = 355
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          939.270833333333400000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbAeropuertos: TQRCheckBox
        Left = 288
        Top = 339
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          896.937500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbAlcantarillas: TQRCheckBox
        Left = 288
        Top = 371
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          981.604166666666800000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbPuertos: TQRCheckBox
        Left = 288
        Top = 387
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1023.937500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel40: TQRLabel
        Left = 304
        Top = 337
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          891.645833333333300000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Aeropuertos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 304
        Top = 353
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          933.979166666666700000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'T'#250'neles'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel42: TQRLabel
        Left = 304
        Top = 369
        Width = 238
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          976.312500000000000000
          629.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Alcantarillas / Tratamiento de aguas y efluentes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel43: TQRLabel
        Left = 304
        Top = 385
        Width = 39
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1018.645833333333000000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Puertos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbObrasFerroviarias: TQRCheckBox
        Left = 576
        Top = 355
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1524.000000000000000000
          939.270833333333400000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbAutopista: TQRCheckBox
        Left = 576
        Top = 339
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1524.000000000000000000
          896.937500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbOtros: TQRCheckBox
        Left = 576
        Top = 371
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1524.000000000000000000
          981.604166666666800000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel44: TQRLabel
        Left = 592
        Top = 337
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          891.645833333333300000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Autopistas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel45: TQRLabel
        Left = 592
        Top = 353
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          933.979166666666700000
          235.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Obras ferroviarias'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel46: TQRLabel
        Left = 592
        Top = 369
        Width = 27
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          976.312500000000000000
          71.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otros'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape15: TQRShape
        Left = 0
        Top = 401
        Width = 778
        Height = 76
        Size.Values = (
          201.083333333333300000
          0.000000000000000000
          1060.979166666667000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 0
        Top = 402
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1063.625000000000000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel48: TQRLabel
        Left = 8
        Top = 404
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          1068.916666666667000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OBRAS DE ARQUITECTURA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object cbViviendasUnifamiliares: TQRCheckBox
        Left = 8
        Top = 445
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1177.395833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbEdificiosPisosMultiples: TQRCheckBox
        Left = 8
        Top = 429
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1135.062500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbEdificiosComerciales: TQRCheckBox
        Left = 8
        Top = 461
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1219.729166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object lbEdificiosPisosMultiples: TQRLabel
        Left = 24
        Top = 427
        Width = 133
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1129.770833333333000000
          351.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edificios de Pisos M'#250'ltiples'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel50: TQRLabel
        Left = 24
        Top = 443
        Width = 117
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1172.104166666667000000
          309.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Viviendas Unifamiliares'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel51: TQRLabel
        Left = 24
        Top = 459
        Width = 104
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1214.437500000000000000
          275.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edificios Comerciales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbEdificiosOficinas: TQRCheckBox
        Left = 288
        Top = 445
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1177.395833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbObrasUrbanizacion: TQRCheckBox
        Left = 288
        Top = 429
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1135.062500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbOtrasEdificacionesUrbanas: TQRCheckBox
        Left = 288
        Top = 461
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1219.729166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel53: TQRLabel
        Left = 304
        Top = 427
        Width = 95
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1129.770833333333000000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Obras Urbanizaci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel54: TQRLabel
        Left = 304
        Top = 443
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1172.104166666667000000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edificios de Oficinas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel61: TQRLabel
        Left = 304
        Top = 459
        Width = 188
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1214.437500000000000000
          497.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otras edificaciones urbanas definitvas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbHospitales: TQRCheckBox
        Left = 576
        Top = 445
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1524.000000000000000000
          1177.395833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbEscuelas: TQRCheckBox
        Left = 576
        Top = 429
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1524.000000000000000000
          1135.062500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel63: TQRLabel
        Left = 592
        Top = 427
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          1129.770833333333000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Escuelas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel64: TQRLabel
        Left = 592
        Top = 443
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          1172.104166666667000000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hospitales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape18: TQRShape
        Left = 0
        Top = 477
        Width = 778
        Height = 76
        Size.Values = (
          201.083333333333300000
          0.000000000000000000
          1262.062500000000000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 0
        Top = 478
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1264.708333333333000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel52: TQRLabel
        Left = 8
        Top = 480
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          1270.000000000000000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OBRAS DE MONTAJE INDUSTRIAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object cbDestileriaRefineriasPetroquimicas: TQRCheckBox
        Left = 8
        Top = 521
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1378.479166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbDemasMontajesIndustriales: TQRCheckBox
        Left = 8
        Top = 505
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1336.145833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbObrasMineria: TQRCheckBox
        Left = 8
        Top = 537
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1420.812500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel62: TQRLabel
        Left = 24
        Top = 503
        Width = 142
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1330.854166666667000000
          375.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dem'#225's montajes Industriales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel65: TQRLabel
        Left = 24
        Top = 519
        Width = 188
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1373.187500000000000000
          497.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Destiler'#237'a / Refiner'#237'as / Petroqu'#237'micas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel66: TQRLabel
        Left = 24
        Top = 535
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1415.520833333333000000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Obras para la miner'#237'a'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbIndustriaManufactureraUrbana: TQRCheckBox
        Left = 288
        Top = 521
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1378.479166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbGeneracionElectrica: TQRCheckBox
        Left = 288
        Top = 505
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1336.145833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel74: TQRLabel
        Left = 304
        Top = 503
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1330.854166666667000000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Generaci'#243'n El'#233'ctrica'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel75: TQRLabel
        Left = 304
        Top = 519
        Width = 156
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1373.187500000000000000
          412.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Industria Manufacturera Urbana'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape21: TQRShape
        Left = 0
        Top = 599
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1584.854166666667000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel76: TQRLabel
        Left = 8
        Top = 601
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          1590.145833333333000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OBRAS DE REDES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel77: TQRLabel
        Left = 24
        Top = 624
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1651.000000000000000000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Comunicaciones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel78: TQRLabel
        Left = 24
        Top = 640
        Width = 181
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1693.333333333333000000
          478.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Transmisi'#243'n El'#233'ctrica en Alto Voltaje'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbTransmisionElectricaBajoVoltaje: TQRCheckBox
        Left = 288
        Top = 642
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1698.625000000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbOtrasObrasRedes: TQRCheckBox
        Left = 288
        Top = 626
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1656.291666666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel80: TQRLabel
        Left = 304
        Top = 624
        Width = 106
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1651.000000000000000000
          280.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otras Obras de Redes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel81: TQRLabel
        Left = 304
        Top = 640
        Width = 263
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1693.333333333333000000
          695.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Transmisi'#243'n El'#233'ctrica en Bajo Voltaje / Subestaciones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbComunicaciones: TQRCheckBox
        Left = 8
        Top = 627
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1658.937500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbTransmisionElectricaAltoVoltaje: TQRCheckBox
        Left = 8
        Top = 643
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1701.270833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRShape22: TQRShape
        Left = 0
        Top = 553
        Width = 778
        Height = 45
        Size.Values = (
          119.062500000000000000
          0.000000000000000000
          1463.145833333333000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 0
        Top = 554
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1465.791666666667000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel82: TQRLabel
        Left = 8
        Top = 556
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          1471.083333333333000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OBRAS DE DUCTOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel83: TQRLabel
        Left = 24
        Top = 579
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1531.937500000000000000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tuber'#237'as'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbEstaciones: TQRCheckBox
        Left = 288
        Top = 581
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1537.229166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel86: TQRLabel
        Left = 304
        Top = 579
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1531.937500000000000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estaciones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbTuberias: TQRCheckBox
        Left = 8
        Top = 582
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1539.875000000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel84: TQRLabel
        Left = 592
        Top = 579
        Width = 109
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          1531.937500000000000000
          288.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otras Obras de Ductos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape25: TQRShape
        Left = 0
        Top = 657
        Width = 778
        Height = 76
        Size.Values = (
          201.083333333333300000
          0.000000000000000000
          1738.312500000000000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 0
        Top = 658
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1740.958333333333000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel79: TQRLabel
        Left = 8
        Top = 660
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          1746.250000000000000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OTRAS CONSTRUCCIONES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object cbExcavacionesSubterraneas: TQRCheckBox
        Left = 8
        Top = 701
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1854.729166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbReparacionesRefacciones: TQRCheckBox
        Left = 8
        Top = 685
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1812.395833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbInstalacionesElectromecanicas: TQRCheckBox
        Left = 8
        Top = 717
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          1897.062500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel85: TQRLabel
        Left = 24
        Top = 683
        Width = 136
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1807.104166666667000000
          359.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reparaciones / Refacciones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel87: TQRLabel
        Left = 24
        Top = 699
        Width = 135
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1849.437500000000000000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Excavaciones Subterr'#225'neas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel88: TQRLabel
        Left = 24
        Top = 715
        Width = 153
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          1891.770833333333000000
          404.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instalaciones Electromecanicas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbInstalacionesHidraulicas: TQRCheckBox
        Left = 288
        Top = 701
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1854.729166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbOtrasObrasNoEspecificadas: TQRCheckBox
        Left = 288
        Top = 685
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1812.395833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel89: TQRLabel
        Left = 304
        Top = 683
        Width = 142
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1807.104166666667000000
          375.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otras obras No Espec'#237'ficadas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel90: TQRLabel
        Left = 304
        Top = 699
        Width = 226
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1849.437500000000000000
          597.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instalaciones Hidr'#225'ulicas / Sanitarias y de gas'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbInstalacionesAireAcondicionado: TQRCheckBox
        Left = 288
        Top = 718
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          762.000000000000000000
          1899.708333333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel91: TQRLabel
        Left = 304
        Top = 716
        Width = 175
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          1894.416666666667000000
          463.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Instalaciones de aire acondicionado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape27: TQRShape
        Left = 0
        Top = 740
        Width = 778
        Height = 245
        Size.Values = (
          648.229166666666800000
          0.000000000000000000
          1957.916666666667000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 0
        Top = 739
        Width = 779
        Height = 22
        Size.Values = (
          58.208333333333340000
          0.000000000000000000
          1955.270833333333000000
          2061.104166666667000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel92: TQRLabel
        Left = 8
        Top = 741
        Width = 270
        Height = 18
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          1960.562500000000000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ACTIVIDAD A EJECUTAR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object cbExcavacionSubsuelos: TQRCheckBox
        Left = 8
        Top = 782
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2069.041666666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbExcavacionSubmuraciones: TQRCheckBox
        Left = 8
        Top = 766
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2026.708333333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbDemolicionTotal: TQRCheckBox
        Left = 8
        Top = 798
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2111.375000000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel93: TQRLabel
        Left = 24
        Top = 764
        Width = 331
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2021.416666666667000000
          875.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          #191'Se realizan trabajos de submuraciones para tareas de excavaci'#243'n' +
          '?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel94: TQRLabel
        Left = 24
        Top = 780
        Width = 333
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2063.750000000000000000
          881.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          #191'Se realizan trabajos de excavaci'#243'n para la ejecuci'#243'n de subsuel' +
          'os?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel95: TQRLabel
        Left = 24
        Top = 796
        Width = 273
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2106.083333333333000000
          722.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realizan trabajos de demolici'#243'n total de estructura?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbExcavacion503: TQRCheckBox
        Left = 8
        Top = 830
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2196.041666666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbDemolicionParcial: TQRCheckBox
        Left = 8
        Top = 814
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2153.708333333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbSilletasAndamios: TQRCheckBox
        Left = 8
        Top = 859
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2272.770833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel99: TQRLabel
        Left = 24
        Top = 812
        Width = 283
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2148.416666666667000000
          748.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realizan trabajos de demolici'#243'n parcial de estructura?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel100: TQRLabel
        Left = 24
        Top = 827
        Width = 377
        Height = 28
        Size.Values = (
          74.083333333333340000
          63.500000000000000000
          2188.104166666667000000
          997.479166666666900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'Otras excavacaiones con m'#225's de 1,2 mts de profundidad, no inclui' +
          'das en la Res. 550/11, ni tuneles, galerias o mineria. Detallar:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel101: TQRLabel
        Left = 24
        Top = 857
        Width = 210
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2267.479166666667000000
          555.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se utilizan silletas o andamios colgantes?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbAltaMediaTension: TQRCheckBox
        Left = 8
        Top = 905
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2394.479166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbMas1000oMas4m: TQRCheckBox
        Left = 8
        Top = 875
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2315.104166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbIzaje: TQRCheckBox
        Left = 8
        Top = 921
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2436.812500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel102: TQRLabel
        Left = 24
        Top = 873
        Width = 376
        Height = 30
        Size.Values = (
          79.375000000000000000
          63.500000000000000000
          2309.812500000000000000
          994.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          #191'Tiene la obra m'#225's de 1000 m2 de superficie cubierta o se trabaj' +
          'a a m'#225's de 4 mts. De altura?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel103: TQRLabel
        Left = 24
        Top = 903
        Width = 243
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2389.187500000000000000
          642.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se trabaja en cercan'#237'as de alta o media tensi'#243'n?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel104: TQRLabel
        Left = 24
        Top = 919
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2431.520833333333000000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realiza izaje?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbHormigonArmado: TQRCheckBox
        Left = 8
        Top = 953
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2521.479166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbInstalacionesVarias: TQRCheckBox
        Left = 8
        Top = 937
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2479.145833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbObrasDetallar: TQRCheckBox
        Left = 8
        Top = 969
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          21.166666666666670000
          2563.812500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRLabel105: TQRLabel
        Left = 24
        Top = 935
        Width = 159
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2473.854166666667000000
          420.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realiza instalaciones varias?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel106: TQRLabel
        Left = 24
        Top = 951
        Width = 152
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2516.187500000000000000
          402.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se ejecuta hormig'#243'n armado?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel107: TQRLabel
        Left = 24
        Top = 967
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          2558.520833333333000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Otros (detallar)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel96: TQRLabel
        Left = 409
        Top = 764
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          1082.145833333333000000
          2021.416666666667000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edExcSubmuracionesInicio: TQRLabel
        Left = 488
        Top = 764
        Width = 142
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2021.416666666667000000
          375.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edExcSubmuracionesInicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel98: TQRLabel
        Left = 601
        Top = 764
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1590.145833333333000000
          2021.416666666667000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Fin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edExcSubmuracionesHasta: TQRLabel
        Left = 674
        Top = 764
        Width = 144
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          2021.416666666667000000
          381.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edExcSubmuracionesHasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel109: TQRLabel
        Left = 409
        Top = 780
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          1082.145833333333000000
          2063.750000000000000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edExcSubsuelosInicio: TQRLabel
        Left = 488
        Top = 780
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2063.750000000000000000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edExcSubsuelosInicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel111: TQRLabel
        Left = 601
        Top = 780
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1590.145833333333000000
          2063.750000000000000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Fin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edExcSubsuelosHasta: TQRLabel
        Left = 674
        Top = 780
        Width = 117
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          2063.750000000000000000
          309.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edExcSubsuelosHasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel117: TQRLabel
        Left = 409
        Top = 796
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          1082.145833333333000000
          2106.083333333333000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edDemTotalInicio: TQRLabel
        Left = 488
        Top = 796
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2106.083333333333000000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edDemTotalInicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel119: TQRLabel
        Left = 601
        Top = 796
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1590.145833333333000000
          2106.083333333333000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Fin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edDemTotalHasta: TQRLabel
        Left = 674
        Top = 796
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          2106.083333333333000000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edDemTotalHasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel121: TQRLabel
        Left = 409
        Top = 828
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          1082.145833333333000000
          2190.750000000000000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edExc503Inicio: TQRLabel
        Left = 488
        Top = 828
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2190.750000000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edExc503Inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel123: TQRLabel
        Left = 601
        Top = 828
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1590.145833333333000000
          2190.750000000000000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Fin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edExc503Hasta: TQRLabel
        Left = 674
        Top = 828
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          2190.750000000000000000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edExc503Hasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel113: TQRLabel
        Left = 409
        Top = 812
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          1082.145833333333000000
          2148.416666666667000000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edDemParcialInicio: TQRLabel
        Left = 488
        Top = 812
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          2148.416666666667000000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edDemParcialInicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel115: TQRLabel
        Left = 601
        Top = 812
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          1590.145833333333000000
          2148.416666666667000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Fin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edDemParcialHasta: TQRLabel
        Left = 674
        Top = 812
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          2148.416666666667000000
          275.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edDemParcialHasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel125: TQRLabel
        Left = 425
        Top = 857
        Width = 178
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          2267.479166666667000000
          470.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realizan trabajos de alba'#241'ileria?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel126: TQRLabel
        Left = 425
        Top = 873
        Width = 201
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          2309.812500000000000000
          531.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realizan montajes electromecanicos?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel127: TQRLabel
        Left = 425
        Top = 890
        Width = 188
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          2354.791666666667000000
          497.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se construyen estructuras met'#225'licas?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel128: TQRLabel
        Left = 425
        Top = 906
        Width = 166
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          2397.125000000000000000
          439.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se realizan trabajos de pinturas?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel129: TQRLabel
        Left = 425
        Top = 922
        Width = 275
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          2439.458333333333000000
          727.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se utilizan ascensores, montacargas o montapersonas?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel130: TQRLabel
        Left = 425
        Top = 938
        Width = 195
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          2481.791666666667000000
          515.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #191'Se desarrollan tareas con electricidad?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbTareasElectricidad: TQRCheckBox
        Left = 409
        Top = 940
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1082.145833333333000000
          2487.083333333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbAscensoresMontacargas: TQRCheckBox
        Left = 409
        Top = 924
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1082.145833333333000000
          2444.750000000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbTrabajosPinturas: TQRCheckBox
        Left = 409
        Top = 908
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1082.145833333333000000
          2402.416666666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbEstructurasMetallicas: TQRCheckBox
        Left = 409
        Top = 892
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1082.145833333333000000
          2360.083333333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbMontajesElectromecanicos: TQRCheckBox
        Left = 409
        Top = 875
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1082.145833333333000000
          2315.104166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbTrabajosAlbanileria: TQRCheckBox
        Left = 409
        Top = 859
        Width = 10
        Height = 10
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1082.145833333333000000
          2272.770833333333000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object QRShape29: TQRShape
        Left = 0
        Top = 991
        Width = 778
        Height = 47
        Size.Values = (
          124.354166666666700000
          0.000000000000000000
          2622.020833333333000000
          2058.458333333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel131: TQRLabel
        Left = 6
        Top = 995
        Width = 135
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          2632.604166666667000000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Extensi'#243'n fecha fin de obra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel132: TQRLabel
        Left = 6
        Top = 1018
        Width = 96
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          2693.458333333333000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Suspensi'#243'n de obra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel133: TQRLabel
        Left = 182
        Top = 995
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          481.541666666666700000
          2632.604166666667000000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel134: TQRLabel
        Left = 182
        Top = 1018
        Width = 29
        Height = 15
        Size.Values = (
          39.687500000000000000
          481.541666666666700000
          2693.458333333333000000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hasta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edFechaextension: TQRLabel
        Left = 221
        Top = 995
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          2632.604166666667000000
          259.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edFechaextension'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edfechaSuspension: TQRLabel
        Left = 222
        Top = 1017
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          587.375000000000000000
          2690.812500000000000000
          277.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edfechaSuspension'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel137: TQRLabel
        Left = 407
        Top = 995
        Width = 146
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          2632.604166666667000000
          386.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Suspensi'#243'n de obra definitiva'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel138: TQRLabel
        Left = 407
        Top = 1018
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          1076.854166666667000000
          2693.458333333333000000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reinicia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edFechaSuspensionDefinitiva: TQRLabel
        Left = 590
        Top = 995
        Width = 161
        Height = 17
        Size.Values = (
          44.979166666666670000
          1561.041666666667000000
          2632.604166666667000000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edFechaSuspensionDefinitiva'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edFechaReinicia: TQRLabel
        Left = 591
        Top = 1017
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1563.687500000000000000
          2690.812500000000000000
          230.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edFechaReinicia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape30: TQRShape
        Left = 0
        Top = 1013
        Width = 777
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          2680.229166666667000000
          2055.812500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 8
        Top = 1042
        Width = 757
        Height = 45
        Size.Values = (
          119.062500000000000000
          21.166666666666670000
          2756.958333333333000000
          2002.895833333333000000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRMemo2: TQRMemo
        Left = 12
        Top = 1092
        Width = 745
        Height = 26
        Size.Values = (
          68.791666666666680000
          31.750000000000000000
          2889.250000000000000000
          1971.145833333334000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Res. SRT 51/97 - Art. 1'#176': "Los empleadores de la construcci'#243'n de' +
            'ber'#225'n comunicar, en forma fehaciente, a su Aseguradora de Riesgo' +
            's del Trabajo y con al menos (5) dias h'#225'biles de anticipaci'#243'n, l' +
            'a fecha de inicio de todo tipo de obra que emprendan."')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 5
      end
      object QRMemo3: TQRMemo
        Left = 12
        Top = 1126
        Width = 745
        Height = 14
        Size.Values = (
          37.041666666666670000
          31.750000000000000000
          2979.208333333333000000
          1971.145833333334000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Remitir este formulario a Carlos Pellegrini 91 (1009) CABA; v'#237'a ' +
            'fax al (011) 4819-2800 interno 4514; o v'#237'a e-mail a construccion' +
            '@provart.com.ar')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 5
      end
      object edCanEmpAdm: TQRLabel
        Left = 662
        Top = 83
        Width = 80
        Height = 16
        Size.Values = (
          42.333333333333330000
          1751.541666666667000000
          219.604166666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edCanEmpAdm'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel36: TQRLabel
        Left = 712
        Top = 84
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          1883.833333333333000000
          222.250000000000000000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prod.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edProd: TQRLabel
        Left = 744
        Top = 83
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          1968.500000000000000000
          219.604166666666700000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edProd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object edSubcontratista: TQRLabel
        Left = 81
        Top = 248
        Width = 93
        Height = 16
        Size.Values = (
          42.333333333333330000
          214.312500000000000000
          656.166666666666700000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edSubcontratista'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRMemo4: TQRMemo
        Left = 12
        Top = 1044
        Width = 745
        Height = 40
        Size.Values = (
          105.833333333333300000
          31.750000000000000000
          2762.250000000000000000
          1971.145833333334000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            'Res. SRT 550/2011 - Anexo I Punto 2 - Anexo II punto 2 - "Los em' +
            'pleadores de la construcci'#243'n, contratistas principales y sucontr' +
            'atistas, no podr'#225'n iniciar los trabajos si no cuentan con la apr' +
            'obaci'#243'n de los Programas de Seguridad por parte de las Asegurado' +
            'ras del Riesgos de Trabajo."'
          
            'Por tal motivo sugerimos tener en cuenta la presentaci'#243'n del Avi' +
            'so de inicio de Obra junto con el Programa de Seguridad pertinen' +
            'te.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 5
      end
      object edDescripcionObra2: TQRLabel
        Left = 5
        Top = 191
        Width = 769
        Height = 16
        Size.Values = (
          42.333333333333330000
          13.229166666666670000
          505.354166666666700000
          2034.645833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbOtrasObrasDuctos: TQRCheckBox
        Left = 576
        Top = 581
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          1524.000000000000000000
          1537.229166666667000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object edDetalleExc503: TQRLabel
        Left = 407
        Top = 840
        Width = 368
        Height = 17
        Size.Values = (
          44.979166666666670000
          1076.854166666667000000
          2222.500000000000000000
          973.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'edExc503Inicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 65
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        171.979166666666700000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object logo: TQRImage
        Left = 619
        Top = -1
        Width = 160
        Height = 67
        Size.Values = (
          177.270833333333300000
          1637.770833333333000000
          -2.645833333333333000
          423.333333333333300000)
        XLColumn = 0
        Stretch = True
      end
      object edFechaTitulo: TQRLabel
        Left = 15
        Top = 44
        Width = 70
        Height = 16
        Size.Values = (
          42.333333333333330000
          39.687500000000000000
          116.416666666666700000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'edFechaTitulo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 41
        Top = 7
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          108.479166666666700000
          18.520833333333330000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Aviso de Obra'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 169
        Top = 8
        Width = 55
        Height = 16
        Size.Values = (
          42.333333333333330000
          447.145833333333300000
          21.166666666666670000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Extensi'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 169
        Top = 24
        Width = 120
        Height = 16
        Size.Values = (
          42.333333333333330000
          447.145833333333300000
          63.500000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Suspensi'#243'n definitiva'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 41
        Top = 24
        Width = 63
        Height = 16
        Size.Values = (
          42.333333333333330000
          108.479166666666700000
          63.500000000000000000
          166.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Suspensi'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object cbAvisodeObra: TQRCheckBox
        Left = 23
        Top = 10
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          60.854166666666680000
          26.458333333333330000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbSuspension: TQRCheckBox
        Left = 23
        Top = 27
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          60.854166666666680000
          71.437500000000000000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbExtension: TQRCheckBox
        Left = 151
        Top = 11
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          399.520833333333400000
          29.104166666666670000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
      object cbSuspensionDefinitiva: TQRCheckBox
        Left = 151
        Top = 28
        Width = 10
        Height = 10
        Hint = 'Calles'
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          26.458333333333330000
          399.520833333333400000
          74.083333333333340000
          26.458333333333330000)
        XLColumn = 0
        TickStyle = tsCross
        Checked = False
      end
    end
    object PageFooterBand2: TQRBand
      Left = 19
      Top = 1227
      Width = 778
      Height = 84
      AlignToBottom = True
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        222.250000000000000000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel25: TQRLabel
        Left = 9
        Top = 73
        Width = 46
        Height = 11
        Size.Values = (
          29.104166666666670000
          23.812500000000000000
          193.145833333333300000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PV-01-F013'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object s: TQRShape
        Left = 54
        Top = 52
        Width = 294
        Height = 1
        Size.Values = (
          2.645833333333333000
          142.875000000000000000
          137.583333333333300000
          777.875000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel139: TQRLabel
        Left = 108
        Top = 56
        Width = 192
        Height = 17
        Size.Values = (
          44.979166666666670000
          285.750000000000000000
          148.166666666666700000
          508.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'Firma, aclaraci'#243'n y sello del empleador'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape33: TQRShape
        Left = 527
        Top = 10
        Width = 104
        Height = 70
        Size.Values = (
          185.208333333333300000
          1394.354166666667000000
          26.458333333333330000
          275.166666666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object edEstado: TQRLabel
        Left = 530
        Top = 61
        Width = 99
        Height = 16
        Size.Values = (
          42.333333333333340000
          1402.291666666667000000
          161.395833333333300000
          261.937500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'edEstado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape34: TQRShape
        Left = 538
        Top = 33
        Width = 82
        Height = 25
        Size.Values = (
          66.145833333333340000
          1423.458333333333000000
          87.312500000000000000
          216.958333333333400000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object edFechaSello: TQRLabel
        Left = 545
        Top = 37
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333330000
          1441.979166666667000000
          97.895833333333330000
          179.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'edFechaSello'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 531
        Top = 11
        Width = 95
        Height = 16
        Size.Values = (
          42.333333333333330000
          1404.937500000000000000
          29.104166666666670000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Caption = 'Provincia ART S.A.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
end
