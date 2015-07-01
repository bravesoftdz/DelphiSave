object rptPlanillaMortalesPostFAcc: TrptPlanillaMortalesPostFAcc
  Left = 539
  Top = 0
  Caption = 'rptPlanillaMortalesPostFAcc'
  ClientHeight = 694
  ClientWidth = 817
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
  object rptPlanilla: TQuickRep
    Left = 0
    Top = 0
    Width = 653
    Height = 845
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
    SnapToGrid = True
    Units = MM
    Zoom = 80
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRLabel2: TQRLabel
      Left = 50
      Top = 103
      Width = 42
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        340.651041666666800000
        138.906250000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Siniestro'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 50
      Top = 119
      Width = 53
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        393.567708333333400000
        175.286458333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha acc.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 50
      Top = 135
      Width = 50
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        446.484375000000000000
        165.364583333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Empleador'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 50
      Top = 151
      Width = 58
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        499.401041666666700000
        191.822916666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Damnificado'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 50
      Top = 167
      Width = 71
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        552.317708333333400000
        234.817708333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha fallecim.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 50
      Top = 242
      Width = 146
      Height = 18
      Size.Values = (
        59.531250000000000000
        165.364583333333300000
        800.364583333333400000
        482.864583333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Evaluaci'#243'n por '#225'rea m'#233'dica'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 11
    end
    object QRShape1: TQRShape
      Left = 51
      Top = 259
      Width = 551
      Height = 216
      Size.Values = (
        714.375000000000000000
        168.671875000000000000
        856.588541666666800000
        1822.317708333333000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRLabel8: TQRLabel
      Left = 59
      Top = 266
      Width = 61
      Height = 14
      Size.Values = (
        46.302083333333340000
        195.130208333333400000
        879.739583333333500000
        201.744791666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Breve rese'#241'a'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmResena: TQRMemo
      Left = 64
      Top = 285
      Width = 519
      Height = 46
      Size.Values = (
        150.812500000000000000
        211.666666666666700000
        941.916666666666800000
        1717.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 59
      Top = 334
      Width = 52
      Height = 14
      Size.Values = (
        46.302083333333340000
        195.130208333333400000
        1104.635416666667000000
        171.979166666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Conclusi'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmConclusion: TQRMemo
      Left = 64
      Top = 354
      Width = 519
      Height = 46
      Size.Values = (
        150.812500000000000000
        211.666666666666700000
        1169.458333333333000000
        1717.145833333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object qrlSiniestro: TQRLabel
      Left = 125
      Top = 103
      Width = 53
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        340.651041666666800000
        175.286458333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlSiniestro'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFAcc: TQRLabel
      Left = 125
      Top = 119
      Width = 37
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        393.567708333333400000
        122.369791666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFAcc'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlEmpleador: TQRLabel
      Left = 125
      Top = 135
      Width = 62
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        446.484375000000000000
        205.052083333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlEmpleador'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlDamnificado: TQRLabel
      Left = 125
      Top = 151
      Width = 69
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        499.401041666666700000
        228.203125000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlDamnificado'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFFallecim: TQRLabel
      Left = 125
      Top = 167
      Width = 58
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        552.317708333333400000
        191.822916666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFFallecim'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 64
      Top = 485
      Width = 36
      Height = 14
      Size.Values = (
        46.302083333333340000
        211.666666666666700000
        1604.036458333333000000
        119.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 64
      Top = 502
      Width = 30
      Height = 14
      Size.Values = (
        46.302083333333340000
        211.666666666666700000
        1660.260416666667000000
        99.218750000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFirmaAmed: TQRLabel
      Left = 104
      Top = 485
      Width = 66
      Height = 14
      Size.Values = (
        46.302083333333340000
        343.958333333333400000
        1604.036458333333000000
        218.281250000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFirmaAmed'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaAMed: TQRLabel
      Left = 104
      Top = 502
      Width = 68
      Height = 14
      Size.Values = (
        46.302083333333340000
        343.958333333333400000
        1660.260416666667000000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaAMed'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel22: TQRLabel
      Left = 50
      Top = 531
      Width = 282
      Height = 18
      Size.Values = (
        59.531250000000000000
        165.364583333333300000
        1756.171875000000000000
        932.656250000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Conclusi'#243'n final Gerencia de Prestaciones y Servicios'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 11
    end
    object QRShape4: TQRShape
      Left = 51
      Top = 550
      Width = 551
      Height = 55
      Size.Values = (
        181.901041666666700000
        168.671875000000000000
        1819.010416666667000000
        1822.317708333333000000)
      XLColumn = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrmPyS: TQRMemo
      Left = 60
      Top = 554
      Width = 536
      Height = 45
      Size.Values = (
        148.828125000000000000
        198.437500000000000000
        1832.239583333333000000
        1772.708333333333000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 64
      Top = 611
      Width = 36
      Height = 15
      Size.Values = (
        49.609375000000000000
        211.666666666666700000
        2020.755208333333000000
        119.062500000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Usuario'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFirmaPys: TQRLabel
      Left = 104
      Top = 611
      Width = 57
      Height = 15
      Size.Values = (
        49.609375000000000000
        343.958333333333400000
        2020.755208333333000000
        188.515625000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFirmaPys'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel27: TQRLabel
      Left = 64
      Top = 630
      Width = 30
      Height = 15
      Size.Values = (
        49.609375000000000000
        211.666666666666700000
        2083.593750000000000000
        99.218750000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaPyS: TQRLabel
      Left = 104
      Top = 630
      Width = 61
      Height = 15
      Size.Values = (
        49.609375000000000000
        343.958333333333400000
        2083.593750000000000000
        201.744791666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaPyS'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object TitleBand1: TQRBand
      Left = 30
      Top = 30
      Width = 593
      Height = 64
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        211.666666666666700000
        1961.223958333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 168
        Top = 11
        Width = 265
        Height = 26
        Size.Values = (
          85.989583333333340000
          555.625000000000000000
          36.380208333333340000
          876.432291666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cobertura de acc. mortales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object qriLogo: TQRImage
        Left = 456
        Top = 7
        Width = 130
        Height = 51
        Size.Values = (
          170.089285714285700000
          1508.125000000000000000
          22.678571428571430000
          430.892857142857100000)
        XLColumn = 0
        Stretch = True
      end
      object QRLabel12: TQRLabel
        Left = 167
        Top = 40
        Width = 266
        Height = 18
        Size.Values = (
          59.531250000000000000
          552.317708333333400000
          132.291666666666700000
          879.739583333333500000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mortal posterior a la fecha de accidente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
    end
    object QRLabel10: TQRLabel
      Left = 50
      Top = 183
      Width = 55
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        605.234375000000000000
        181.901041666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Investigador'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 50
      Top = 199
      Width = 64
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        658.151041666666800000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Solic. informe'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 50
      Top = 215
      Width = 73
      Height = 14
      Size.Values = (
        46.302083333333340000
        165.364583333333300000
        711.067708333333400000
        241.432291666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Fecha aceptac.'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlFechaAcept: TQRLabel
      Left = 125
      Top = 215
      Width = 68
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        711.067708333333400000
        224.895833333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlFechaAcept'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlSolInforme: TQRLabel
      Left = 125
      Top = 199
      Width = 61
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        658.151041666666800000
        201.744791666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlSolInforme'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlInvestigador: TQRLabel
      Left = 125
      Top = 183
      Width = 66
      Height = 14
      Size.Values = (
        46.302083333333340000
        413.411458333333400000
        605.234375000000000000
        218.281250000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlInvestigador'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel16: TQRLabel
      Left = 59
      Top = 401
      Width = 50
      Height = 14
      Size.Values = (
        46.302083333333340000
        195.130208333333400000
        1326.223958333333000000
        165.364583333333300000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Evaluaci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrmEvaluacion: TQRMemo
      Left = 64
      Top = 421
      Width = 519
      Height = 46
      Size.Values = (
        152.135416666666700000
        211.666666666666700000
        1392.369791666667000000
        1716.484375000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 190
      Top = 502
      Width = 33
      Height = 14
      Size.Values = (
        46.302083333333340000
        628.385416666666800000
        1660.260416666667000000
        109.140625000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlAccionAMed: TQRLabel
      Left = 230
      Top = 502
      Width = 71
      Height = 14
      Size.Values = (
        46.302083333333340000
        760.677083333333400000
        1660.260416666667000000
        234.817708333333400000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlAccionAMed'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 190
      Top = 630
      Width = 33
      Height = 15
      Size.Values = (
        49.609375000000000000
        628.385416666666800000
        2083.593750000000000000
        109.140625000000000000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'Acci'#243'n'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
    object qrlAccionPyS: TQRLabel
      Left = 230
      Top = 630
      Width = 64
      Height = 15
      Size.Values = (
        49.609375000000000000
        760.677083333333400000
        2083.593750000000000000
        211.666666666666700000)
      XLColumn = 0
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'qrlAccionPyS'
      Color = clWhite
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FontSize = 10
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ha_breveresenia, ha_conclusion, ha_sugerencia, ha_observa' +
        'ciones, trunc(ha_fechaalta) ha_fechaalta, ha_usualta, se_nombre,' +
        ' am_descripcion'
      
        '  FROM din.dcm_casosmortales, din.dha_historicoacciones b, art.u' +
        'se_usuarios, din.dam_accionesmortales'
      ' WHERE cm_id = :idcaso'
      '   AND ha_idcaso = cm_id'
      '   AND ha_idsector = :idsector'
      '   AND ha_id = (SELECT MAX(ha_id)'
      '                  FROM din.dha_historicoacciones'
      '                 WHERE ha_idsector = b.ha_idsector'
      '                   AND ha_idcaso = b.ha_idcaso)'
      '   AND se_usuario = ha_usualta'
      '   AND ha_idaccion = am_id')
    Left = 8
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcaso'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idsector'
        ParamType = ptInput
      end>
  end
  object sdqSiniestro: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT art.siniestro.get_siniestrocompleto(cm_idexpediente) sini' +
        'estro, ex_fechaaccidente, tj_nombre, em_nombre, ex_fecharecepcio' +
        'n,'
      
        '       art.siniestro.get_datosinvestigacion(ex_id, '#39'I'#39') investig' +
        'ador,'
      
        '       art.siniestro.get_datosparteevolutivo(ex_id, '#39'I'#39', '#39'A'#39') fi' +
        'nforme,'
      '       ex_altamedica, trunc(es_fechaalta) fechaacept, ex_id'
      
        '  FROM din.dcm_casosmortales, art.sex_expedientes, comunes.ctj_t' +
        'rabajador, afi.aem_empresa, ART.SES_ESTADOSSINIESTROS'
      ' WHERE cm_id = :idcaso'
      '   AND ex_id = cm_idexpediente'
      '   AND ex_idtrabajador = tj_id'
      '   AND ex_cuit = em_cuit'
      '   AND es_idexpediente = ex_id'
      '   AND es_observaciones LIKE '#39'Aceptaci'#243'n%'#39
      '   AND es_estado = '#39'01'#39)
    Left = 56
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcaso'
        ParamType = ptInput
      end>
  end
end
