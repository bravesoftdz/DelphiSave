inherited frmInvReporteMinuta: TfrmInvReporteMinuta
  Left = 372
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Impresi'#243'n de Minuta'
  ClientHeight = 77
  ClientWidth = 224
  OldCreateOrder = True
  Scaled = False
  DesignSize = (
    224
    77)
  PixelsPerInch = 96
  TextHeight = 13
  object gbVencimiento: TGroupBox [0]
    Left = 3
    Top = 3
    Width = 218
    Height = 43
    Caption = 'Fecha'
    TabOrder = 0
    object Label1: TLabel
      Left = 103
      Top = 18
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object edFechaDesde: TDateComboBox
      Left = 9
      Top = 15
      Width = 89
      Height = 21
      MaxDateCombo = edFechaHasta
      TabOrder = 0
    end
    object edFechaHasta: TDateComboBox
      Left = 121
      Top = 15
      Width = 89
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 1
    end
  end
  object btnAceptar: TButton [1]
    Left = 69
    Top = 50
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [2]
    Left = 146
    Top = 50
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object qrMinuta: TQuickRep [3]
    Left = 44
    Top = 120
    Width = 1056
    Height = 816
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
    PrintIfEmpty = True
    ReportTitle = 'Minuta de Inversiones'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRGroup1: TQRGroup
      Left = 38
      Top = 111
      Width = 980
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      LinkBand = DetailBand1
      Size.Values = (
        76.729166666666670000
        2592.916666666667000000)
      Expression = 'sdqDatos.FECHA'
      FooterBand = qrBandFooter
      Master = qrMinuta
      ReprintOnNewPage = False
      object qrlDia: TQRLabel
        Left = 1
        Top = 5
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.861111111111110000
          3.527777777777778000
          12.347222222222220000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'D'#237'a:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 37
        Top = 5
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.861111111111110000
          97.013888888888890000
          12.347222222222220000
          303.388888888888900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrBandFooter: TQRBand
      Left = 38
      Top = 180
      Width = 980
      Height = 267
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
        706.437500000000000000
        2592.916666666667000000)
      BandType = rbGroupFooter
      object QRLabel7: TQRLabel
        Left = 5
        Top = 59
        Width = 106
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
          280.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CONFECCIONA '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlConfecciona: TQRLabel
        Left = 115
        Top = 59
        Width = 855
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          304.270833333333300000
          156.104166666666700000
          2262.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlConfecciona'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlAutoriza: TQRMemo
        Left = 115
        Top = 134
        Width = 855
        Height = 128
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          338.666666666666700000
          304.270833333333300000
          354.541666666666700000
          2262.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 5
        Top = 134
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          354.541666666666700000
          280.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'AUTORIZA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 980
      Height = 73
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
        193.145833333333300000
        2592.916666666667000000)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 4
        Top = 9
        Width = 974
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          10.583333333333330000
          23.812500000000000000
          2577.041666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Minuta de Inversiones'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qriLogo: TQRImage
        Left = 810
        Top = 5
        Width = 163
        Height = 64
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          169.333333333333300000
          2143.125000000000000000
          13.229166666666670000
          431.270833333333300000)
        Stretch = True
      end
      object qrlMontos: TQRLabel
        Left = 395
        Top = 35
        Width = 407
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.861111111111110000
          1045.986111111111000000
          91.722222222222220000
          1077.736111111111000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlMontos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 160
      Width = 980
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2592.916666666667000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 117
        Top = 2
        Width = 141
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          309.562500000000000000
          5.291666666666667000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'ESPECIE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 264
        Top = 2
        Width = 165
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          698.500000000000000000
          5.291666666666667000
          436.562499999999900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'ENTIDAD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 435
        Top = 2
        Width = 122
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1150.937500000000000000
          5.291666666666667000
          322.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'MONTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        OnPrint = FormatMonto
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 565
        Top = 2
        Width = 122
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1494.895833333333000000
          5.291666666666667000
          322.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'VALOR_NOMINAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 694
        Top = 2
        Width = 145
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1836.208333333333000000
          5.291666666666667000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'TIPO_OPERACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 846
        Top = 2
        Width = 54
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2238.375000000000000000
          5.291666666666667000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'PLAZO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 906
        Top = 2
        Width = 70
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2397.125000000000000000
          5.291666666666667000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'TASA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        OnPrint = FormatMonto2
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 258
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          682.625000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 429
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1135.062500000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 558
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1476.375000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 687
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1817.687500000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 840
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2222.500000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 900
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2381.250000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 110
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          291.041666666666700000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText8: TQRDBText
        Left = 2
        Top = 2
        Width = 108
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          5.291666666666667000
          5.291666666666667000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'TIPO_INSTRUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 140
      Width = 980
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2592.916666666667000000)
      ParentBand = QRGroup1
      object QRLabel10: TQRLabel
        Left = 2
        Top = 2
        Width = 108
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          5.291666666666667000
          5.291666666666667000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo Instr.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object qrlDocumento: TQRLabel
        Left = 117
        Top = 2
        Width = 141
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          309.562500000000000000
          5.291666666666667000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Especie'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object qrlCodigo: TQRLabel
        Left = 264
        Top = 2
        Width = 165
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          698.500000000000000000
          5.291666666666667000
          436.562499999999900000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Entidad'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 436
        Top = 2
        Width = 122
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1153.583333333333000000
          5.291666666666667000
          322.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Monto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 565
        Top = 2
        Width = 122
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1494.895833333333000000
          5.291666666666667000
          322.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valor Nominal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 694
        Top = 2
        Width = 145
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1836.208333333333000000
          5.291666666666667000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo de Operaci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 846
        Top = 2
        Width = 54
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2238.375000000000000000
          5.291666666666667000
          142.875000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Plazo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 906
        Top = 2
        Width = 70
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2397.125000000000000000
          5.291666666666667000
          185.208333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tasa'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRShape14: TQRShape
        Left = 110
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          291.041666666666700000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 258
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          682.625000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 429
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          1135.944444444444000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 558
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          1476.375000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 687
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          1816.805555555556000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 840
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          2222.500000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 900
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.388888888888890000
          2381.250000000000000000
          0.000000000000000000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 16
    Top = 89
  end
  inherited XPMenu: TXPMenu
    Left = 44
    Top = 89
  end
  inherited ilByN: TImageList
    Left = 16
    Top = 117
  end
  inherited ilColor: TImageList
    Left = 44
    Top = 117
  end
  inherited IconosXP: TImageList
    Left = 72
    Top = 117
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION ESPECIE, ' +
        'NS_NOMBRE ENTIDAD, OI_MONTO MONTO,'
      
        '       IN_VALORNOMINAL VALOR_NOMINAL, TO_DESCRIPCION TIPO_OPERAC' +
        'ION,'
      '       IN_PLAZO PLAZO, IN_TASA TASA, OI_FECHA FECHA'
      
        '  FROM NNS_INSTITUCION, NIN_INSTRUMENTO, NOI_OPERACIONINSTRUMENT' +
        'O NOI2,'
      '       NTI_TIPOINSTRUMENTO, NTO_TIPOOPERACION'
      'WHERE NS_ID(+) = IN_IDINSTITUCION'
      '   AND IN_ID = OI_IDINSTRUMENTO'
      '   AND TO_ID = OI_IDTIPOOPERACION'
      '   AND IN_IDTIPOINSTRUMENTO = TI_ID'
      '   AND OI_FECHA BETWEEN :FechaDesde AND :FechaHasta'
      '   AND (SELECT SUM(NOI.OI_MONTO)'
      '          FROM NIN_INSTRUMENTO NIN, NOI_OPERACIONINSTRUMENTO NOI'
      '         WHERE NOI.OI_FECHA = NOI2.OI_FECHA'
      '           AND IN_ID = OI_IDINSTRUMENTO'
      
        '           AND NIN.IN_IDTIPOINSTRUMENTO = TI_ID) BETWEEN :Desde ' +
        'AND :Hasta'
      'UNION ALL'
      
        'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IA_DESCRIPCION ESPECIE, ' +
        'NS_NOMBRE ENTIDAD, NULL MONTO,'
      
        '       IA_NOMINALLICITACION VALOR_NOMINAL, '#39'LICITACION'#39' TIPO_OPE' +
        'RACION,'
      
        '       NULL PLAZO, IA_TASALICITACION TASA, TRUNC(IA_FECHACARGALI' +
        'CIT) FECHA'
      '  FROM NNS_INSTITUCION, NIA_INSTRUMENTOENANALISIS,'
      '       NTI_TIPOINSTRUMENTO'
      'WHERE NS_ID(+) = IA_IDCOLOCADOR'
      '   AND IA_IDTIPOINSTRUMENTO = TI_ID'
      
        '   AND TRUNC(IA_FECHACARGALICIT) BETWEEN :FechaDesde AND :FechaH' +
        'asta'
      '   AND :Desde < 1'
      'ORDER BY FECHA, TIPO_OPERACION, ESPECIE'
      '')
    Left = 143
    Top = 115
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FechaHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Desde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Hasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FechaHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Desde'
        ParamType = ptInput
      end>
  end
end
