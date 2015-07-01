object rptAltaJuicio: TrptAltaJuicio
  Left = 262
  Top = 180
  Caption = 'rptAltaJuicio'
  ClientHeight = 728
  ClientWidth = 860
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
    Left = -18
    Top = 2
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
    ReportTitle = 'Formulario Alta de Juicio'
    SnapToGrid = True
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbTitulo: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 835
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2209.270833333333000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object logo: TQRImage
        Left = 589
        Top = 2
        Width = 148
        Height = 59
        Size.Values = (
          156.104166666666700000
          1558.395833333333000000
          5.291666666666667000
          391.583333333333300000)
        XLColumn = 0
      end
      object QRLabel1: TQRLabel
        Left = 0
        Top = 64
        Width = 740
        Height = 23
        Size.Values = (
          60.854166666666680000
          0.000000000000000000
          169.333333333333300000
          1957.916666666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'ALTA JUICIO DEMANDADA (JD)'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object qrlNroJuicio: TQRLabel
        Left = 217
        Top = 104
        Width = 80
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          275.166666666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlNroJuicio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object lblcuit: TQRLabel
        Left = 8
        Top = 104
        Width = 37
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          275.166666666666700000
          97.895833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JD N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlNroSiniestro: TQRLabel
        Left = 217
        Top = 120
        Width = 98
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          317.500000000000000000
          259.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlNroSiniestro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 120
        Width = 73
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          317.500000000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Siniestro N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlFechaAlta: TQRLabel
        Left = 217
        Top = 136
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          359.833333333333300000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlFechaAlta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 136
        Width = 67
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          359.833333333333300000
          177.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha Alta'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlFechaNotificacion: TQRLabel
        Left = 217
        Top = 152
        Width = 131
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          402.166666666666700000
          346.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlFechaNotificacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 152
        Width = 135
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          402.166666666666700000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha Notificaci'#243'n JD'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel8: TQRLabel
        Left = 440
        Top = 120
        Width = 57
        Height = 19
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          317.500000000000000000
          150.812500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Orden N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlOrdenNro: TQRLabel
        Left = 545
        Top = 120
        Width = 82
        Height = 19
        Size.Values = (
          50.270833333333330000
          1441.979166666667000000
          317.500000000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlOrdenNro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel10: TQRLabel
        Left = 8
        Top = 208
        Width = 53
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          550.333333333333300000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Car'#225'tula'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlDemandante: TQRLabel
        Left = 228
        Top = 208
        Width = 98
        Height = 19
        Size.Values = (
          50.270833333333330000
          603.250000000000000000
          550.333333333333300000
          259.291666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlDemandante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel12: TQRLabel
        Left = 240
        Top = 192
        Width = 77
        Height = 19
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          508.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Demandante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel13: TQRLabel
        Left = 568
        Top = 192
        Width = 72
        Height = 19
        Size.Values = (
          50.270833333333330000
          1502.833333333333000000
          508.000000000000000000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Demandado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlDemandado: TQRLabel
        Left = 558
        Top = 208
        Width = 93
        Height = 19
        Size.Values = (
          50.270833333333330000
          1476.375000000000000000
          550.333333333333300000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlDemandado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel15: TQRLabel
        Left = 8
        Top = 224
        Width = 11
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          592.666666666666700000
          29.104166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 's/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlCaratula: TQRLabel
        Left = 240
        Top = 224
        Width = 73
        Height = 19
        Size.Values = (
          50.270833333333330000
          635.000000000000000000
          592.666666666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlCaratula'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel17: TQRLabel
        Left = 8
        Top = 256
        Width = 152
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          677.333333333333300000
          402.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RECLAMO y RESERVA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel18: TQRLabel
        Left = 8
        Top = 280
        Width = 58
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          740.833333333333300000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reclamo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlReclamo: TQRLabel
        Left = 217
        Top = 280
        Width = 60
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          740.833333333333300000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlReclamo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel20: TQRLabel
        Left = 8
        Top = 296
        Width = 164
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          783.166666666666700000
          433.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha del hecho generador'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlFechaReclamo: TQRLabel
        Left = 217
        Top = 296
        Width = 109
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          783.166666666666700000
          288.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlFechaReclamo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel22: TQRLabel
        Left = 8
        Top = 312
        Width = 161
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          825.500000000000000000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '$ Monto Reclamado ART'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlMontoReclamado: TQRLabel
        Left = 217
        Top = 312
        Width = 128
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          825.500000000000000000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlMontoReclamado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrLabelAcc: TQRLabel
        Left = 8
        Top = 360
        Width = 59
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          952.500000000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Accidente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlLabelEnf: TQRLabel
        Left = 440
        Top = 360
        Width = 75
        Height = 19
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          952.500000000000000000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Enfermedad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel34: TQRLabel
        Left = 440
        Top = 208
        Width = 11
        Height = 19
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          550.333333333333300000
          29.104166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'c/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel35: TQRLabel
        Left = 8
        Top = 392
        Width = 145
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1037.166666666667000000
          383.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ESTUDIO JUR'#205'DICO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlEstudioJuridico: TQRLabel
        Left = 217
        Top = 392
        Width = 119
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          1037.166666666667000000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlEstudioJuridico'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel37: TQRLabel
        Left = 8
        Top = 424
        Width = 131
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1121.833333333333000000
          346.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATOS DEL ACTOR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel38: TQRLabel
        Left = 8
        Top = 440
        Width = 128
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1164.166666666667000000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de nacimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlFechaNacimiento: TQRLabel
        Left = 217
        Top = 440
        Width = 127
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          1164.166666666667000000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlFechaNacimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel40: TQRLabel
        Left = 8
        Top = 456
        Width = 34
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1206.500000000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlEdad: TQRLabel
        Left = 217
        Top = 456
        Width = 52
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          1206.500000000000000000
          137.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlEdad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlLabelFalta: TQRLabel
        Left = 440
        Top = 440
        Width = 98
        Height = 19
        Size.Values = (
          50.270833333333330000
          1164.166666666667000000
          1164.166666666667000000
          259.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Falta Demanda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel44: TQRLabel
        Left = 8
        Top = 472
        Width = 53
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1248.833333333333000000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '$ Sueldo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlSueldo: TQRLabel
        Left = 217
        Top = 472
        Width = 60
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          1248.833333333333000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlSueldo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel46: TQRLabel
        Left = 8
        Top = 488
        Width = 166
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1291.166666666667000000
          439.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '% Incapacidad Reclamada'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlIncapacidadReclamada: TQRLabel
        Left = 217
        Top = 488
        Width = 162
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          1291.166666666667000000
          428.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlIncapacidadReclamada'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel48: TQRLabel
        Left = 8
        Top = 504
        Width = 203
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1333.500000000000000000
          537.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '% Incapacidad Comisi'#243'n M'#233'dica'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlIncapacidadComMedica: TQRLabel
        Left = 217
        Top = 504
        Width = 166
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          1333.500000000000000000
          439.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlIncapacidadComMedica'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel50: TQRLabel
        Left = 8
        Top = 536
        Width = 274
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1418.166666666667000000
          724.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Entrega de Documentaci'#243'n (Acuse de recibo)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlAccidente: TQRLabel
        Left = 217
        Top = 360
        Width = 80
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          952.500000000000000000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlAccidente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlEnfermedad: TQRLabel
        Left = 545
        Top = 360
        Width = 95
        Height = 19
        Size.Values = (
          50.270833333333330000
          1441.979166666667000000
          952.500000000000000000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlEnfermedad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlFaltaDemanda: TQRLabel
        Left = 545
        Top = 440
        Width = 112
        Height = 19
        Size.Values = (
          50.270833333333330000
          1441.979166666667000000
          1164.166666666667000000
          296.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlFaltaDemanda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRLabel4: TQRLabel
        Left = 32
        Top = 560
        Width = 111
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1481.666666666667000000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Demanda original'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape1: TQRShape
        Left = 11
        Top = 561
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1484.312500000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 32
        Top = 581
        Width = 127
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1537.229166666667000000
          336.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Carpeta de Siniestro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape2: TQRShape
        Left = 11
        Top = 582
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1539.875000000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 32
        Top = 602
        Width = 133
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1592.791666666667000000
          351.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Resumen de siniestro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape3: TQRShape
        Left = 11
        Top = 603
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1595.437500000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 32
        Top = 623
        Width = 140
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1648.354166666667000000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Evolutivo de Siniestro'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape4: TQRShape
        Left = 11
        Top = 624
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1651.000000000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 32
        Top = 664
        Width = 133
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666680000
          1756.833333333333000000
          351.895833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ficha del Trabajador'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape5: TQRShape
        Left = 11
        Top = 665
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1759.479166666667000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel14: TQRLabel
        Left = 32
        Top = 685
        Width = 124
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666680000
          1812.395833333333000000
          328.083333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ficha de la empresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape6: TQRShape
        Left = 11
        Top = 686
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1815.041666666667000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Left = 32
        Top = 644
        Width = 160
        Height = 19
        Size.Values = (
          50.270833333333330000
          84.666666666666670000
          1703.916666666667000000
          423.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Evolutivo de Incapacidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape13: TQRShape
        Left = 11
        Top = 645
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          29.104166666666670000
          1706.562500000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 336
        Top = 560
        Width = 288
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1481.666666666667000000
          762.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Carpeta de Prestaciones Dinerarias (Siniestro)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape7: TQRShape
        Left = 315
        Top = 561
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1484.312500000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel19: TQRLabel
        Left = 336
        Top = 581
        Width = 285
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1537.229166666667000000
          754.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fotocopia de Carpeta Prestaciones Dinerarias'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape8: TQRShape
        Left = 315
        Top = 582
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1539.875000000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 336
        Top = 602
        Width = 183
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1592.791666666667000000
          484.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recibos ILP (Original/Copia)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape9: TQRShape
        Left = 315
        Top = 603
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1595.437500000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 336
        Top = 623
        Width = 183
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1648.354166666667000000
          484.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recibos ILT (Original/Copia)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape10: TQRShape
        Left = 315
        Top = 624
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1651.000000000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 336
        Top = 664
        Width = 270
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1756.833333333333000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C.D. enviada a la Empresa (Original/Copia)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape11: TQRShape
        Left = 315
        Top = 665
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1759.479166666667000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel25: TQRLabel
        Left = 336
        Top = 685
        Width = 279
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1812.395833333333000000
          738.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Documentacion de respaldo enviada por mail'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape12: TQRShape
        Left = 315
        Top = 686
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1815.041666666667000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel27: TQRLabel
        Left = 336
        Top = 644
        Width = 271
        Height = 19
        Size.Values = (
          50.270833333333330000
          889.000000000000000000
          1703.916666666667000000
          717.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C.D. enviada al trabajador (Original/Copia)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape14: TQRShape
        Left = 315
        Top = 645
        Width = 16
        Height = 16
        Size.Values = (
          42.333333333333340000
          833.437500000000000000
          1706.562500000000000000
          42.333333333333340000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 59
        Top = 790
        Width = 243
        Height = 5
        Size.Values = (
          13.229166666666670000
          156.104166666666700000
          2090.208333333333000000
          642.937500000000000000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel28: TQRLabel
        Left = 72
        Top = 797
        Width = 205
        Height = 19
        Size.Values = (
          50.270833333333330000
          190.500000000000000000
          2108.729166666667000000
          542.395833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Recibe/Firma/Aclaraci'#243'n - Fecha'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRShape16: TQRShape
        Left = 395
        Top = 790
        Width = 94
        Height = 5
        Size.Values = (
          13.229166666666670000
          1045.104166666667000000
          2090.208333333333000000
          248.708333333333300000)
        XLColumn = 0
        Brush.Color = clWindow
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 424
        Top = 797
        Width = 38
        Height = 19
        Size.Values = (
          50.270833333333330000
          1121.833333333333000000
          2108.729166666667000000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Bodoni MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
    end
  end
end
