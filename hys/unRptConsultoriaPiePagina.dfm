object rptConsultoriaPiePagina: TrptConsultoriaPiePagina
  Left = 320
  Top = 227
  Width = 979
  Height = 563
  Caption = 'rptConsultoriaPiePagina'
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
  object qrHoja1: TQuickRep
    Left = 9
    Top = 9
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqConsolidadoEmpresa
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
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
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
    Units = Pixels
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrdetail: TQRBand
      Left = 19
      Top = 301
      Width = 756
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.979166666666670000
        2000.250000000000000000)
      BandType = rbDetail
      object QRShape12: TQRShape
        Left = 1
        Top = -1
        Width = 613
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          2.645833333333333000
          -2.645833333333333000
          1621.895833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 529
        Top = -1
        Width = 8
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1399.645833333333000000
          -2.645833333333333000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 413
        Top = -1
        Width = 8
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1092.729166666667000000
          -2.645833333333333000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 333
        Top = -1
        Width = 9
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666680000
          881.062500000000000000
          -2.645833333333333000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 242
        Top = -1
        Width = 9
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.437500000000000000
          640.291666666666800000
          -2.645833333333333000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 129
        Top = -1
        Width = 9
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          341.312500000000000000
          -2.645833333333333000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText10: TQRDBText
        Left = 462
        Top = 3
        Width = 37
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1222.375000000000000000
          7.937500000000000000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresa
        DataField = 'anormales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText11: TQRDBText
        Left = 559
        Top = 3
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1479.020833333333000000
          7.937500000000000000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresa
        DataField = 'enfprof'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape4: TQRShape
        Left = 242
        Top = 1
        Width = 9
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          640.291666666666800000
          2.645833333333333000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 333
        Top = 1
        Width = 8
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          881.062500000000000000
          2.645833333333333000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText1: TQRDBText
        Left = 33
        Top = 3
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          87.312500000000000000
          7.937500000000000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresa
        DataField = 'ESTAB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText2: TQRDBText
        Left = 173
        Top = 3
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          457.729166666666600000
          7.937500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresa
        DataField = 'tiporelevcast'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText4: TQRDBText
        Left = 274
        Top = 3
        Width = 77
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          724.958333333333400000
          7.937500000000000000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresa
        DataField = 'personalconexamenes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText5: TQRDBText
        Left = 361
        Top = 3
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          955.145833333333500000
          7.937500000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresa
        DataField = 'ausentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 282
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
        746.125000000000000000
        2000.250000000000000000)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 8
        Top = 4
        Width = 184
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          486.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '5.CONSOLIDADO POR EMPRESA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 0
        Top = 253
        Width = 614
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          0.000000000000000000
          669.395833333333400000
          1624.541666666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 5
        Top = 256
        Width = 121
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          677.333333333333400000
          320.145833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'ESTABLECIMIENTOS ACTIVOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel3: TQRLabel
        Left = 139
        Top = 257
        Width = 100
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          367.770833333333400000
          679.979166666666800000
          264.583333333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PERS RELEVADO ULTIMO RAR '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape7: TQRShape
        Left = 129
        Top = 253
        Width = 9
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          341.312500000000000000
          669.395833333333400000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 19
        Top = 23
        Width = 727
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          50.270833333333330000
          60.854166666666680000
          1923.520833333334000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Se define un perfil de empresa de acuerdo al an'#225'lisis realizado ' +
          'para cada establecimiento. El consolidado obtenido permitir'#225' ten' +
          'er una visi'#243'n del estado de situaci'#243'n del cliente y las acciones' +
          ' a seguir.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 255
        Top = 257
        Width = 69
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          674.687500000000000000
          679.979166666666800000
          182.562500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PERS CON EX'#193'MENES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel6: TQRLabel
        Left = 346
        Top = 257
        Width = 37
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          915.458333333333200000
          679.979166666666800000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AUSENTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel7: TQRLabel
        Left = 423
        Top = 257
        Width = 63
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1119.187500000000000000
          679.979166666666800000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'ANORMALIDADES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape8: TQRShape
        Left = 242
        Top = 253
        Width = 9
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          640.291666666666800000
          669.395833333333400000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 333
        Top = 253
        Width = 9
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          881.062500000000000000
          669.395833333333400000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 413
        Top = 253
        Width = 8
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1092.729166666667000000
          669.395833333333400000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 529
        Top = 253
        Width = 8
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1399.645833333333000000
          669.395833333333400000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 560
        Top = 257
        Width = 24
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1481.666666666667000000
          679.979166666666800000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'EPROF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText12: TQRDBText
        Left = 43
        Top = 61
        Width = 702
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666680000
          113.770833333333300000
          161.395833333333300000
          1857.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqCantRelevExpuestos
        DataField = 'cantestabrelev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText13: TQRDBText
        Left = 43
        Top = 100
        Width = 702
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666680000
          113.770833333333300000
          264.583333333333400000
          1857.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqCantEstabPersExpuesto
        DataField = 'cantestabpersexpuesto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText15: TQRDBText
        Left = 43
        Top = 206
        Width = 702
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          545.041666666666800000
          1857.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAnormalidadesDetec
        DataField = 'ANORMAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText16: TQRDBText
        Left = 43
        Top = 227
        Width = 702
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          600.604166666666800000
          1857.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqEnfProfDetec
        DataField = 'ENFPROF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrLabelCantPersAsig: TQRLabel
        Left = 43
        Top = 140
        Width = 702
        Height = 54
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          142.875000000000000000
          113.770833333333300000
          370.416666666666700000
          1857.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrLabelCantPersAsig'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object SummaryBand1: TQRBand
      Left = 19
      Top = 318
      Width = 756
      Height = 85
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
        224.895833333333300000
        2000.250000000000000000)
      BandType = rbSummary
      object QRShape3: TQRShape
        Left = 1
        Top = -1
        Width = 613
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          2.645833333333333000
          -2.645833333333333000
          1621.895833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 529
        Top = -1
        Width = 8
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1399.645833333333000000
          -2.645833333333333000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 413
        Top = -1
        Width = 8
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1092.729166666667000000
          -2.645833333333333000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 129
        Top = -1
        Width = 9
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          341.312500000000000000
          -2.645833333333333000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText18: TQRDBText
        Left = 462
        Top = 3
        Width = 37
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1222.375000000000000000
          7.937500000000000000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresaTotal
        DataField = 'anormales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText19: TQRDBText
        Left = 560
        Top = 3
        Width = 26
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          1481.666666666667000000
          7.937500000000000000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresaTotal
        DataField = 'enfprof'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape25: TQRShape
        Left = 242
        Top = 1
        Width = 9
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          640.291666666666800000
          2.645833333333333000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 333
        Top = 1
        Width = 8
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          881.062500000000000000
          2.645833333333333000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText21: TQRDBText
        Left = 173
        Top = 3
        Width = 46
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          457.729166666666600000
          7.937500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresaTotal
        DataField = 'tiporelevcast'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText22: TQRDBText
        Left = 275
        Top = 3
        Width = 77
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          727.604166666666800000
          7.937500000000000000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresaTotal
        DataField = 'personalconexamenes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRDBText23: TQRDBText
        Left = 362
        Top = 4
        Width = 32
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          957.791666666666800000
          10.583333333333330000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsolidadoEmpresaTotal
        DataField = 'ausentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel8: TQRLabel
        Left = 5
        Top = 3
        Width = 121
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          7.937500000000000000
          320.145833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Totales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel9: TQRLabel
        Left = 5
        Top = 36
        Width = 119
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          95.250000000000000000
          314.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'SE: SIN EXPUESTOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 5
        Top = 59
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          156.104166666666700000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'SR: SIN RELEVAR'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qrHoja2: TQuickRep
    Left = 809
    Top = 9
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqAcciones
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
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
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
    object QRBand1: TQRBand
      Left = 19
      Top = 95
      Width = 756
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        50.270833333333330000
        2000.250000000000000000)
      BandType = rbDetail
      object QRDBText7: TQRDBText
        Left = 6
        Top = 4
        Width = 745
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          15.875000000000000000
          10.583333333333330000
          1971.145833333334000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAcciones
        DataField = 'texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 76
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
        201.083333333333300000
        2000.250000000000000000)
      BandType = rbTitle
      object QRLabel11: TQRLabel
        Left = 8
        Top = 4
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '6.ACCIONES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape31: TQRShape
        Left = 0
        Top = 60
        Width = 780
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          158.750000000000000000
          2063.750000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 5
        Top = 63
        Width = 121
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          13.229166666666670000
          166.687500000000000000
          320.145833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Recomendaciones'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel15: TQRLabel
        Left = 19
        Top = 23
        Width = 727
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.958333333333340000
          50.270833333333330000
          60.854166666666680000
          1923.520833333334000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Se recomiendan las siguientes acciones tendientes a normalizar e' +
          'l estado de situaci'#243'n de cada categor'#237'a relevada para disminuir ' +
          'la exposici'#243'n a sanciones y para mejorar la eficiencia de la ges' +
          'ti'#243'n de prevenci'#243'n.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qrHoja3: TQuickRep
    Left = 809
    Top = 189
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqAnexo
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
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
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
    object QRBand4: TQRBand
      Left = 19
      Top = 64
      Width = 756
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        37.041666666666670000
        2000.250000000000000000)
      BandType = rbDetail
      object QRDBText9: TQRDBText
        Left = 24
        Top = 1
        Width = 61
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          63.500000000000000000
          2.645833333333333000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexo
        DataField = 'ES_NROESTABLECI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRShape2: TQRShape
        Left = 94
        Top = -1
        Width = 10
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          248.708333333333300000
          -2.645833333333333000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 641
        Top = 0
        Width = 10
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1695.979166666667000000
          0.000000000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 109
        Top = 1
        Width = 40
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          288.395833333333400000
          2.645833333333333000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexo
        DataField = 'ES_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText6: TQRDBText
        Left = 676
        Top = 1
        Width = 51
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1788.583333333333000000
          2.645833333333333000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexo
        DataField = 'ES_EMPLEADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRShape24: TQRShape
        Left = 352
        Top = 0
        Width = 10
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          931.333333333333500000
          0.000000000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 500
        Top = 0
        Width = 8
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1322.916666666667000000
          0.000000000000000000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText14: TQRDBText
        Left = 511
        Top = 1
        Width = 37
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1352.020833333333000000
          2.645833333333333000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexo
        DataField = 'ACTIVIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText17: TQRDBText
        Left = 365
        Top = 1
        Width = 37
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          965.729166666666800000
          2.645833333333333000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexo
        DataField = 'PROVINCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
    end
    object QRBand5: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 45
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
        119.062500000000000000
        2000.250000000000000000)
      BandType = rbTitle
      object QRShape29: TQRShape
        Left = 1
        Top = 32
        Width = 777
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2.645833333333333000
          84.666666666666680000
          2055.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel14: TQRLabel
        Left = 8
        Top = 9
        Width = 35
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          23.812500000000000000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ANEXO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 27
        Top = 34
        Width = 28
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          71.437500000000000000
          89.958333333333340000
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' Estab'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLabel18: TQRLabel
        Left = 147
        Top = 34
        Width = 91
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          388.937500000000000000
          89.958333333333340000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre del establecimiento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRShape30: TQRShape
        Left = 94
        Top = 33
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          248.708333333333300000
          87.312500000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 352
        Top = 33
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          931.333333333333500000
          87.312500000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 416
        Top = 34
        Width = 30
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1100.666666666667000000
          89.958333333333340000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRShape34: TQRShape
        Left = 499
        Top = 33
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1320.270833333333000000
          87.312500000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 641
        Top = 33
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1695.979166666667000000
          87.312500000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel20: TQRLabel
        Left = 672
        Top = 34
        Width = 53
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1778.000000000000000000
          89.958333333333340000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cant. Trab estab'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRLabel21: TQRLabel
        Left = 553
        Top = 34
        Width = 29
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1463.145833333333000000
          89.958333333333340000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Actividad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
    end
  end
  object qrHoja4: TQuickRep
    Left = 809
    Top = 349
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqAnexoEmpleados
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
    Page.Columns = 2
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      2100.000000000000000000
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
    object QRBand6: TQRBand
      Left = 19
      Top = 42
      Width = 378
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        37.041666666666670000
        1000.125000000000000000)
      BandType = rbDetail
      object QRShape36: TQRShape
        Left = 345
        Top = 0
        Width = 8
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          912.812500000000100000
          0.000000000000000000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText20: TQRDBText
        Left = 6
        Top = 1
        Width = 39
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          15.875000000000000000
          2.645833333333333000
          103.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexoEmpleados
        DataField = 'TJ_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText24: TQRDBText
        Left = 354
        Top = 1
        Width = 19
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          936.625000000000100000
          2.645833333333333000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexoEmpleados
        DataField = 'EDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRShape37: TQRShape
        Left = 234
        Top = 0
        Width = 10
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          619.125000000000000000
          0.000000000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape38: TQRShape
        Left = 300
        Top = 0
        Width = 8
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          793.750000000000000000
          0.000000000000000000
          21.166666666666670000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText25: TQRDBText
        Left = 310
        Top = 1
        Width = 29
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          820.208333333333500000
          2.645833333333333000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexoEmpleados
        DataField = 'TJ_SEXO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
      object QRDBText26: TQRDBText
        Left = 247
        Top = 1
        Width = 45
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          653.520833333333400000
          2.645833333333333000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAnexoEmpleados
        DataField = 'ANTIGUEDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 5
      end
    end
    object QRBand7: TQRBand
      Left = 19
      Top = 19
      Width = 756
      Height = 23
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
        60.854166666666680000
        2000.250000000000000000)
      BandType = rbTitle
      object QRShape39: TQRShape
        Left = 1
        Top = 0
        Width = 377
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          2.645833333333333000
          0.000000000000000000
          997.479166666666900000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 51
        Top = 2
        Width = 65
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          134.937500000000000000
          5.291666666666667000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre y Apellido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape41: TQRShape
        Left = 234
        Top = 0
        Width = 10
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333340000
          619.125000000000000000
          0.000000000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 244
        Top = 1
        Width = 57
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          645.583333333333400000
          2.645833333333333000
          150.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Antig'#252'edad en la empresa'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRShape42: TQRShape
        Left = 299
        Top = 0
        Width = 10
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          791.104166666666800000
          0.000000000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 344
        Top = 0
        Width = 10
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          910.166666666666600000
          0.000000000000000000
          26.458333333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel25: TQRLabel
        Left = 355
        Top = 3
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          939.270833333333400000
          7.937500000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Edad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object QRLabel26: TQRLabel
        Left = 317
        Top = 2
        Width = 17
        Height = 11
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          29.104166666666670000
          838.729166666666800000
          5.291666666666667000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sexo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
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
    Left = 11
  end
  object sdqCantRelevExpuestos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      ''
      
        'SELECT NVL((SELECT   '#39'La cantidad establecimientos relevados en ' +
        #39' || anio || '#39' fue de '#39' || COUNT(*)'
      
        '                     || '#39' con una cantidad de personal expuesto ' +
        'de '#39
      '                     || (SELECT COUNT(DISTINCT rt_cuil)'
      
        '                           FROM art.prt_riestrab, hys.hcn_cabece' +
        'ranomina, afi.aem_empresa'
      '                          WHERE cn_idestado NOT IN(3, 6)'
      '                            AND em_cuit = cn_cuit'
      
        '                            AND cn_fecharelevamiento >= TRUNC(SY' +
        'SDATE, '#39'YYYY'#39')'
      
        '                            AND cn_fecharelevamiento <= TO_DATE(' +
        'TO_CHAR(SYSDATE, '#39'YYYY'#39') || '#39'1231'#39', '#39'YYYYMMDD'#39')'
      '                            AND rt_idcabeceranomina = cn_id'
      '                            AND em_id = :idempresa)'
      '                     || '#39' sobre un total de '#39
      
        '                     || (SELECT emi.utiles.get_empleados(art.get' +
        '_vultcontrato(em_cuit), SYSDATE) empleados'
      '                           FROM afi.aem_empresa'
      
        '                          WHERE em_id = :idempresa) || '#39' trabaja' +
        'dores. '#39' cantestabrelev'
      
        '                FROM (SELECT DISTINCT cn_cuit, cn_estableci, TO_' +
        'CHAR(cn_fecharelevamiento, '#39'YYYY'#39') anio'
      
        '                                 FROM hys.hcn_cabeceranomina, af' +
        'i.aem_empresa'
      '                                WHERE cn_idestado NOT IN(3, 6)'
      '                                  AND em_cuit = cn_cuit'
      
        '                                  AND cn_fecharelevamiento >= TR' +
        'UNC(SYSDATE, '#39'YYYY'#39')'
      
        '                                  AND cn_fecharelevamiento <= TO' +
        '_DATE(TO_CHAR(SYSDATE, '#39'YYYY'#39') || '#39'1231'#39', '#39'YYYYMMDD'#39')'
      '                                  AND em_id = :idempresa'
      '                      UNION'
      
        '                      SELECT DISTINCT sr_cuit, sr_estableci, TO_' +
        'CHAR(sr_fecha, '#39'YYYY'#39') anio'
      
        '                                 FROM art.psr_sinriesgo, afi.aem' +
        '_empresa'
      '                                WHERE em_cuit = sr_cuit'
      
        '                                  AND sr_fecha >= TRUNC(SYSDATE,' +
        ' '#39'YYYY'#39')'
      
        '                                  AND sr_fecha <= TO_DATE(TO_CHA' +
        'R(SYSDATE, '#39'YYYY'#39') || '#39'1231'#39', '#39'YYYYMMDD'#39')'
      '                                  AND em_id = :idempresa) a'
      '            GROUP BY anio),'
      
        '           '#39'La cantidad establecimientos relevados en '#39' || '#39' fue' +
        ' de  0 con una cantidad de personal expuesto de '#39
      
        '           || '#39'0 sobre un total de 0 trabajadores. '#39') cantestabr' +
        'elev'
      '  FROM DUAL')
    Left = 39
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqCantEstabPersExpuesto: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT NVL'
      
        '         ((SELECT   '#39'La cantidad de establecimientos con persona' +
        'l expuestos es de '#39' || COUNT(*)'
      '                    || '#39' de un total de establecimientos'#39
      '                    || (SELECT COUNT(DISTINCT es_nroestableci)'
      
        '                          FROM afi.aes_establecimiento, afi.aco_' +
        'contrato, afi.aem_empresa'
      '                         WHERE em_id = co_idempresa'
      '                           AND co_contrato = es_contrato'
      
        '                           AND co_contrato = art.afiliacion.get_' +
        'contratovigente(em_cuit, TO_DATE(anio || '#39'1231'#39', '#39'YYYYMMDD'#39'))'
      '                           AND em_id = :idempresa'
      
        '                           AND es_fechaalta <= TO_DATE(anio || '#39 +
        '1231'#39', '#39'YYYYMMDD'#39')'
      '                           AND (   es_fechabaja IS NULL'
      
        '                                OR es_fechabaja >= TO_DATE(anio ' +
        '|| '#39'0101'#39', '#39'YYYYMMDD'#39')))'
      
        '                                                                ' +
        '                   cantestabpersexpuesto'
      
        '               FROM (SELECT DISTINCT cn_cuit, cn_estableci, TO_C' +
        'HAR(cn_fecharelevamiento, '#39'YYYY'#39') anio'
      
        '                                FROM hys.hcn_cabeceranomina, afi' +
        '.aem_empresa'
      '                               WHERE cn_idestado NOT IN(3, 6)'
      '                                 AND em_cuit = cn_cuit'
      
        '                                 AND cn_fecharelevamiento >= TRU' +
        'NC(SYSDATE, '#39'YYYY'#39')'
      '                                 AND em_id = :idempresa) a'
      '           GROUP BY anio),'
      
        '          '#39'La cantidad de establecimientos con personal expuesto' +
        's es de 0 de un total de establecimientos 0'#39')'
      
        '                                                                ' +
        '                                          cantestabpersexpuesto'
      '  FROM DUAL')
    Left = 67
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqAnormalidadesDetec: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT NVL((SELECT '#39'La cantidad de Anormalidades detectadas e in' +
        'formadas al empleador fue de '#39' || anormal || '#39'.'#39
      
        '              FROM (SELECT   TO_CHAR(et_fecha, '#39'YYYY'#39') anio, SUM' +
        '(CASE'
      
        '                                                                ' +
        '   WHEN et_tipores = '#39'A'#39' THEN 1'
      
        '                                                                ' +
        '   ELSE 0'
      
        '                                                                ' +
        ' END) anormal'
      '                        FROM art.aet_estrab, afi.aem_empresa'
      '                       WHERE TRUNC(SYSDATE, '#39'YYYY'#39') <= et_fecha'
      '                         AND em_cuit = et_cuit'
      '                         AND et_tipo = '#39'EP'#39
      '                         AND et_fechabaja IS NULL'
      '                         AND em_id = :idempresa'
      '                    GROUP BY TO_CHAR(et_fecha, '#39'YYYY'#39')) a'
      '                   LEFT JOIN'
      
        '                   (SELECT   TO_CHAR(le_fechaalta, '#39'YYYY'#39') anio,' +
        ' SUM(CASE'
      
        '                                                                ' +
        '       WHEN gr_enfprofesional = '#39'S'#39' THEN 1'
      
        '                                                                ' +
        '       ELSE 0'
      
        '                                                                ' +
        '     END) enfprof,'
      '                             SUM(CASE'
      '                                   WHEN dl_debito = '#39'S'#39' THEN 1'
      '                                   ELSE 0'
      '                                 END) debito'
      
        '                        FROM hys.hgr_gestionreconfirmacion, hys.' +
        'hdl_detallelote, hys.hde_descripcionestadolote,'
      
        '                             hys.hle_loteestudio, hys.hel_estado' +
        'lote, afi.aes_establecimiento, afi.aco_contrato,'
      '                             afi.aem_empresa'
      '                       WHERE es_contrato = co_contrato'
      '                         AND co_idempresa = em_id'
      '                         AND le_id = el_idlote'
      '                         AND dl_idlote = el_idlote'
      '                         AND dl_idestableci = es_id'
      '                         AND de_codigo = el_estado'
      '                         AND el_operativo <> '#39'R'#39
      '                         AND (   (dl_fechabaja IS NULL)'
      '                              OR (    dl_fechabaja IS NOT NULL'
      
        '                                  AND dl_fecharealizacion IS NOT' +
        ' NULL))'
      '                         AND (   (el_fechabaja IS NULL)'
      '                              OR (    (el_fechabaja IS NOT NULL)'
      '                                  AND (TRUNC(de_valor) <> 10)))'
      '                         AND gr_iddetallelote(+) = dl_id'
      
        '                         AND TRUNC(SYSDATE, '#39'YYYY'#39') <= le_fechaa' +
        'lta'
      '                         AND em_id = :idempresa'
      
        '                    GROUP BY TO_CHAR(le_fechaalta, '#39'YYYY'#39')) b ON' +
        ' a.anio = b.anio'
      
        '                   ), '#39'La cantidad de Anormalidades detectadas e' +
        ' informadas al empleador fue de 0.'#39') anormal'
      '  FROM DUAL')
    Left = 95
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqConsolidadoEmpresa: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   DECODE(tiporelev,'
      '                '#39'CE'#39', TO_CHAR((SELECT COUNT(*)'
      '                                 FROM art.prt_riestrab'
      '                                WHERE rt_cuit = em_cuit'
      '                                  AND rt_estableci = estab'
      '                                  AND rt_fecha = ultrelev)),'
      '                tiporelev) tiporelevcast,'
      '         a.*,'
      '         (SELECT COUNT(DISTINCT dl_idtrabajador)'
      
        '            FROM hys.hdl_detallelote, hys.hde_descripcionestadol' +
        'ote, hys.hle_loteestudio,'
      '                 hys.hel_estadolote, hys.hrl_relevamientolote'
      '           WHERE el_rlid = rl_id'
      '             AND rl_fecha = ultrelev'
      '             AND le_id = el_idlote'
      '             AND dl_idlote = el_idlote'
      '             AND rl_idestableci = es_id'
      '             AND de_codigo = el_estado'
      '             AND el_operativo <> '#39'R'#39
      '             AND (   (dl_fechabaja IS NULL)'
      '                  OR (    dl_fechabaja IS NOT NULL'
      '                      AND dl_fecharealizacion IS NOT NULL))'
      '             AND (   (el_fechabaja IS NULL)'
      '                  OR (    (el_fechabaja IS NOT NULL)'
      
        '                      AND (TRUNC(de_valor) <> 10)))) personalcon' +
        'examenes,'
      '         (SELECT COUNT(DISTINCT dl_idtrabajador)'
      
        '            FROM hys.hdl_detallelote hdl, hys.hde_descripcionest' +
        'adolote, hys.hle_loteestudio, hys.hel_estadolote,'
      '                 hys.hrl_relevamientolote'
      '           WHERE el_rlid = rl_id'
      '             AND rl_fecha = ultrelev'
      '             AND le_id = el_idlote'
      '             AND dl_idlote = el_idlote'
      '             AND rl_idestableci = es_id'
      '             AND de_codigo = el_estado'
      '             AND (   (dl_fechabaja IS NULL)'
      '                  OR (    dl_fechabaja IS NOT NULL'
      '                      AND dl_fecharealizacion IS NOT NULL))'
      '             AND (   (el_fechabaja IS NULL)'
      '                  OR (    (el_fechabaja IS NOT NULL)'
      '                      AND (TRUNC(de_valor) <> 10)))'
      '             AND NOT EXISTS(SELECT 1'
      '                              FROM hys.hdl_detallelote hdl1'
      
        '                             WHERE hdl1.dl_idlote = hdl.dl_idlot' +
        'e'
      
        '                               AND hdl1.dl_idtrabajador = hdl.dl' +
        '_idtrabajador'
      
        '                               AND dl_fecharealizacion IS NOT NU' +
        'LL)) ausentes,'
      '         NVL((SELECT COUNT(*) anormal'
      '                FROM art.aet_estrab, afi.aem_empresa'
      '               WHERE ultrelev <= et_fecha'
      '                 AND em_cuit = et_cuit'
      '                 AND et_tipo = '#39'EP'#39
      '                 AND et_fechabaja IS NULL'
      '                 AND et_tipores = '#39'A'#39
      '                 AND em_id = :idempresa'
      '                 AND et_estableci = estab),'
      '             0) anormales,'
      '         NVL((SELECT COUNT(*) enfprof'
      
        '                FROM hys.hgr_gestionreconfirmacion, hys.hdl_deta' +
        'llelote, hys.hde_descripcionestadolote,'
      
        '                     hys.hle_loteestudio, hys.hel_estadolote, hy' +
        's.hrl_relevamientolote, afi.aes_establecimiento,'
      '                     afi.aco_contrato, afi.aem_empresa'
      '               WHERE el_rlid = rl_id'
      '                 AND es_contrato = co_contrato'
      '                 AND co_idempresa = em_id'
      '                 AND le_id = el_idlote'
      '                 AND dl_idlote = el_idlote'
      '                 AND dl_idestableci = es_id'
      '                 AND de_codigo = el_estado'
      '                 AND el_operativo <> '#39'R'#39
      '                 AND gr_enfprofesional = '#39'S'#39
      '                 AND (   (dl_fechabaja IS NULL)'
      '                      OR (    dl_fechabaja IS NOT NULL'
      '                          AND dl_fecharealizacion IS NOT NULL))'
      '                 AND (   (el_fechabaja IS NULL)'
      '                      OR (    (el_fechabaja IS NOT NULL)'
      '                          AND (TRUNC(de_valor) <> 10)))'
      '                 AND gr_iddetallelote = dl_id'
      '                 AND em_id = :idempresa'
      '                 AND es_nroestableci = es_nroestableci),'
      '             0) enfprof'
      
        '    FROM (SELECT   es_nroestableci estab, '#39'CE'#39' tiporelev, MAX(cn' +
        '_fecharelevamiento) ultrelev, es_id, em_cuit'
      
        '              FROM afi.aes_establecimiento, afi.aco_contrato, hy' +
        's.hcn_cabeceranomina hcn, afi.aem_empresa'
      '             WHERE cn_idestado NOT IN(3, 6)'
      '               AND em_cuit = cn_cuit'
      '               AND co_idempresa = em_id'
      '               AND es_contrato = co_contrato'
      '               AND co_contrato = art.get_vultcontrato(em_cuit)'
      '               AND cn_cuit = em_cuit'
      '               AND cn_estableci = es_nroestableci'
      '               AND NOT EXISTS(SELECT 1'
      
        '                                FROM art.psr_sinriesgo, afi.aem_' +
        'empresa'
      '                               WHERE em_cuit = sr_cuit'
      
        '                                 AND sr_fecha > cn_fecharelevami' +
        'ento'
      '                                 AND em_id = :idempresa'
      
        '                                 AND sr_estableci = hcn.cn_estab' +
        'leci)'
      '               AND em_id = :idempresa'
      '          GROUP BY es_nroestableci, es_id, em_cuit'
      '          UNION ALL'
      
        '          SELECT   es_nroestableci, '#39'SE'#39' tiporelev, MAX(sr_fecha' +
        '), es_id, em_cuit'
      
        '              FROM afi.aes_establecimiento, afi.aco_contrato, ar' +
        't.psr_sinriesgo, afi.aem_empresa'
      '             WHERE em_cuit = sr_cuit'
      '               AND co_idempresa = em_id'
      '               AND es_contrato = co_contrato'
      '               AND co_contrato = art.get_vultcontrato(em_cuit)'
      '               AND sr_cuit = em_cuit'
      '               AND sr_estableci = es_nroestableci'
      '               AND NOT EXISTS(SELECT 1'
      
        '                                FROM hys.hcn_cabeceranomina, afi' +
        '.aem_empresa'
      '                               WHERE cn_idestado NOT IN(3, 6)'
      '                                 AND em_cuit = cn_cuit'
      
        '                                 AND cn_fecharelevamiento > sr_f' +
        'echa'
      '                                 AND sr_estableci = cn_estableci'
      '                                 AND em_id = :idempresa)'
      '               AND em_id = :idempresa'
      '          GROUP BY es_nroestableci, es_id, em_cuit'
      '          UNION ALL'
      
        '          SELECT es_nroestableci, '#39'SR'#39' tiporelev, NULL, es_id, e' +
        'm_cuit'
      
        '            FROM afi.aes_establecimiento, afi.aco_contrato, afi.' +
        'aem_empresa'
      '           WHERE co_idempresa = em_id'
      '             AND es_contrato = co_contrato'
      '             AND co_contrato = art.get_vultcontrato(em_cuit)'
      '             AND NOT EXISTS(SELECT 1'
      
        '                              FROM art.psr_sinriesgo, afi.aem_em' +
        'presa'
      '                             WHERE em_cuit = sr_cuit'
      '                               AND em_id = :idempresa'
      
        '                               AND sr_estableci = es_nroestablec' +
        'i)'
      '             AND NOT EXISTS(SELECT 1'
      
        '                              FROM hys.hcn_cabeceranomina, afi.a' +
        'em_empresa'
      '                             WHERE cn_idestado NOT IN(3, 6)'
      '                               AND em_cuit = cn_cuit'
      
        '                               AND es_nroestableci = cn_establec' +
        'i'
      '                               AND em_id = :idempresa)'
      '             AND em_id = :idempresa) a'
      'ORDER BY 2')
    Left = 151
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqConsolidadoEmpresaTotal: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT SUM(DECODE(tiporelev,'
      '                  '#39'CE'#39', TO_CHAR((SELECT COUNT(*)'
      '                                   FROM art.prt_riestrab'
      '                                  WHERE rt_cuit = em_cuit'
      '                                    AND rt_estableci = estab'
      
        '                                    AND rt_fecha = ultrelev)))) ' +
        'tiporelevcast,'
      '       SUM((SELECT COUNT(DISTINCT dl_idtrabajador)'
      
        '              FROM hys.hdl_detallelote, hys.hde_descripcionestad' +
        'olote, hys.hle_loteestudio,'
      '                   hys.hel_estadolote, hys.hrl_relevamientolote'
      '             WHERE el_rlid = rl_id'
      '               AND rl_fecha = ultrelev'
      '               AND le_id = el_idlote'
      '               AND dl_idlote = el_idlote'
      '               AND rl_idestableci = es_id'
      '               AND de_codigo = el_estado'
      '               AND el_operativo <> '#39'R'#39
      '               AND (   (dl_fechabaja IS NULL)'
      '                    OR (    dl_fechabaja IS NOT NULL'
      '                        AND dl_fecharealizacion IS NOT NULL))'
      '               AND (   (el_fechabaja IS NULL)'
      '                    OR (    (el_fechabaja IS NOT NULL)'
      
        '                        AND (TRUNC(de_valor) <> 10))))) personal' +
        'conexamenes,'
      '       SUM((SELECT COUNT(DISTINCT dl_idtrabajador)'
      
        '              FROM hys.hdl_detallelote hdl, hys.hde_descripcione' +
        'stadolote, hys.hle_loteestudio, hys.hel_estadolote,'
      '                   hys.hrl_relevamientolote'
      '             WHERE el_rlid = rl_id'
      '               AND rl_fecha = ultrelev'
      '               AND le_id = el_idlote'
      '               AND dl_idlote = el_idlote'
      '               AND rl_idestableci = es_id'
      '               AND de_codigo = el_estado'
      '               AND (   (dl_fechabaja IS NULL)'
      '                    OR (    dl_fechabaja IS NOT NULL'
      '                        AND dl_fecharealizacion IS NOT NULL))'
      '               AND (   (el_fechabaja IS NULL)'
      '                    OR (    (el_fechabaja IS NOT NULL)'
      '                        AND (TRUNC(de_valor) <> 10)))'
      '               AND NOT EXISTS(SELECT 1'
      '                                FROM hys.hdl_detallelote hdl1'
      
        '                               WHERE hdl1.dl_idlote = hdl.dl_idl' +
        'ote'
      
        '                                 AND hdl1.dl_idtrabajador = hdl.' +
        'dl_idtrabajador'
      
        '                                 AND dl_fecharealizacion IS NOT ' +
        'NULL))) ausentes,'
      '       SUM(NVL((SELECT COUNT(*) anormal'
      '                  FROM art.aet_estrab, afi.aem_empresa'
      '                 WHERE ultrelev <= et_fecha'
      '                   AND em_cuit = et_cuit'
      '                   AND et_tipo = '#39'EP'#39
      '                   AND et_fechabaja IS NULL'
      '                   AND et_tipores = '#39'A'#39
      '                   AND em_id = :idempresa'
      '                   AND et_estableci = estab),'
      '               0)) anormales,'
      '       SUM(NVL((SELECT COUNT(*) enfprof'
      
        '                  FROM hys.hgr_gestionreconfirmacion, hys.hdl_de' +
        'tallelote, hys.hde_descripcionestadolote,'
      
        '                       hys.hle_loteestudio, hys.hel_estadolote, ' +
        'hys.hrl_relevamientolote, afi.aes_establecimiento,'
      '                       afi.aco_contrato, afi.aem_empresa'
      '                 WHERE el_rlid = rl_id'
      '                   AND es_contrato = co_contrato'
      '                   AND co_idempresa = em_id'
      '                   AND le_id = el_idlote'
      '                   AND dl_idlote = el_idlote'
      '                   AND dl_idestableci = es_id'
      '                   AND de_codigo = el_estado'
      '                   AND el_operativo <> '#39'R'#39
      '                   AND gr_enfprofesional = '#39'S'#39
      '                   AND (   (dl_fechabaja IS NULL)'
      '                        OR (    dl_fechabaja IS NOT NULL'
      
        '                            AND dl_fecharealizacion IS NOT NULL)' +
        ')'
      '                   AND (   (el_fechabaja IS NULL)'
      '                        OR (    (el_fechabaja IS NOT NULL)'
      '                            AND (TRUNC(de_valor) <> 10)))'
      '                   AND gr_iddetallelote = dl_id'
      '                   AND em_id = :idempresa'
      '                   AND es_nroestableci = es_nroestableci),'
      '               0)) enfprof'
      
        '  FROM (SELECT   es_nroestableci estab, '#39'CE'#39' tiporelev, MAX(cn_f' +
        'echarelevamiento) ultrelev, es_id, em_cuit'
      
        '            FROM afi.aes_establecimiento, afi.aco_contrato, hys.' +
        'hcn_cabeceranomina hcn, afi.aem_empresa'
      '           WHERE cn_idestado NOT IN(3, 6)'
      '             AND em_cuit = cn_cuit'
      '             AND co_idempresa = em_id'
      '             AND es_contrato = co_contrato'
      '             AND co_contrato = art.get_vultcontrato(em_cuit)'
      '             AND cn_cuit = em_cuit'
      '             AND cn_estableci = es_nroestableci'
      '             AND NOT EXISTS(SELECT 1'
      
        '                              FROM art.psr_sinriesgo, afi.aem_em' +
        'presa'
      '                             WHERE em_cuit = sr_cuit'
      
        '                               AND sr_fecha > cn_fecharelevamien' +
        'to'
      '                               AND em_id = :idempresa'
      
        '                               AND sr_estableci = hcn.cn_estable' +
        'ci)'
      '             AND em_id = :idempresa'
      '        GROUP BY es_nroestableci, es_id, em_cuit'
      '        UNION ALL'
      
        '        SELECT   es_nroestableci, '#39'SE'#39' tiporelev, MAX(sr_fecha),' +
        ' es_id, em_cuit'
      
        '            FROM afi.aes_establecimiento, afi.aco_contrato, art.' +
        'psr_sinriesgo, afi.aem_empresa'
      '           WHERE em_cuit = sr_cuit'
      '             AND co_idempresa = em_id'
      '             AND es_contrato = co_contrato'
      '             AND co_contrato = art.get_vultcontrato(em_cuit)'
      '             AND sr_cuit = em_cuit'
      '             AND sr_estableci = es_nroestableci'
      '             AND NOT EXISTS(SELECT 1'
      
        '                              FROM hys.hcn_cabeceranomina, afi.a' +
        'em_empresa'
      '                             WHERE cn_idestado NOT IN(3, 6)'
      '                               AND em_cuit = cn_cuit'
      
        '                               AND cn_fecharelevamiento > sr_fec' +
        'ha'
      '                               AND sr_estableci = cn_estableci'
      '                               AND em_id = :idempresa)'
      '             AND em_id = :idempresa'
      '        GROUP BY es_nroestableci, es_id, em_cuit'
      '        UNION ALL'
      
        '        SELECT es_nroestableci, '#39'SR'#39' tiporelev, NULL, es_id, em_' +
        'cuit'
      
        '          FROM afi.aes_establecimiento, afi.aco_contrato, afi.ae' +
        'm_empresa'
      '         WHERE co_idempresa = em_id'
      '           AND es_contrato = co_contrato'
      '           AND co_contrato = art.get_vultcontrato(em_cuit)'
      '           AND NOT EXISTS(SELECT 1'
      
        '                            FROM art.psr_sinriesgo, afi.aem_empr' +
        'esa'
      '                           WHERE em_cuit = sr_cuit'
      '                             AND em_id = :idempresa'
      '                             AND sr_estableci = es_nroestableci)'
      '           AND NOT EXISTS(SELECT 1'
      
        '                            FROM hys.hcn_cabeceranomina, afi.aem' +
        '_empresa'
      '                           WHERE cn_idestado NOT IN(3, 6)'
      '                             AND em_cuit = cn_cuit'
      '                             AND es_nroestableci = cn_estableci'
      '                             AND em_id = :idempresa)'
      '           AND em_id = :idempresa) a')
    Left = 179
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqEnfProfDetec: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT NVL((SELECT '#39'La cantidad de Enfermedades Profesionales e ' +
        'informadas al empleador fue de '#39' || enfprof || '#39'.'#39
      
        '              FROM (SELECT   TO_CHAR(et_fecha, '#39'YYYY'#39') anio, SUM' +
        '(CASE'
      
        '                                                                ' +
        '   WHEN et_tipores = '#39'A'#39' THEN 1'
      
        '                                                                ' +
        '   ELSE 0'
      
        '                                                                ' +
        ' END) anormal'
      '                        FROM art.aet_estrab, afi.aem_empresa'
      '                       WHERE TRUNC(SYSDATE, '#39'YYYY'#39') <= et_fecha'
      '                         AND em_cuit = et_cuit'
      '                         AND et_tipo = '#39'EP'#39
      '                         AND et_fechabaja IS NULL'
      '                         AND em_id = :idempresa'
      '                    GROUP BY TO_CHAR(et_fecha, '#39'YYYY'#39')) a'
      '                   LEFT JOIN'
      
        '                   (SELECT   TO_CHAR(le_fechaalta, '#39'YYYY'#39') anio,' +
        ' SUM(CASE'
      
        '                                                                ' +
        '       WHEN gr_enfprofesional = '#39'S'#39' THEN 1'
      
        '                                                                ' +
        '       ELSE 0'
      
        '                                                                ' +
        '     END) enfprof,'
      '                             SUM(CASE'
      '                                   WHEN dl_debito = '#39'S'#39' THEN 1'
      '                                   ELSE 0'
      '                                 END) debito'
      
        '                        FROM hys.hgr_gestionreconfirmacion, hys.' +
        'hdl_detallelote, hys.hde_descripcionestadolote,'
      
        '                             hys.hle_loteestudio, hys.hel_estado' +
        'lote, afi.aes_establecimiento, afi.aco_contrato,'
      '                             afi.aem_empresa'
      '                       WHERE es_contrato = co_contrato'
      '                         AND co_idempresa = em_id'
      '                         AND le_id = el_idlote'
      '                         AND dl_idlote = el_idlote'
      '                         AND dl_idestableci = es_id'
      '                         AND de_codigo = el_estado'
      '                         AND el_operativo <> '#39'R'#39
      '                         AND (   (dl_fechabaja IS NULL)'
      '                              OR (    dl_fechabaja IS NOT NULL'
      
        '                                  AND dl_fecharealizacion IS NOT' +
        ' NULL))'
      '                         AND (   (el_fechabaja IS NULL)'
      '                              OR (    (el_fechabaja IS NOT NULL)'
      '                                  AND (TRUNC(de_valor) <> 10)))'
      '                         AND gr_iddetallelote(+) = dl_id'
      
        '                         AND TRUNC(SYSDATE, '#39'YYYY'#39') <= le_fechaa' +
        'lta'
      '                         AND em_id = :idempresa'
      
        '                    GROUP BY TO_CHAR(le_fechaalta, '#39'YYYY'#39')) b ON' +
        ' a.anio = b.anio'
      
        '                   ), '#39'La cantidad de Enfermedades Profesionales' +
        ' e informadas al empleador fue de 0.'#39') enfprof'
      '  FROM DUAL')
    Left = 123
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqAcciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT '#39'Se ha detectado la falta n'#243'mina de personal por establec' +
        'imiento. Se recomienda gestionar la n'#243'mina de personal '#39
      
        '       || '#39'por establecimiento de manera de realizar un trabajo ' +
        'm'#225's eficiente, no s'#243'lo referido al an'#225'lisis del personal '#39
      
        '       || '#39'expuesto sino tambi'#233'n para la realizaci'#243'n de visitas ' +
        'de seguridad e higiene.  En su defecto contar con un dato '#39
      
        '       || '#39'con actualizaci'#243'n peri'#243'dica sobre la cantidad de trab' +
        'ajadores por establecimiento.'#39' texto'
      
        '  FROM afi.aes_establecimiento, afi.aco_contrato, afi.aem_empres' +
        'a'
      ' WHERE co_idempresa = em_id'
      '   AND es_contrato = co_contrato'
      '   AND co_contrato = art.get_vultcontrato(em_cuit)'
      '   AND (   (es_sindatos = '#39'S'#39')'
      '        OR     (es_empleados = 0)'
      '           AND NVL(es_sinpersonal, '#39'N'#39') <> '#39'S'#39')'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Se recomienda realizar reuniones informativas a cargo de' +
        'l Preventor referente, Coordinador, Jefe de Higiene '#39
      
        '       || '#39'y Seguridad y Comercial asignado explicando las respo' +
        'nsabilidades y obligaciones al cliente. Se sugiere '#39
      
        '       || '#39'coordinar la realizaci'#243'n desde el establecimiento pri' +
        'ncipal. Debe informarse al cliente que en caso de '#39
      
        '       || '#39'demora o negativa la ART deber'#225' informar a la SRT el ' +
        'incumplimiento.'#39' texto'
      
        '  FROM afi.aes_establecimiento, afi.aco_contrato, afi.aem_empres' +
        'a'
      ' WHERE co_idempresa = em_id'
      '   AND es_contrato = co_contrato'
      '   AND co_contrato = art.get_vultcontrato(em_cuit)'
      '   AND art.afiliacion.is_empresavip(co_contrato, SYSDATE) = '#39'S'#39
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hcn_cabeceranomina'
      '                   WHERE cn_cuit = em_cuit'
      '                     AND cn_estableci = es_nroestableci'
      '                     AND cn_idestado NOT IN(3, 6)'
      
        '                     AND TO_CHAR(cn_fecharelevamiento) = TO_CHAR' +
        '(SYSDATE, '#39'YYYY'#39'))'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM art.psr_sinriesgo'
      '                   WHERE sr_cuit = em_cuit'
      '                     AND sr_estableci = es_nroestableci'
      
        '                     AND TO_CHAR(sr_fecha, '#39'YYYY'#39') = TO_CHAR(SYS' +
        'DATE, '#39'YYYY'#39'))'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Se ha detectado la falta de relevamientos de expuestos p' +
        'ara el a'#241'o en curso. Se recomienda disponer '#39
      
        '       || '#39'de los relevamientos de agentes de riesgo para cada e' +
        'stablecimiento. Util'#237'cese las herramientas '#39
      
        '       || '#39'disponibles para realizar el pedido al cliente, por e' +
        'jemplo, Ventanilla electr'#243'nica y comunicar a la '#39
      '       || '#39'SRT por la v'#237'a adecuada.'#39' texto'
      
        '  FROM afi.aes_establecimiento, afi.aco_contrato, afi.aem_empres' +
        'a'
      ' WHERE co_idempresa = em_id'
      '   AND es_contrato = co_contrato'
      '   AND co_contrato = art.get_vultcontrato(em_cuit)'
      '   AND art.afiliacion.is_empresavip(co_contrato, SYSDATE) = '#39'N'#39
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hcn_cabeceranomina'
      '                   WHERE cn_cuit = em_cuit'
      '                     AND cn_estableci = es_nroestableci'
      '                     AND cn_idestado NOT IN(3, 6)'
      
        '                     AND TO_CHAR(cn_fecharelevamiento) = TO_CHAR' +
        '(SYSDATE, '#39'YYYY'#39'))'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM art.psr_sinriesgo'
      '                   WHERE sr_cuit = em_cuit'
      '                     AND sr_estableci = es_nroestableci'
      
        '                     AND TO_CHAR(sr_fecha, '#39'YYYY'#39') = TO_CHAR(SYS' +
        'DATE, '#39'YYYY'#39'))'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Se han superado los 45 d'#237'as establecidos por la normativ' +
        'a para la asignaci'#243'n de prestador para la '#39
      
        '       || '#39'realizaci'#243'n de ex'#225'menes m'#233'dicos peri'#243'dicos. Se recomi' +
        'enda ajustar los tiempos de asignaci'#243'n acorde '#39
      '       || '#39'a la normativa vigente'#39' texto'
      
        '  FROM afi.aes_establecimiento, afi.aco_contrato, hys.hcn_cabece' +
        'ranomina hcn, afi.aem_empresa'
      ' WHERE cn_idestado NOT IN(3, 6)'
      '   AND em_cuit = cn_cuit'
      
        '   AND cn_fecharelevamiento = (SELECT MAX(hcn1.cn_fecharelevamie' +
        'nto)'
      
        '                                 FROM hys.hcn_cabeceranomina hcn' +
        '1'
      '                                WHERE hcn1.cn_cuit = hcn.cn_cuit'
      
        '                                  AND hcn1.cn_estableci = hcn.cn' +
        '_estableci'
      
        '                                  AND hcn1.cn_idestado NOT IN(3,' +
        ' 6)'
      '                                  AND NOT EXISTS(SELECT 1'
      
        '                                                   FROM art.psr_' +
        'sinriesgo'
      
        '                                                  WHERE sr_cuit ' +
        '= hcn1.cn_cuit'
      
        '                                                    AND sr_estab' +
        'leci = hcn1.cn_estableci'
      
        '                                                    AND sr_fecha' +
        ' > hcn1.cn_fecharelevamiento))'
      '   AND es_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND es_nroestableci = cn_estableci'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(cn_cuit,' +
        ' cn_fecharelevamiento)'
      '   AND CEIL((SELECT MIN(le_fechaalta)'
      
        '               FROM hys.hle_loteestudio, hys.hel_estadolote, hys' +
        '.hrl_relevamientolote'
      '              WHERE el_rlid = rl_id'
      '                AND rl_fecha = cn_fecharelevamiento'
      '                AND le_id = el_idlote'
      '                AND rl_idestableci = es_id) - cn_fechaalta) > 45'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'No se han realizado la totalidad de los ex'#225'menes m'#233'dicos' +
        ' peri'#243'dicos y se han superado los 90 d'#237'as desde '#39
      
        '       || '#39'la asignaci'#243'n de prestador. Se recomienda realizar re' +
        'uniones informativas a cargo del Preventor referente, '#39
      
        '       || '#39'Coordinador, Jefe de Higiene y Seguridad y Comercial ' +
        'asignado explicando las responsabilidades y '#39
      
        '       || '#39'obligaciones al cliente. Se sugiere coordinar la real' +
        'izaci'#243'n desde el establecimiento principal. Debe '#39
      
        '       || '#39'informarse al cliente que en caso de demora o negativ' +
        'a la ART deber'#225' informar a la SRT el incumplimiento.'#39' texto'
      
        '  FROM afi.aes_establecimiento, afi.aco_contrato, hys.hcn_cabece' +
        'ranomina hcn, afi.aem_empresa'
      ' WHERE cn_idestado NOT IN(3, 6)'
      '   AND em_cuit = cn_cuit'
      
        '   AND cn_fecharelevamiento = (SELECT MAX(hcn1.cn_fecharelevamie' +
        'nto)'
      
        '                                 FROM hys.hcn_cabeceranomina hcn' +
        '1'
      '                                WHERE hcn1.cn_cuit = hcn.cn_cuit'
      
        '                                  AND hcn1.cn_estableci = hcn.cn' +
        '_estableci'
      
        '                                  AND hcn1.cn_idestado NOT IN(3,' +
        ' 6)'
      '                                  AND NOT EXISTS(SELECT 1'
      
        '                                                   FROM art.psr_' +
        'sinriesgo'
      
        '                                                  WHERE sr_cuit ' +
        '= hcn1.cn_cuit'
      
        '                                                    AND sr_estab' +
        'leci = hcn1.cn_estableci'
      
        '                                                    AND sr_fecha' +
        ' > hcn1.cn_fecharelevamiento))'
      '   AND es_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND es_nroestableci = cn_estableci'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(cn_cuit,' +
        ' cn_fecharelevamiento)'
      '   AND art.afiliacion.is_empresavip(co_contrato, SYSDATE) = '#39'S'#39
      '   AND CEIL((SELECT MIN(le_fechaalta)'
      
        '               FROM hys.hle_loteestudio, hys.hel_estadolote, hys' +
        '.hrl_relevamientolote'
      '              WHERE el_rlid = rl_id'
      '                AND rl_fecha = cn_fecharelevamiento'
      '                AND le_id = el_idlote'
      '                AND rl_idestableci = es_id) - cn_fechaalta) > 90'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'No se han realizado la totalidad de los ex'#225'menes m'#233'dicos' +
        ' peri'#243'dicos y se han superado los 90 d'#237'as '#39
      
        '       || '#39'desde la asignaci'#243'n de prestador. Se recomienda comun' +
        'icar al cliente sobre su obligaci'#243'n. Util'#237'cese las '#39
      
        '       || '#39'herramientas disponibles para realizar el pedido al c' +
        'liente, por ejemplo, Ventanilla electr'#243'nica '#39' texto'
      
        '  FROM afi.aes_establecimiento, afi.aco_contrato, hys.hcn_cabece' +
        'ranomina hcn, afi.aem_empresa'
      ' WHERE cn_idestado NOT IN(3, 6)'
      '   AND em_cuit = cn_cuit'
      
        '   AND cn_fecharelevamiento = (SELECT MAX(hcn1.cn_fecharelevamie' +
        'nto)'
      
        '                                 FROM hys.hcn_cabeceranomina hcn' +
        '1'
      '                                WHERE hcn1.cn_cuit = hcn.cn_cuit'
      
        '                                  AND hcn1.cn_estableci = hcn.cn' +
        '_estableci'
      
        '                                  AND hcn1.cn_idestado NOT IN(3,' +
        ' 6)'
      '                                  AND NOT EXISTS(SELECT 1'
      
        '                                                   FROM art.psr_' +
        'sinriesgo'
      
        '                                                  WHERE sr_cuit ' +
        '= hcn1.cn_cuit'
      
        '                                                    AND sr_estab' +
        'leci = hcn1.cn_estableci'
      
        '                                                    AND sr_fecha' +
        ' > hcn1.cn_fecharelevamiento))'
      '   AND es_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND es_nroestableci = cn_estableci'
      
        '   AND co_contrato = art.afiliacion.get_contratovigente(cn_cuit,' +
        ' cn_fecharelevamiento)'
      '   AND art.afiliacion.is_empresavip(co_contrato, SYSDATE) = '#39'N'#39
      '   AND CEIL((SELECT MIN(le_fechaalta)'
      
        '               FROM hys.hle_loteestudio, hys.hel_estadolote, hys' +
        '.hrl_relevamientolote'
      '              WHERE el_rlid = rl_id'
      '                AND rl_fecha = cn_fecharelevamiento'
      '                AND le_id = el_idlote'
      '                AND rl_idestableci = es_id) - cn_fechaalta) > 90'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      'SELECT /*+rule*/'
      
        '       '#39'Se han detectado EP a partir de los Ex'#225'menes Peri'#243'dicos.' +
        ' Se recomienda implementar un plan '#39
      
        '       || '#39'espec'#237'fico de control de las enfermedades profesional' +
        'es a partir del an'#225'lisis de las '#39
      '       || '#39'condiciones de trabajo.'#39' texto'
      
        '  FROM hys.hgr_gestionreconfirmacion, hys.hde_descripcionestadol' +
        'ote, hys.hel_estadolote, hys.hdl_detallelote'
      ' WHERE dl_idlote = el_idlote'
      '   AND de_codigo = el_estado'
      '   AND el_operativo <> '#39'R'#39
      '   AND gr_enfprofesional = '#39'S'#39
      '   AND (   (dl_fechabaja IS NULL)'
      '        OR (    dl_fechabaja IS NOT NULL'
      '            AND dl_fecharealizacion IS NOT NULL))'
      '   AND (   (el_fechabaja IS NULL)'
      '        OR (    (el_fechabaja IS NOT NULL)'
      '            AND (TRUNC(de_valor) <> 10)))'
      '   AND gr_iddetallelote = dl_id'
      '   AND dl_idempresa = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Se ha detectado la falta de datos de puestos y/o tareas ' +
        'en las n'#243'minas de personal '#39
      
        '       || '#39'expuesto. Se recomienda asesorar a los clientes o dis' +
        'poner de una herramienta que evite '#39
      
        '       || '#39'estos errores. Esta informaci'#243'n permitir'#225' definir una' +
        ' correcta relaci'#243'n entre los riesgos '#39
      '       || '#39'asignados y la actividad realizada.'#39' texto'
      
        '  FROM comunes.crl_relacionlaboral, afi.aco_contrato, afi.aem_em' +
        'presa'
      ' WHERE co_idempresa = em_id'
      '   AND co_contrato = art.get_vultcontrato(em_cuit)'
      '   AND rl_contrato = co_contrato'
      '   AND rl_tarea IS NULL'
      '   AND em_id = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Se ha detectado la no realizaci'#243'n de la totalidad de los' +
        ' ex'#225'menes peri'#243'dicos (realizaci'#243'n '#39
      
        '       || '#39'parcial de los ex'#225'menes asignados al trabajador). Se ' +
        'recomienda: Fortalecer los '#39
      
        '       || '#39'controles a los prestadores Solicitar se informen los' +
        ' motivos por la no realizaci'#243'n '#39' || '#39'a los prestadores.'#39' texto'
      '  FROM hys.hdl_detallelote hdl'
      ' WHERE dl_idempresa = :idempresa'
      
        '   AND dl_idlote = art.amp.get_ultimolote_no_anulado(dl_idestabl' +
        'eci, '#39'N'#39', '#39'N'#39')'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hdl_detallelote hdl1'
      '                   WHERE hdl1.dl_idlote = hdl.dl_idlote'
      
        '                     AND hdl1.dl_idtrabajador = hdl.dl_idtrabaja' +
        'dor'
      '                     AND dl_fecharealizacion IS NOT NULL)'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hdl_detallelote hdl1'
      '                   WHERE hdl1.dl_idlote = hdl.dl_idlote'
      
        '                     AND hdl1.dl_idtrabajador = hdl.dl_idtrabaja' +
        'dor'
      '                     AND dl_fecharealizacion IS NULL)'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'No se ha presentado la totalidad (presentaci'#243'n parcial/a' +
        'uesentes) del personal asignado '#39
      
        '       || '#39'para la realizaci'#243'n de ex'#225'menes peri'#243'dicos. Se recomi' +
        'enda informar al empleador sobre '#39
      '       || '#39'el incumplimiento y a la SRT.'#39' texto'
      '  FROM hys.hdl_detallelote hdl'
      ' WHERE dl_idempresa = :idempresa'
      
        '   AND dl_idlote = art.amp.get_ultimolote_no_anulado(dl_idestabl' +
        'eci, '#39'N'#39', '#39'N'#39')'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hdl_detallelote hdl1'
      '                   WHERE hdl1.dl_idlote = hdl.dl_idlote'
      
        '                     AND hdl1.dl_idtrabajador = hdl.dl_idtrabaja' +
        'dor'
      '                     AND dl_fecharealizacion IS NOT NULL)'
      '   AND EXISTS(SELECT 1'
      '                FROM hys.hdl_detallelote hdl1'
      '               WHERE hdl1.dl_idlote = hdl.dl_idlote'
      '                 AND hdl1.dl_idtrabajador = hdl.dl_idtrabajador'
      '                 AND dl_fecharealizacion IS NULL)'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'No se ha presentado la totalidad (no se ha presentado ni' +
        'ng'#250'n trabajador) del personal '#39
      
        '       || '#39'asignado para la realizaci'#243'n de ex'#225'menes peri'#243'dicos. ' +
        'Se recomienda informar al empleador '#39
      '       || '#39'sobre el incumplimiento y a la SRT.'#39' texto'
      '  FROM hys.hdl_detallelote hdl'
      ' WHERE dl_idempresa = :idempresa'
      
        '   AND dl_idlote = art.amp.get_ultimolote_no_anulado(dl_idestabl' +
        'eci, '#39'N'#39', '#39'N'#39')'
      '   AND NOT EXISTS(SELECT 1'
      '                    FROM hys.hdl_detallelote hdl1'
      '                   WHERE hdl1.dl_idlote = hdl.dl_idlote'
      '                     AND dl_fecharealizacion IS NOT NULL)'
      '   AND EXISTS(SELECT 1'
      '                FROM hys.hdl_detallelote hdl1'
      '               WHERE hdl1.dl_idlote = hdl.dl_idlote'
      '                 AND dl_fecharealizacion IS NULL)'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Se ha detectado inconsistencias entre las n'#243'minas de per' +
        'sonal expuesto recibidas entre '#39
      
        '       || '#39'un per'#237'odo y otro. Se recomienda realizar verosimilit' +
        'ud de los relevamientos para '#39
      '       || '#39'que guarden consistencia.'#39' texto'
      
        '  FROM art.prg_riesgos, art.prt_riestrab prt, hys.hcn_cabecerano' +
        'mina hcn, afi.aem_empresa'
      ' WHERE cn_idestado NOT IN(3, 6)'
      '   AND em_cuit = cn_cuit'
      '   AND cn_cuit = em_cuit'
      '   AND rt_idcabeceranomina = cn_id'
      '   AND rt_riesgo = rg_codigo'
      '   AND em_id = :idempresa'
      '   AND NOT EXISTS(SELECT   1'
      
        '                      FROM art.prg_riesgos, art.prt_riestrab prt' +
        '1, hys.hcn_cabeceranomina hcn1, afi.aem_empresa'
      '                     WHERE cn_idestado NOT IN(3, 6)'
      '                       AND em_cuit = cn_cuit'
      '                       AND cn_cuit = em_cuit'
      '                       AND rt_idcabeceranomina = cn_id'
      '                       AND rt_riesgo = rg_codigo'
      '                       AND em_id = :idempresa'
      '                       AND hcn.cn_estableci = hcn1.cn_estableci'
      '                       AND prt1.rt_riesgo = prt.rt_riesgo'
      
        '                       AND TO_CHAR(hcn1.cn_fecharelevamiento, '#39'Y' +
        'YYY'#39') <> TO_CHAR(hcn.cn_fecharelevamiento, '#39'YYYY'#39')'
      
        '                  GROUP BY TRIM(rg_esop || '#39' '#39' || rg_sufijoesop)' +
        ', rg_descripcion, TO_CHAR(cn_fecharelevamiento, '#39'YYYY'#39'))'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Dadas las caracter'#237'sticas de la empresa, instarla a disp' +
        'oner de servicio de seguridad e higiene.'#39' texto'
      
        '  FROM comunes.cac_actividad, hys.hia_itemanexo, hys.hil_itemsri' +
        'esgolaboral, hys.hrl_relevriesgolaboral, afi.aco_contrato'
      
        ' WHERE rl_id = art.hys.get_ultidrelev463(rl_contrato, rl_estable' +
        'ci, NULL)'
      '   AND rl_contrato = co_contrato'
      '   AND rl_id = il_idrelevriesgolaboral'
      '   AND ia_id = il_iditemanexo'
      '   AND ia_cargorepresentante IS NOT NULL'
      '   AND DECODE(il_cumplimiento, '#39'S'#39', '#39'S'#39', '#39'N'#39') = '#39'N'#39
      '   AND ia_cargorepresentante = '#39'H'#39
      '   AND ac_id = co_idactividad'
      '   AND NOT(    SUBSTR(ac_relacion, 1, 1) = '#39'1'#39
      
        '           AND NVL(co_totempleadosactual, co_totempleados) <= 15' +
        ')'
      '   AND NOT(    SUBSTR(ac_relacion, 1, 1) = '#39'9'#39
      
        '           AND NVL(co_totempleadosactual, co_totempleados) <= 20' +
        '0)'
      '   AND NOT(    SUBSTR(ac_relacion, 1, 1) = '#39'6'#39
      
        '           AND NVL(co_totempleadosactual, co_totempleados) <= 10' +
        '0)'
      '   AND co_idempresa = :idempresa'
      '   AND ROWNUM = 1'
      'UNION ALL'
      
        'SELECT '#39'Instarla a la empresa a disponer de servicio de medicina' +
        ' laboral.'#39' texto'
      
        '  FROM comunes.cac_actividad, hys.hia_itemanexo, hys.hil_itemsri' +
        'esgolaboral, hys.hrl_relevriesgolaboral, afi.aco_contrato'
      
        ' WHERE rl_id = art.hys.get_ultidrelev463(rl_contrato, rl_estable' +
        'ci, NULL)'
      '   AND rl_contrato = co_contrato'
      '   AND rl_id = il_idrelevriesgolaboral'
      '   AND ia_id = il_iditemanexo'
      '   AND ia_cargorepresentante IS NOT NULL'
      '   AND DECODE(il_cumplimiento, '#39'S'#39', '#39'S'#39', '#39'N'#39') = '#39'N'#39
      '   AND ia_cargorepresentante = '#39'M'#39
      '   AND ac_id = co_idactividad'
      '   AND co_idempresa = :idempresa'
      '   AND ROWNUM = 1')
    Left = 207
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqAnexo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   es_nroestableci, es_nombre,  pv_descripcion provincia, ' +
        'ac_descripcion actividad, es_empleados'
      
        '    FROM art.cpv_provincias, comunes.cac_actividad, afi.aes_esta' +
        'blecimiento, afi.aco_contrato,'
      '         afi.aem_empresa'
      '   WHERE co_idempresa = em_id'
      '     AND es_contrato = co_contrato'
      '     AND co_contrato = art.get_vultcontrato(em_cuit)'
      '     AND ac_id = es_idactividad'
      '     AND es_provincia = pv_codigo'
      '     AND em_id = :idempresa'
      'ORDER BY 1'
      ''
      '')
    Left = 235
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
  object sdqAnexoEmpleados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   tj_nombre, rl_fechaingreso,'
      
        '         TRUNC(MONTHS_BETWEEN(art.actualdate, rl_fechaingreso) /' +
        ' 12) || '#39' a'#241'os '#39
      '         || CEIL(MONTHS_BETWEEN(art.actualdate, rl_fechaingreso)'
      
        '                 - TRUNC(MONTHS_BETWEEN(art.actualdate, rl_fecha' +
        'ingreso) / 12) * 12)'
      '         || '#39' meses'#39' antiguedad,'
      
        '         tj_sexo, TRUNC(MONTHS_BETWEEN(art.actualdate, tj_fnacim' +
        'iento) / 12) edad'
      
        '    FROM comunes.ctj_trabajador, comunes.crl_relacionlaboral, af' +
        'i.aco_contrato, afi.aem_empresa'
      '   WHERE co_idempresa = em_id'
      '     AND co_contrato = art.get_vultcontrato(em_cuit)'
      '     AND rl_contrato = co_contrato'
      '     AND tj_id = rl_idtrabajador'
      '     AND em_id = :idempresa'
      'ORDER BY 1')
    Left = 267
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idempresa'
        ParamType = ptInput
      end>
  end
end
