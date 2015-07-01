object rptResolucion463SolicitudAFI: TrptResolucion463SolicitudAFI
  Left = 198
  Top = 109
  Width = 907
  Height = 715
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
  object qrPlanillaB: TQuickRep
    Left = 2494
    Top = -10
    Width = 816
    Height = 1344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = AntesDeImprimir
    DataSet = sdqDifenilos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39)
    IDReport = 0
    OnEndPage = CambioDeHoja
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 4
    Page.Orientation = poPortrait
    Page.PaperSize = Legal
    Page.Values = (
      50.000000000000000000
      3556.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
      5.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbPlanillaB: TQRBand
      Left = 19
      Top = 179
      Width = 193
      Height = 14
      Frame.Color = 12566463
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = AntesDelDetalle
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        37.041666666666670000
        510.645833333333300000)
      BandType = rbDetail
      object QRShape24: TQRShape
        Left = 158
        Top = -1
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          40.216666666666670000
          419.100000000000000000
          -2.116666666666667000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 127
        Top = -1
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          40.216666666666670000
          335.491666666666700000
          -2.116666666666667000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBDescPlanillaB: TQRDBText
        Left = 4
        Top = 1
        Width = 120
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333340000
          2.116666666666667000
          318.558333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDifenilos
        DataField = 'IT_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText8: TQRDBText
        Left = 128
        Top = 1
        Width = 31
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          338.666666666666700000
          2.645833333333333000
          82.020833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = sdqDifenilos
        DataField = 'CUMP_SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintSIyNO
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText9: TQRDBText
        Left = 157
        Top = 1
        Width = 35
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          415.395833333333400000
          2.645833333333333000
          92.604166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = sdqDifenilos
        DataField = 'CUMP_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintSIyNO
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
    end
    object QRBand11: TQRBand
      Left = 19
      Top = 155
      Width = 193
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clBlack
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        510.645833333333300000)
      BandType = rbColumnHeader
      object QRLabel14: TQRLabel
        Left = 4
        Top = 8
        Width = 50
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          21.166666666666670000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCRIPCI'#211'N'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel15: TQRLabel
        Left = 142
        Top = 8
        Width = 8
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          375.708333333333400000
          21.166666666666670000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'S'#205
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel17: TQRLabel
        Left = 169
        Top = 8
        Width = 13
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          447.145833333333400000
          21.166666666666670000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object PageHeaderBand3: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        2058.458333333333000000)
      BandType = rbPageHeader
      object QRLabel64: TQRLabel
        Left = 220
        Top = 4
        Width = 316
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          582.083333333333400000
          10.583333333333330000
          836.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELEVAMIENTO GENERAL DE RIESGOS LABORALES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel65: TQRLabel
        Left = 316
        Top = 18
        Width = 97
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          836.083333333333400000
          47.625000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FORMULARIO A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoFormulario
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel81: TQRLabel
        Left = 284
        Top = 43
        Width = 83
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          751.416666666666800000
          113.770833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '.........................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel83: TQRLabel
        Left = 189
        Top = 40
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          500.062500000000000000
          105.833333333333300000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' de Establecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel84: TQRLabel
        Left = 84
        Top = 43
        Width = 95
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          113.770833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '...............................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object edCuitTituloB: TQRLabel
        Left = 97
        Top = 40
        Width = 75
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          256.645833333333400000
          105.833333333333300000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edCuitTituloB'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoCuit
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object edNroEstableciTituloB: TQRLabel
        Left = 313
        Top = 40
        Width = 119
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          828.145833333333200000
          105.833333333333300000
          314.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edNroEstableciTituloB'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoEstab
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel87: TQRLabel
        Left = 44
        Top = 6
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          116.416666666666700000
          15.875000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '      /       /            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel88: TQRLabel
        Left = 0
        Top = 6
        Width = 34
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          0.000000000000000000
          15.875000000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRImage4: TQRImage
        Left = 619
        Top = -1
        Width = 167
        Height = 67
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          176.388888888888900000
          1638.652777777778000000
          -3.527777777777778000
          440.972222222222200000)
        Stretch = True
      end
      object QRLabel82: TQRLabel
        Left = 2
        Top = 40
        Width = 91
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          5.291666666666667000
          105.833333333333300000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.U.I.T./C.U.I.P. N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand5: TQRBand
      Left = 19
      Top = 193
      Width = 778
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        2058.458333333333000000)
      BandType = rbPageFooter
      object QRSysData3: TQRSysData
        Left = 714
        Top = 13
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1889.125000000000000000
          34.395833333333340000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina '
        Transparent = False
        FontSize = 6
      end
      object QRLabel102: TQRLabel
        Left = 767
        Top = 13
        Width = 4
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          2029.354166666667000000
          34.395833333333340000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = lbCantPagPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape17: TQRShape
        Left = 0
        Top = 8
        Width = 60
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          35.416666666666670000
          0.000000000000000000
          20.833333333333330000
          159.375000000000000000)
        Brush.Color = clBlack
        Shape = qrsRoundRect
        RoundFactor = 0.109999999403953600
        VertAdjust = 0
      end
      object QRLabel103: TQRLabel
        Left = 9
        Top = 9
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          23.812500000000000000
          23.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PV-01-F001'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintTipoForm
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object ChildBand1: TQRChildBand
      Left = 19
      Top = 75
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      ParentBand = PageHeaderBand3
      object qrlTituloB: TQRLabel
        Left = 4
        Top = 12
        Width = 208
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          31.750000000000000000
          550.333333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLANILLA B | DIFENILOS POLICLORADOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object TitleBand4: TQRBand
      Left = 19
      Top = 115
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = DespuesDelTitulo
      AlignToBottom = False
      BeforePrint = AntesDelTitulo
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbTitle
      object QRLabel77: TQRLabel
        Left = 4
        Top = 12
        Width = 208
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          10.583333333333330000
          31.750000000000000000
          550.333333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLANILLA B | DIFENILOS POLICLORADOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object qrObservacion: TQuickRep
    Left = 843
    Top = 1398
    Width = 816
    Height = 1344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqObservaciones
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39)
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Legal
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = False
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object DetailBand1: TQRBand
      Left = 19
      Top = 120
      Width = 778
      Height = 13
      Frame.Color = 12566463
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = DetailBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        34.395833333333330000
        2058.458333333333000000)
      BandType = rbDetail
      object QRDBText14: TQRDBText
        Left = 362
        Top = 1
        Width = 370
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          957.791666666666800000
          2.645833333333333000
          978.958333333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqObservaciones
        DataField = 'ro_infoextra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBDescObs: TQRDBText
        Left = 4
        Top = 1
        Width = 348
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          10.583333333333330000
          2.645833333333333000
          920.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqObservaciones
        DataField = 'ob_descripcion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape63: TQRShape
        Left = 355
        Top = 0
        Width = 5
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          939.270833333333400000
          0.000000000000000000
          13.229166666666670000)
        Pen.Color = clGreen
        Shape = qrsVertLine
        VertAdjust = 20
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 78
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        206.375000000000000000
        2058.458333333333000000)
      BandType = rbPageHeader
      object qrLogoObservacion: TQRImage
        Left = 619
        Top = -1
        Width = 167
        Height = 67
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          176.388888888888900000
          1638.652777777778000000
          -3.527777777777778000
          440.972222222222200000)
        Stretch = True
      end
      object QRLabel31: TQRLabel
        Left = 309
        Top = 55
        Width = 83
        Height = 14
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          817.562500000000000000
          145.520833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '.........................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel52: TQRLabel
        Left = 2
        Top = 48
        Width = 91
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          5.291666666666667000
          127.000000000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.U.I.T./C.U.I.P. N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel53: TQRLabel
        Left = 189
        Top = 48
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          500.062500000000100000
          127.000000000000000000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' de Establecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrTituloObservacion1: TQRLabel
        Left = 220
        Top = 4
        Width = 316
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          582.083333333333400000
          10.583333333333330000
          836.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELEVAMIENTO GENERAL DE RIESGOS LABORALES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrTituloObservacion: TQRLabel
        Left = 316
        Top = 18
        Width = 129
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          836.083333333333400000
          47.625000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrTituloObservacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoFormulario
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel57: TQRLabel
        Left = 0
        Top = 6
        Width = 34
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          0.000000000000000000
          15.875000000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel58: TQRLabel
        Left = 36
        Top = 6
        Width = 84
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          95.250000000000000000
          15.875000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '      /       /            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel70: TQRLabel
        Left = 89
        Top = 55
        Width = 95
        Height = 12
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          235.479166666666700000
          145.520833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '...............................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object edCuitObservacion: TQRLabel
        Left = 97
        Top = 48
        Width = 101
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          256.645833333333400000
          127.000000000000000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edCuitObservacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoCuit
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edNroEstableciObservacion: TQRLabel
        Left = 313
        Top = 48
        Width = 145
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          828.145833333333200000
          127.000000000000000000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edNroEstableciObservacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoEstab
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object ChildBand6: TQRChildBand
      Left = 19
      Top = 97
      Width = 778
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clBlack
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        2058.458333333333000000)
      ParentBand = QRBand3
      object QRLabel105: TQRLabel
        Left = 65
        Top = 7
        Width = 50
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.458333333333330000
          171.979166666666700000
          18.520833333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OBSERVACI'#211'N'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -7
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLabel106: TQRLabel
        Left = 399
        Top = 7
        Width = 88
        Height = 10
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          26.458333333333330000
          1055.687500000000000000
          18.520833333333330000
          232.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INFORMACI'#211'N ADICIONAL'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -7
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
    end
  end
  object qrPlanillaC: TQuickRep
    Left = 1678
    Top = 10
    Width = 816
    Height = 1344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = AntesDeImprimir
    DataSet = sdqSustQuimicas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39)
    IDReport = 0
    OnEndPage = CambioDeHoja
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 2
    Page.Orientation = poPortrait
    Page.PaperSize = Legal
    Page.Values = (
      50.000000000000000000
      3556.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
      5.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbPlanillaC: TQRBand
      Left = 19
      Top = 185
      Width = 388
      Height = 14
      Frame.Color = 12566463
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = AntesDelDetalle
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        37.041666666666670000
        1026.583333333333000000)
      BandType = rbDetail
      object QRDBText12: TQRDBText
        Left = 362
        Top = 1
        Width = 13
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          956.733333333333200000
          2.116666666666667000
          34.925000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustQuimicas
        DataField = 'CUMP_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintSIyNO
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText11: TQRDBText
        Left = 326
        Top = 1
        Width = 13
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          861.483333333333200000
          2.116666666666667000
          34.925000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustQuimicas
        DataField = 'CUMP_SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintSIyNO
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRShape18: TQRShape
        Left = 348
        Top = 0
        Width = 5
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666660000
          919.691666666666800000
          0.000000000000000000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 311
        Top = 0
        Width = 5
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666660000
          822.325000000000000000
          0.000000000000000000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBDescPlanillaC: TQRDBText
        Left = 4
        Top = 1
        Width = 227
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          10.583333333333330000
          2.645833333333333000
          600.604166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustQuimicas
        DataField = 'IT_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText2: TQRDBText
        Left = 235
        Top = 1
        Width = 75
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          622.300000000000000000
          2.116666666666667000
          197.908333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustQuimicas
        DataField = 'IT_MASDATOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRShape20: TQRShape
        Left = 232
        Top = 0
        Width = 5
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666660000
          613.833333333333400000
          0.000000000000000000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object TitleBand3: TQRBand
      Left = 19
      Top = 115
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = DespuesDelTitulo
      AlignToBottom = False
      BeforePrint = AntesDelTitulo
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbTitle
      object qrlTituloC: TQRLabel
        Left = 8
        Top = 12
        Width = 252
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          21.166666666666670000
          31.750000000000000000
          666.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLANILLA C | SUSTANCIAS QU'#205'MICAS A DECLARAR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 19
      Top = 155
      Width = 388
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clBlack
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1026.583333333333000000)
      BandType = rbColumnHeader
      object QRLabel19: TQRLabel
        Left = 85
        Top = 11
        Width = 50
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          224.895833333333300000
          29.104166666666670000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCRIPCI'#211'N'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel20: TQRLabel
        Left = 328
        Top = 11
        Width = 8
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          867.833333333333500000
          29.104166666666670000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'S'#205
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel21: TQRLabel
        Left = 362
        Top = 11
        Width = 13
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          957.791666666666800000
          29.104166666666670000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel86: TQRLabel
        Left = 251
        Top = 4
        Width = 38
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          664.104166666666800000
          10.583333333333330000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CANTIDAD'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel104: TQRLabel
        Left = 246
        Top = 12
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          650.875000000000000000
          31.750000000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UMBRAL (TN)'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        2058.458333333333000000)
      BandType = rbPageHeader
      object QRLabel60: TQRLabel
        Left = 220
        Top = 4
        Width = 316
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          582.083333333333400000
          10.583333333333330000
          836.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELEVAMIENTO GENERAL DE RIESGOS LABORALES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel61: TQRLabel
        Left = 316
        Top = 18
        Width = 97
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          836.083333333333400000
          47.625000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FORMULARIO A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoFormulario
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel71: TQRLabel
        Left = 284
        Top = 43
        Width = 83
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          751.416666666666800000
          113.770833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '.........................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel75: TQRLabel
        Left = 189
        Top = 40
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          500.062500000000100000
          105.833333333333300000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' de Establecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel76: TQRLabel
        Left = 84
        Top = 43
        Width = 95
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          113.770833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '...............................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object edCuitTituloC: TQRLabel
        Left = 97
        Top = 40
        Width = 73
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          256.645833333333400000
          105.833333333333300000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edCuitTituloC'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoCuit
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object edNroEstableciTituloC: TQRLabel
        Left = 313
        Top = 40
        Width = 117
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          828.145833333333200000
          105.833333333333300000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edNroEstableciTituloC'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoEstab
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel79: TQRLabel
        Left = 0
        Top = 6
        Width = 34
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          0.000000000000000000
          15.875000000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel80: TQRLabel
        Left = 36
        Top = 6
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          95.250000000000000000
          15.875000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '      /       /            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRImage3: TQRImage
        Left = 619
        Top = -1
        Width = 167
        Height = 67
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          176.388888888888900000
          1638.652777777778000000
          -3.527777777777778000
          440.972222222222200000)
        Stretch = True
      end
      object QRLabel74: TQRLabel
        Left = 2
        Top = 40
        Width = 91
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          5.291666666666667000
          105.833333333333300000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.U.I.T./C.U.I.P. N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand4: TQRBand
      Left = 19
      Top = 199
      Width = 778
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        2058.458333333333000000)
      BandType = rbPageFooter
      object QRSysData2: TQRSysData
        Left = 714
        Top = 13
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1889.125000000000000000
          34.395833333333340000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina '
        Transparent = False
        FontSize = 6
      end
      object QRLabel100: TQRLabel
        Left = 767
        Top = 13
        Width = 4
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          2029.354166666667000000
          34.395833333333340000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = lbCantPagPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape11: TQRShape
        Left = 0
        Top = 8
        Width = 60
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          35.416666666666670000
          0.000000000000000000
          20.833333333333330000
          159.375000000000000000)
        Brush.Color = clBlack
        Shape = qrsRoundRect
        RoundFactor = 0.109999999403953600
        VertAdjust = 0
      end
      object QRLabel101: TQRLabel
        Left = 9
        Top = 9
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          23.812500000000000000
          23.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PV-01-F001'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintTipoForm
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object ChildBand2: TQRChildBand
      Left = 19
      Top = 75
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      ParentBand = PageHeaderBand1
      object QRLabel78: TQRLabel
        Left = 8
        Top = 12
        Width = 252
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          21.166666666666670000
          31.750000000000000000
          666.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLANILLA C | SUSTANCIAS QU'#205'MICAS A DECLARAR'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object qrResolucion: TQuickRep
    Left = 8
    Top = 10
    Width = 816
    Height = 1344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqEmpresa
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
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Legal
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    ReportTitle = 'Formulario de Resoluci'#243'n'
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbTitle: TQRBand
      Left = 19
      Top = 84
      Width = 778
      Height = 225
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        595.312500000000000000
        2058.458333333333000000)
      BandType = rbTitle
      object QRShape1: TQRShape
        Left = 0
        Top = 80
        Width = 778
        Height = 120
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          317.500000000000000000
          0.000000000000000000
          211.666666666666700000
          2058.458333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 4
        Top = 83
        Width = 111
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          219.604166666666700000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre de la Empresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 4
        Top = 103
        Width = 108
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          272.520833333333300000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' de establecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 207
        Width = 504
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          547.687500000000000000
          1333.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'ESTADO DE CUMPLIMIENTO EN EL ESTABLECIMIENTO DE LA NORMATIVA VIG' +
          'ENTE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 59
        Width = 779
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333320000
          0.000000000000000000
          155.222222222222200000
          2061.986111111111000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel35: TQRLabel
        Left = 8
        Top = 61
        Width = 270
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          160.513888888888900000
          714.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATOS GENERALES DEL ESTABLECIMIENTO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrmEncabezado: TQRMemo
        Left = 0
        Top = 1
        Width = 778
        Height = 56
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          148.166666666666700000
          0.000000000000000000
          2.116666666666667000
          2058.458333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        Lines.Strings = (
          
            'El presente deber'#225' ser completado obligatoriamente en todos sus ' +
            'campos por el empleador o profesional responsable, revistiendo l' +
            'os datos all'#237' consignados car'#225'cter de declaraci'#243'n jurada.'
          
            'El relevamiento deber'#225' ser realizado para cada uno de los establ' +
            'ecimientos que disponga la empresa. Para los empleadores cuya ac' +
            'tividad se desarrolle en embarcaciones, las mismas ser'#225'n conside' +
            'radas como establecimientos.'
          
            'En caso de empresas de servicios eventuales, el empleador deber'#225 +
            ' llenar la declaraci'#243'n jurada en todos los campos correspondient' +
            'es a su responsabilidad, debiendo consignar por separado el nomb' +
            're o raz'#243'n social y domicilio de los empleadores donde esta pres' +
            'tando servicio.'
          
            'El presente relevamiento de estado de cumplimiento de la normati' +
            'va de salud higiene y seguridad laboral deber'#225' ser actualizado a' +
            'nualmente y presentado ante la ART a la que se encuentra afiliad' +
            'o.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel16: TQRLabel
        Left = 4
        Top = 123
        Width = 312
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          325.437500000000000000
          825.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo actividad Formulario AFIP N'#186' 150 (Res AFIP N'#186' 485/99)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 142
        Width = 163
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          375.708333333333300000
          431.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Breve descripci'#243'n de la actividad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 163
        Width = 46
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          431.270833333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Domicilio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 4
        Top = 183
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          484.187500000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 201
        Top = 183
        Width = 121
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          531.812500000000000000
          484.187500000000000000
          320.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo Postal Argentino'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 464
        Top = 183
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1227.666666666667000000
          484.187500000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Localidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 624
        Top = 183
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1651.000000000000000000
          484.187500000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tel'#233'fono'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 511
        Top = 83
        Width = 80
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1352.020833333333000000
          219.604166666666700000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.U.I.T./C.U.I.P. N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 236
        Top = 103
        Width = 200
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          624.416666666666700000
          272.520833333333300000
          529.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.I.I.U. (Actividad econ'#243'mica - Revisi'#243'n 3)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 540
        Top = 103
        Width = 180
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1428.750000000000000000
          272.520833333333300000
          476.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Superficie del establecimiento en m'#178
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 540
        Top = 123
        Width = 126
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1428.750000000000000000
          325.437500000000000000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cantidad de Trabajadores'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape30: TQRShape
        Left = 0
        Top = 180
        Width = 777
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.116666666666667000
          0.000000000000000000
          476.250000000000000000
          2056.341666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 0
        Top = 100
        Width = 777
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.116666666666667000
          0.000000000000000000
          264.583333333333400000
          2056.341666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 0
        Top = 120
        Width = 777
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.763888888888889000
          0.000000000000000000
          317.500000000000000000
          2056.694444444444000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 0
        Top = 160
        Width = 777
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.116666666666667000
          0.000000000000000000
          423.333333333333400000
          2056.341666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 0
        Top = 140
        Width = 777
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1.763888888888889000
          0.000000000000000000
          370.416666666666700000
          2056.694444444444000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object edNombreEmpresa: TQRLabel
        Left = 126
        Top = 83
        Width = 90
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          333.375000000000000000
          219.604166666666700000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre Empresa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edNroEstablecimiento: TQRLabel
        Left = 117
        Top = 103
        Width = 105
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          309.562500000000000000
          272.520833333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NroEstablecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoEstab
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edCUITCUIP: TQRLabel
        Left = 606
        Top = 83
        Width = 48
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1603.375000000000000000
          219.604166666666700000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUITCUIP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoCuit
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edSupEstab: TQRLabel
        Left = 724
        Top = 103
        Width = 51
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1915.583333333333000000
          272.520833333333300000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SupEstab'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edCantidadTrabajadores: TQRLabel
        Left = 669
        Top = 123
        Width = 117
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1770.062500000000000000
          325.437500000000000000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CantidadTrabajadores'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edDescActividad: TQRLabel
        Left = 171
        Top = 142
        Width = 114
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          452.437500000000000000
          375.708333333333300000
          301.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DescripcionActividad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edDomicilio: TQRLabel
        Left = 55
        Top = 163
        Width = 51
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          145.520833333333300000
          431.270833333333300000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Domicilio'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edProvincia: TQRLabel
        Left = 55
        Top = 183
        Width = 50
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          145.520833333333300000
          484.187500000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edCodigoPostal: TQRLabel
        Left = 326
        Top = 183
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          862.541666666666700000
          484.187500000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CodigoPostal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edCIIU: TQRLabel
        Left = 441
        Top = 103
        Width = 21
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1166.812500000000000000
          272.520833333333300000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CIIU'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edResAFIP: TQRLabel
        Left = 319
        Top = 123
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          844.020833333333300000
          325.437500000000000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ResAFIP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edLocalidad: TQRLabel
        Left = 516
        Top = 183
        Width = 51
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1365.250000000000000000
          484.187500000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Localidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edTelefono: TQRLabel
        Left = 672
        Top = 183
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1778.000000000000000000
          484.187500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telefono'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabelNormativa: TQRLabel
        Left = 504
        Top = 207
        Width = 117
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1333.500000000000000000
          547.687500000000000000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabelNormativa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = QRLabelNormativaPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbDetail1: TQRBand
      Left = 19
      Top = 347
      Width = 778
      Height = 13
      Frame.Color = 12566463
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbDetail1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        34.395833333333330000
        2058.458333333333000000)
      BandType = rbDetail
      object qrdbtDescripcion: TQRDBText
        Left = 21
        Top = 1
        Width = 436
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          55.562500000000000000
          2.645833333333333000
          1153.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'IA_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText3: TQRDBText
        Left = 2
        Top = 1
        Width = 16
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.208333333333340000
          5.208333333333334000
          2.083333333333333000
          42.708333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'IA_NRODESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object lbSi: TQRDBText
        Left = 466
        Top = 1
        Width = 10
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.633333333333340000
          1231.900000000000000000
          2.116666666666667000
          26.458333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'SICUMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintCheck
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object lbNo: TQRDBText
        Left = 479
        Top = 1
        Width = 14
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.633333333333340000
          1267.883333333333000000
          2.116666666666667000
          37.041666666666660000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'NOCUMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintCheck
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object lbNoAplica: TQRDBText
        Left = 506
        Top = 1
        Width = 10
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.633333333333340000
          1337.733333333333000000
          2.116666666666667000
          26.458333333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'NOAPCUMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintCheck
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBArticulos: TQRDBText
        Left = 579
        Top = 0
        Width = 31
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1531.937500000000000000
          0.000000000000000000
          82.020833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'ia_normativa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = AgrandoLetra
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object qrsLineaV1: TQRShape
        Left = 18
        Top = 0
        Width = 4
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          47.625000000000000000
          0.000000000000000000
          10.583333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsLineaV2: TQRShape
        Left = 462
        Top = 0
        Width = 4
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1222.375000000000000000
          0.000000000000000000
          10.583333333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsLineaV3: TQRShape
        Left = 475
        Top = 0
        Width = 4
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1257.300000000000000000
          0.000000000000000000
          10.583333333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsLineaV4: TQRShape
        Left = 492
        Top = 0
        Width = 4
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1302.808333333333000000
          0.000000000000000000
          10.583333333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsLineaV5: TQRShape
        Left = 526
        Top = 0
        Width = 4
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1391.708333333333000000
          0.000000000000000000
          10.583333333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrsLineaV6: TQRShape
        Left = 576
        Top = 0
        Width = 4
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1524.000000000000000000
          0.000000000000000000
          10.583333333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText13: TQRDBText
        Left = 530
        Top = 1
        Width = 47
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          30.691666666666670000
          1401.233333333333000000
          2.116666666666667000
          124.883333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'IL_FECHAREGULARIZACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintCheck
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText16: TQRDBText
        Left = 739
        Top = 0
        Width = 37
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1955.270833333333000000
          0.000000000000000000
          97.895833333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'ia_normativabis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = AgrandoLetra
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRDBText17: TQRDBText
        Left = 579
        Top = 6
        Width = 34
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1531.937500000000000000
          15.875000000000000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'ia_normativa2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
      object QRDBText18: TQRDBText
        Left = 736
        Top = 6
        Width = 40
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1947.333333333333000000
          15.875000000000000000
          105.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqEmpresa
        DataField = 'ia_normativabis2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 4
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 65
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        171.979166666666700000
        2058.458333333333000000)
      BandType = rbPageHeader
      object logo: TQRImage
        Left = 619
        Top = -1
        Width = 167
        Height = 67
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          177.270833333333300000
          1637.770833333333000000
          -2.645833333333333000
          441.854166666666700000)
        AutoSize = True
      end
      object lbAnexo: TQRLabel
        Left = 309
        Top = 55
        Width = 83
        Height = 14
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          817.562500000000000000
          145.520833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '.........................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlNroEstablecimiento: TQRLabel
        Left = 189
        Top = 48
        Width = 118
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          500.062500000000000000
          127.000000000000000000
          312.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' de Establecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel30: TQRLabel
        Left = 246
        Top = 2
        Width = 285
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          650.875000000000000000
          5.291666666666667000
          754.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELEVAMIENTO GENERAL DE RIESGOS LABORALES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrTituloForm: TQRLabel
        Left = 345
        Top = 17
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          912.812500000000000000
          44.979166666666670000
          232.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FORMULARIO A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoFormulario
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel32: TQRLabel
        Left = 0
        Top = 6
        Width = 34
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          15.875000000000000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 36
        Top = 6
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          95.250000000000000000
          15.875000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '      /       /            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = QRLabel33Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 89
        Top = 55
        Width = 95
        Height = 12
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          235.479166666666700000
          145.520833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '...............................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object edCuitTitulo: TQRLabel
        Left = 97
        Top = 48
        Width = 48
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          256.645833333333300000
          127.000000000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUITCUIP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoCuit
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object edNroEstableciTitulo: TQRLabel
        Left = 313
        Top = 48
        Width = 48
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          828.145833333333300000
          127.000000000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUITCUIP'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoEstab
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object qrlCUITCUIP: TQRLabel
        Left = 2
        Top = 48
        Width = 91
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          5.291666666666667000
          127.000000000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.U.I.T./C.U.I.P. N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel55: TQRLabel
        Left = 164
        Top = 32
        Width = 242
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          433.916666666666700000
          84.666666666666670000
          640.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ANEXO DE LA SOLICITUD DE AFILIACI'#211'N N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lbNumeroSolicitud: TQRLabel
        Left = 412
        Top = 32
        Width = 201
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1090.083333333333000000
          84.666666666666670000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '00051-99999999999-99999999'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object PageFooterBand2: TQRBand
      Left = 19
      Top = 360
      Width = 778
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        2058.458333333333000000)
      BandType = rbPageFooter
      object qrData: TQRSysData
        Left = 714
        Top = 13
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1889.125000000000000000
          34.395833333333330000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina '
        Transparent = False
        FontSize = 6
      end
      object lbCantPag: TQRLabel
        Left = 767
        Top = 13
        Width = 4
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          2029.354166666667000000
          34.395833333333330000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = lbCantPagPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape5: TQRShape
        Left = 0
        Top = 8
        Width = 60
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          35.416666666666670000
          0.000000000000000000
          20.833333333333330000
          159.375000000000000000)
        Brush.Color = clBlack
        Shape = qrsRoundRect
        RoundFactor = 0.109999999403953600
        VertAdjust = 0
      end
      object QRLabel89: TQRLabel
        Left = 9
        Top = 9
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          23.812500000000000000
          23.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PV-01-F001'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintTipoForm
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object QRGroup2: TQRGroup
      Left = 19
      Top = 309
      Width = 778
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clBlack
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2058.458333333333000000)
      Master = qrResolucion
      ReprintOnNewPage = True
      object QRLabel96: TQRLabel
        Left = 1
        Top = 0
        Width = 20
        Height = 25
        Frame.Color = clWhite
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          66.675000000000000000
          2.116666666666667000
          0.000000000000000000
          53.974999999999990000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' '
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRLabel95: TQRLabel
        Left = 530
        Top = 0
        Width = 49
        Height = 25
        Frame.Color = clWhite
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1402.291666666667000000
          0.000000000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' '
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRLabel94: TQRLabel
        Left = 494
        Top = 0
        Width = 35
        Height = 25
        Frame.Color = clWhite
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1307.041666666667000000
          0.000000000000000000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' '
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRLabel93: TQRLabel
        Left = 477
        Top = 0
        Width = 18
        Height = 25
        Frame.Color = clWhite
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1262.062500000000000000
          0.000000000000000000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' '
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRLabel92: TQRLabel
        Left = 463
        Top = 0
        Width = 15
        Height = 25
        Frame.Color = clWhite
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1225.020833333333000000
          0.000000000000000000
          39.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' '
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object qrLabelNormativaVig: TQRLabel
        Left = 616
        Top = 6
        Width = 101
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1629.833333333333000000
          15.875000000000000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NORMATIVA VIGENTE'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrLabelPRS: TQRLabel
        Left = 537
        Top = 2
        Width = 29
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1420.812500000000000000
          5.291666666666667000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FECHA'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel90: TQRLabel
        Left = 531
        Top = 16
        Width = 43
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1404.937500000000000000
          42.333333333333330000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REGULARIZACI'#211'N'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -5
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 4
      end
      object QRLabel91: TQRLabel
        Left = 495
        Top = 13
        Width = 32
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1309.687500000000000000
          34.395833333333330000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'APLICA'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 505
        Top = 2
        Width = 14
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1336.145833333333000000
          5.291666666666667000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'NO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRLabel11: TQRLabel
        Left = 479
        Top = 7
        Width = 14
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1267.354166666667000000
          18.520833333333330000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 129
        Top = 6
        Width = 188
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          341.312500000000000000
          15.875000000000000000
          497.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EMPRESAS: CONDICIONES A CUMPLIR'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = PrintHeader
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 6
        Top = 7
        Width = 11
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          15.875000000000000000
          18.520833333333330000
          29.104166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 465
        Top = 7
        Width = 9
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1230.312500000000000000
          18.520833333333330000
          23.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'S'#205
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRGroup1: TQRGroup
      Left = 19
      Top = 334
      Width = 778
      Height = 13
      Frame.Color = clWhite
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDetail1
      ParentFont = False
      Size.Values = (
        34.395833333333330000
        2058.458333333333000000)
      Expression = 'TA_DESCRIPCION'
      Master = qrResolucion
      ReprintOnNewPage = True
      object QRDBText1: TQRDBText
        Left = 22
        Top = 2
        Width = 60
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          58.208333333333330000
          5.291666666666667000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clBlack
        DataSet = sdqEmpresa
        DataField = 'TA_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
  end
  object qrPlanillaA: TQuickRep
    Left = 849
    Top = 6
    Width = 816
    Height = 1344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = AntesDeImprimir
    DataSet = sdqSustAgentesCan
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39)
    IDReport = 0
    OnEndPage = CambioDeHoja
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 2
    Page.Orientation = poPortrait
    Page.PaperSize = Legal
    Page.Values = (
      50.000000000000000000
      3556.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
      5.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbPlanillaA: TQRBand
      Left = 19
      Top = 179
      Width = 388
      Height = 14
      Frame.Color = 12566463
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = AntesDelDetalle
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        37.041666666666670000
        1026.583333333333000000)
      BandType = rbDetail
      object QRShape7: TQRShape
        Left = 351
        Top = 0
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.450000000000000000
          928.158333333333400000
          0.000000000000000000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 319
        Top = 0
        Width = 5
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.450000000000000000
          843.491666666666800000
          0.000000000000000000
          13.758333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBDescPlanillaA: TQRDBText
        Left = 3
        Top = 1
        Width = 311
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          8.466666666666668000
          2.116666666666667000
          823.383333333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustAgentesCan
        DataField = 'IT_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 322
        Top = 1
        Width = 31
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          851.958333333333400000
          2.645833333333333000
          82.020833333333340000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustAgentesCan
        DataField = 'CUMP_SI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintSIyNO
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRDBText6: TQRDBText
        Left = 353
        Top = 1
        Width = 35
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          933.979166666666600000
          2.645833333333333000
          92.604166666666680000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = sdqSustAgentesCan
        DataField = 'CUMP_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintSIyNO
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
    end
    object qrbColumnHeader: TQRBand
      Left = 19
      Top = 155
      Width = 388
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = AntesDelColumnHeader
      Color = clBlack
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1026.583333333333000000)
      BandType = rbColumnHeader
      object QRLabel36: TQRLabel
        Left = 112
        Top = 4
        Width = 50
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          296.333333333333400000
          10.583333333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCRIPCI'#211'N'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel37: TQRLabel
        Left = 334
        Top = 4
        Width = 8
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          883.708333333333400000
          10.583333333333330000
          21.166666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'S'#205
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel38: TQRLabel
        Left = 364
        Top = 4
        Width = 13
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          963.083333333333400000
          10.583333333333330000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object TitleBand2: TQRBand
      Left = 19
      Top = 115
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = DespuesDelTitulo
      AlignToBottom = False
      BeforePrint = AntesDelTitulo
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      BandType = rbTitle
      object qrlTituloA: TQRLabel
        Left = 4
        Top = 12
        Width = 337
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          31.750000000000000000
          891.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLANILLA A | LISTADO DE SUSTANCIAS Y AGENTES CANCER'#205'GENOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageHeaderBand2: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        2058.458333333333000000)
      BandType = rbPageHeader
      object QRLabel62: TQRLabel
        Left = 220
        Top = 4
        Width = 316
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          582.083333333333400000
          10.583333333333330000
          836.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELEVAMIENTO GENERAL DE RIESGOS LABORALES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel63: TQRLabel
        Left = 316
        Top = 18
        Width = 97
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          836.083333333333400000
          47.625000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FORMULARIO A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoFormulario
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel66: TQRLabel
        Left = 284
        Top = 43
        Width = 83
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          751.416666666666800000
          113.770833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '.........................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel68: TQRLabel
        Left = 189
        Top = 40
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          500.062500000000100000
          105.833333333333300000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' de Establecimiento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel69: TQRLabel
        Left = 84
        Top = 43
        Width = 95
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          113.770833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '...............................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object edCuitTituloA: TQRLabel
        Left = 97
        Top = 40
        Width = 74
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          256.645833333333400000
          105.833333333333300000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edCuitTituloA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoCuit
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object edNroEstableciTituloA: TQRLabel
        Left = 313
        Top = 40
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          828.145833333333200000
          105.833333333333300000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'edNroEstableciTituloA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        OnPrint = CompletoEstab
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel72: TQRLabel
        Left = 36
        Top = 6
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          95.250000000000000000
          15.875000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '      /       /            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel73: TQRLabel
        Left = 0
        Top = 6
        Width = 34
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          15.875000000000000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRImage1: TQRImage
        Left = 619
        Top = -1
        Width = 167
        Height = 67
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          176.388888888888900000
          1638.652777777778000000
          -3.527777777777778000
          440.972222222222200000)
        Stretch = True
      end
      object QRLabel67: TQRLabel
        Left = 2
        Top = 40
        Width = 91
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          5.291666666666667000
          105.833333333333300000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.U.I.T./C.U.I.P. N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand1: TQRBand
      Left = 19
      Top = 193
      Width = 778
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2058.458333333333000000)
      BandType = rbSummary
      object QRLabel98: TQRLabel
        Left = -372
        Top = 9
        Width = 566
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          -984.250000000000000000
          23.812500000000000000
          1497.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'La codificaci'#243'n aqu'#237' representada corresponde al listado de c'#243'di' +
          'gos de agentes de riesgo normado en la Disposici'#243'n G.P. y C. N'#176' ' +
          '005 de fecha de 10 de Mayo de 2005.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 215
      Width = 778
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        2058.458333333333000000)
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 714
        Top = 13
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1889.125000000000000000
          34.395833333333340000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina '
        Transparent = False
        FontSize = 6
      end
      object QRLabel97: TQRLabel
        Left = 767
        Top = 13
        Width = 4
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          2029.354166666667000000
          34.395833333333340000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = lbCantPagPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 8
        Width = 60
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          35.416666666666670000
          0.000000000000000000
          20.833333333333330000
          159.375000000000000000)
        Brush.Color = clBlack
        Shape = qrsRoundRect
        RoundFactor = 0.109999999403953600
        VertAdjust = 0
      end
      object QRLabel99: TQRLabel
        Left = 9
        Top = 9
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          23.812500000000000000
          23.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PV-01-F001'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintTipoForm
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object ChildBand3: TQRChildBand
      Left = 19
      Top = 75
      Width = 778
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2058.458333333333000000)
      ParentBand = PageHeaderBand2
      object QRLabel85: TQRLabel
        Left = 4
        Top = 12
        Width = 337
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          10.583333333333330000
          31.750000000000000000
          891.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLANILLA A | LISTADO DE SUSTANCIAS Y AGENTES CANCER'#205'GENOS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object qrPieReporte: TQuickRep
    Left = 7
    Top = 1394
    Width = 816
    Height = 1344
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39)
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Legal
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Native
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object TitleBand1: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        2058.458333333333000000)
      BandType = rbTitle
      object QRMemo4: TQRMemo
        Left = 3
        Top = 4
        Width = 731
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          7.937500000000000000
          10.583333333333330000
          1934.104166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        Lines.Strings = (
          
            '[*]Cantidad umbral: designa respecto de una sustancia o categor'#237 +
            'a de sustancias peligrosas la cantidad fijada para cada establec' +
            'imiento por la legislaci'#243'n nacional con referencia a condiciones' +
            ' espec'#237'ficas que, si se sobrepasa, identifica una instalaci'#243'n ex' +
            'puesta a riesgos de accidentes mayores. La cantidad umbral se re' +
            'fiere a cada establecimiento. Las cantidades umbrales son las ma' +
            'ximas que est'#233'n presentes, o puedan estarlo, en un momento dado.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object ChildBand5: TQRChildBand
      Left = 19
      Top = 61
      Width = 778
      Height = 407
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1076.854166666667000000
        2058.458333333333000000)
      ParentBand = TitleBand1
      object QRShape42: TQRShape
        Left = 75
        Top = 248
        Width = 158
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          53.974999999999990000
          198.966666666666700000
          657.225000000000000000
          419.099999999999900000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape39: TQRShape
        Left = 75
        Top = 228
        Width = 158
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          53.974999999999990000
          198.966666666666700000
          604.308333333333400000
          419.099999999999900000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 75
        Top = 208
        Width = 158
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          198.966666666666700000
          550.333333333333400000
          419.099999999999900000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Left = 632
        Top = 248
        Width = 112
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          53.974999999999990000
          1672.166666666667000000
          657.225000000000000000
          296.333333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape57: TQRShape
        Left = 632
        Top = 228
        Width = 112
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          53.974999999999990000
          1672.166666666667000000
          604.308333333333400000
          296.333333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 632
        Top = 208
        Width = 112
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1672.166666666667000000
          550.333333333333400000
          296.333333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Left = 541
        Top = 248
        Width = 92
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1430.866666666667000000
          656.166666666666600000
          242.358333333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape54: TQRShape
        Left = 541
        Top = 228
        Width = 92
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1430.866666666667000000
          603.250000000000000000
          242.358333333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape53: TQRShape
        Left = 541
        Top = 208
        Width = 92
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1430.866666666667000000
          550.333333333333400000
          242.358333333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape41: TQRShape
        Left = 447
        Top = 248
        Width = 94
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1183.216666666667000000
          656.166666666666600000
          248.708333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 447
        Top = 228
        Width = 94
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1183.216666666667000000
          603.250000000000000000
          248.708333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 447
        Top = 208
        Width = 94
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          1183.216666666667000000
          550.333333333333400000
          248.708333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape52: TQRShape
        Left = 368
        Top = 248
        Width = 80
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          973.666666666666900000
          656.166666666666600000
          210.608333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape51: TQRShape
        Left = 368
        Top = 228
        Width = 80
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          973.666666666666900000
          603.250000000000000000
          210.608333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape50: TQRShape
        Left = 368
        Top = 208
        Width = 80
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          973.666666666666900000
          550.333333333333400000
          210.608333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Left = 279
        Top = 248
        Width = 89
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          738.716666666666800000
          656.166666666666600000
          236.008333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 279
        Top = 228
        Width = 89
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          738.716666666666800000
          603.250000000000000000
          236.008333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 279
        Top = 208
        Width = 89
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          738.716666666666800000
          550.333333333333400000
          236.008333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 233
        Top = 248
        Width = 46
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          617.008333333333400000
          656.166666666666600000
          122.766666666666700000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 233
        Top = 228
        Width = 46
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          617.008333333333400000
          603.250000000000000000
          122.766666666666700000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 233
        Top = 208
        Width = 46
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          617.008333333333400000
          550.333333333333400000
          122.766666666666700000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 4
        Top = 248
        Width = 72
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          10.583333333333340000
          656.166666666666600000
          189.441666666666700000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Left = 4
        Top = 228
        Width = 72
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          10.583333333333340000
          603.250000000000000000
          189.441666666666700000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 4
        Top = 208
        Width = 72
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          10.583333333333340000
          550.333333333333400000
          189.441666666666700000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel27: TQRLabel
        Left = 3
        Top = 7
        Width = 353
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          7.937500000000000000
          18.520833333333330000
          933.979166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'EN CASO DE CONTAR CON DELEGADOS GREMIALES INDIQUE EL N'#186' DE LEGAJ' +
          'O CONFORME A LA INSCRIPCI'#211'N EN EL MINISTERIO DE TRABAJO, EMPLEO ' +
          'Y SEGURIDAD SOCIAL.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel28: TQRLabel
        Left = 519
        Top = 7
        Width = 216
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          1373.187500000000000000
          18.520833333333330000
          571.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'EN EL CASO DE ENCOMENDAR TAREAS A CONTRATISTAS, INDICAR EL N'#186' DE' +
          ' C.U.I.T. DEL O LOS MISMOS.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape2: TQRShape
        Left = 4
        Top = 35
        Width = 496
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          92.604166666666680000
          1312.333333333333000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 7
        Top = 39
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          103.187500000000000000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' DE LEGAJO DEL GREMIO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel34: TQRLabel
        Left = 280
        Top = 39
        Width = 83
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          740.833333333333400000
          103.187500000000000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOMBRE DEL GREMIO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape14: TQRShape
        Left = 512
        Top = 53
        Width = 228
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1354.666666666667000000
          140.229166666666700000
          603.250000000000000000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 512
        Top = 73
        Width = 228
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1354.666666666667000000
          193.145833333333300000
          603.250000000000000000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape34: TQRShape
        Left = 512
        Top = 93
        Width = 228
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1354.666666666667000000
          246.062500000000000000
          603.250000000000000000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 7
        Top = 120
        Width = 573
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          18.520833333333330000
          317.500000000000000000
          1516.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 
          'DATOS DE LOS PROFESIONALES QUE PRESTAN SERVICIO DE HyS EN EL TRA' +
          'BAJO, MEDICINA LABORAL Y RESPONSABLE DE LOS DATOS DEL FORMULARIO' +
          '.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo2: TQRMemo
        Left = 6
        Top = 132
        Width = 372
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          15.875000000000000000
          349.250000000000000000
          984.249999999999900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        Lines.Strings = (
          'CARGO'
          'H = Profesional de Higiene y Seguridad en el Trabajo'
          'M = Profesional de Medicina Laboral'
          
            'R = Responsable de los datos del formulario en caso que no sea n' +
            'inguno de los profesionales mencionados anteriormente de HyS o M' +
            'edicina Laboral')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRMemo3: TQRMemo
        Left = 434
        Top = 132
        Width = 256
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          1148.291666666667000000
          349.250000000000000000
          677.333333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        Lines.Strings = (
          'REPRESENTACI'#211'N'
          '> Representante Legal     > Director General'
          '> Presidente                     > Administrador General'
          '> Vicepresidente              > Otro'
          '> Gerente General           ')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape6: TQRShape
        Left = 4
        Top = 184
        Width = 740
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          10.583333333333330000
          486.833333333333400000
          1957.916666666667000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel41: TQRLabel
        Left = 7
        Top = 185
        Width = 59
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          18.520833333333330000
          489.479166666666600000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'C.U.I.T. / C.U.I.L.         C.U.I.P.'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRLabel42: TQRLabel
        Left = 129
        Top = 188
        Width = 80
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          341.312500000000000000
          497.416666666666700000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOMBRE Y APELLIDO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel43: TQRLabel
        Left = 559
        Top = 188
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1479.020833333333000000
          497.416666666666700000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' MATR'#205'CULA'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel44: TQRLabel
        Left = 245
        Top = 188
        Width = 26
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          648.229166666666800000
          497.416666666666700000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CARGO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel45: TQRLabel
        Left = 290
        Top = 188
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          767.291666666666800000
          497.416666666666700000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REPRESENTACI'#211'N'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel46: TQRLabel
        Left = 382
        Top = 185
        Width = 53
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          1010.708333333333000000
          489.479166666666600000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = '    PROPIO / CONTRATADO'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel47: TQRLabel
        Left = 457
        Top = 188
        Width = 75
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1209.145833333333000000
          497.416666666666700000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TITULO HABITANTE'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel48: TQRLabel
        Left = 642
        Top = 184
        Width = 92
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          1698.625000000000000000
          486.833333333333400000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = ' ENTIDAD QUE OTORGO EL TITULO HABILITANTE'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel49: TQRLabel
        Left = 2
        Top = 275
        Width = 737
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          5.291666666666667000
          727.604166666666800000
          1949.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 
          'El que suscribe en el car'#225'cter de responsable firmante declara b' +
          'ajo juramento que los datos consignados en la presente son corre' +
          'ctos y completos, y que esta declaraci'#243'n ha sido confeccionada s' +
          'in omitir ni falsear dato alguno que deba contener, siendo fiel ' +
          'expresi'#243'n de la verdad.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object s: TQRShape
        Left = 14
        Top = 384
        Width = 294
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          37.041666666666670000
          1016.000000000000000000
          777.875000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel50: TQRLabel
        Left = 15
        Top = 388
        Width = 290
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          39.687500000000000000
          1026.583333333333000000
          767.291666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 
          'FIRMA, ACLARACI'#211'N Y SELLO DEL RESPONSABLE DE LOS DATOS DECLARADO' +
          'S'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape59: TQRShape
        Left = 432
        Top = 384
        Width = 218
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1143.000000000000000000
          1016.000000000000000000
          576.791666666666800000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel51: TQRLabel
        Left = 435
        Top = 388
        Width = 212
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1150.937500000000000000
          1026.583333333333000000
          560.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'FIRMA, ACLARACI'#211'N Y SELLO DEL RESPONSABLE DE HyS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edCuitContratista1: TQRLabel
        Left = 536
        Top = 58
        Width = 69
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1418.166666666667000000
          153.458333333333300000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUIT CONTRATISTA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edCuitContratista2: TQRLabel
        Left = 536
        Top = 78
        Width = 69
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1418.166666666667000000
          206.375000000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUIT CONTRATISTA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edCuitContratista3: TQRLabel
        Left = 536
        Top = 98
        Width = 69
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1418.166666666667000000
          259.291666666666700000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUIT CONTRATISTA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edCuitResponsable2: TQRLabel
        Left = 6
        Top = 232
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          15.875000000000000000
          613.833333333333400000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUIT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edCuitResponsable3: TQRLabel
        Left = 6
        Top = 252
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          15.875000000000000000
          666.750000000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUIT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edNombreyApellidoResp3: TQRLabel
        Left = 82
        Top = 250
        Width = 147
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          216.958333333333400000
          661.458333333333400000
          388.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Nombre y Apellido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edNombreyApellidoResp2: TQRLabel
        Left = 82
        Top = 229
        Width = 147
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          216.958333333333400000
          605.895833333333400000
          388.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Nombre y Apellido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edNombreyApellidoResp1: TQRLabel
        Left = 82
        Top = 208
        Width = 147
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          216.958333333333400000
          550.333333333333400000
          388.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Nombre y Apellido'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edCargoResp2: TQRLabel
        Left = 238
        Top = 232
        Width = 20
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          629.708333333333400000
          613.833333333333400000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edCargoResp1: TQRLabel
        Left = 238
        Top = 212
        Width = 20
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          629.708333333333400000
          560.916666666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edCargoResp3: TQRLabel
        Left = 238
        Top = 252
        Width = 20
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          629.708333333333400000
          666.750000000000000000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cargo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edRepresentacionResp2: TQRLabel
        Left = 281
        Top = 232
        Width = 86
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          743.479166666666800000
          613.833333333333400000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Representacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edRepresentacionResp1: TQRLabel
        Left = 281
        Top = 212
        Width = 86
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          743.479166666666800000
          560.916666666666800000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Representacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edRepresentacionResp3: TQRLabel
        Left = 281
        Top = 252
        Width = 86
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          743.479166666666800000
          666.750000000000000000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Representacion'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edPropioContratadoResp3: TQRLabel
        Left = 374
        Top = 252
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          989.541666666666800000
          666.750000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Propio/Contratado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edPropioContratadoResp2: TQRLabel
        Left = 374
        Top = 232
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          989.541666666666800000
          613.833333333333400000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Propio/Contratado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edPropioContratadoResp1: TQRLabel
        Left = 374
        Top = 212
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          989.541666666666800000
          560.916666666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Propio/Contratado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edTituloHabitanteResp1: TQRLabel
        Left = 449
        Top = 212
        Width = 91
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1187.979166666667000000
          560.916666666666800000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TituloHabitante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edTituloHabitanteResp2: TQRLabel
        Left = 449
        Top = 232
        Width = 91
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1187.979166666667000000
          613.833333333333400000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TituloHabitante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edTituloHabitanteResp3: TQRLabel
        Left = 449
        Top = 252
        Width = 91
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1187.979166666667000000
          666.750000000000000000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TituloHabitante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edNroMatriculaResp1: TQRLabel
        Left = 546
        Top = 212
        Width = 45
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1444.625000000000000000
          560.916666666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NroMatricula'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edNroMatriculaResp2: TQRLabel
        Left = 546
        Top = 232
        Width = 45
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1444.625000000000000000
          613.833333333333400000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NroMatricula'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edNroMatriculaResp3: TQRLabel
        Left = 546
        Top = 252
        Width = 45
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1444.625000000000000000
          666.750000000000000000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NroMatricula'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edEntidadOtorgaResp3: TQRLabel
        Left = 634
        Top = 252
        Width = 105
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1677.458333333333000000
          666.750000000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EntidadOtorgante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edEntidadOtorgaResp2: TQRLabel
        Left = 634
        Top = 232
        Width = 105
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1677.458333333333000000
          613.833333333333400000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EntidadOtorgante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object edEntidadOtorgaResp1: TQRLabel
        Left = 634
        Top = 212
        Width = 105
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1677.458333333333000000
          560.916666666666800000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EntidadOtorgante'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRShape62: TQRShape
        Left = 512
        Top = 35
        Width = 228
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1354.666666666667000000
          92.604166666666680000
          603.250000000000000000)
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel39: TQRLabel
        Left = 591
        Top = 39
        Width = 49
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1563.687500000000000000
          103.187500000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' DE C.U.I.T.'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape13: TQRShape
        Left = 176
        Top = 53
        Width = 324
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          464.608333333333400000
          140.758333333333400000
          858.308333333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 175
        Top = 73
        Width = 325
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          463.020833333333400000
          193.145833333333300000
          859.895833333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 175
        Top = 93
        Width = 325
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          463.020833333333400000
          246.062500000000000000
          859.895833333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 4
        Top = 73
        Width = 172
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          10.583333333333330000
          193.145833333333300000
          455.083333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 4
        Top = 93
        Width = 172
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          10.583333333333330000
          246.062500000000000000
          455.083333333333300000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object edCuitResponsable1: TQRLabel
        Left = 6
        Top = 212
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          15.875000000000000000
          560.916666666666700000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUIT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 6
      end
      object QRShape12: TQRShape
        Left = 4
        Top = 53
        Width = 172
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.033333333333330000
          10.583333333333340000
          140.758333333333400000
          455.083333333333400000)
        Pen.Color = 12566463
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object edLegajoGremio1: TQRLabel
        Left = 5
        Top = 58
        Width = 70
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          153.458333333333300000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LEGAJO DEL GREMIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edLegajoGremio2: TQRLabel
        Left = 5
        Top = 78
        Width = 70
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          206.375000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LEGAJO DEL GREMIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edLegajoGremio3: TQRLabel
        Left = 5
        Top = 98
        Width = 70
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          259.291666666666700000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LEGAJO DEL GREMIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edNombreGremio1: TQRLabel
        Left = 272
        Top = 58
        Width = 75
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          719.666666666666800000
          153.458333333333300000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOMBRE DEL GREMIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edNombreGremio2: TQRLabel
        Left = 272
        Top = 78
        Width = 75
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          719.666666666666800000
          206.375000000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOMBRE DEL GREMIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object edNombreGremio3: TQRLabel
        Left = 272
        Top = 98
        Width = 75
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          719.666666666666800000
          259.291666666666700000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOMBRE DEL GREMIO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object ChildBand4: TQRChildBand
      Left = 19
      Top = 468
      Width = 778
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        2058.458333333333000000)
      ParentBand = ChildBand5
      object QRSysData5: TQRSysData
        Left = 714
        Top = 13
        Width = 52
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1889.125000000000000000
          34.395833333333340000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina '
        Transparent = False
        FontSize = 6
      end
      object QRLabel54: TQRLabel
        Left = 767
        Top = 13
        Width = 4
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          2029.354166666667000000
          34.395833333333340000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = lbCantPagPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape22: TQRShape
        Left = 0
        Top = 8
        Width = 60
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          35.416666666666670000
          0.000000000000000000
          20.833333333333330000
          159.375000000000000000)
        Brush.Color = clBlack
        Shape = qrsRoundRect
        RoundFactor = 0.109999999403953600
        VertAdjust = 0
      end
      object QRLabel56: TQRLabel
        Left = 9
        Top = 9
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          23.812500000000000000
          23.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PV-01-F001'
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Neo Sans'
        Font.Style = []
        OnPrint = PrintTipoForm
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
  end
  object sdqEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ta_descripcion, ra_titulo, ia_nrodescripcion, ia_descri' +
        'pcion, DECODE(st_cumplimiento, '#39'S'#39', '#39'X'#39', '#39#39') AS sicump,'
      
        '         DECODE(st_cumplimiento, '#39'N'#39', '#39'X'#39', '#39#39') AS nocump, DECODE' +
        '(st_cumplimiento, '#39'X'#39', '#39'X'#39', '#39#39') AS noapcump,'
      
        '         st_fecharegularizacion, ia_sololectura,                ' +
        '                                --ia_normativa, ia_normativabis,'
      
        '                                                LENGTH(NVL(ia_no' +
        'rmativa, 0)) + LENGTH(NVL(ia_normativabis, 0)) AS largo,'
      
        '         NVL(ia_normativa, '#39#39') || '#39' '#39' || NVL(ia_normativabis, '#39#39 +
        ') AS articulos,'
      '         CASE'
      '           WHEN(LENGTH(NVL(ia_normativa, 0)) > 40)'
      
        '           AND (LENGTH(NVL(ia_normativa, 0)) + LENGTH(NVL(ia_nor' +
        'mativabis, 0)) > 80) THEN TRIM(SUBSTR(ia_normativa, 1,'
      
        '                                                                ' +
        '                                      INSTR(ia_normativa, '#39' '#39','
      
        '                                                                ' +
        '                                            39)))'
      '           ELSE ia_normativa'
      '         END AS ia_normativa,'
      '         CASE'
      '           WHEN(LENGTH(NVL(ia_normativa, 0)) > 40)'
      
        '           AND (LENGTH(NVL(ia_normativa, 0)) + LENGTH(NVL(ia_nor' +
        'mativabis, 0)) > 80) THEN TRIM(SUBSTR(ia_normativa,'
      
        '                                                                ' +
        '                                      INSTR(ia_normativa, '#39' '#39','
      
        '                                                                ' +
        '                                            39)'
      
        '                                                                ' +
        '                                      + 1))'
      '           WHEN LENGTH(NVL(ia_normativa, 0)) <= 40 THEN NULL'
      '         END AS ia_normativa2,'
      '         CASE'
      
        '           WHEN LENGTH(NVL(ia_normativabis, 0)) > 40 THEN TRIM(S' +
        'UBSTR(ia_normativabis, 1,'
      
        '                                                                ' +
        '      INSTR(ia_normativabis, '#39' '#39', 39)))'
      '           ELSE ia_normativabis'
      '         END AS ia_normativabis,'
      '         CASE'
      
        '           WHEN LENGTH(NVL(ia_normativabis, 0)) > 40 THEN TRIM(S' +
        'UBSTR(ia_normativabis,'
      
        '                                                                ' +
        '      INSTR(ia_normativabis, '#39' '#39', 39) + 1))'
      '           WHEN LENGTH(NVL(ia_normativabis, 0)) <= 40 THEN NULL'
      '         END AS ia_normativabis2,'
      '         '#39'S'#39' editable'
      
        '    FROM hys.hia_itemanexo, hys.hta_titulosanexo, hys.hra_resolu' +
        'cionanexo, hys.hst_solicituditemsfgrl, hys.hsf_solicitudfgrl'
      '   WHERE ta_id = ia_idtituloanexo'
      '     AND st_iditem = ia_id'
      '     AND ta_idresolucionanexo = ra_id'
      '     AND st_idsolicitudfgrl = sf_id'
      
        '     AND sf_idsolicitudestablecimiento = :idsolicitudestablecimi' +
        'ento'
      '     AND sf_fechabaja IS NULL'
      '     AND st_fechabaja IS NULL'
      '     AND ia_fechabaja IS NULL'
      '     AND ta_fechabaja IS NULL'
      '     AND ra_fechabaja IS NULL'
      'ORDER BY 2, 3')
    Left = 109
    Top = 514
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end>
  end
  object CompositeReport: TQRCompositeReport
    OnAddReports = CompositeReportAddReports
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Legal
    Left = 18
    Top = 393
  end
  object sdqSustAgentesCan: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   it_id, it_codigo, it_descripcion, it_masdatos, si_cumpl' +
        'imiento cumplimiento, si_id iditemformrelev,'
      
        '         DECODE(si_cumplimiento, '#39'S'#39', '#39'X'#39', '#39#39') cump_si, DECODE(s' +
        'i_cumplimiento, '#39'N'#39', '#39'X'#39', '#39#39') cump_no, it_orden'
      
        '    FROM hys.hit_itemtipoanexo, hys.hsi_solicituditemsplanillafg' +
        'rl, hys.hsp_solicitudplanillafgrl, hys.hsf_solicitudfgrl'
      '   WHERE it_idtipoanexo = 1'
      '     AND sp_idtipoanexo = 1'
      '     AND sp_idsolicitudfgrl = sf_id'
      
        '     AND sf_idsolicitudestablecimiento = :idsolicitudestablecimi' +
        'ento'
      '     AND si_iditemtipoanexo = it_id'
      '     AND si_idsolicitudplanillafgrl = sp_id'
      '     AND sf_fechabaja IS NULL'
      '     AND sp_fechabaja IS NULL'
      'UNION ALL'
      
        'SELECT   it_id, it_codigo, it_descripcion, it_masdatos, NULL cum' +
        'plimiento, NULL iditemformrelev, NULL cump_si, NULL cump_no,'
      '         it_orden'
      '    FROM hys.hit_itemtipoanexo'
      '   WHERE it_idtipoanexo = 1'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM hys.hsp_solicitudplanillafgrl, hys.hs' +
        'f_solicitudfgrl'
      '                     WHERE sp_idtipoanexo = 1'
      '                       AND sp_idsolicitudfgrl = sf_id'
      
        '                       AND sf_idsolicitudestablecimiento = :idso' +
        'licitudestablecimiento'
      '                       AND sf_fechabaja IS NULL'
      '                       AND sp_fechabaja IS NULL)'
      'ORDER BY it_orden')
    Left = 17
    Top = 454
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end>
  end
  object sdqDifenilos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   it_id, it_codigo, it_descripcion, it_masdatos, si_cumpl' +
        'imiento cumplimiento, si_id iditemformrelev,'
      
        '         DECODE(si_cumplimiento, '#39'S'#39', '#39'X'#39', '#39#39') cump_si, DECODE(s' +
        'i_cumplimiento, '#39'N'#39', '#39'X'#39', '#39#39') cump_no, it_orden'
      
        '    FROM hys.hit_itemtipoanexo, hys.hsi_solicituditemsplanillafg' +
        'rl, hys.hsp_solicitudplanillafgrl, hys.hsf_solicitudfgrl'
      '   WHERE it_idtipoanexo = 2'
      '     AND sp_idtipoanexo = 2'
      '     AND sp_idsolicitudfgrl = sf_id'
      
        '     AND sf_idsolicitudestablecimiento = :idsolicitudestablecimi' +
        'ento'
      '     AND si_iditemtipoanexo = it_id'
      '     AND si_idsolicitudplanillafgrl = sp_id'
      '     AND sf_fechabaja IS NULL'
      '     AND sp_fechabaja IS NULL'
      'UNION ALL'
      
        'SELECT   it_id, it_codigo, it_descripcion, it_masdatos, NULL cum' +
        'plimiento, NULL iditemformrelev, NULL cump_si, NULL cump_no,'
      '         it_orden'
      '    FROM hys.hit_itemtipoanexo'
      '   WHERE it_idtipoanexo = 2'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM hys.hsp_solicitudplanillafgrl, hys.hs' +
        'f_solicitudfgrl'
      '                     WHERE sp_idtipoanexo = 2'
      '                       AND sp_idsolicitudfgrl = sf_id'
      
        '                       AND sf_idsolicitudestablecimiento = :idso' +
        'licitudestablecimiento'
      '                       AND sf_fechabaja IS NULL'
      '                       AND sp_fechabaja IS NULL)'
      'ORDER BY it_orden')
    Left = 17
    Top = 482
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end>
  end
  object sdqSustQuimicas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   it_id, it_codigo, it_descripcion, it_masdatos, si_cumpl' +
        'imiento cumplimiento, si_id iditemformrelev,'
      
        '         DECODE(si_cumplimiento, '#39'S'#39', '#39'X'#39', '#39#39') cump_si, DECODE(s' +
        'i_cumplimiento, '#39'N'#39', '#39'X'#39', '#39#39') cump_no, it_orden'
      
        '    FROM hys.hit_itemtipoanexo, hys.hsi_solicituditemsplanillafg' +
        'rl, hys.hsp_solicitudplanillafgrl, hys.hsf_solicitudfgrl'
      '   WHERE it_idtipoanexo = 3'
      '     AND sp_idtipoanexo = 3'
      '     AND sp_idsolicitudfgrl = sf_id'
      
        '     AND sf_idsolicitudestablecimiento = :idsolicitudestablecimi' +
        'ento'
      '     AND si_iditemtipoanexo = it_id'
      '     AND si_idsolicitudplanillafgrl = sp_id'
      '     AND sf_fechabaja IS NULL'
      '     AND sp_fechabaja IS NULL'
      'UNION ALL'
      
        'SELECT   it_id, it_codigo, it_descripcion, it_masdatos, NULL cum' +
        'plimiento, NULL iditemformrelev, NULL cump_si, NULL cump_no,'
      '         it_orden'
      '    FROM hys.hit_itemtipoanexo'
      '   WHERE it_idtipoanexo = 3'
      '     AND NOT EXISTS(SELECT 1'
      
        '                      FROM hys.hsp_solicitudplanillafgrl, hys.hs' +
        'f_solicitudfgrl'
      '                     WHERE sp_idtipoanexo = 3'
      '                       AND sp_idsolicitudfgrl = sf_id'
      
        '                       AND sf_idsolicitudestablecimiento = :idso' +
        'licitudestablecimiento'
      '                       AND sf_fechabaja IS NULL'
      '                       AND sp_fechabaja IS NULL)'
      'ORDER BY it_orden')
    Left = 17
    Top = 510
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idsolicitudestablecimiento'
        ParamType = ptInput
      end>
  end
  object sdqGremio: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hrg_relevgremialista, hys.hrl_relevriesgolaboral'
      ' WHERE rl_id = rg_idrelevriesgolaboral'
      '   AND 1=2')
    Left = 17
    Top = 538
  end
  object sdqResponsable: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT DECODE(sa_tipo_documento_titular,'
      '              '#39'CUIL'#39', sa_documento_titular,'
      
        '              '#39'DNI'#39', art.get_cuilvalido(sa_documento_titular, sa' +
        '_sexo_titular, 1),'
      '              NULL) rr_cuitcuil,'
      
        '       sa_titular rr_nombre, '#39'R'#39' rr_cargo, '#39'OTROS'#39' rs_descripcio' +
        'n, '#39'Propio'#39' rr_relacion, NULL rr_titulo, NULL rr_matricula,'
      '       NULL rr_entidad'
      
        '  FROM afi.asa_solicitudafiliacion, afi.ase_solicitudestablecimi' +
        'ento'
      ' WHERE sa_id = se_idsolicitud'
      '   AND se_id = :idsolicitudestab'
      '   AND sa_titular IS NOT NULL'
      '   AND sa_cargo_titular IS NOT NULL')
    Left = 17
    Top = 566
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idsolicitudestab'
        ParamType = ptInput
      end>
  end
  object sdqContratista: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM hys.hrc_relevcontratista, hys.hrl_relevriesgolaboral'
      ' WHERE rl_id = rc_idrelevriesgolaboral'
      '   AND 1=2')
    Left = 17
    Top = 594
  end
  object sdqObservaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ob_descripcion, ro_infoextra, ob_tipooperacion, ro_idob' +
        'servacion,'
      '         ro_estado, ro_fechabaja, ro_usubaja, ro_id, ob_tipo'
      '    FROM hys.hob_observacion,'
      '         hys.hro_relevobservacion,'
      '         hys.hrl_relevriesgolaboral'
      '   WHERE ro_idobservacion = ob_id'
      '     AND ro_idrelevriesgolaboral = rl_id'
      '     AND 1=2')
    Left = 17
    Top = 622
  end
end
