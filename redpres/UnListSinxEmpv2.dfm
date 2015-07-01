inherited frmListxEmpr2: TfrmListxEmpr2
  Left = 386
  Top = 139
  Caption = 'frmListxEmpr2'
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1352
  end
  inherited CoolBar: TCoolBar
    Width = 1352
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1348
      end>
    inherited ToolBar: TToolBar
      Width = 1335
      ButtonHeight = 816
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Hint = 'Vista Preliminar'
        Visible = True
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 17
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 1352
    Height = 850
  end
  object qrpReporte: TQuickRep [3]
    Left = 8
    Top = 100
    Width = 1344
    Height = 816
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
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Legal
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1268
      Height = 55
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
        145.520833333333300000
        3354.916666666667000000)
      BandType = rbPageHeader
      object qriLogo: TQRImage
        Left = 0
        Top = 1
        Width = 229
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          0.000000000000000000
          2.645833333333330000
          605.895833333333000000)
      end
      object QRLabel14: TQRLabel
        Left = 987
        Top = 4
        Width = 34
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          2611.437500000000000000
          10.583333333333300000
          89.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Filtros:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object qrlFiltros: TQRLabel
        Left = 1022
        Top = 2
        Width = 235
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          2704.041666666670000000
          5.291666666666670000
          621.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlFiltros'
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText11: TQRDBText
        Left = 667
        Top = 36
        Width = 80
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1764.770833333330000000
          95.250000000000000000
          211.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'MP_NOMBRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 598
        Top = 36
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1582.208333333330000000
          95.250000000000000000
          161.395833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Empresa:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 93
      Width = 1268
      Height = 46
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
        121.708333333333300000
        3354.916666666667000000)
      Expression = 'sdqDatosGrilla.PRESTADOR'
      Master = qrpReporte
      ReprintOnNewPage = True
      object QRLabel2: TQRLabel
        Left = 2
        Top = 14
        Width = 1261
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          5.291666666666670000
          37.041666666666700000
          3336.395833333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '                                      '
        Color = 14737632
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 4
        Top = 4
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          10.583333333333330000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prestador:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 80
        Top = 4
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          10.583333333333330000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'PRESTADOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 2
        Top = 32
        Width = 82
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          5.291666666666670000
          84.666666666666700000
          216.958333333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Siniestro'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Left = 86
        Top = 32
        Width = 183
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          227.541666666667000000
          84.666666666666700000
          484.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' Paciente'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel5: TQRLabel
        Left = 272
        Top = 32
        Width = 77
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          719.666666666667000000
          84.666666666666700000
          203.729166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CUIL'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 352
        Top = 32
        Width = 61
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          931.333333333333000000
          84.666666666666700000
          161.395833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'F.Acc/Rec.'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Left = 415
        Top = 32
        Width = 49
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          1098.020833333330000000
          84.666666666666700000
          129.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'D'#237'as Baja'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 467
        Top = 32
        Width = 274
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          1235.604166666670000000
          84.666666666666700000
          724.958333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' Diagn'#243'stico'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel9: TQRLabel
        Left = 743
        Top = 32
        Width = 63
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          1965.854166666670000000
          84.666666666666700000
          166.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'F.Control'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 808
        Top = 32
        Width = 299
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          2137.833333333330000000
          84.666666666666700000
          791.104166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' Observaciones'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel11: TQRLabel
        Left = 1190
        Top = 32
        Width = 75
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          3148.541666666670000000
          84.666666666666700000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Alta Med.'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel16: TQRLabel
        Left = 1110
        Top = 32
        Width = 78
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          2936.875000000000000000
          84.666666666666700000
          206.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nuevo Control'
        Color = 14737632
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 139
      Width = 1268
      Height = 16
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
        42.333333333333340000
        3354.916666666667000000)
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 2
        Top = 2
        Width = 81
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          5.291666666666670000
          5.291666666666670000
          214.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SINIESTRO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText3: TQRDBText
        Left = 85
        Top = 2
        Width = 184
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          224.895833333333000000
          5.291666666666670000
          486.833333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'PACIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 272
        Top = 2
        Width = 77
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          719.666666666667000000
          5.291666666666670000
          203.729166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'CUIL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText5: TQRDBText
        Left = 352
        Top = 2
        Width = 60
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          931.333333333333000000
          5.291666666666670000
          158.750000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'FACCIDENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText6: TQRDBText
        Left = 415
        Top = 2
        Width = 49
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1098.020833333330000000
          5.291666666666670000
          129.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'DIAS_BAJA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText7: TQRDBText
        Left = 467
        Top = 2
        Width = 275
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1235.604166666670000000
          5.291666666666670000
          727.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataField = 'DIAGNOSTICO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText8: TQRDBText
        Left = 744
        Top = 1
        Width = 62
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1968.500000000000000000
          2.645833333333330000
          164.041666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'FCONTROL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText9: TQRDBText
        Left = 808
        Top = 2
        Width = 299
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          2137.833333333330000000
          5.291666666666670000
          791.104166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataField = 'OBSERVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText10: TQRDBText
        Left = 1110
        Top = 2
        Width = 77
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          2936.875000000000000000
          5.291666666666670000
          203.729166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'NUEVOCONTROL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRDBText12: TQRDBText
        Left = 1190
        Top = 2
        Width = 74
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          3148.541666666670000000
          5.291666666666670000
          195.791666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ALTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 184
      Width = 1268
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
        58.208333333333340000
        3354.916666666667000000)
      BandType = rbPageFooter
      object QRShape1: TQRShape
        Left = 4
        Top = 4
        Width = 1258
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          10.583333333333300000
          10.583333333333300000
          3328.458333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRSysData1: TQRSysData
        Left = 1189
        Top = 7
        Width = 27
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          3145.895833333330000000
          18.520833333333300000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 1154
        Top = 7
        Width = 32
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          3053.291666666670000000
          18.520833333333300000
          84.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRSysData2: TQRSysData
        Left = 50
        Top = 7
        Width = 35
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          132.291666666666700000
          18.520833333333330000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 7
      end
      object QRLabel13: TQRLabel
        Left = 3
        Top = 7
        Width = 43
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          7.937500000000000000
          18.520833333333330000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'gina N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 155
      Width = 1268
      Height = 29
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
        76.729166666666680000
        3354.916666666667000000)
      BandType = rbSummary
      object qrlResultados: TQRLabel
        Left = 4
        Top = 9
        Width = 34
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          10.583333333333330000
          23.812500000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '           '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object sdqDatosGrilla: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'Select ex_siniestro||'#39'-'#39'||ex_orden||'#39'-'#39'||ex_recaida SINIESTRO,'
      '           tj_nombre PACIENTE, ex_cuil CUIL, mp_nombre,'
      '           nvl(ex_fecharecaida,ex_fechaaccidente) FACCIDENTE,'
      
        '           actualdate - nvl(ex_bajamedica,nvl(ex_fecharecaida,ex' +
        '_fechaaccidente)) + 1 DIAS_BAJA,'
      
        '           ex_diagnostico DIAGNOSTICO, pv_fechacontrol FCONTROL,' +
        ' A.PV_FECHAALTA, pv_observaciones OBSERVACIONES,'
      
        '           pv_proximocontrol NUEVOCONTROL, ca_descripcion PRESTA' +
        'DOR, ex_altamedica ALTA'
      
        'From  sex_expedientes, ctj_trabajadores, spv_parteevolutivo A, c' +
        'pr_prestador, cmp_empresas'
      'Where ex_cuit = '#39'20145369836'#39
      '            and ex_altamedica is null'
      '            and nvl(ex_causafin,'#39' '#39') not in ('#39'99'#39','#39'95'#39','#39'02'#39')'
      '            and tj_cuil = ex_cuil'
      '            and mp_cuit(+) = ex_cuit'
      '            and  pv_siniestro = ex_siniestro'
      '            and pv_orden = ex_orden'
      '            and pv_recaida = ex_recaida'
      '            and  pv_nroparte = ( Select max (pv_nroparte)'
      
        '                                             From  spv_parteevol' +
        'utivo B'
      
        '                                             Where A.pv_siniestr' +
        'o = B.pv_siniestro'
      
        '                                                        and A.pv' +
        '_orden = B.pv_orden'
      
        '                                                        and A.pv' +
        '_recaida = B.pv_recaida'
      
        '                                                        and B.pv' +
        '_tipoparte in ('#39'E'#39','#39'T'#39'))'
      '             and ex_prestador = ca_identificador(+)'
      ''
      ' ')
    Left = 24
    Top = 172
    object sdqDatosGrillaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 122
    end
    object sdqDatosGrillaPACIENTE: TStringField
      FieldName = 'PACIENTE'
      Size = 60
    end
    object sdqDatosGrillaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 11
    end
    object sdqDatosGrillaMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Size = 60
    end
    object sdqDatosGrillaFACCIDENTE: TDateTimeField
      FieldName = 'FACCIDENTE'
    end
    object sdqDatosGrillaDIAS_BAJA: TFloatField
      FieldName = 'DIAS_BAJA'
    end
    object sdqDatosGrillaDIAGNOSTICO: TStringField
      FieldName = 'DIAGNOSTICO'
      Size = 250
    end
    object sdqDatosGrillaFCONTROL: TDateTimeField
      FieldName = 'FCONTROL'
      Required = True
    end
    object sdqDatosGrillaPV_FECHAALTA: TDateTimeField
      FieldName = 'PV_FECHAALTA'
      Required = True
    end
    object sdqDatosGrillaOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 1000
    end
    object sdqDatosGrillaNUEVOCONTROL: TDateTimeField
      FieldName = 'NUEVOCONTROL'
    end
    object sdqDatosGrillaPRESTADOR: TStringField
      FieldName = 'PRESTADOR'
      Size = 150
    end
    object sdqDatosGrillaALTA: TDateTimeField
      FieldName = 'ALTA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatosGrilla
    Left = 52
    Top = 172
  end
end
