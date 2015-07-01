object frmRptInfoPLA: TfrmRptInfoPLA
  Left = 279
  Top = 52
  Caption = 'Informaci'#243'n PLA y FT'
  ClientHeight = 642
  ClientWidth = 1055
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
  object rptInfoPLA: TQuickRep
    Left = 0
    Top = 0
    Width = 1056
    Height = 816
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
    Page.Orientation = poLandscape
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      2794.000000000000000000
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
    object TitleBand1: TQRBand
      Left = 38
      Top = 38
      Width = 980
      Height = 74
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        195.791666666666700000
        2592.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 50
        Top = 10
        Width = 875
        Height = 25
        Size.Values = (
          66.145833333333340000
          132.291666666666700000
          26.458333333333330000
          2315.104166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Formulario de Reporte de Informaci'#243'n Estad'#237'stica de Prevenci'#243'n d' +
          'e Lavado de Activos y F.T.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object QRLabel2: TQRLabel
        Left = 16
        Top = 52
        Width = 81
        Height = 18
        Size.Values = (
          47.625000000000000000
          42.333333333333340000
          137.583333333333300000
          214.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Informaci'#243'n al'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 49
        Top = 68
        Width = 875
        Height = 9
        Size.Values = (
          23.812500000000000000
          129.645833333333300000
          179.916666666666700000
          2315.104166666667000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlFecha: TQRLabel
        Left = 107
        Top = 52
        Width = 45
        Height = 18
        Size.Values = (
          47.625000000000000000
          283.104166666666700000
          137.583333333333300000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FECHA'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object QRShape2: TQRShape
      Left = 53
      Top = 151
      Width = 950
      Height = 1
      Size.Values = (
        3.527777777777778000
        141.111111111111100000
        398.638888888888900000
        2513.541666666667000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape3: TQRShape
      Left = 53
      Top = 236
      Width = 950
      Height = 1
      Size.Values = (
        3.527777777777778000
        141.111111111111100000
        624.416666666666700000
        2513.541666666667000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape4: TQRShape
      Left = 52
      Top = 151
      Width = 1
      Height = 86
      Size.Values = (
        227.541666666666700000
        138.906250000000000000
        399.520833333333300000
        2.645833333333333000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape8: TQRShape
      Left = 669
      Top = 172
      Width = 1
      Size.Values = (
        172.861111111111100000
        1769.180555555556000000
        455.083333333333300000
        1.763888888888889000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape11: TQRShape
      Left = 53
      Top = 192
      Width = 865
      Height = 1
      Size.Values = (
        3.527777777777778000
        139.347222222222200000
        508.000000000000000000
        2287.763888888889000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel3: TQRLabel
      Left = 58
      Top = 164
      Width = 284
      Height = 18
      Size.Values = (
        47.625000000000000000
        153.458333333333300000
        433.916666666666700000
        751.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Operaciones Monitoreadas en el per'#237'odo informado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 354
      Top = 164
      Width = 188
      Height = 18
      Size.Values = (
        47.625000000000000000
        936.625000000000000000
        433.916666666666700000
        497.416666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '% de Operaciones Seleccionadas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 600
      Top = 154
      Width = 130
      Height = 18
      Size.Values = (
        47.625000000000000000
        1587.500000000000000000
        407.458333333333400000
        343.958333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Operaciones Inusuales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRShape12: TQRShape
      Left = 545
      Top = 172
      Width = 248
      Height = 1
      Size.Values = (
        3.527777777777778000
        1442.861111111111000000
        455.083333333333300000
        656.166666666666700000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel6: TQRLabel
      Left = 574
      Top = 175
      Width = 60
      Height = 16
      Size.Values = (
        42.333333333333340000
        1518.708333333333000000
        463.020833333333400000
        158.750000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'En estudio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 678
      Top = 175
      Width = 98
      Height = 16
      Size.Values = (
        42.333333333333340000
        1793.875000000000000000
        463.020833333333400000
        259.291666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Res. Favorablem.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel8: TQRLabel
      Left = 807
      Top = 159
      Width = 95
      Height = 28
      Size.Values = (
        74.083333333333330000
        2135.187500000000000000
        420.687500000000000000
        251.354166666666700000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Calificadas de Sospechosas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 917
      Top = 169
      Width = 82
      Height = 28
      Size.Values = (
        74.083333333333330000
        2426.229166666667000000
        447.145833333333300000
        216.958333333333300000)
      XLColumn = 0
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      Caption = 'Informadas o Rechazadas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 9
    end
    object QRShape13: TQRShape
      Left = 53
      Top = 211
      Width = 950
      Height = 1
      Size.Values = (
        3.527777777777778000
        139.347222222222200000
        557.388888888888900000
        2513.541666666667000000)
      XLColumn = 0
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape14: TQRShape
      Left = 156
      Top = 193
      Width = 4
      Height = 44
      Size.Values = (
        115.358333333333300000
        412.750000000000000000
        511.175000000000000000
        9.525000000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel10: TQRLabel
      Left = 66
      Top = 196
      Width = 80
      Height = 15
      Size.Values = (
        39.687500000000000000
        174.625000000000000000
        518.583333333333400000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Tipo / Operaci'#243'n'
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
    object QRLabel11: TQRLabel
      Left = 175
      Top = 196
      Width = 43
      Height = 15
      Size.Values = (
        39.687500000000000000
        463.020833333333400000
        518.583333333333400000
        113.770833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad'
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
    object QRLabel12: TQRLabel
      Left = 250
      Top = 196
      Width = 80
      Height = 15
      Size.Values = (
        39.687500000000000000
        661.458333333333400000
        518.583333333333400000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Monto en ($000)'
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
    object QRLabel13: TQRLabel
      Left = 352
      Top = 196
      Width = 56
      Height = 15
      Size.Values = (
        39.687500000000000000
        931.333333333333500000
        518.583333333333400000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '% Cantidad'
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
    object QRLabel14: TQRLabel
      Left = 432
      Top = 196
      Width = 93
      Height = 15
      Size.Values = (
        39.687500000000000000
        1143.000000000000000000
        518.583333333333400000
        246.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '% Monto en ($000)'
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
    object QRLabel16: TQRLabel
      Left = 588
      Top = 196
      Width = 80
      Height = 15
      Size.Values = (
        39.687500000000000000
        1555.750000000000000000
        518.583333333333400000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Monto en ($000)'
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
    object QRLabel15: TQRLabel
      Left = 553
      Top = 196
      Width = 26
      Height = 15
      Size.Values = (
        39.687500000000000000
        1463.145833333333000000
        518.583333333333400000
        68.791666666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cant.'
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
    object QRLabel17: TQRLabel
      Left = 799
      Top = 196
      Width = 26
      Height = 15
      Size.Values = (
        39.687500000000000000
        2114.020833333333000000
        518.583333333333400000
        68.791666666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cant.'
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
    object QRLabel18: TQRLabel
      Left = 835
      Top = 196
      Width = 80
      Height = 15
      Size.Values = (
        39.687500000000000000
        2209.270833333333000000
        518.583333333333400000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Monto en ($000)'
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
    object QRLabel19: TQRLabel
      Left = 677
      Top = 196
      Width = 26
      Height = 15
      Size.Values = (
        39.687500000000000000
        1791.229166666667000000
        518.583333333333400000
        68.791666666666670000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cant.'
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
    object QRLabel20: TQRLabel
      Left = 711
      Top = 196
      Width = 80
      Height = 15
      Size.Values = (
        39.687500000000000000
        1881.187500000000000000
        518.583333333333400000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Monto en ($000)'
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
    object QRShape15: TQRShape
      Left = 230
      Top = 193
      Width = 4
      Height = 44
      Size.Values = (
        115.358333333333300000
        608.541666666666700000
        511.175000000000000000
        9.525000000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape16: TQRShape
      Left = 417
      Top = 193
      Width = 3
      Height = 43
      Size.Values = (
        114.652777777777800000
        1102.430555555556000000
        511.527777777777800000
        8.819444444444444000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape6: TQRShape
      Left = 347
      Top = 151
      Width = 1
      Height = 86
      Size.Values = (
        227.541666666666700000
        917.222222222222200000
        400.402777777777800000
        3.527777777777778000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape7: TQRShape
      Left = 545
      Top = 151
      Width = 1
      Height = 86
      Size.Values = (
        227.541666666666700000
        1442.861111111111000000
        400.402777777777800000
        3.527777777777778000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape9: TQRShape
      Left = 792
      Top = 151
      Width = 1
      Height = 86
      Size.Values = (
        227.541666666666700000
        2095.500000000000000000
        400.402777777777800000
        3.527777777777778000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape10: TQRShape
      Left = 915
      Top = 151
      Width = 1
      Height = 86
      Size.Values = (
        227.541666666666700000
        2421.819444444444000000
        400.402777777777800000
        3.527777777777778000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape5: TQRShape
      Left = 1002
      Top = 151
      Width = 1
      Height = 86
      Size.Values = (
        227.541666666666700000
        2651.125000000000000000
        400.402777777777800000
        3.527777777777778000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel21: TQRLabel
      Left = 66
      Top = 218
      Width = 67
      Height = 15
      Size.Values = (
        39.687500000000000000
        174.625000000000000000
        576.791666666666700000
        177.270833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Liquidaciones'
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
    object lblCantFilt: TQRLabel
      Left = 184
      Top = 218
      Width = 46
      Height = 15
      Size.Values = (
        39.687500000000000000
        486.833333333333400000
        576.791666666666700000
        121.708333333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lblCantFilt'
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
    object lblMontoFilt: TQRLabel
      Left = 250
      Top = 218
      Width = 53
      Height = 15
      Size.Values = (
        39.687500000000000000
        661.458333333333400000
        576.791666666666700000
        140.229166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lblMontoFilt'
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
    object QRLabel22: TQRLabel
      Left = 66
      Top = 287
      Width = 59
      Height = 15
      Size.Values = (
        39.687500000000000000
        174.625000000000000000
        759.354166666666700000
        156.104166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Monto Total:'
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
    object QRLabel23: TQRLabel
      Left = 66
      Top = 265
      Width = 72
      Height = 15
      Size.Values = (
        39.687500000000000000
        174.625000000000000000
        701.145833333333300000
        190.500000000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Cantidad Total:'
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
    object lblCantTotal: TQRLabel
      Left = 144
      Top = 265
      Width = 56
      Height = 15
      Size.Values = (
        39.687500000000000000
        381.000000000000000000
        701.145833333333300000
        148.166666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lblCantTotal'
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
    object lblMontoTotal: TQRLabel
      Left = 144
      Top = 287
      Width = 63
      Height = 15
      Size.Values = (
        39.687500000000000000
        381.000000000000000000
        759.354166666666700000
        166.687500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lblMontoTotal'
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
    object lblPorcCant: TQRLabel
      Left = 363
      Top = 218
      Width = 55
      Height = 15
      Size.Values = (
        39.687500000000000000
        960.437500000000000000
        576.791666666666700000
        145.520833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lblPorcCant'
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
    object lblPorcMonto: TQRLabel
      Left = 454
      Top = 218
      Width = 62
      Height = 15
      Size.Values = (
        39.687500000000000000
        1201.208333333333000000
        576.791666666666700000
        164.041666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'lblPorcMonto'
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
    object QRShape17: TQRShape
      Left = 584
      Top = 193
      Width = 3
      Height = 43
      Size.Values = (
        113.770833333333300000
        1545.166666666667000000
        510.645833333333300000
        7.937500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape18: TQRShape
      Left = 708
      Top = 193
      Width = 3
      Height = 43
      Size.Values = (
        113.770833333333300000
        1873.250000000000000000
        510.645833333333300000
        7.937500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape19: TQRShape
      Left = 831
      Top = 193
      Width = 3
      Height = 43
      Size.Values = (
        113.770833333333300000
        2198.687500000000000000
        510.645833333333300000
        7.937500000000000000)
      XLColumn = 0
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object lblCEst: TQRLabel
      Left = 561
      Top = 218
      Width = 7
      Height = 15
      Size.Values = (
        39.687500000000000000
        1484.312500000000000000
        576.791666666666700000
        18.520833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '0'
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
    object lblMEst: TQRLabel
      Left = 612
      Top = 218
      Width = 28
      Height = 15
      Size.Values = (
        39.687500000000000000
        1619.250000000000000000
        576.791666666666700000
        74.083333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '$0.00'
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
    object QRLabel25: TQRLabel
      Left = 735
      Top = 218
      Width = 28
      Height = 15
      Size.Values = (
        39.687500000000000000
        1944.687500000000000000
        576.791666666666700000
        74.083333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '$0.00'
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
    object QRLabel24: TQRLabel
      Left = 688
      Top = 218
      Width = 7
      Height = 15
      Size.Values = (
        39.687500000000000000
        1820.333333333333000000
        576.791666666666700000
        18.520833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '0'
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
    object QRLabel26: TQRLabel
      Left = 860
      Top = 218
      Width = 28
      Height = 15
      Size.Values = (
        39.687500000000000000
        2275.416666666667000000
        576.791666666666700000
        74.083333333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '$0.00'
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
    object QRLabel27: TQRLabel
      Left = 809
      Top = 218
      Width = 7
      Height = 15
      Size.Values = (
        39.687500000000000000
        2140.479166666667000000
        576.791666666666700000
        18.520833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '0'
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
    object QRLabel28: TQRLabel
      Left = 951
      Top = 218
      Width = 7
      Height = 15
      Size.Values = (
        39.687500000000000000
        2516.187500000000000000
        576.791666666666700000
        18.520833333333340000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = '0'
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
  end
end
