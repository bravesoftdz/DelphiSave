object frmPedidoDocum: TfrmPedidoDocum
  Left = 639
  Top = 104
  Caption = 'frmPedidoDocum'
  ClientHeight = 830
  ClientWidth = 928
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
  object qrPedidoDocum: TQuickRep
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
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
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 763
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        2018.770833333333000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRSysData1: TQRSysData
        Left = 1221
        Top = 69
        Width = 39
        Height = 21
        Size.Values = (
          55.562500000000000000
          3230.562500000000000000
          182.562500000000000000
          103.187500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        FontSize = 12
      end
      object QRSysData2: TQRSysData
        Left = 1192
        Top = 92
        Width = 69
        Height = 14
        Size.Values = (
          37.041666666666670000
          3153.833333333334000000
          243.416666666666700000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        FontSize = 8
      end
      object qriLogo: TQRImage
        Left = 1096
        Top = 2
        Width = 167
        Height = 64
        Size.Values = (
          169.333333333333300000
          2899.833333333334000000
          5.291666666666667000
          441.854166666666700000)
        XLColumn = 0
        Stretch = True
      end
      object qrlLugarFecha: TQRLabel
        Left = 280
        Top = 45
        Width = 435
        Height = 19
        Size.Values = (
          50.270833333333330000
          740.833333333333400000
          119.062500000000000000
          1150.937500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlLugarFecha'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 12
        Top = 109
        Width = 145
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          288.395833333333400000
          383.645833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Se'#241'ores'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlEmpresa: TQRLabel
        Left = 12
        Top = 133
        Width = 469
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          351.895833333333400000
          1240.895833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '                                 '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 12
        Top = 157
        Width = 145
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          415.395833333333400000
          383.645833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Presente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 412
        Top = 189
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          1090.083333333333000000
          500.062500000000100000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'REF.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlTrabajador: TQRLabel
        Left = 463
        Top = 189
        Width = 250
        Height = 19
        Size.Values = (
          50.270833333333330000
          1225.020833333333000000
          500.062500000000100000
          661.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '                         '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 412
        Top = 215
        Width = 135
        Height = 19
        Size.Values = (
          50.270833333333330000
          1090.083333333333000000
          568.854166666666800000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha del Siniestro:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlFechaAccidente: TQRLabel
        Left = 552
        Top = 215
        Width = 161
        Height = 19
        Size.Values = (
          50.270833333333330000
          1460.500000000000000000
          568.854166666666800000
          425.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '                         '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 412
        Top = 240
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          1090.083333333333000000
          635.000000000000000000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CUIL:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlCuil: TQRLabel
        Left = 463
        Top = 240
        Width = 250
        Height = 19
        Size.Values = (
          50.270833333333330000
          1225.020833333333000000
          635.000000000000000000
          661.458333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '                         '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 12
        Top = 309
        Width = 223
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          817.562500000000000000
          590.020833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'De nuestra mayor consideraci'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo1: TQRMemo
        Left = 12
        Top = 344
        Width = 693
        Height = 53
        Size.Values = (
          140.229166666666700000
          31.750000000000000000
          910.166666666666600000
          1833.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            '                                            Por la presente, nos' +
            ' dirigimos a Uds. a fin de solicitarles nos remitan a la mayor b' +
            'revedad los recibos de sueldo del trabajador de la referencia. M' +
            'otiva el pedido, el hecho que debemos estimar el ingreso base me' +
            'nsual seg'#250'n lo normado en el art'#237'culo 12 de la Ley 24.557.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 12
        Top = 421
        Width = 267
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          1113.895833333333000000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '  -  El Periodo requerido es el siguiente:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 12
        Top = 450
        Width = 267
        Height = 19
        Size.Values = (
          50.270833333333330000
          31.750000000000000000
          1190.625000000000000000
          706.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '  -  Fotocopia del DNI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo2: TQRMemo
        Left = 12
        Top = 504
        Width = 693
        Height = 57
        Size.Values = (
          150.812500000000000000
          31.750000000000000000
          1333.500000000000000000
          1833.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            '                                            Dicha documentaci'#243'n ' +
            'podr'#225' ser remitida a Carlos Pellegrini 91 planta baja, Ciudad Au' +
            't'#243'noma de Buenos Aires, atenci'#243'n Departamento de Prestaciones Di' +
            'nerarias o v'#237'a correo electr'#243'nico a Incapacidadesdinerarias@prov' +
            'art.com.ar. ')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo3: TQRMemo
        Left = 12
        Top = 567
        Width = 693
        Height = 40
        Size.Values = (
          105.833333333333300000
          31.750000000000000000
          1500.187500000000000000
          1833.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            '                                            A la espera de la re' +
            'misi'#243'n de la documentaci'#243'n requerida saludamos a Uds. muy atte.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlPeriodo: TQRLabel
        Left = 290
        Top = 421
        Width = 421
        Height = 19
        Size.Values = (
          50.270833333333330000
          767.291666666666800000
          1113.895833333333000000
          1113.895833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '   '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 285
        Top = 450
        Width = 428
        Height = 19
        Size.Values = (
          50.270833333333330000
          754.062500000000000000
          1190.625000000000000000
          1132.416666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '    '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
end
