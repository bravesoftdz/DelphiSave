object frmRptSolicitudReingreso: TfrmRptSolicitudReingreso
  Left = 0
  Top = 0
  Caption = 'frmRptSolicitudReingreso'
  ClientHeight = 750
  ClientWidth = 1243
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
  object qrSolicitudReingreso: TQuickRep
    Left = 8
    Top = 8
    Width = 1111
    Height = 1572
    IDReport = 0
    DataSet = sdqReporte
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
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 2
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
    ReportTitle = 'Solicitud de Reingreso'
    SnapToGrid = True
    Units = MM
    Zoom = 140
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrHeader: TQRBand
      Left = 53
      Top = 53
      Width = 1005
      Height = 122
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        230.565476190476200000
        1899.330357142857000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape5: TQRShape
        Left = 527
        Top = 2
        Width = 454
        Height = 117
        Size.Values = (
          221.116071428571400000
          995.967261904762000000
          3.779761904761905000
          858.005952380952400000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 539
        Top = 7
        Width = 434
        Height = 51
        Size.Values = (
          96.383928571428570000
          1018.645833333333000000
          13.229166666666670000
          820.208333333333500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CONSTANCIA DE SOLICITUD'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object QRLabel44: TQRLabel
        Left = 541
        Top = 64
        Width = 371
        Height = 51
        Size.Values = (
          96.383928571428570000
          1022.425595238095000000
          120.952380952381000000
          701.145833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DE REINGRESO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object QRLabel45: TQRLabel
        Left = 5
        Top = 33
        Width = 466
        Height = 64
        Size.Values = (
          120.952380952381000000
          9.449404761904763000
          62.366071428571420000
          880.684523809523800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ART: _____________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 28
      end
      object qrlART: TQRLabel
        Left = 118
        Top = 22
        Width = 350
        Height = 58
        Size.Values = (
          109.613095238095200000
          223.005952380952400000
          41.577380952380950000
          661.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Provincia ART S.A.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
    end
    object qrTitle: TQRBand
      Left = 53
      Top = 175
      Width = 1005
      Height = 25
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.247023809523810000
        1899.330357142857000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel2: TQRLabel
        Left = 1
        Top = 3
        Width = 108
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          5.669642857142857000
          204.107142857142800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'N'#176' DE SINIESTRO:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 115
        Top = 3
        Width = 195
        Height = 19
        Size.Values = (
          35.907738095238090000
          217.336309523809500000
          5.669642857142857000
          368.526785714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'SINIESTRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
    object qrbTrabajador: TQRChildBand
      Left = 53
      Top = 200
      Width = 1005
      Height = 124
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        234.345238095238100000
        1899.330357142857000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrTitle
      PrintOrder = cboAfterParent
      object QRLabel19: TQRLabel
        Left = 1
        Top = 27
        Width = 126
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          51.026785714285720000
          238.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Apellido y Nombre:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 1
        Top = 75
        Width = 39
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          141.741071428571400000
          73.705357142857140000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Calle:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel21: TQRLabel
        Left = 357
        Top = 99
        Width = 56
        Height = 19
        Size.Values = (
          35.907738095238090000
          674.687500000000000000
          187.098214285714300000
          105.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel. Fijo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 619
        Top = 27
        Width = 83
        Height = 19
        Size.Values = (
          35.907738095238090000
          1169.836309523810000000
          51.026785714285720000
          156.860119047619000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIL/DNI N'#176':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel78: TQRLabel
        Left = 272
        Top = 99
        Width = 22
        Height = 19
        Size.Values = (
          35.907738095238090000
          514.047619047619000000
          187.098214285714300000
          41.577380952380950000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CP:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel79: TQRLabel
        Left = 1
        Top = 99
        Width = 67
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          187.098214285714300000
          126.622023809523800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Provincia:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText19: TQRDBText
        Left = 129
        Top = 27
        Width = 77
        Height = 20
        Size.Values = (
          37.797619047619050000
          243.794642857142800000
          51.026785714285720000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TJ_NOMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText20: TQRDBText
        Left = 43
        Top = 75
        Width = 359
        Height = 20
        Size.Values = (
          37.797619047619050000
          81.264880952380970000
          141.741071428571400000
          678.467261904762000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'tj_calle'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText79: TQRDBText
        Left = 296
        Top = 99
        Width = 60
        Height = 20
        Size.Values = (
          37.797619047619050000
          559.404761904761900000
          187.098214285714300000
          113.392857142857100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TJ_CPOSTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 1
        Top = 51
        Width = 144
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          96.383928571428570000
          272.142857142857200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Nacimiento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText26: TQRDBText
        Left = 149
        Top = 51
        Width = 98
        Height = 20
        Size.Values = (
          37.797619047619050000
          281.592261904761900000
          96.383928571428570000
          185.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'tj_fnacimiento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 272
        Top = 51
        Width = 42
        Height = 18
        Size.Values = (
          34.017857142857150000
          514.047619047619000000
          96.383928571428570000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sexo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape12: TQRShape
        Left = 892
        Top = 16
        Width = 15
        Height = 91
        Size.Values = (
          171.979166666666700000
          1685.773809523810000000
          30.238095238095240000
          28.348214285714280000)
        XLColumn = 0
        Pen.Style = psClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText80: TQRDBText
        Left = 69
        Top = 99
        Width = 161
        Height = 19
        Size.Values = (
          35.907738095238090000
          130.401785714285700000
          187.098214285714300000
          304.270833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TRABAJADOR_PROVINCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText25: TQRDBText
        Left = 704
        Top = 26
        Width = 31
        Height = 20
        Size.Values = (
          37.797619047619050000
          1330.476190476191000000
          49.136904761904770000
          58.586309523809540000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CUIL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 1
        Top = 3
        Width = 980
        Height = 22
        Size.Values = (
          41.577380952380950000
          1.889880952380953000
          5.669642857142857000
          1852.083333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' DATOS DEL TRABAJADOR'
        Color = clNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRShape2: TQRShape
        Left = 332
        Top = 50
        Width = 21
        Height = 21
        Size.Values = (
          39.687500000000000000
          627.440476190476200000
          94.494047619047620000
          39.687500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText11: TQRDBText
        Left = 335
        Top = 51
        Width = 15
        Height = 19
        Size.Values = (
          35.907738095238090000
          633.110119047619100000
          96.383928571428570000
          28.348214285714280000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'sexo_M'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 373
        Top = 50
        Width = 21
        Height = 21
        Size.Values = (
          39.687500000000000000
          704.925595238095200000
          94.494047619047620000
          39.687500000000000000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText34: TQRDBText
        Left = 376
        Top = 51
        Width = 15
        Height = 19
        Size.Values = (
          35.907738095238090000
          710.595238095238000000
          96.383928571428570000
          28.348214285714280000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'sexo_F'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel31: TQRLabel
        Left = 316
        Top = 51
        Width = 14
        Height = 18
        Size.Values = (
          34.017857142857150000
          597.202380952380900000
          96.383928571428570000
          26.458333333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'M'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel32: TQRLabel
        Left = 361
        Top = 51
        Width = 10
        Height = 18
        Size.Values = (
          34.017857142857150000
          682.247023809523800000
          96.383928571428570000
          18.898809523809530000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'F'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel46: TQRLabel
        Left = 404
        Top = 75
        Width = 29
        Height = 19
        Size.Values = (
          35.907738095238090000
          763.511904761904800000
          141.741071428571400000
          54.806547619047620000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText29: TQRDBText
        Left = 434
        Top = 75
        Width = 56
        Height = 20
        Size.Values = (
          37.797619047619050000
          820.208333333333500000
          141.741071428571400000
          105.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'tj_numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel64: TQRLabel
        Left = 494
        Top = 75
        Width = 34
        Height = 19
        Size.Values = (
          35.907738095238090000
          933.601190476190600000
          141.741071428571400000
          64.255952380952380000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Piso:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText30: TQRDBText
        Left = 528
        Top = 75
        Width = 26
        Height = 19
        Size.Values = (
          35.907738095238090000
          997.857142857142800000
          141.741071428571400000
          49.136904761904770000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'tj_piso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText35: TQRDBText
        Left = 605
        Top = 75
        Width = 26
        Height = 19
        Size.Values = (
          35.907738095238090000
          1143.377976190476000000
          141.741071428571400000
          49.136904761904770000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'tj_departamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel65: TQRLabel
        Left = 558
        Top = 75
        Width = 46
        Height = 19
        Size.Values = (
          35.907738095238090000
          1054.553571428571000000
          141.741071428571400000
          86.934523809523810000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Depto:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel112: TQRLabel
        Left = 633
        Top = 75
        Width = 70
        Height = 19
        Size.Values = (
          35.907738095238090000
          1196.294642857143000000
          141.741071428571400000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Localidad:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText36: TQRDBText
        Left = 706
        Top = 75
        Width = 274
        Height = 19
        Size.Values = (
          35.907738095238090000
          1334.255952380952000000
          141.741071428571400000
          517.827380952381000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'tj_localidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText37: TQRDBText
        Left = 413
        Top = 99
        Width = 288
        Height = 19
        Size.Values = (
          35.907738095238090000
          780.520833333333400000
          187.098214285714300000
          544.285714285714300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TelFijo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel77: TQRLabel
        Left = 705
        Top = 99
        Width = 66
        Height = 19
        Size.Values = (
          35.907738095238090000
          1332.366071428571000000
          187.098214285714300000
          124.732142857142800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel.M'#243'vil:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText21: TQRDBText
        Left = 774
        Top = 99
        Width = 205
        Height = 19
        Size.Values = (
          35.907738095238090000
          1462.767857142857000000
          187.098214285714300000
          387.425595238095200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'Celular'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
    object qrbEmpresa: TQRChildBand
      Left = 53
      Top = 324
      Width = 1005
      Height = 55
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        103.943452380952400000
        1899.330357142857000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbTrabajador
      PrintOrder = cboAfterParent
      object QRLabel50: TQRLabel
        Left = 1
        Top = 29
        Width = 87
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          54.806547619047620000
          164.419642857142800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Raz'#243'n Social:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel49: TQRLabel
        Left = 706
        Top = 29
        Width = 35
        Height = 19
        Size.Values = (
          35.907738095238090000
          1334.255952380952000000
          54.806547619047620000
          66.145833333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText31: TQRDBText
        Left = 89
        Top = 29
        Width = 614
        Height = 19
        Size.Values = (
          35.907738095238090000
          168.199404761904800000
          54.806547619047620000
          1160.386904761905000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EMPRESA_NOMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText51: TQRDBText
        Left = 745
        Top = 29
        Width = 232
        Height = 19
        Size.Values = (
          35.907738095238090000
          1407.961309523810000000
          54.806547619047620000
          438.452380952381000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CUIT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrlDatosEmpDep: TQRLabel
        Left = 1
        Top = 3
        Width = 980
        Height = 22
        Size.Values = (
          41.577380952380950000
          1.889880952380953000
          5.669642857142857000
          1852.083333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' DATOS DEL EMPLEADOR'
        Color = clNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    object qrbPrestador: TQRChildBand
      Left = 53
      Top = 379
      Width = 1005
      Height = 979
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1850.193452380952000000
        1899.330357142857000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbEmpresa
      PrintOrder = cboAfterParent
      object QRLabel16: TQRLabel
        Left = 1
        Top = 26
        Width = 269
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          49.136904761904770000
          508.377976190476200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nombre del Establecimiento Asistencial:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 1
        Top = 51
        Width = 39
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          96.383928571428570000
          73.705357142857140000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Calle:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 706
        Top = 50
        Width = 70
        Height = 19
        Size.Values = (
          35.907738095238090000
          1334.255952380952000000
          94.494047619047620000
          132.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Localidad:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel54: TQRLabel
        Left = 706
        Top = 25
        Width = 35
        Height = 19
        Size.Values = (
          35.907738095238090000
          1334.255952380952000000
          47.247023809523810000
          66.145833333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel55: TQRLabel
        Left = 1
        Top = 75
        Width = 67
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          141.741071428571400000
          126.622023809523800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Provincia:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel56: TQRLabel
        Left = 296
        Top = 74
        Width = 22
        Height = 19
        Size.Values = (
          35.907738095238090000
          559.404761904761900000
          139.851190476190500000
          41.577380952380950000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CP:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 43
        Top = 50
        Width = 251
        Height = 19
        Size.Values = (
          35.907738095238090000
          81.264880952380970000
          94.494047619047620000
          474.360119047619100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ca_calle'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText18: TQRDBText
        Left = 69
        Top = 74
        Width = 226
        Height = 19
        Size.Values = (
          35.907738095238090000
          130.401785714285700000
          139.851190476190500000
          427.113095238095300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'prestador_provincia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText52: TQRDBText
        Left = 319
        Top = 74
        Width = 69
        Height = 19
        Size.Values = (
          35.907738095238090000
          602.872023809523800000
          139.851190476190500000
          130.401785714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ca_codpostal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel60: TQRLabel
        Left = 392
        Top = 74
        Width = 25
        Height = 19
        Size.Values = (
          35.907738095238090000
          740.833333333333400000
          139.851190476190500000
          47.247023809523810000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Tel:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel61: TQRLabel
        Left = 706
        Top = 74
        Width = 28
        Height = 19
        Size.Values = (
          35.907738095238090000
          1334.255952380952000000
          139.851190476190500000
          52.916666666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel62: TQRLabel
        Left = 1
        Top = 99
        Width = 35
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          187.098214285714300000
          66.145833333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mail:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape14: TQRShape
        Left = 873
        Top = 26
        Width = 15
        Size.Values = (
          122.842261904761900000
          1649.866071428572000000
          49.136904761904770000
          28.348214285714280000)
        XLColumn = 0
        Pen.Style = psClear
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText59: TQRDBText
        Left = 39
        Top = 98
        Width = 939
        Height = 19
        Size.Values = (
          35.907738095238090000
          73.705357142857140000
          185.208333333333300000
          1774.598214285715000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ca_direlectronica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText53: TQRDBText
        Left = 745
        Top = 25
        Width = 232
        Height = 19
        Size.Values = (
          35.907738095238090000
          1407.961309523810000000
          47.247023809523810000
          438.452380952381000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'prestador_cuit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 1
        Top = 3
        Width = 980
        Height = 22
        Size.Values = (
          41.577380952380950000
          1.889880952380953000
          5.669642857142857000
          1852.083333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' DATOS DEL PRESTADOR'
        Color = clNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRDBText12: TQRDBText
        Left = 324
        Top = 50
        Width = 54
        Height = 19
        Size.Values = (
          35.907738095238090000
          612.321428571428600000
          94.494047619047620000
          102.053571428571400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ca_numero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 294
        Top = 50
        Width = 29
        Height = 19
        Size.Values = (
          35.907738095238090000
          555.625000000000000000
          94.494047619047620000
          54.806547619047620000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Nro:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 380
        Top = 50
        Width = 34
        Height = 19
        Size.Values = (
          35.907738095238090000
          718.154761904762000000
          94.494047619047620000
          64.255952380952380000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Piso:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 412
        Top = 50
        Width = 31
        Height = 19
        Size.Values = (
          35.907738095238090000
          778.630952380952600000
          94.494047619047620000
          58.586309523809540000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ca_piso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 445
        Top = 50
        Width = 46
        Height = 19
        Size.Values = (
          35.907738095238090000
          840.997023809523800000
          94.494047619047620000
          86.934523809523810000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Depto:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 492
        Top = 50
        Width = 48
        Height = 19
        Size.Values = (
          35.907738095238090000
          929.821428571428600000
          94.494047619047620000
          90.714285714285710000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CA_Departamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText58: TQRDBText
        Left = 736
        Top = 74
        Width = 241
        Height = 19
        Size.Values = (
          35.907738095238090000
          1390.952380952381000000
          139.851190476190500000
          455.461309523809500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'prestador_fax'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText32: TQRDBText
        Left = 419
        Top = 74
        Width = 153
        Height = 19
        Size.Values = (
          35.907738095238090000
          791.860119047619200000
          139.851190476190500000
          289.151785714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'PRESTADOR_TELEFONO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 274
        Top = 25
        Width = 426
        Height = 19
        Size.Values = (
          35.907738095238090000
          517.827380952381000000
          47.247023809523810000
          805.089285714285800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'PRESTADOR_NOMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 777
        Top = 50
        Width = 202
        Height = 19
        Size.Values = (
          35.907738095238090000
          1468.437500000000000000
          94.494047619047620000
          381.755952380952400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'PRESTADOR_LOCALIDAD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel57: TQRLabel
        Left = 0
        Top = 146
        Width = 139
        Height = 19
        Size.Values = (
          35.907738095238090000
          0.000000000000000000
          275.922619047619100000
          262.693452380952400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Accidente de trabajo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape8: TQRShape
        Left = 141
        Top = 145
        Width = 19
        Height = 20
        Size.Values = (
          37.797619047619050000
          266.473214285714300000
          274.032738095238100000
          35.907738095238090000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText48: TQRDBText
        Left = 144
        Top = 146
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          272.142857142857200000
          275.922619047619100000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EX_TIPO_1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel59: TQRLabel
        Left = 275
        Top = 146
        Width = 130
        Height = 19
        Size.Values = (
          35.907738095238090000
          519.717261904761900000
          275.922619047619100000
          245.684523809523800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Accidente in It'#237'nere'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape9: TQRShape
        Left = 407
        Top = 145
        Width = 19
        Height = 20
        Size.Values = (
          37.797619047619050000
          769.181547619047600000
          274.032738095238100000
          35.907738095238090000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText49: TQRDBText
        Left = 410
        Top = 146
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          774.851190476190500000
          275.922619047619100000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EX_TIPO_2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel63: TQRLabel
        Left = 549
        Top = 146
        Width = 160
        Height = 19
        Size.Values = (
          35.907738095238090000
          1037.544642857143000000
          275.922619047619100000
          302.380952380952400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Enfermedad Profesional'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape10: TQRShape
        Left = 711
        Top = 146
        Width = 19
        Height = 20
        Size.Values = (
          37.797619047619050000
          1343.705357142857000000
          275.922619047619100000
          35.907738095238090000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText50: TQRDBText
        Left = 714
        Top = 147
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          1349.375000000000000000
          277.812500000000000000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EX_TIPO_3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 0
        Top = 121
        Width = 980
        Height = 22
        Size.Values = (
          41.577380952380950000
          0.000000000000000000
          228.675595238095300000
          1852.083333333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' DESCRIPCI'#211'N DEL MOTIVO DE LA CONSULTA'
        Color = clNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel43: TQRLabel
        Left = 845
        Top = 146
        Width = 97
        Height = 19
        Size.Values = (
          35.907738095238090000
          1596.949404761905000000
          275.922619047619100000
          183.318452380952400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Intercurrencia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 944
        Top = 146
        Width = 19
        Height = 20
        Size.Values = (
          37.797619047619050000
          1784.047619047619000000
          275.922619047619100000
          35.907738095238090000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText28: TQRDBText
        Left = 947
        Top = 147
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          1789.717261904762000000
          277.812500000000000000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EX_INTERCURRENCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText62: TQRDBText
        Left = 742
        Top = 169
        Width = 86
        Height = 19
        Size.Values = (
          35.907738095238090000
          1402.291666666667000000
          319.389880952381000000
          162.529761904761900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'fechaacc_hora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel70: TQRLabel
        Left = 701
        Top = 169
        Width = 38
        Height = 19
        Size.Values = (
          35.907738095238090000
          1324.806547619048000000
          319.389880952381000000
          71.815476190476190000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hora:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText55: TQRDBText
        Left = 537
        Top = 168
        Width = 137
        Height = 19
        Size.Values = (
          35.907738095238090000
          1014.866071428571000000
          317.500000000000000000
          258.913690476190500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'FECHAACC'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel47: TQRLabel
        Left = 487
        Top = 169
        Width = 45
        Height = 19
        Size.Values = (
          35.907738095238090000
          920.372023809523800000
          319.389880952381000000
          85.044642857142860000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel66: TQRLabel
        Left = 1
        Top = 169
        Width = 315
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          319.389880952381000000
          595.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de ocurrencia de la contingencia original:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel42: TQRLabel
        Left = 0
        Top = 193
        Width = 146
        Height = 19
        Size.Values = (
          35.907738095238090000
          0.000000000000000000
          364.747023809523800000
          275.922619047619100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de Alta M'#233'dica:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel107: TQRLabel
        Left = 486
        Top = 193
        Width = 45
        Height = 19
        Size.Values = (
          35.907738095238090000
          918.482142857142900000
          364.747023809523800000
          85.044642857142860000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel110: TQRLabel
        Left = 700
        Top = 193
        Width = 38
        Height = 19
        Size.Values = (
          35.907738095238090000
          1322.916666666667000000
          364.747023809523800000
          71.815476190476190000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hora:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 744
        Top = 193
        Width = 61
        Height = 19
        Size.Values = (
          35.907738095238090000
          1406.071428571428000000
          364.747023809523800000
          115.282738095238100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '_______'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel48: TQRLabel
        Left = 0
        Top = 217
        Width = 228
        Height = 19
        Size.Values = (
          35.907738095238090000
          0.000000000000000000
          410.104166666666800000
          430.892857142857100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha de la Solicitud de Reingreso:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel51: TQRLabel
        Left = 486
        Top = 217
        Width = 45
        Height = 19
        Size.Values = (
          35.907738095238090000
          918.482142857142900000
          410.104166666666800000
          85.044642857142860000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel52: TQRLabel
        Left = 700
        Top = 217
        Width = 38
        Height = 19
        Size.Values = (
          35.907738095238090000
          1322.916666666667000000
          410.104166666666800000
          71.815476190476190000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hora:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 744
        Top = 217
        Width = 61
        Height = 19
        Size.Values = (
          35.907738095238090000
          1406.071428571428000000
          410.104166666666800000
          115.282738095238100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '_______'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel74: TQRLabel
        Left = 1
        Top = 241
        Width = 240
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          455.461309523809500000
          453.571428571428500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Descripci'#243'n del motivo de consulta:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel80: TQRLabel
        Left = 1
        Top = 315
        Width = 84
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          595.312500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Diagn'#243'stico:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel53: TQRLabel
        Left = 1
        Top = 386
        Width = 183
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          729.494047619047700000
          345.848214285714300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Indicaciones / Tratamiento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 189
        Top = 387
        Width = 791
        Height = 19
        Size.Values = (
          35.907738095238090000
          357.187500000000000000
          731.383928571428600000
          1494.895833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          '________________________________________________________________' +
          '___________________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 25
        Top = 888
        Width = 278
        Height = 19
        Size.Values = (
          35.907738095238090000
          47.247023809523810000
          1678.214285714286000000
          525.386904761904800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '_________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 355
        Top = 888
        Width = 278
        Height = 19
        Size.Values = (
          35.907738095238090000
          670.907738095238100000
          1678.214285714286000000
          525.386904761904800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '_________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 681
        Top = 888
        Width = 278
        Height = 19
        Size.Values = (
          35.907738095238090000
          1287.008928571429000000
          1678.214285714286000000
          525.386904761904800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '_________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 42
        Top = 908
        Width = 245
        Height = 19
        Size.Values = (
          35.907738095238090000
          79.375000000000000000
          1716.011904761905000000
          463.020833333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Lugar y fecha de la Asistencia M'#233'dica'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 384
        Top = 908
        Width = 221
        Height = 19
        Size.Values = (
          35.907738095238090000
          725.714285714285700000
          1716.011904761905000000
          417.663690476190500000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Firma y Aclaraci'#243'n del Trabajador'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 694
        Top = 908
        Width = 253
        Height = 19
        Size.Values = (
          35.907738095238090000
          1311.577380952381000000
          1716.011904761905000000
          478.139880952381000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Firma y Sello M'#233'dico c/N'#176' de Matr'#237'cula'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 247
        Top = 241
        Width = 729
        Height = 19
        Size.Values = (
          35.907738095238090000
          466.800595238095300000
          455.461309523809500000
          1377.723214285714000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          '________________________________________________________________' +
          '___________________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRMemo1: TQRMemo
        Left = 1
        Top = 261
        Width = 977
        Height = 46
        Size.Values = (
          86.934523809523810000
          1.889880952380953000
          493.258928571428600000
          1846.413690476191000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          
            '________________________________________________________________' +
            '________________________________________________________________' +
            '___________'
          
            '________________________________________________________________' +
            '________________________________________________________________' +
            '___________')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRMemo3: TQRMemo
        Left = 1
        Top = 337
        Width = 977
        Height = 46
        Size.Values = (
          86.934523809523810000
          1.889880952380953000
          636.889880952380900000
          1846.413690476191000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          
            '________________________________________________________________' +
            '________________________________________________________________' +
            '___________'
          
            '________________________________________________________________' +
            '________________________________________________________________' +
            '___________')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 92
        Top = 317
        Width = 887
        Height = 19
        Size.Values = (
          35.907738095238090000
          173.869047619047600000
          599.092261904762000000
          1676.324404761905000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          '________________________________________________________________' +
          '______________________________________________________________'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 304
        Top = 475
        Width = 19
        Height = 20
        Size.Values = (
          37.797619047619050000
          574.523809523809500000
          897.693452380952600000
          35.907738095238090000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText4: TQRDBText
        Left = 307
        Top = 476
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          580.193452380952400000
          899.583333333333400000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'AceptaRein_Si'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 1
        Top = 476
        Width = 272
        Height = 19
        Size.Values = (
          35.907738095238090000
          1.889880952380953000
          899.583333333333400000
          514.047619047619000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Aceptaci'#243'n del Reingreso al tratamiento:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 304
        Top = 502
        Width = 19
        Height = 20
        Size.Values = (
          37.797619047619050000
          574.523809523809500000
          948.720238095238300000
          35.907738095238090000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object QRDBText5: TQRDBText
        Left = 307
        Top = 503
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          580.193452380952400000
          950.610119047619100000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'AceptaRein_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 278
        Top = 476
        Width = 13
        Height = 19
        Size.Values = (
          35.907738095238090000
          525.386904761904800000
          899.583333333333400000
          24.568452380952380000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SI'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 278
        Top = 503
        Width = 21
        Height = 19
        Size.Values = (
          35.907738095238090000
          525.386904761904800000
          950.610119047619100000
          39.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 335
        Top = 503
        Width = 304
        Height = 19
        Size.Values = (
          35.907738095238090000
          633.110119047619100000
          950.610119047619100000
          574.523809523809500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '--> Fundamento de la denegaci'#243'n de reingreso'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape18: TQRShape
        Left = 8
        Top = 595
        Width = 973
        Height = 80
        Frame.Width = 5
        Size.Values = (
          151.190476190476200000
          15.119047619047620000
          1124.479166666667000000
          1838.854166666667000000)
        XLColumn = 0
        Shape = qrsRectangle
        RoundFactor = 0.500000000000000000
        VertAdjust = 0
      end
      object qrMemoNotaAlPie1: TQRMemo
        Left = 16
        Top = 602
        Width = 957
        Height = 67
        Size.Values = (
          126.622023809523800000
          30.238095238095240000
          1137.708333333333000000
          1808.616071428572000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText6: TQRDBText
        Left = 640
        Top = 504
        Width = 339
        Height = 78
        Size.Values = (
          147.410714285714300000
          1209.523809523810000000
          952.500000000000000000
          640.669642857142800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CC_MOTIVONOACEPTAREING'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRMemo2: TQRMemo
        Left = 1
        Top = 409
        Width = 977
        Height = 46
        Size.Values = (
          86.934523809523810000
          1.889880952380953000
          772.961309523809700000
          1846.413690476191000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          
            '________________________________________________________________' +
            '________________________________________________________________' +
            '___________'
          
            '________________________________________________________________' +
            '________________________________________________________________' +
            '___________')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel34: TQRLabel
        Left = 8
        Top = 956
        Width = 73
        Height = 15
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          28.348214285714280000
          15.119047619047620000
          1806.726190476191000000
          137.961309523809600000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'PM-03-F011'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText8: TQRDBText
        Left = 537
        Top = 193
        Width = 132
        Height = 19
        Size.Values = (
          35.907738095238090000
          1014.866071428571000000
          364.747023809523800000
          249.464285714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ex_altamedica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 537
        Top = 218
        Width = 132
        Height = 19
        Size.Values = (
          35.907738095238090000
          1014.866071428571000000
          411.994047619047700000
          249.464285714285700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'cc_fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
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
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 12
    Top = 20
  end
end
