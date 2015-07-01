object frmRemitoDocumentacion: TfrmRemitoDocumentacion
  Left = 241
  Top = 78
  ClientHeight = 850
  ClientWidth = 1384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrRemito: TQuickRep
    Left = 24
    Top = 12
    Width = 1344
    Height = 816
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
    Page.Orientation = poLandscape
    Page.PaperSize = Legal
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      3556.000000000000000000
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
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbHeader: TQRBand
      Left = 38
      Top = 38
      Width = 1268
      Height = 155
      AlignToBottom = False
      BeforePrint = qrbHeaderBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        410.104166666666700000
        3354.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object lbNumeroRemito: TQRLabel
        Left = 500
        Top = 40
        Width = 268
        Height = 25
        Size.Values = (
          66.145833333333330000
          1322.916666666667000000
          105.833333333333300000
          709.083333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        AutoSize = False
        Caption = 'Remito de Documentaci'#243'n'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object QRLabel2: TQRLabel
        Left = 2
        Top = 134
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          354.541666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'C'#243'digo'
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
      object QRLabel3: TQRLabel
        Left = 72
        Top = 134
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          354.541666666666700000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha'
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
      object QRLabel4: TQRLabel
        Left = 140
        Top = 134
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          370.416666666666700000
          354.541666666666700000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Remitente'
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
      object QRLabel5: TQRLabel
        Left = 314
        Top = 134
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          830.791666666666700000
          354.541666666666700000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Usuario Destino'
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
      object QRLabel6: TQRLabel
        Left = 448
        Top = 134
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          354.541666666666700000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sector Destino'
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
      object QRLabel7: TQRLabel
        Left = 580
        Top = 134
        Width = 125
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          354.541666666666700000
          330.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tipo de Documento'
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
      object QRLabel8: TQRLabel
        Left = 720
        Top = 134
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          1905.000000000000000000
          354.541666666666700000
          248.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Observaciones'
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
      object QRLabel9: TQRLabel
        Left = 908
        Top = 134
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          2402.416666666667000000
          354.541666666666700000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'CUIL'
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
      object QRLabel10: TQRLabel
        Left = 1000
        Top = 134
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          2645.833333333333000000
          354.541666666666700000
          134.937500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nombre'
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
      object QRShape4: TQRShape
        Left = 1162
        Top = 53
        Width = 101
        Height = 18
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          47.625000000000000000
          3074.458333333333000000
          140.229166666666700000
          267.229166666666700000)
        XLColumn = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlAnio: TQRLabel
        Left = 1228
        Top = 55
        Width = 32
        Height = 14
        Size.Values = (
          37.041666666666670000
          3249.083333333333000000
          145.520833333333300000
          84.666666666666670000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '0001'
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
      object qrlMes: TQRLabel
        Left = 1199
        Top = 55
        Width = 23
        Height = 14
        Size.Values = (
          37.041666666666670000
          3172.354166666667000000
          145.520833333333300000
          60.854166666666670000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '01'
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
      object qrlDia: TQRLabel
        Left = 1165
        Top = 55
        Width = 26
        Height = 14
        Size.Values = (
          37.041666666666670000
          3082.395833333333000000
          145.520833333333300000
          68.791666666666670000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '01'
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
      object qrsSeparadorFecha1: TQRShape
        Left = 1191
        Top = 53
        Width = 9
        Height = 18
        Size.Values = (
          47.625000000000000000
          3151.187500000000000000
          140.229166666666700000
          23.812500000000000000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsSeparadorFecha2: TQRShape
        Left = 1223
        Top = 57
        Width = 4
        Height = 18
        Size.Values = (
          47.625000000000000000
          3235.854166666667000000
          150.812500000000000000
          10.583333333333330000)
        XLColumn = 0
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlNumero: TQRLabel
        Left = 985
        Top = 5
        Width = 275
        Height = 26
        Size.Values = (
          68.791666666666670000
          2606.145833333333000000
          13.229166666666670000
          727.604166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumero'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object qrlPagina: TQRLabel
        Left = 1092
        Top = 32
        Width = 169
        Height = 17
        Size.Values = (
          44.979166666666670000
          2889.250000000000000000
          84.666666666666670000
          447.145833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlPagina'
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
      object qrCodigoBarras: TQRLabel
        Left = 1056
        Top = 76
        Width = 207
        Height = 38
        Size.Values = (
          100.541666666666700000
          2794.000000000000000000
          201.083333333333300000
          547.687500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = '*12345678*'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Code39-Digits'
        Font.Style = []
        OnPrint = qrCodigoBarrasPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 28
      end
      object qriLogo: TQRImage
        Left = 5
        Top = 5
        Width = 163
        Height = 64
        Size.Values = (
          169.333333333333300000
          13.229166666666670000
          13.229166666666670000
          431.270833333333400000)
        XLColumn = 0
        Stretch = True
      end
      object QRLabel1: TQRLabel
        Left = 1165
        Top = 134
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          3082.395833333333000000
          354.541666666666700000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Sec. Trazabil.'
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
      object QRShape1: TQRShape
        Left = 2
        Top = 148
        Width = 1267
        Height = 8
        Size.Values = (
          21.166666666666670000
          5.291666666666667000
          391.583333333333300000
          3352.270833333333000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 193
      Width = 1268
      Height = 17
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        3354.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText10: TQRDBText
        Left = 1165
        Top = 1
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          3082.395833333333000000
          2.645833333333333000
          267.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'SECUENCIATRAZABIL'
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
      object QRDBText11: TQRDBText
        Left = 1000
        Top = 1
        Width = 161
        Height = 15
        Size.Values = (
          39.687500000000000000
          2645.833333333333000000
          2.645833333333333000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DR_NOMBRE'
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
      object qrdbCuil: TQRDBText
        Left = 908
        Top = 1
        Width = 86
        Height = 15
        Size.Values = (
          39.687500000000000000
          2402.416666666667000000
          2.645833333333333000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DR_CUIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = qrdbCuilPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 720
        Top = 1
        Width = 185
        Height = 15
        Size.Values = (
          39.687500000000000000
          1905.000000000000000000
          2.645833333333333000
          489.479166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DR_OBSERVACIONES'
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
      object QRDBText14: TQRDBText
        Left = 580
        Top = 1
        Width = 136
        Height = 15
        Size.Values = (
          39.687500000000000000
          1534.583333333333000000
          2.645833333333333000
          359.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'TB_DESCRIPCION'
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
      object QRDBText15: TQRDBText
        Left = 448
        Top = 1
        Width = 128
        Height = 15
        Size.Values = (
          39.687500000000000000
          1185.333333333333000000
          2.645833333333333000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'SC_DESCRIPCION'
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
      object QRDBText16: TQRDBText
        Left = 314
        Top = 1
        Width = 128
        Height = 15
        Size.Values = (
          39.687500000000000000
          830.791666666666700000
          2.645833333333333000
          338.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'USE_DEST'
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
      object QRDBText17: TQRDBText
        Left = 140
        Top = 1
        Width = 172
        Height = 15
        Size.Values = (
          39.687500000000000000
          370.416666666666700000
          2.645833333333333000
          455.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DR_REMITENTE'
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
      object QRDBText18: TQRDBText
        Left = 72
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DR_FECHA'
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
      object QRDBText19: TQRDBText
        Left = 2
        Top = 1
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          5.291666666666667000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DR_ID'
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
    object QRBand2: TQRBand
      Left = 38
      Top = 210
      Width = 1268
      Height = 148
      AlignToBottom = True
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        391.583333333333300000
        3354.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel12: TQRLabel
        Left = 71
        Top = 56
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          187.854166666666700000
          148.166666666666700000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Recibido por'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 71
        Top = 130
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          187.854166666666700000
          343.958333333333300000
          224.895833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 160
        Top = 64
        Width = 320
        Height = 8
        Size.Values = (
          21.166666666666670000
          423.333333333333300000
          169.333333333333300000
          846.666666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 160
        Top = 138
        Width = 320
        Height = 8
        Size.Values = (
          21.166666666666670000
          423.333333333333300000
          365.125000000000000000
          846.666666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 7
        Top = 13
        Width = 149
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          34.395833333333330000
          394.229166666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Cant. de Documentos:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRExpr3: TQRExpr
        Left = 161
        Top = 13
        Width = 133
        Height = 17
        Size.Values = (
          44.979166666666670000
          425.979166666666700000
          34.395833333333330000
          351.895833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'COUNT()'
        Mask = '#,###'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT DR_ID, DR_FECHA, DR_REMITENTE, USE_DEST.SE_NOMBRE USE_DES' +
        'T, USC_DEST.SC_DESCRIPCION, TB_DESCRIPCION,'
      
        '       DR_OBSERVACIONES, USE_REC.SE_NOMBRE USE_REC, DR_REMITO, D' +
        'R_CUIL, DR_NOMBRE, DR_NUMERODOCUMENTO,'
      
        '       DR_USUDESTINO, DR_SECTORDESTINO, DR_TIPODOCUMENTO, USE_DE' +
        'R.SE_NOMBRE USE_DER, DR_SECUENCIATRAZABIL SECUENCIATRAZABIL'
      
        '  FROM USE_USUARIOS USE_DER, USE_USUARIOS USE_REC, CTB_TABLAS, U' +
        'SC_SECTORES USC_DEST, USE_USUARIOS USE_DEST, CDR_DOCUMENTACIONRE' +
        'CIBIDA'
      ' WHERE DR_USUDESTINO = USE_DEST.SE_USUARIO(+)'
      '   AND DR_SECTORDESTINO = USC_DEST.SC_CODIGO'
      '   AND DR_DERIVADOA = USE_DER.SE_USUARIO(+)'
      '   AND DR_TIPODOCUMENTO = TB_CODIGO'
      '   AND TB_CLAVE = '#39'TDOCR'#39
      '   AND DR_USURECEPCION = USE_REC.SE_USUARIO(+)'
      '   AND DR_REMITO = :Remito'
      '   AND DR_FECHABAJA IS NULL'
      ' ORDER BY NVL(DR_SECUENCIATRAZABIL, DR_ID)'
      '')
    Left = 7
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Remito'
        ParamType = ptInput
      end>
  end
end
