object frmInvRptAsientosContabilizar: TfrmInvRptAsientosContabilizar
  Left = -37
  Top = 43
  Caption = 'frmInvRptAsientosContabilizar'
  ClientHeight = 850
  ClientWidth = 1440
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
  object qrAsientosContabilizar: TQuickRep
    Left = 8
    Top = 8
    Width = 1584
    Height = 1224
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
    ReportTitle = 'Asientos'
    SnapToGrid = True
    Units = MM
    Zoom = 150
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 57
      Top = 57
      Width = 1471
      Height = 105
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        185.208333333333300000
        2594.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlTitulo: TQRLabel
        Left = 673
        Top = 40
        Width = 125
        Height = 30
        Size.Values = (
          52.916666666666670000
          1187.097222222222000000
          70.555555555555560000
          220.486111111111100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = True
        Caption = 'ASIENTOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qriLogo: TQRImage
        Left = 1220
        Top = 4
        Width = 245
        Height = 96
        Size.Values = (
          169.333333333333300000
          2151.944444444444000000
          7.055555555555556000
          432.152777777777800000)
        XLColumn = 0
        Stretch = True
      end
    end
    object qrbDetalle: TQRBand
      Left = 57
      Top = 226
      Width = 1471
      Height = 29
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        51.152777777777780000
        2594.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 7
        Top = 2
        Width = 98
        Height = 25
        Size.Values = (
          44.097222222222220000
          12.347222222222220000
          3.527777777777778000
          172.861111111111100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'FECHA'
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
      object QRDBText2: TQRDBText
        Left = 113
        Top = 2
        Width = 203
        Height = 25
        Size.Values = (
          44.097222222222220000
          199.319444444444400000
          3.527777777777778000
          358.069444444444400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CUENTA'
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
      object QRDBText3: TQRDBText
        Left = 322
        Top = 2
        Width = 190
        Height = 25
        Size.Values = (
          44.097222222222220000
          567.972222222222200000
          3.527777777777778000
          335.138888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DEBITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatMonto
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 520
        Top = 2
        Width = 190
        Height = 25
        Size.Values = (
          44.097222222222220000
          917.222222222222200000
          3.527777777777778000
          335.138888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CREDITO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatMonto
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 718
        Top = 2
        Width = 162
        Height = 25
        Size.Values = (
          44.097222222222220000
          1266.472222222222000000
          3.527777777777778000
          285.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'OPERACION'
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
      object QRDBText7: TQRDBText
        Left = 886
        Top = 2
        Width = 462
        Height = 25
        Size.Values = (
          44.097222222222220000
          1562.805555555556000000
          3.527777777777778000
          814.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DENOMINACION'
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
      object QRDBText8: TQRDBText
        Left = 1353
        Top = 2
        Width = 111
        Height = 25
        Size.Values = (
          44.097222222222220000
          2386.541666666667000000
          3.527777777777778000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CUPON'
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
    object PageFooterBand1: TQRBand
      Left = 57
      Top = 287
      Width = 1471
      Height = 27
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2594.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel7: TQRLabel
        Left = 1351
        Top = 1
        Width = 52
        Height = 25
        Size.Values = (
          44.097222222222220000
          2383.013888888889000000
          1.763888888888889000
          91.722222222222220000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'P'#225'g.'
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
      object QRSysData2: TQRSysData
        Left = 1409
        Top = 1
        Width = 56
        Height = 25
        Size.Values = (
          44.097222222222220000
          2485.319444444444000000
          1.763888888888889000
          98.777777777777780000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        FontSize = 9
      end
      object qrlUsuario: TQRLabel
        Left = 2
        Top = 1
        Width = 510
        Height = 25
        Size.Values = (
          44.097222222222220000
          3.527777777777778000
          1.763888888888889000
          899.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Usuario:'
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
      object QRSysData1: TQRSysData
        Left = 608
        Top = 1
        Width = 53
        Height = 25
        Size.Values = (
          44.097222222222220000
          1072.444444444444000000
          1.763888888888889000
          93.486111111111110000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        FontSize = 9
      end
    end
    object qrgGrupo: TQRGroup
      Left = 57
      Top = 162
      Width = 1471
      Height = 31
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDetalle
      Size.Values = (
        54.680555555555560000
        2594.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'sdqDatos.TIPO_INSTRUMENTO'
      FooterBand = qrbFooter
      Master = qrAsientosContabilizar
      ReprintOnNewPage = False
      object QRLabel3: TQRLabel
        Left = 3
        Top = 2
        Width = 176
        Height = 25
        Size.Values = (
          44.097222222222220000
          5.291666666666667000
          3.527777777777778000
          310.444444444444400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo Instrumento:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 183
        Top = 2
        Width = 733
        Height = 25
        Size.Values = (
          44.097222222222220000
          322.791666666666700000
          3.527777777777778000
          1292.930555555556000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'TIPO_INSTRUMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object qrbFooter: TQRBand
      Left = 57
      Top = 255
      Width = 1471
      Height = 32
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        56.444444444444440000
        2594.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRExpr2: TQRExpr
        Left = 520
        Top = 6
        Width = 190
        Height = 22
        Size.Values = (
          38.805555555555560000
          917.222222222222200000
          10.583333333333330000
          335.138888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = FormatMonto
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(sdqDatos.CREDITO)'
        Mask = '#,###'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 322
        Top = 6
        Width = 190
        Height = 22
        Size.Values = (
          38.805555555555560000
          567.972222222222200000
          10.583333333333330000
          335.138888888888900000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = FormatMonto
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(sdqDatos.DEBITO)'
        Mask = '#,###'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 319
        Top = 3
        Width = 193
        Height = 2
        Size.Values = (
          3.527777777777778000
          562.680555555555600000
          5.291666666666667000
          340.430555555555600000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 517
        Top = 3
        Width = 193
        Height = 2
        Size.Values = (
          3.527777777777778000
          911.930555555555600000
          5.291666666666667000
          340.430555555555600000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object ChildBand1: TQRChildBand
      Left = 57
      Top = 193
      Width = 1471
      Height = 33
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2594.680555555556000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgGrupo
      PrintOrder = cboAfterParent
      object QRLabel10: TQRLabel
        Left = 8
        Top = 2
        Width = 98
        Height = 25
        Size.Values = (
          44.097222222222220000
          14.111111111111110000
          3.527777777777778000
          172.861111111111100000)
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
      object QRLabel11: TQRLabel
        Left = 113
        Top = 2
        Width = 203
        Height = 25
        Size.Values = (
          44.097222222222220000
          199.319444444444400000
          3.527777777777778000
          358.069444444444400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cuenta'
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
      object QRLabel13: TQRLabel
        Left = 322
        Top = 2
        Width = 190
        Height = 25
        Size.Values = (
          44.097222222222220000
          567.972222222222200000
          3.527777777777778000
          335.138888888888900000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'D'#233'bito'
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
      object QRLabel1: TQRLabel
        Left = 520
        Top = 2
        Width = 190
        Height = 25
        Size.Values = (
          44.097222222222220000
          917.222222222222200000
          3.527777777777778000
          335.138888888888900000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cr'#233'dito'
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
        Left = 718
        Top = 2
        Width = 162
        Height = 25
        Size.Values = (
          44.097222222222220000
          1266.472222222222000000
          3.527777777777778000
          285.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Operaci'#243'n'
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
        Left = 886
        Top = 2
        Width = 462
        Height = 25
        Size.Values = (
          44.097222222222220000
          1562.805555555556000000
          3.527777777777778000
          814.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Denominaci'#243'n'
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
        Left = 1355
        Top = 2
        Width = 111
        Height = 25
        Size.Values = (
          44.097222222222220000
          2390.069444444444000000
          3.527777777777778000
          195.791666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cup'#243'n'
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
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '')
    Left = 24
    Top = 8
  end
end
