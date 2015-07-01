object frmRptCasosPorLiquidador: TfrmRptCasosPorLiquidador
  Left = 387
  Top = 148
  Caption = 'frmRptCasosPorLiquidador'
  ClientHeight = 533
  ClientWidth = 816
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
  object qrCasosPorLiq: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    IDReport = 0
    BeforePrint = qrCasosPorLiqBeforePrint
    DataSet = sdqCasosPorLiq
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
      Width = 740
      Height = 67
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        177.270833333333300000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 248
        Top = 16
        Width = 223
        Height = 28
        Size.Values = (
          74.083333333333340000
          656.166666666666600000
          42.333333333333340000
          590.020833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Casos por liquidador'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
      object lFecha: TQRLabel
        Left = 32
        Top = 48
        Width = 225
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          127.000000000000000000
          595.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha generaci'#243'n:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 129
      Width = 740
      Height = 21
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 43
        Top = 3
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          7.937500000000000000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqCasosPorLiq
        DataField = 'lc_usuario'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 337
        Top = 3
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          891.645833333333400000
          7.937500000000000000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqCasosPorLiq
        DataField = 'cantcasos'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 488
        Top = 3
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          7.937500000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqCasosPorLiq
        DataField = 'cantsiniestros'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 650
        Top = 3
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1719.791666666667000000
          7.937500000000000000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = sdqCasosPorLiq
        DataField = 'CANLIQ15'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 105
      Width = 740
      Height = 24
      AlignToBottom = False
      Color = clMoneyGreen
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object QRLabel2: TQRLabel
        Left = 43
        Top = 4
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          10.583333333333330000
          158.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Liquidador'
        Color = clMoneyGreen
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 314
        Top = 4
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          830.791666666666600000
          10.583333333333330000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cant. Casos'
        Color = clMoneyGreen
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 460
        Top = 4
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          1217.083333333333000000
          10.583333333333330000
          248.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cant. Siniestros'
        Color = clMoneyGreen
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 608
        Top = 4
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          10.583333333333330000
          272.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Liquid. en 15 d'#237'as'
        Color = clMoneyGreen
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object sdqCasosPorLiq: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT lc_usuario, art.dinerarias.get_cantcasosliq(lc_id) cantca' +
        'sos,'
      
        '       art.dinerarias.get_cantsiniestrosliq(lc_id) cantsiniestro' +
        's,'
      
        '       art.dinerarias.get_cantcasosliquidados(lc_id, '#39'S'#39') canliq' +
        '15'
      '  FROM din.dlc_liquidadorescasos'
      ' WHERE lc_fechabaja IS NULL'
      '   AND lc_idtipocaso = :idtipocaso')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idtipocaso'
        ParamType = ptInput
      end>
  end
end
