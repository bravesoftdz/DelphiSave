object frmListIncAprobadas: TfrmListIncAprobadas
  Left = 477
  Top = 354
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Incapacidades Aprobadas'
  ClientHeight = 278
  ClientWidth = 587
  Color = clBtnFace
  Constraints.MinHeight = 120
  Constraints.MinWidth = 206
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbFAprobacion: TGroupBox
    Left = 374
    Top = 52
    Width = 209
    Height = 47
    Caption = ' F. Aprobaci'#243'n '
    TabOrder = 2
    object lblFechas: TLabel
      Left = 101
      Top = 21
      Width = 8
      Height = 13
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dcFecAccDesde: TDateComboBox
      Left = 5
      Top = 17
      Width = 95
      Height = 21
      MaxDateCombo = dcFecAccHasta
      TabOrder = 0
    end
    object dcFecAccHasta: TDateComboBox
      Left = 109
      Top = 17
      Width = 95
      Height = 21
      MinDateCombo = dcFecAccDesde
      TabOrder = 1
    end
  end
  object btnAceptar: TBitBtn
    Left = 417
    Top = 246
    Width = 79
    Height = 27
    Caption = '&Aceptar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btnAceptarClick
  end
  object btnCancelar: TBitBtn
    Left = 502
    Top = 246
    Width = 79
    Height = 27
    Cancel = True
    Caption = '&Cancelar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = btnCancelarClick
  end
  object ScrollBox1: TScrollBox
    Left = 93
    Top = 360
    Width = 1401
    Height = 577
    TabOrder = 13
    object qrIncApro: TQuickRep
      Left = 5
      Top = 40
      Width = 1056
      Height = 816
      IDReport = 0
      DataSet = sdqInca
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
        50.000000000000000000
        50.000000000000000000
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
      PreviewInitialState = wsMaximized
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object TitleBand1: TQRBand
        Left = 19
        Top = 38
        Width = 1018
        Height = 81
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          214.312500000000000000
          2693.458333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
        object qrlTitulo: TQRLabel
          Left = 3
          Top = 18
          Width = 1012
          Height = 25
          Frame.Width = 3
          Size.Values = (
            66.145833333333340000
            7.937500000000000000
            47.625000000000000000
            2677.583333333333000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'INCAPACIDADES APROBADAS'
          Color = cl3DLight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 14
        end
        object QRSysData1: TQRSysData
          Left = 956
          Top = 2
          Width = 31
          Height = 15
          Size.Values = (
            39.687500000000000000
            2529.416666666667000000
            5.291666666666667000
            82.020833333333340000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          Data = qrsDate
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 8
        end
        object qrlSubtitulo: TQRLabel
          Left = 3
          Top = 46
          Width = 1012
          Height = 32
          Frame.Width = 3
          Size.Values = (
            84.666666666666680000
            7.937500000000000000
            121.708333333333300000
            2677.583333333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Caption = 'qrlSubtitulo'
          Color = cl3DLight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
      end
      object ColumnHeaderBand1: TQRBand
        Left = 19
        Top = 119
        Width = 1018
        Height = 35
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          92.604166666666680000
          2693.458333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbColumnHeader
        object QRLabel1: TQRLabel
          Left = 0
          Top = 13
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666700000
            0.000000000000000000
            34.395833333333300000
            171.979166666667000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Siniestro'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel2: TQRLabel
          Left = 67
          Top = 13
          Width = 36
          Height = 17
          Size.Values = (
            44.979166666666670000
            177.270833333333300000
            34.395833333333340000
            95.250000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Orden'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel3: TQRLabel
          Left = 106
          Top = 13
          Width = 178
          Height = 17
          Size.Values = (
            44.979166666666670000
            280.458333333333400000
            34.395833333333340000
            470.958333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Nombre Trabajador'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel4: TQRLabel
          Left = 286
          Top = 13
          Width = 211
          Height = 17
          Size.Values = (
            44.979166666666670000
            756.708333333333400000
            34.395833333333340000
            558.270833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Nombre Empresa'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel5: TQRLabel
          Left = 501
          Top = 13
          Width = 108
          Height = 17
          Size.Values = (
            44.979166666666670000
            1325.562500000000000000
            34.395833333333340000
            285.750000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Tipo'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel6: TQRLabel
          Left = 821
          Top = 13
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            2172.229166666667000000
            34.395833333333330000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'F.Incap.'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel7: TQRLabel
          Left = 885
          Top = 13
          Width = 55
          Height = 17
          Size.Values = (
            44.979166666666670000
            2341.562500000000000000
            34.395833333333330000
            145.520833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = '% Incap.'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRShape2: TQRShape
          Left = 1
          Top = 31
          Width = 1015
          Height = 1
          Size.Values = (
            2.645833333333330000
            2.645833333333330000
            82.020833333333300000
            2685.520833333330000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRLabel10: TQRLabel
          Left = 613
          Top = 13
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1621.895833333333000000
            34.395833333333340000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Id.Juicio'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel11: TQRLabel
          Left = 944
          Top = 13
          Width = 72
          Height = 17
          Size.Values = (
            44.979166666666670000
            2497.666666666667000000
            34.395833333333340000
            190.500000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Extens. ILT'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel12: TQRLabel
          Left = 755
          Top = 13
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1997.604166666667000000
            34.395833333333330000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Rec. Dict'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel8: TQRLabel
          Left = 683
          Top = 13
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            1807.104166666667000000
            34.395833333333330000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Mediaci'#243'n'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
      end
      object DetailBand1: TQRBand
        Left = 19
        Top = 154
        Width = 1018
        Height = 51
        AlignToBottom = False
        BeforePrint = DetailBand1BeforePrint
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          134.937500000000000000
          2693.458333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbDetail
        object qrdbSiniestro: TQRDBText
          Left = 0
          Top = 0
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666700000
            0.000000000000000000
            0.000000000000000000
            171.979166666667000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqInca
          DataField = 'EX_SINIESTRO'
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
        object qrdbOrden: TQRDBText
          Left = 67
          Top = 0
          Width = 36
          Height = 17
          Size.Values = (
            44.979166666666700000
            177.270833333333000000
            0.000000000000000000
            95.250000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqInca
          DataField = 'EX_ORDEN'
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
        object QRDBText1: TQRDBText
          Left = 106
          Top = 0
          Width = 177
          Height = 17
          Size.Values = (
            44.979166666666670000
            280.458333333333400000
            0.000000000000000000
            468.312500000000100000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'TJ_NOMBRE'
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
        object qrdbEmpresa: TQRDBText
          Left = 286
          Top = 0
          Width = 211
          Height = 17
          Size.Values = (
            44.979166666666670000
            756.708333333333400000
            0.000000000000000000
            558.270833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'EM_NOMBRE'
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
        object qrlTipo: TQRLabel
          Left = 503
          Top = 0
          Width = 106
          Height = 17
          Size.Values = (
            44.979166666666670000
            1330.854166666667000000
            0.000000000000000000
            280.458333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlTipo'
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
        object qrlFecha: TQRLabel
          Left = 823
          Top = 0
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            2177.520833333333000000
            0.000000000000000000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlFecha'
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
        object qrlPorcent: TQRLabel
          Left = 887
          Top = 0
          Width = 55
          Height = 17
          Size.Values = (
            44.979166666666670000
            2346.854166666667000000
            0.000000000000000000
            145.520833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlPorcent'
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
        object QRDBText2: TQRDBText
          Left = 677
          Top = 0
          Width = 76
          Height = 17
          Size.Values = (
            44.979166666666670000
            1791.229166666667000000
            0.000000000000000000
            201.083333333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqInca
          DataField = 'mediacion'
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
          Left = 613
          Top = 0
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1621.895833333333000000
            0.000000000000000000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'JUICIOSPD'
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
        object QRDBText4: TQRDBText
          Left = 955
          Top = 0
          Width = 50
          Height = 17
          Size.Values = (
            44.979166666666670000
            2526.770833333333000000
            0.000000000000000000
            132.291666666666700000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqInca
          DataField = 'EXTENSIONILT'
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
        object QRDBText5: TQRDBText
          Left = 756
          Top = 0
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            2000.250000000000000000
            0.000000000000000000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'EV_FECHARECEPCION'
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
        object QRLabel15: TQRLabel
          Left = 20
          Top = 31
          Width = 56
          Height = 17
          Size.Values = (
            44.979166666666670000
            52.916666666666660000
            82.020833333333340000
            148.166666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Aut. Dict:'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel13: TQRLabel
          Left = 164
          Top = 31
          Width = 114
          Height = 17
          Size.Values = (
            44.979166666666670000
            433.916666666666800000
            82.020833333333340000
            301.625000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'D'#237'as e/ rec. y apr.:'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel16: TQRLabel
          Left = 338
          Top = 31
          Width = 75
          Height = 17
          Size.Values = (
            44.979166666666670000
            894.291666666666800000
            82.020833333333320000
            198.437500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Pluriempleo:'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRDBText6: TQRDBText
          Left = 79
          Top = 32
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            209.020833333333300000
            84.666666666666680000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'fautdict'
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
          Left = 416
          Top = 32
          Width = 44
          Height = 17
          Size.Values = (
            44.979166666666670000
            1100.666666666667000000
            84.666666666666680000
            116.416666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'pluriemp'
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
          Left = 282
          Top = 32
          Width = 27
          Height = 17
          Size.Values = (
            44.979166666666670000
            746.125000000000000000
            84.666666666666680000
            71.437500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqInca
          DataField = 'dias'
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
        object QRShape3: TQRShape
          Left = 42
          Top = 49
          Width = 934
          Height = 1
          Size.Values = (
            2.645833333333333000
            111.125000000000000000
            129.645833333333300000
            2471.208333333333000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
      end
      object PageFooterBand1: TQRBand
        Left = 19
        Top = 233
        Width = 1018
        Height = 22
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          58.208333333333340000
          2693.458333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageFooter
        object QRSysData2: TQRSysData
          Left = 977
          Top = 2
          Width = 38
          Height = 17
          Size.Values = (
            44.979166666666700000
            2584.979166666670000000
            5.291666666666670000
            100.541666666667000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsPageNumber
          Transparent = False
          ExportAs = exptText
          FontSize = 10
        end
        object QRLabel9: TQRLabel
          Left = 947
          Top = 2
          Width = 28
          Height = 17
          Size.Values = (
            44.979166666666670000
            2505.604166666667000000
            5.291666666666667000
            74.083333333333340000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'P'#225'g.'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
      end
      object SummaryBand1: TQRBand
        Left = 19
        Top = 205
        Width = 1018
        Height = 28
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          74.083333333333340000
          2693.458333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbSummary
        object QRShape1: TQRShape
          Left = 1
          Top = 6
          Width = 1012
          Height = 1
          Size.Values = (
            2.645833333333333000
            2.645833333333333000
            15.875000000000000000
            2677.583333333333000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object qrlTotal: TQRLabel
          Left = 5
          Top = 8
          Width = 101
          Height = 17
          Size.Values = (
            44.979166666666670000
            13.229166666666670000
            21.166666666666670000
            267.229166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Total Aprobaciones:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object qrlSumPorcent: TQRLabel
          Left = 880
          Top = 8
          Width = 55
          Height = 17
          Size.Values = (
            44.979166666666670000
            2328.333333333333000000
            21.166666666666670000
            145.520833333333300000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlSumPorcent'
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
      end
    end
  end
  object gbTipoAccidente: TGroupBox
    Left = 3
    Top = 101
    Width = 152
    Height = 47
    Caption = 'Tipo de Accidente'
    TabOrder = 3
    DesignSize = (
      152
      47)
    object cmbTipoAccidente: TDBCheckCombo
      Left = 4
      Top = 18
      Width = 145
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DataSource = dsTipoAccidente
      KeyField = 'TA_CODIGO'
      ListField = 'TA_DESCRIPCION'
    end
  end
  object gbEmpresa: TGroupBox
    Left = 4
    Top = 3
    Width = 579
    Height = 47
    Caption = ' Empresa '
    TabOrder = 0
    inline fraEmpresa: TfraEmpresa
      Left = 6
      Top = 16
      Width = 565
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 6
      ExplicitTop = 16
      ExplicitWidth = 565
      ExplicitHeight = 21
      inherited lbContrato: TLabel
        Left = 461
        ExplicitLeft = 375
      end
      inherited edContrato: TIntEdit
        Left = 508
        ExplicitLeft = 508
      end
      inherited cmbRSocial: TArtComboBox
        Width = 326
        ExplicitWidth = 326
      end
    end
  end
  object gbTrabajador: TGroupBox
    Left = 4
    Top = 52
    Width = 370
    Height = 47
    Caption = ' Trabajador  '
    TabOrder = 1
    DesignSize = (
      370
      47)
    inline fraTrabajador: TfraTrabajador
      Left = 5
      Top = 16
      Width = 358
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitTop = 16
      ExplicitWidth = 358
      inherited cmbNombre: TArtComboBox
        Width = 274
        ExplicitWidth = 274
      end
    end
  end
  object gbTipoEmpresa: TGroupBox
    Left = 307
    Top = 199
    Width = 276
    Height = 40
    Caption = ' Tipo Empresa '
    TabOrder = 9
    object rbSuss: TRadioButton
      Left = 11
      Top = 17
      Width = 47
      Height = 17
      Caption = 'SUSS'
      TabOrder = 0
    end
    object rbNoSuss: TRadioButton
      Left = 73
      Top = 17
      Width = 64
      Height = 17
      Caption = 'No SUSS'
      TabOrder = 1
    end
    object rbSussTodas: TRadioButton
      Left = 215
      Top = 17
      Width = 49
      Height = 17
      Caption = 'Todas'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object rbSussMixto: TRadioButton
      Left = 152
      Top = 17
      Width = 47
      Height = 17
      Caption = 'Mixto'
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 199
    Width = 152
    Height = 40
    Caption = ' Extensi'#243'n ILT '
    TabOrder = 7
    object rbExt_Si: TRadioButton
      Left = 7
      Top = 17
      Width = 31
      Height = 17
      Caption = 'Si'
      TabOrder = 0
    end
    object rbExt_No: TRadioButton
      Left = 52
      Top = 17
      Width = 34
      Height = 17
      Caption = 'No'
      TabOrder = 1
    end
    object rbExt_Todos: TRadioButton
      Left = 93
      Top = 17
      Width = 50
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 156
    Top = 199
    Width = 151
    Height = 40
    Caption = ' Juicio '
    TabOrder = 8
    object rbJuicio_Si: TRadioButton
      Left = 8
      Top = 17
      Width = 30
      Height = 17
      Caption = 'Si'
      TabOrder = 0
    end
    object rbJuicio_No: TRadioButton
      Left = 49
      Top = 17
      Width = 34
      Height = 17
      Caption = 'No'
      TabOrder = 1
    end
    object rbJuicio_Todos: TRadioButton
      Left = 92
      Top = 17
      Width = 50
      Height = 17
      Caption = 'Todos'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object GroupBox5: TGroupBox
    Left = 4
    Top = 151
    Width = 151
    Height = 46
    Caption = ' Tipo de concepto '
    TabOrder = 5
    DesignSize = (
      151
      46)
    object dcTipoCon: TDBCheckCombo
      Left = 7
      Top = 17
      Width = 139
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = dcTipoConChange
      DataSource = dsTipoCon
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
  end
  object GroupBox4: TGroupBox
    Left = 155
    Top = 151
    Width = 428
    Height = 46
    Caption = 'Concepto de pago'
    TabOrder = 6
    DesignSize = (
      428
      46)
    object dcConcepto: TDBCheckCombo
      Left = 8
      Top = 17
      Width = 414
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DataSource = dsConcepto
      KeyField = 'CP_CONPAGO'
      ListField = 'CP_DENPAGO'
    end
  end
  object ToolBar: TToolBar
    Left = 5
    Top = 244
    Width = 32
    Height = 27
    Align = alNone
    BorderWidth = 1
    Caption = 'ToolBar'
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    object tbLimpiar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      ImageIndex = 1
      OnClick = tbLimpiarClick
    end
  end
  object gbSector: TGroupBox
    Left = 155
    Top = 101
    Width = 428
    Height = 47
    Caption = ' Sector de la Empresa '
    TabOrder = 4
    DesignSize = (
      428
      47)
    object cmbSector: TDBCheckCombo
      Left = 7
      Top = 18
      Width = 416
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DataSource = dsSector
      KeyField = 'TB_CODIGO'
      ListField = 'TB_DESCRIPCION'
    end
  end
  object sdqInca: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ex_siniestro, ex_orden, tj_nombre, em_nombre, ex_diagnost' +
        'icooms, ev_porcincapacidad,'
      
        '       liq.Get_InfoIncapacidad(ev_Siniestro, ev_Orden, ev_Fecha+' +
        '1) InfoInca,  art.SIN.get_listanrosjuicioexp(ex_siniestro, ex_or' +
        'den, ex_recaida, '#39'T'#39') juiciospd,'
      
        '       art.inca.is_extensionilt(ex_id) ExtensionILT, ev_fecharec' +
        'epcion, art.SIN.get_listanrosmediacionesexp (ex_id) mediacion,'
      
        '       art.inca.get_fechaautorizado(ev_idevento) fautdict, ex_pl' +
        'uriempleo pluriemp,'
      
        '       decode(art.inca.get_fechaautorizado (ev_idevento), '#39#39', tr' +
        'unc(sysdate), to_date(art.inca.get_fechaautorizado (ev_idevento)' +
        ', '#39'dd/mm/yyyy'#39')) - to_date(ev_fecharecepcion, '#39'dd/mm/yyyy'#39') dias'
      
        'FROM ctj_Trabajadores, aem_empresa, sex_Expedientes, sev_eventos' +
        'detramite'
      'WHERE ex_Siniestro = ev_siniestro   '
      '  AND ex_Orden = ev_orden   '
      '  AND ex_Recaida = 0'
      '  AND ev_evento > 0 '
      '  AND NVL(ev_Codigo, '#39'000'#39')='#39'950'#39'   '
      '  AND ev_Fecha=to_date(:pFecha,'#39'dd/mm/yyyy'#39')'
      '  AND tj_Cuil = ex_Cuil   '
      '  AND em_Cuit = ex_Cuit'
      'ORDER BY ex_siniestro')
    Left = 140
    Top = 239
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pFecha'
        ParamType = ptInput
      end>
    object sdqIncaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqIncaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqIncaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqIncaEX_DIAGNOSTICOOMS: TStringField
      FieldName = 'EX_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqIncaINFOINCA: TStringField
      FieldName = 'INFOINCA'
      Size = 4000
    end
    object sdqIncaEV_PORCINCAPACIDAD: TFloatField
      FieldName = 'EV_PORCINCAPACIDAD'
    end
    object sdqIncaJUICIOSPD: TStringField
      DisplayWidth = 12
      FieldName = 'JUICIOSPD'
      Required = True
      Size = 12
    end
    object sdqIncaEXTENSIONILT: TStringField
      FieldName = 'EXTENSIONILT'
      Size = 1
    end
    object sdqIncaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Size = 100
    end
    object sdqIncaEV_FECHARECEPCION: TDateTimeField
      FieldName = 'EV_FECHARECEPCION'
    end
    object sdqIncaMEDIACION: TStringField
      FieldName = 'MEDIACION'
      Size = 4000
    end
    object sdqIncaFAUTDICT: TStringField
      FieldName = 'FAUTDICT'
      Size = 4000
    end
    object sdqIncaPLURIEMP: TStringField
      FieldName = 'PLURIEMP'
      Size = 1
    end
    object sdqIncaDIAS: TFloatField
      FieldName = 'DIAS'
    end
  end
  object dsInca: TDataSource
    DataSet = sdqInca
    Left = 112
    Top = 239
  end
  object sdqTipoAccidente: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT ta_codigo, ta_descripcion'
      '    FROM sin.sta_tipoaccidente'
      'ORDER BY ta_codigo')
    Left = 76
    Top = 115
  end
  object dsTipoAccidente: TDataSource
    DataSet = sdqTipoAccidente
    Left = 48
    Top = 115
  end
  object dsTipoCon: TDataSource
    DataSet = sdqTipoCon
    Left = 31
    Top = 169
  end
  object sdqTipoCon: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT tb_codigo, tb_descripcion'
      '  FROM art.ctb_tablas'
      ' WHERE tb_clave = '#39'TCONP'#39
      '   AND tb_codigo <> '#39'0'#39)
    Left = 59
    Top = 169
  end
  object dsConcepto: TDataSource
    DataSet = sdqConcepto
    Left = 398
    Top = 166
  end
  object sdqConcepto: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   cp_conpago, cp_denpago'
      '    FROM art.scp_conpago'
      '   WHERE cp_tipo IN('#39'I'#39', '#39'P'#39', '#39'M'#39')'
      'ORDER BY cp_denpago')
    Left = 426
    Top = 166
  end
  object sdqSector: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT tb_codigo, tb_descripcion'
      '  FROM art.ctb_tablas'
      ' WHERE tb_clave = '#39'SECT'#39
      '   AND tb_codigo > 0')
    Left = 368
    Top = 116
  end
  object dsSector: TDataSource
    DataSet = sdqSector
    Left = 340
    Top = 116
  end
end
