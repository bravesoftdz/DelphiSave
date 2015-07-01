object frmRptRemitoValores: TfrmRptRemitoValores
  Left = -4
  Top = -4
  ClientHeight = 850
  ClientWidth = 1440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object rptRemitoValores: TQuickRep
    Left = 52
    Top = 0
    Width = 979
    Height = 1267
    IDReport = 0
    DataSet = dmCustomDataModule.sdqConsulta
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
    Zoom = 120
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object DetailBand1: TQRBand
      Left = 45
      Top = 46
      Width = 888
      Height = 1175
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2590.711805555556000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape4: TQRShape
        Left = 5
        Top = 887
        Width = 72
        Height = 16
        Size.Values = (
          35.277777777777780000
          11.024305555555560000
          1955.711805555556000000
          158.750000000000000000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRoundRect
        RoundFactor = 0.109999999403953600
        VertAdjust = 0
      end
      object qrlNumero: TQRLabel
        Left = 2
        Top = 10
        Width = 884
        Height = 31
        Size.Values = (
          68.791666666666680000
          5.291666666666667000
          21.166666666666670000
          1949.979166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'REMITO DE VALORES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object qriLogo: TQRImage
        Left = 692
        Top = 4
        Width = 196
        Height = 77
        Size.Values = (
          169.333333333333300000
          1526.645833333333000000
          7.937500000000000000
          431.270833333333400000)
        XLColumn = 0
        Stretch = True
      end
      object qrlDireccionART: TQRLabel
        Left = 608
        Top = 92
        Width = 276
        Height = 20
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          203.729166666666700000
          608.541666666666800000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlDireccionART'
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
      object qrlTelefonoART: TQRLabel
        Left = 608
        Top = 133
        Width = 276
        Height = 20
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          293.687500000000000000
          608.541666666666800000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlTelefonoART'
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
      object qrlFaxART: TQRLabel
        Left = 608
        Top = 154
        Width = 276
        Height = 20
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          338.666666666666700000
          608.541666666666800000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlFaxART'
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
      object qrlWebART: TQRLabel
        Left = 608
        Top = 174
        Width = 276
        Height = 20
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          383.645833333333400000
          608.541666666666800000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlWebART'
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
      object qrlPciaART: TQRLabel
        Left = 608
        Top = 113
        Width = 276
        Height = 20
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          248.708333333333300000
          608.541666666666800000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlPciaART'
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
      object QRLabel1: TQRLabel
        Left = 276
        Top = 640
        Width = 294
        Height = 18
        Size.Values = (
          39.687500000000000000
          608.541666666666800000
          1410.229166666667000000
          648.229166666666800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma de Receptor'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRShape2: TQRShape
        Left = 276
        Top = 634
        Width = 294
        Height = 6
        Size.Values = (
          13.229166666666670000
          608.541666666666800000
          1397.000000000000000000
          648.229166666666800000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 588
        Top = 640
        Width = 294
        Height = 18
        Size.Values = (
          39.687500000000000000
          1296.458333333333000000
          1410.229166666667000000
          648.229166666666800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma Devoluci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 588
        Top = 634
        Width = 294
        Height = 6
        Size.Values = (
          13.229166666666670000
          1296.458333333333000000
          1397.000000000000000000
          648.229166666666800000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrdbCUIT: TQRDBText
        Left = 571
        Top = 227
        Width = 145
        Height = 20
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          500.062500000000100000
          320.145833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CUIT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbCONTRATO: TQRDBText
        Left = 798
        Top = 227
        Width = 86
        Height = 20
        Size.Values = (
          44.979166666666670000
          1759.479166666667000000
          500.062500000000100000
          190.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'CONTRATO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbRAZON_SOCIAL: TQRDBText
        Left = 107
        Top = 227
        Width = 404
        Height = 20
        Size.Values = (
          44.979166666666670000
          235.479166666666700000
          500.062500000000100000
          891.645833333333200000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'RAZON_SOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 517
        Top = 227
        Width = 52
        Height = 20
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          500.062500000000100000
          113.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CUIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 721
        Top = 227
        Width = 73
        Height = 20
        Size.Values = (
          44.979166666666670000
          1590.145833333333000000
          500.062500000000100000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Contrato:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 227
        Width = 100
        Height = 20
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          500.062500000000100000
          219.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Raz'#243'n Social:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 4
        Top = 92
        Width = 88
        Height = 20
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          203.729166666666700000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 4
        Top = 120
        Width = 88
        Height = 20
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          264.583333333333400000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Remito N'#186':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrdbFECHA_ACC: TQRDBText
        Left = 97
        Top = 92
        Width = 101
        Height = 20
        Size.Values = (
          44.979166666666670000
          214.312500000000000000
          203.729166666666700000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'IMPRESION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 97
        Top = 120
        Width = 101
        Height = 20
        Size.Values = (
          44.979166666666670000
          214.312500000000000000
          264.583333333333400000
          222.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'REMITO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 4
        Top = 317
        Width = 151
        Height = 20
        Size.Values = (
          44.097222222222220000
          8.819444444444444000
          698.940972222222200000
          332.934027777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CHEQUE N'#186':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 460
        Top = 317
        Width = 100
        Height = 20
        Size.Values = (
          44.097222222222220000
          1014.236111111111000000
          698.940972222222200000
          220.486111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'BANCO:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 4
        Top = 355
        Width = 151
        Height = 20
        Size.Values = (
          44.097222222222220000
          8.819444444444444000
          782.725694444444400000
          332.934027777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'FECHA VTO.:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 460
        Top = 355
        Width = 100
        Height = 20
        Size.Values = (
          44.097222222222220000
          1014.236111111111000000
          782.725694444444400000
          220.486111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'IMPORTE:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrdbBANCO: TQRDBText
        Left = 562
        Top = 317
        Width = 322
        Height = 20
        Size.Values = (
          44.097222222222220000
          1239.131944444444000000
          698.940972222222200000
          709.965277777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'BANCO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbVA_NROCHEQUE: TQRDBText
        Left = 160
        Top = 317
        Width = 294
        Height = 20
        Size.Values = (
          44.097222222222220000
          352.777777777777800000
          698.940972222222200000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'VA_NROCHEQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbIMPORTE: TQRDBText
        Left = 562
        Top = 355
        Width = 322
        Height = 20
        Size.Values = (
          44.097222222222220000
          1239.131944444444000000
          782.725694444444400000
          709.965277777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'IMPORTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrdbFECHA_VAL: TQRDBText
        Left = 160
        Top = 355
        Width = 294
        Height = 20
        Size.Values = (
          44.097222222222220000
          352.777777777777800000
          782.725694444444400000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'FECHA_VAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 3
        Top = 431
        Width = 151
        Height = 20
        Size.Values = (
          44.097222222222220000
          6.614583333333333000
          950.295138888888900000
          332.934027777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MOTIVO RECHAZO:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrdbMRECH: TQRDBText
        Left = 160
        Top = 431
        Width = 294
        Height = 20
        Size.Values = (
          44.097222222222220000
          352.777777777777800000
          950.295138888888900000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'MRECH'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 4
        Top = 113
        Width = 194
        Height = 6
        Size.Values = (
          13.229166666666670000
          7.937500000000000000
          248.708333333333300000
          428.625000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 4
        Top = 140
        Width = 194
        Height = 6
        Size.Values = (
          13.229166666666670000
          7.937500000000000000
          309.562500000000000000
          428.625000000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 4
        Top = 247
        Width = 882
        Height = 6
        Size.Values = (
          13.229166666666670000
          7.937500000000000000
          545.041666666666800000
          1944.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 4
        Top = 337
        Width = 882
        Height = 6
        Size.Values = (
          13.229166666666670000
          7.937500000000000000
          743.479166666666800000
          1944.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 4
        Top = 376
        Width = 882
        Height = 6
        Size.Values = (
          13.229166666666670000
          7.937500000000000000
          828.145833333333200000
          1944.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 4
        Top = 452
        Width = 882
        Height = 6
        Size.Values = (
          13.229166666666670000
          8.819444444444444000
          996.597222222222200000
          1944.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel14: TQRLabel
        Left = 276
        Top = 706
        Width = 294
        Height = 18
        Size.Values = (
          39.687500000000000000
          608.541666666666700000
          1555.750000000000000000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Aclaraci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 276
        Top = 774
        Width = 294
        Height = 18
        Size.Values = (
          39.687500000000000000
          608.541666666666700000
          1706.562500000000000000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Por'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel16: TQRLabel
        Left = 276
        Top = 841
        Width = 294
        Height = 18
        Size.Values = (
          39.687500000000000000
          608.541666666666700000
          1854.729166666667000000
          648.229166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Car'#225'cter'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 460
        Top = 431
        Width = 100
        Height = 20
        Size.Values = (
          44.097222222222220000
          1014.236111111111000000
          950.295138888888900000
          220.486111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'F. RECHAZO:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 562
        Top = 431
        Width = 322
        Height = 20
        Size.Values = (
          44.097222222222220000
          1239.131944444444000000
          950.295138888888900000
          709.965277777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'FECHARECHAZO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 3
        Top = 469
        Width = 151
        Height = 20
        Size.Values = (
          44.097222222222220000
          6.614583333333333000
          1034.079861111111000000
          332.934027777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OBSERVACIONES:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 4
        Top = 490
        Width = 882
        Height = 6
        Size.Values = (
          13.229166666666670000
          8.819444444444444000
          1080.381944444444000000
          1944.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 276
        Top = 700
        Width = 294
        Height = 6
        Size.Values = (
          13.229166666666670000
          608.541666666666700000
          1543.402777777778000000
          648.229166666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 276
        Top = 768
        Width = 294
        Height = 6
        Size.Values = (
          13.229166666666670000
          608.541666666666700000
          1693.333333333333000000
          648.229166666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 276
        Top = 835
        Width = 294
        Height = 6
        Size.Values = (
          13.229166666666670000
          608.541666666666700000
          1841.059027777778000000
          648.229166666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 16
        Top = 889
        Width = 48
        Height = 13
        Size.Values = (
          28.663194444444440000
          35.277777777777780000
          1960.121527777778000000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AF-09-F002'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 6
      end
      object QRDBText3: TQRDBText
        Left = 160
        Top = 469
        Width = 723
        Height = 20
        Size.Values = (
          44.097222222222220000
          352.777777777777800000
          1034.079861111111000000
          1594.114583333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'OBSERVACIONES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 4
        Top = 393
        Width = 151
        Height = 20
        Size.Values = (
          44.097222222222220000
          8.819444444444444000
          866.510416666666700000
          332.934027777777800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'RECIBO N'#186':'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 160
        Top = 393
        Width = 723
        Height = 20
        Size.Values = (
          44.097222222222220000
          352.777777777777800000
          866.510416666666700000
          1594.114583333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqDatos
        DataField = 'DESCR_TIPORECIBO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRShape14: TQRShape
        Left = 4
        Top = 413
        Width = 882
        Height = 6
        Size.Values = (
          13.229166666666670000
          8.819444444444444000
          910.607638888888900000
          1944.687500000000000000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      
        'SELECT EM_CUIT CUIT, EM_NOMBRE RAZON_SOCIAL, CO_CONTRATO CONTRAT' +
        'O,'
      '       TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, VA_NROCHEQUE,'
      
        '       VA_VENCIMIENTO FECHA_VAL, VA_IMPORTE IMPORTE, UBI.TB_DESC' +
        'RIPCION ACCION,'
      '       TRUNC(VA_FECHAALTA) FECHA_ACC, UV_REMITO REMITO,'
      
        '       TRUNC(UV_FECHAIMPRESION) IMPRESION, UV_RECEPTOR RECEPTOR,' +
        ' RECH.TB_DESCRIPCION MRECH,'
      
        '       TRUNC(VA_FECHARECHAZO) FECHARECHAZO, UV_OBSERVACIONES OBS' +
        'ERVACIONES,'
      
        '       COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) DESCR_TIPORECIB' +
        'O'
      '  FROM AEM_EMPRESA, ACO_CONTRATO, OTV_TIPOVALOR, ZBA_BANCO,'
      
        '    '#9' CTB_TABLAS RECH, CTB_TABLAS UBI, ZVA_VALOR, RUV_UBICACIONV' +
        'ALOR'
      ' WHERE VA_ID = UV_IDVALOR'
      '   AND BA_ID = VA_IDBANCO'
      '   AND TV_ID = VA_IDTIPOVALOR'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_CONTRATO = VA_IDCONTRATO'
      '   AND UBI.TB_CODIGO = UV_ACCION'
      '   AND UBI.TB_CLAVE = '#39'UBVAL'#39
      '   AND RECH.TB_CODIGO(+) = VA_MOTIVORECHAZO'
      '   AND RECH.TB_CLAVE(+) = '#39'MRECH'#39
      '   AND UV_ID = :ID'
      ' UNION ALL'
      
        'SELECT ED_CUIT CUIT, ED_NOMBRE RAZON_SOCIAL, TO_NUMBER(NULL) CON' +
        'TRATO,'
      '       TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, VA_NROCHEQUE,'
      
        '       VA_VENCIMIENTO FECHA_VAL, VA_IMPORTE IMPORTE, UBI.TB_DESC' +
        'RIPCION ACCION,'
      '       TRUNC(VA_FECHAALTA) FECHA_ACC, UV_REMITO REMITO,'
      
        '       TRUNC(UV_FECHAIMPRESION) IMPRESION, UV_RECEPTOR RECEPTOR,' +
        ' RECH.TB_DESCRIPCION MRECH,'
      
        '       TRUNC(VA_FECHARECHAZO) FECHARECHAZO, UV_OBSERVACIONES OBS' +
        'ERVACIONES,'
      
        '       COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) DESCR_TIPORECIB' +
        'O'
      '  FROM RED_EMPDEUDORA, OTV_TIPOVALOR, ZBA_BANCO,'
      
        '    '#9' CTB_TABLAS RECH, CTB_TABLAS UBI, ZVA_VALOR, RUV_UBICACIONV' +
        'ALOR'
      ' WHERE VA_ID = UV_IDVALOR'
      '   AND BA_ID = VA_IDBANCO'
      '   AND TV_ID = VA_IDTIPOVALOR'
      '   AND ED_ID = VA_IDEMPDEUDORA'
      '   AND UBI.TB_CODIGO = UV_ACCION'
      '   AND UBI.TB_CLAVE = '#39'UBVAL'#39
      '   AND RECH.TB_CODIGO(+) = VA_MOTIVORECHAZO'
      '   AND RECH.TB_CLAVE(+) = '#39'MRECH'#39
      '   AND UV_ID = :ID'
      ' UNION ALL'
      
        'SELECT GC_CUIT CUIT, GC_NOMBRE RAZON_SOCIAL, TO_NUMBER(NULL) CON' +
        'TRATO,'
      '       TV_DESCRIPCION TIPO_VALOR, BA_NOMBRE BANCO, VA_NROCHEQUE,'
      
        '       VA_VENCIMIENTO FECHA_VAL, VA_IMPORTE IMPORTE, UBI.TB_DESC' +
        'RIPCION ACCION,'
      '       TRUNC(VA_FECHAALTA) FECHA_ACC, UV_REMITO REMITO,'
      
        '       TRUNC(UV_FECHAIMPRESION) IMPRESION, UV_RECEPTOR RECEPTOR,' +
        ' RECH.TB_DESCRIPCION MRECH,'
      
        '       TRUNC(VA_FECHARECHAZO) FECHARECHAZO, UV_OBSERVACIONES OBS' +
        'ERVACIONES,'
      
        '       COBRANZA.GETDESCRIPCIONRECIBOVALOR(VA_ID) DESCR_TIPORECIB' +
        'O'
      '  FROM AGC_GESTORCUENTA, OTV_TIPOVALOR, ZBA_BANCO,'
      
        '    '#9' CTB_TABLAS RECH, CTB_TABLAS UBI, ZVA_VALOR, RUV_UBICACIONV' +
        'ALOR'
      ' WHERE VA_ID = UV_IDVALOR'
      '   AND BA_ID = VA_IDBANCO'
      '   AND TV_ID = VA_IDTIPOVALOR'
      '   AND GC_ID = VA_IDGESTORCUENTA'
      '   AND UBI.TB_CODIGO = UV_ACCION'
      '   AND UBI.TB_CLAVE = '#39'UBVAL'#39
      '   AND RECH.TB_CODIGO(+) = VA_MOTIVORECHAZO'
      '   AND RECH.TB_CLAVE(+) = '#39'MRECH'#39
      '   AND UV_ID = :ID'
      '')
    Left = 7
    Top = 7
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
