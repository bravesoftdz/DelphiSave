object rptControlInterfaces: TrptControlInterfaces
  Left = -211
  Top = 0
  Width = 1056
  Height = 816
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = sdqDatosSiart
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
  Page.PaperSize = Letter
  Page.Values = (
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    2794.000000000000000000
    80.000000000000000000
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
  ReportTitle = 'Control de Interfaces'
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  object TitleBand1: TQRBand
    Left = 30
    Top = 38
    Width = 1007
    Height = 974
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
      2577.041666666667000000
      2664.354166666667000000)
    BandType = rbTitle
    object QRShape27: TQRShape
      Left = 15
      Top = 579
      Width = 983
      Height = 83
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        219.604166666666700000
        39.687500000000000000
        1531.937500000000000000
        2600.854166666667000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape42: TQRShape
      Left = 16
      Top = 580
      Width = 982
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.020833333333340000
        42.333333333333340000
        1534.583333333333000000
        2598.208333333333000000)
      Brush.Color = clSilver
      Pen.Style = psClear
      Pen.Width = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape14: TQRShape
      Left = 15
      Top = 371
      Width = 983
      Height = 83
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        219.604166666666700000
        39.687500000000000000
        981.604166666666800000
        2600.854166666667000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape41: TQRShape
      Left = 16
      Top = 372
      Width = 982
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.020833333333340000
        42.333333333333340000
        984.249999999999900000
        2598.208333333333000000)
      Brush.Color = clSilver
      Pen.Style = psClear
      Pen.Width = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape1: TQRShape
      Left = 15
      Top = 164
      Width = 983
      Height = 83
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        219.604166666666700000
        39.687500000000000000
        433.916666666666800000
        2600.854166666667000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRShape40: TQRShape
      Left = 16
      Top = 165
      Width = 982
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        82.020833333333340000
        42.333333333333340000
        436.562499999999900000
        2598.208333333333000000)
      Brush.Color = clSilver
      Pen.Style = psClear
      Pen.Width = 0
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object qrlTitulo: TQRLabel
      Left = 380
      Top = 75
      Width = 377
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666680000
        1005.416666666667000000
        198.437500000000000000
        997.479166666666900000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'CONTROL DE INTERFACES'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 14
    end
    object QRLabel1: TQRLabel
      Left = 8
      Top = 136
      Width = 181
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        359.833333333333400000
        478.895833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SIART'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel2: TQRLabel
      Left = 182
      Top = 173
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        481.541666666666700000
        457.729166666666600000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ILT / ILP'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 345
      Top = 173
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        912.812500000000100000
        457.729166666666600000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Otros Conceptos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 508
      Top = 173
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        457.729166666666600000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisiones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 671
      Top = 173
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1775.354166666667000000
        457.729166666666600000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Prestaciones M'#233'dicas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel7: TQRLabel
      Left = 835
      Top = 173
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2209.270833333333000000
        457.729166666666600000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagos Legales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 18
      Top = 200
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        529.166666666666800000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 78
      Top = 200
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        206.375000000000000000
        529.166666666666800000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 182
      Top = 200
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        481.541666666666700000
        529.166666666666800000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel11: TQRLabel
      Left = 242
      Top = 200
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        640.291666666666800000
        529.166666666666800000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel12: TQRLabel
      Left = 345
      Top = 200
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        912.812500000000100000
        529.166666666666800000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel13: TQRLabel
      Left = 405
      Top = 200
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1071.562500000000000000
        529.166666666666800000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel14: TQRLabel
      Left = 508
      Top = 200
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        529.166666666666800000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 568
      Top = 200
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1502.833333333333000000
        529.166666666666800000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel16: TQRLabel
      Left = 671
      Top = 200
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1775.354166666667000000
        529.166666666666800000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel17: TQRLabel
      Left = 731
      Top = 200
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1934.104166666667000000
        529.166666666666800000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel18: TQRLabel
      Left = 835
      Top = 200
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2209.270833333333000000
        529.166666666666800000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel19: TQRLabel
      Left = 895
      Top = 200
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2368.020833333333000000
        529.166666666666800000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape2: TQRShape
      Left = 15
      Top = 194
      Width = 983
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        39.687500000000000000
        513.291666666666800000
        2600.854166666667000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape3: TQRShape
      Left = 179
      Top = 165
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        473.604166666666700000
        436.562499999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape4: TQRShape
      Left = 342
      Top = 165
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        904.875000000000000000
        436.562499999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape5: TQRShape
      Left = 505
      Top = 165
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        1336.145833333333000000
        436.562499999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape6: TQRShape
      Left = 668
      Top = 165
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        1767.416666666667000000
        436.562499999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape7: TQRShape
      Left = 832
      Top = 165
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        2201.333333333333000000
        436.562499999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape8: TQRShape
      Left = 75
      Top = 195
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        198.437500000000000000
        515.937500000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape9: TQRShape
      Left = 239
      Top = 195
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        632.354166666666800000
        515.937500000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape10: TQRShape
      Left = 402
      Top = 195
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1063.625000000000000000
        515.937500000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape11: TQRShape
      Left = 565
      Top = 195
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1494.895833333333000000
        515.937500000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape12: TQRShape
      Left = 728
      Top = 195
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1926.166666666667000000
        515.937500000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape13: TQRShape
      Left = 892
      Top = 195
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        2360.083333333333000000
        515.937500000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText1: TQRDBText
      Left = 77
      Top = 220
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        203.729166666666700000
        582.083333333333400000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'TOTALCS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 17
      Top = 220
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        44.979166666666670000
        582.083333333333400000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'CANTIDADCS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 181
      Top = 220
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        478.895833333333400000
        582.083333333333400000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'CANTIDADILT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 241
      Top = 220
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        637.645833333333400000
        582.083333333333400000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'TOTALILT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 344
      Top = 220
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        910.166666666666600000
        582.083333333333400000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'CANTIDADOC'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText6: TQRDBText
      Left = 404
      Top = 220
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1068.916666666667000000
        582.083333333333400000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'TOTALOC'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 507
      Top = 220
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1341.437500000000000000
        582.083333333333400000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'CANTIDADCOM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 567
      Top = 220
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1500.187500000000000000
        582.083333333333400000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'TOTALCOM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText9: TQRDBText
      Left = 670
      Top = 220
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1772.708333333334000000
        582.083333333333400000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'CANTIDADPM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText10: TQRDBText
      Left = 731
      Top = 220
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1934.104166666667000000
        582.083333333333400000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'TOTALPM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText11: TQRDBText
      Left = 834
      Top = 220
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2206.625000000000000000
        582.083333333333400000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'CANTIDADLEG'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText12: TQRDBText
      Left = 894
      Top = 220
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2365.375000000000000000
        582.083333333333400000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosSiart
      DataField = 'TOTALLEG'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel20: TQRLabel
      Left = 8
      Top = 343
      Width = 181
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        907.520833333333400000
        478.895833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'FINANCIALS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel21: TQRLabel
      Left = 182
      Top = 380
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        481.541666666666700000
        1005.416666666667000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ILT / ILP'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel22: TQRLabel
      Left = 345
      Top = 380
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        912.812500000000100000
        1005.416666666667000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Otros Conceptos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel23: TQRLabel
      Left = 18
      Top = 380
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        1005.416666666667000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Compens. Deuda Sin.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel24: TQRLabel
      Left = 508
      Top = 380
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        1005.416666666667000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisiones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel25: TQRLabel
      Left = 671
      Top = 380
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1775.354166666667000000
        1005.416666666667000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Prestaciones M'#233'dicas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel26: TQRLabel
      Left = 18
      Top = 407
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        1076.854166666667000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel27: TQRLabel
      Left = 78
      Top = 407
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        206.375000000000000000
        1076.854166666667000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel28: TQRLabel
      Left = 182
      Top = 407
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        481.541666666666700000
        1076.854166666667000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel29: TQRLabel
      Left = 242
      Top = 407
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        640.291666666666800000
        1076.854166666667000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel30: TQRLabel
      Left = 345
      Top = 407
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        912.812500000000100000
        1076.854166666667000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel31: TQRLabel
      Left = 405
      Top = 407
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1071.562500000000000000
        1076.854166666667000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel32: TQRLabel
      Left = 508
      Top = 407
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        1076.854166666667000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel33: TQRLabel
      Left = 568
      Top = 407
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1502.833333333333000000
        1076.854166666667000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel34: TQRLabel
      Left = 671
      Top = 407
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1775.354166666667000000
        1076.854166666667000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel35: TQRLabel
      Left = 731
      Top = 407
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1934.104166666667000000
        1076.854166666667000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape15: TQRShape
      Left = 15
      Top = 401
      Width = 983
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        39.687500000000000000
        1060.979166666667000000
        2600.854166666667000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape16: TQRShape
      Left = 179
      Top = 372
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        473.604166666666700000
        984.249999999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape17: TQRShape
      Left = 342
      Top = 372
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        904.875000000000000000
        984.249999999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape18: TQRShape
      Left = 505
      Top = 372
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        1336.145833333333000000
        984.249999999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape19: TQRShape
      Left = 668
      Top = 372
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        1767.416666666667000000
        984.249999999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape20: TQRShape
      Left = 75
      Top = 402
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        198.437500000000000000
        1063.625000000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape21: TQRShape
      Left = 239
      Top = 402
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        632.354166666666800000
        1063.625000000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape22: TQRShape
      Left = 402
      Top = 402
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1063.625000000000000000
        1063.625000000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape23: TQRShape
      Left = 565
      Top = 402
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1494.895833333333000000
        1063.625000000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape24: TQRShape
      Left = 728
      Top = 402
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1926.166666666667000000
        1063.625000000000000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRDBText13: TQRDBText
      Left = 77
      Top = 427
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        203.729166666666700000
        1129.770833333333000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'TOTALCS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText14: TQRDBText
      Left = 17
      Top = 427
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        44.979166666666670000
        1129.770833333333000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'CANTIDADCS'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText15: TQRDBText
      Left = 181
      Top = 427
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        478.895833333333400000
        1129.770833333333000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'CANTIDADILT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText16: TQRDBText
      Left = 241
      Top = 427
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        637.645833333333400000
        1129.770833333333000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'TOTALILT'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText17: TQRDBText
      Left = 344
      Top = 427
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        910.166666666666600000
        1129.770833333333000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'CANTIDADOC'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText18: TQRDBText
      Left = 404
      Top = 427
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1068.916666666667000000
        1129.770833333333000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'TOTALOC'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText19: TQRDBText
      Left = 507
      Top = 427
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1341.437500000000000000
        1129.770833333333000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'CANTIDADCOM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText20: TQRDBText
      Left = 567
      Top = 427
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1500.187500000000000000
        1129.770833333333000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'TOTALCOM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText21: TQRDBText
      Left = 670
      Top = 427
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1772.708333333334000000
        1129.770833333333000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'CANTIDADPM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText22: TQRDBText
      Left = 731
      Top = 427
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1934.104166666667000000
        1129.770833333333000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'TOTALPM'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel36: TQRLabel
      Left = 835
      Top = 380
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2209.270833333333000000
        1005.416666666667000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagos Legales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel37: TQRLabel
      Left = 835
      Top = 408
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2209.270833333333000000
        1079.500000000000000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel38: TQRLabel
      Left = 895
      Top = 408
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2368.020833333333000000
        1079.500000000000000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText23: TQRDBText
      Left = 894
      Top = 428
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2365.375000000000000000
        1132.416666666667000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'TOTALLEG'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText24: TQRDBText
      Left = 834
      Top = 428
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2206.625000000000000000
        1132.416666666667000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = sdqDatosFinancials
      DataField = 'CANTIDADLEG'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape25: TQRShape
      Left = 892
      Top = 403
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        2360.083333333333000000
        1066.270833333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape26: TQRShape
      Left = 832
      Top = 372
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        2201.333333333333000000
        984.249999999999900000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRSysData1: TQRSysData
      Left = 4
      Top = 4
      Width = 36
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
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDate
      Transparent = False
      FontSize = 10
    end
    object QRLabel39: TQRLabel
      Left = 8
      Top = 551
      Width = 181
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        21.166666666666670000
        1457.854166666667000000
        478.895833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'DIFERENCIAS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel40: TQRLabel
      Left = 182
      Top = 588
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        481.541666666666700000
        1555.750000000000000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ILT / ILP'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel41: TQRLabel
      Left = 345
      Top = 588
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        912.812500000000100000
        1555.750000000000000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Otros Conceptos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel42: TQRLabel
      Left = 18
      Top = 588
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        1555.750000000000000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Compens. Deuda Sin.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel43: TQRLabel
      Left = 508
      Top = 588
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        1555.750000000000000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Comisiones'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel44: TQRLabel
      Left = 671
      Top = 588
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1775.354166666667000000
        1555.750000000000000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Prestaciones M'#233'dicas'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel45: TQRLabel
      Left = 18
      Top = 615
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        1627.187500000000000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel46: TQRLabel
      Left = 78
      Top = 615
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        206.375000000000000000
        1627.187500000000000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel47: TQRLabel
      Left = 182
      Top = 615
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        481.541666666666700000
        1627.187500000000000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel48: TQRLabel
      Left = 242
      Top = 615
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        640.291666666666800000
        1627.187500000000000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel49: TQRLabel
      Left = 345
      Top = 615
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        912.812500000000100000
        1627.187500000000000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel50: TQRLabel
      Left = 405
      Top = 615
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1071.562500000000000000
        1627.187500000000000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel51: TQRLabel
      Left = 508
      Top = 615
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1344.083333333333000000
        1627.187500000000000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel52: TQRLabel
      Left = 568
      Top = 615
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1502.833333333333000000
        1627.187500000000000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel53: TQRLabel
      Left = 671
      Top = 615
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1775.354166666667000000
        1627.187500000000000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel54: TQRLabel
      Left = 731
      Top = 615
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1934.104166666667000000
        1627.187500000000000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape28: TQRShape
      Left = 15
      Top = 609
      Width = 983
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666667000
        39.687500000000000000
        1611.312500000000000000
        2600.854166666667000000)
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape29: TQRShape
      Left = 179
      Top = 580
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        473.604166666666700000
        1534.583333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape30: TQRShape
      Left = 342
      Top = 580
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        904.875000000000000000
        1534.583333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape31: TQRShape
      Left = 505
      Top = 580
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        1336.145833333333000000
        1534.583333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape32: TQRShape
      Left = 668
      Top = 580
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        1767.416666666667000000
        1534.583333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape33: TQRShape
      Left = 75
      Top = 610
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        198.437500000000000000
        1613.958333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape34: TQRShape
      Left = 239
      Top = 610
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        632.354166666666800000
        1613.958333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape35: TQRShape
      Left = 402
      Top = 610
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1063.625000000000000000
        1613.958333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape36: TQRShape
      Left = 565
      Top = 610
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1494.895833333333000000
        1613.958333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape37: TQRShape
      Left = 728
      Top = 610
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        1926.166666666667000000
        1613.958333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRLabel55: TQRLabel
      Left = 835
      Top = 588
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2209.270833333333000000
        1555.750000000000000000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Pagos Legales'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel56: TQRLabel
      Left = 835
      Top = 616
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2209.270833333333000000
        1629.833333333333000000
        150.812500000000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Cantidad'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel57: TQRLabel
      Left = 895
      Top = 616
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2368.020833333333000000
        1629.833333333333000000
        264.583333333333400000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape38: TQRShape
      Left = 892
      Top = 611
      Width = 3
      Height = 51
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        134.937500000000000000
        2360.083333333333000000
        1616.604166666667000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object QRShape39: TQRShape
      Left = 832
      Top = 580
      Width = 3
      Height = 81
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        214.312500000000000000
        2201.333333333333000000
        1534.583333333333000000
        7.937500000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrlCSCant: TQRLabel
      Left = 17
      Top = 636
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        44.979166666666670000
        1682.750000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlCSTot: TQRLabel
      Left = 77
      Top = 636
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        203.729166666666700000
        1682.750000000000000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0,00'
      Color = clWhite
      OnPrint = FormatoCampo2
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlILTCant: TQRLabel
      Left = 181
      Top = 636
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        478.895833333333400000
        1682.750000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlILTTot: TQRLabel
      Left = 241
      Top = 636
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        637.645833333333400000
        1682.750000000000000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0,00'
      Color = clWhite
      OnPrint = FormatoCampo2
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlOCCant: TQRLabel
      Left = 344
      Top = 636
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        910.166666666666600000
        1682.750000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlOCTot: TQRLabel
      Left = 404
      Top = 636
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1068.916666666667000000
        1682.750000000000000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0,00'
      Color = clWhite
      OnPrint = FormatoCampo2
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlCOMCant: TQRLabel
      Left = 507
      Top = 636
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1341.437500000000000000
        1682.750000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlCOMTot: TQRLabel
      Left = 567
      Top = 636
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1500.187500000000000000
        1682.750000000000000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0,00'
      Color = clWhite
      OnPrint = FormatoCampo2
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlPMCant: TQRLabel
      Left = 670
      Top = 636
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1772.708333333334000000
        1682.750000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlPMTot: TQRLabel
      Left = 730
      Top = 636
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1931.458333333333000000
        1682.750000000000000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0,00'
      Color = clWhite
      OnPrint = FormatoCampo2
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlLEGCant: TQRLabel
      Left = 834
      Top = 636
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2206.625000000000000000
        1682.750000000000000000
        150.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlLEGTot: TQRLabel
      Left = 894
      Top = 636
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        2365.375000000000000000
        1682.750000000000000000
        264.583333333333400000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '0,00'
      Color = clWhite
      OnPrint = FormatoCampo2
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrlSubtitulo: TQRLabel
      Left = 381
      Top = 97
      Width = 205
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        60.854166666666680000
        1008.062500000000000000
        256.645833333333400000
        542.395833333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'SubTitulo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 18
      Top = 173
      Width = 160
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        47.625000000000000000
        457.729166666666600000
        423.333333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Compens. Deuda Sin.'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object qriLogo: TQRImage
      Left = 839
      Top = 3
      Width = 163
      Height = 64
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        169.333333333333300000
        2219.854166666667000000
        7.937500000000000000
        431.270833333333400000)
      Stretch = True
    end
  end
  object sdqDatosSiart: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT '#39'ILT / ILP'#39' tipo, COUNT(*) cantidadILT, NVL(SUM(l' +
        'e_imporperi), 0) totalILT'
      '          FROM art.sle_liquiempsin'
      '         WHERE le_faprobado = :fecha'
      '           AND le_imporperi <> 0'
      '           AND (   NVL(le_estado, '#39' '#39') = '#39'E'#39
      '                OR (    NVL(le_estado, '#39' '#39') = '#39'X'#39
      '                    AND le_fmodif = le_faprobado))),'
      
        '       (SELECT '#39'OTROS CONCEPTOS'#39' tipo, COUNT(*) cantidadOC, NVL(' +
        'SUM(pr_imporpago), 0) totalOC'
      '          FROM art.spr_pagoexpesin'
      '         WHERE pr_faprobado = :fecha'
      '           AND pr_imporpago <> 0'
      '           AND (   pr_estado =('#39'E'#39')'
      '                OR (    NVL(pr_estado, '#39' '#39') = '#39'X'#39
      '                    AND pr_fmodif = pr_faprobado))),'
      
        '       (SELECT '#39'COMPENSACION'#39' tipo, SUM(cantidad) cantidadCS, SU' +
        'M(total) totalCS'
      
        '          FROM (SELECT COUNT(*) cantidad, NVL(SUM(sle.le_imporpe' +
        'ri), 0) total'
      
        '                  FROM art.sle_liquiempsin sle, art.sle_liqpendi' +
        'entesdeuda sledeuda'
      '                 WHERE sledeuda.le_idcompensacion = :lote'
      '                   AND sledeuda.le_siniestro = sle.le_siniestro'
      '                   AND sledeuda.le_orden = sle.le_orden'
      '                   AND sledeuda.le_recaida = sle.le_recaida'
      '                   AND sledeuda.le_numliqui = sle.le_numliqui'
      '                   AND sle.le_imporperi <> 0'
      '                UNION ALL'
      '                SELECT COUNT(*) cantidad, SUM(-v_total) total'
      '                  FROM v_ced_estadodeuda'
      '                 WHERE v_id = :lote'
      '                   AND v_total <> 0)),'
      
        '       (SELECT '#39'COMISIONES'#39' tipo, COUNT(*) cantidadCOM, NVL(SUM(' +
        'lc_comisionneta), 0) totalCOM'
      '          FROM xlc_liqcomision'
      '         WHERE lc_fechaliq = :fecha'
      '           AND lc_comisionneta <> 0'
      '           AND lc_estado <> '#39'C'#39'),'
      
        '       (SELECT '#39'PRESTACIONES MEDICAS'#39' tipo, NVL(SUM(cantidad), 0' +
        ') cantidadPM, NVL(SUM(total), 0) totalPM'
      '          FROM (SELECT 1 cantidad, SUM(vo_monto) total'
      '                  FROM art.svo_volantes'
      '                 WHERE vo_fechapago = :fecha'
      '                   AND vo_monto <> 0'
      '                   AND vo_estado IN('#39'E'#39', '#39'EG'#39')'
      #9#9#9'     GROUP BY vo_volante  '
      '                UNION ALL'
      
        '                SELECT 1 cantidad, SUM(vo_montoboni-vo_montodebi' +
        'to) total'
      '                  FROM art.svo_volantes'
      '                 WHERE vo_fechapago = :fecha'
      '                   AND vo_monto <> 0'
      '                   AND vo_estado IN('#39'E'#39', '#39'EG'#39')'
      
        '                   AND (vo_montodebito <> 0 or vo_montoboni <> 0' +
        ')'
      ' '#9' '#9' '#9' '#9' GROUP BY vo_volante'
      '                UNION ALL'
      
        '                SELECT DECODE(vo_montoboni,0,DECODE(vo_montodebi' +
        'to,0,1,0),0) cantidad, SUM(iv_impfacturado) total'
      '                  FROM art.siv_itemvolante, art.svo_volantes'
      '                 WHERE iv_estado LIKE '#39'C%'#39
      '                   AND iv_impfacturado < 0'
      '                   AND vo_fechapago = :fecha'
      '                   AND vo_monto <> 0'
      '                   AND vo_estado IN('#39'E'#39', '#39'EG'#39')'
      '                   AND vo_volante = iv_volante'
      #9#9#9#9' GROUP BY VO_VOLANTE, VO_MONTOBONI, VO_MONTODEBITO)),'
      
        '       (SELECT '#39'LEGALES'#39' tipo, SUM(cantidad) cantidadLEG, SUM(to' +
        'tal) totalLEG'
      
        '          FROM (SELECT COUNT(*) cantidad, NVL(SUM(NVL(pl.pl_impo' +
        'rtepago, 0) + NVL(pl.pl_importeconretencion, 0)), 0) total'
      '                  FROM legales.lpl_pagolegal pl'
      '                 WHERE pl.pl_fechaaprobado >= :fecha'
      '                   AND pl.pl_fechaaprobado < TO_DATE(:fecha + 1)'
      '                   AND (   (pl.pl_estado = '#39'E'#39')'
      '                        OR (    NVL(pl.pl_estado, '#39' '#39') = '#39'X'#39
      
        '                            AND TRUNC(pl.pl_fechamodif) = TRUNC(' +
        'pl.pl_fechaaprobado)))'
      
        '                   AND NVL(pl.pl_importepago, 0) + NVL(pl.pl_imp' +
        'orteconretencion, 0) <> 0'
      '                UNION ALL'
      
        '                SELECT COUNT(*) cantidad, NVL(SUM(NVL(ps_importe' +
        'pago, 0) + NVL(ps_importeconretencion, 0)), 0) total'
      '                  FROM legales.lps_pagosumario ps'
      '                 WHERE ps.ps_fechaaprobado >= :fecha'
      '                   AND ps.ps_fechaaprobado < TO_DATE(:fecha + 1)'
      '                   AND (   (ps.ps_estado = '#39'E'#39')'
      '                        OR (    NVL(ps.ps_estado, '#39' '#39') = '#39'X'#39
      
        '                            AND TRUNC(ps.ps_fechamodif) = TRUNC(' +
        'ps.ps_fechaaprobado)))))'#9
      '')
    Left = 38
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end>
    object sdqDatosSiartTIPO: TStringField
      FieldName = 'TIPO'
      Size = 9
    end
    object sdqDatosSiartCANTIDADILT: TFloatField
      FieldName = 'CANTIDADILT'
    end
    object sdqDatosSiartTOTALILT: TFloatField
      FieldName = 'TOTALILT'
      currency = True
    end
    object sdqDatosSiartTIPO_1: TStringField
      FieldName = 'TIPO_1'
      Size = 15
    end
    object sdqDatosSiartCANTIDADOC: TFloatField
      FieldName = 'CANTIDADOC'
    end
    object sdqDatosSiartTOTALOC: TFloatField
      FieldName = 'TOTALOC'
      currency = True
    end
    object sdqDatosSiartTIPO_2: TStringField
      FieldName = 'TIPO_2'
      Size = 12
    end
    object sdqDatosSiartCANTIDADCS: TFloatField
      FieldName = 'CANTIDADCS'
    end
    object sdqDatosSiartTOTALCS: TFloatField
      FieldName = 'TOTALCS'
      currency = True
    end
    object sdqDatosSiartTIPO_3: TStringField
      FieldName = 'TIPO_3'
      Size = 10
    end
    object sdqDatosSiartCANTIDADCOM: TFloatField
      FieldName = 'CANTIDADCOM'
    end
    object sdqDatosSiartTOTALCOM: TFloatField
      FieldName = 'TOTALCOM'
      currency = True
    end
    object sdqDatosSiartTIPO_4: TStringField
      FieldName = 'TIPO_4'
    end
    object sdqDatosSiartCANTIDADPM: TFloatField
      FieldName = 'CANTIDADPM'
    end
    object sdqDatosSiartTOTALPM: TFloatField
      FieldName = 'TOTALPM'
      currency = True
    end
    object sdqDatosSiartTIPO_5: TStringField
      FieldName = 'TIPO_5'
      Size = 7
    end
    object sdqDatosSiartCANTIDADLEG: TFloatField
      FieldName = 'CANTIDADLEG'
    end
    object sdqDatosSiartTOTALLEG: TFloatField
      FieldName = 'TOTALLEG'
      currency = True
    end
  end
  object sdqDatosFinancials: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT '#39'ILT / ILP'#39' tipo, COUNT(*) cantidadILT, NVL(SUM(i' +
        'nvoice_amount), 0) totalILT'
      '          FROM ap_invoices_all'
      '         WHERE invoice_date = :fecha'
      '           AND invoice_num LIKE '#39'S-0%'#39
      '           AND SOURCE = '#39'AC INTERFACE'#39
      #9#9'   AND pay_group_lookup_code <> '#39'Siniestros Compensaci'#243'n'#39'),'
      
        '       (SELECT '#39'OTROS CONCEPTOS'#39' tipo, COUNT(*) cantidadOC, NVL(' +
        'SUM(invoice_amount), 0) totalOC'
      '          FROM ap_invoices_all'
      '         WHERE invoice_date = :fecha'
      '           AND invoice_num LIKE '#39'S-1%'#39
      '           AND SOURCE = '#39'AC INTERFACE'#39'),'
      
        '       (SELECT '#39'COMPENSACION'#39' tipo, NVL(MAX(control_invoice_coun' +
        't), 0) cantidadCS, NVL(MAX(control_invoice_total), 0) totalCS'
      '          FROM ap_batches_all'
      
        '         WHERE Upper(batch_name) like '#39'COMPENS%LOTE%'#39' || NVL(LTR' +
        'IM(TO_CHAR(:lote)), '#39'XXX'#39') || '#39'%'#39'),'
      
        '       (SELECT '#39'COMISIONES'#39' tipo, COUNT(*) cantidadCOM, NVL(SUM(' +
        'invoice_amount), 0) totalCOM'
      '          FROM ap_invoices_all'
      '         WHERE invoice_date = :fecha'
      '           AND invoice_num LIKE '#39'R-%'#39
      '           AND SOURCE = '#39'AC INTERFACE'#39'),'
      
        '       (SELECT '#39'PRESTACIONES MEDICAS'#39' tipo, COUNT(*) cantidadPM,' +
        ' NVL(SUM(invoice_amount), 0) totalPM'
      '          FROM ap_invoices_all'
      '         WHERE gl_date = :fecha'
      '           AND SOURCE = '#39'AC INTERFACE'#39
      '           AND pay_group_lookup_code LIKE '#39'Prest%'#39'),'
      
        '       (SELECT '#39'LEGALES'#39' tipo, COUNT(*) cantidadLEG, NVL(SUM(inv' +
        'oice_amount), 0) totalLEG'
      '          FROM ap_invoices_all'
      '         WHERE gl_date = :fecha'
      '           AND SOURCE = '#39'AC INTERFACE'#39
      '           AND pay_group_lookup_code = '#39'LEGALES_SIART'#39')'
      ''
      '')
    Left = 68
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'lote'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end>
    object sdqDatosFinancialsTIPO: TStringField
      FieldName = 'TIPO'
      Size = 9
    end
    object sdqDatosFinancialsCANTIDADILT: TFloatField
      FieldName = 'CANTIDADILT'
    end
    object sdqDatosFinancialsTOTALILT: TFloatField
      FieldName = 'TOTALILT'
      currency = True
    end
    object sdqDatosFinancialsTIPO_1: TStringField
      FieldName = 'TIPO_1'
      Size = 15
    end
    object sdqDatosFinancialsCANTIDADOC: TFloatField
      FieldName = 'CANTIDADOC'
    end
    object sdqDatosFinancialsTOTALOC: TFloatField
      FieldName = 'TOTALOC'
      currency = True
    end
    object sdqDatosFinancialsTIPO_2: TStringField
      FieldName = 'TIPO_2'
      Size = 12
    end
    object sdqDatosFinancialsCANTIDADCS: TFloatField
      FieldName = 'CANTIDADCS'
    end
    object sdqDatosFinancialsTOTALCS: TFloatField
      FieldName = 'TOTALCS'
      currency = True
    end
    object sdqDatosFinancialsTIPO_3: TStringField
      FieldName = 'TIPO_3'
      Size = 10
    end
    object sdqDatosFinancialsCANTIDADCOM: TFloatField
      FieldName = 'CANTIDADCOM'
    end
    object sdqDatosFinancialsTOTALCOM: TFloatField
      FieldName = 'TOTALCOM'
      currency = True
    end
    object sdqDatosFinancialsTIPO_4: TStringField
      FieldName = 'TIPO_4'
    end
    object sdqDatosFinancialsCANTIDADPM: TFloatField
      FieldName = 'CANTIDADPM'
    end
    object sdqDatosFinancialsTOTALPM: TFloatField
      FieldName = 'TOTALPM'
      currency = True
    end
    object sdqDatosFinancialsTIPO_5: TStringField
      FieldName = 'TIPO_5'
      Size = 7
    end
    object sdqDatosFinancialsCANTIDADLEG: TFloatField
      FieldName = 'CANTIDADLEG'
    end
    object sdqDatosFinancialsTOTALLEG: TFloatField
      FieldName = 'TOTALLEG'
      currency = True
    end
  end
end
