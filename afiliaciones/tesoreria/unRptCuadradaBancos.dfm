object frmRptCuadrada: TfrmRptCuadrada
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  HorzScrollBar.Position = 838
  Caption = 'frmRptCuadrada'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrpCuadrada: TQuickRep
    Left = -829
    Top = -12
    Width = 1613
    Height = 979
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
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
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 120
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBDatosAnexos: TQRBand
      Left = 45
      Top = 130
      Width = 1522
      Height = 59
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        130.086805555555600000
        3355.798611111111000000)
      BandType = rbColumnHeader
      object QRLabel1: TQRLabel
        Left = 6
        Top = 21
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          13.229166666666670000
          46.302083333333340000
          92.604166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cuenta'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 905
        Top = 3
        Width = 100
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          110.243055555556000000
          1995.399305555560000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Saldo seg'#250'n extracto bancario'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 700
        Top = 3
        Width = 100
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          110.243055555556000000
          1543.402777777780000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(-) D'#233'bitos Contabilizados pendientes'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 598
        Top = 3
        Width = 100
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          110.243055555556000000
          1318.506944444440000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(+) Cr'#233'ditos  Bancarios no contabilizados'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 496
        Top = 3
        Width = 100
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          110.243055555556000000
          1093.611111111110000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(-) D'#233'bitos  Bancarios no contabilizados'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 394
        Top = 18
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          868.715277777778000000
          39.687500000000000000
          222.690972222222000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Saldo Contable'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 1007
        Top = 3
        Width = 100
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          110.243055555556000000
          2220.295138888890000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(-)Cheques emitidos y no entregados'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 1109
        Top = 12
        Width = 100
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          90.399305555555600000
          2445.190972222220000000
          26.458333333333300000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Nuevo Saldo Contable'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 1315
        Top = 12
        Width = 100
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          90.399305555555600000
          2899.392361111110000000
          26.458333333333300000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Acreedores Exigibles'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 1417
        Top = 12
        Width = 100
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          90.399305555555600000
          3124.288194444440000000
          26.458333333333300000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Acreedores Bancarios'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 802
        Top = 3
        Width = 100
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          110.243055555556000000
          1768.298611111110000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(+) Cr'#233'ditos Contabilizados pendientes'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 1211
        Top = 18
        Width = 100
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          77.170138888888900000
          2670.086805555560000000
          39.687500000000000000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SLAP'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 45
      Top = 243
      Width = 1522
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
        99.218750000000000000
        3355.798611111111000000)
      BandType = rbPageFooter
      object QRSysData1: TQRSysData
        Left = 716
        Top = 12
        Width = 89
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222230000
          1578.680555555556000000
          26.458333333333330000
          196.232638888888900000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'P'#225'gina '
        Transparent = False
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 1413
        Top = 0
        Width = 103
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222230000
          3115.468750000000000000
          0.000000000000000000
          227.100694444444500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Impreso el: '
        Transparent = False
        FontSize = 8
      end
      object QRSysData3: TQRSysData
        Left = 1413
        Top = 20
        Width = 72
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222230000
          3115.468750000000000000
          44.097222222222230000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Hora: '
        Transparent = False
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 45
      Top = 45
      Width = 1522
      Height = 85
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
        187.413194444444400000
        3355.798611111111000000)
      BandType = rbPageHeader
      object QRLabel27: TQRLabel
        Left = 789
        Top = 164
        Width = 69
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          45.357142857142900000
          1738.690476190480000000
          360.967261904762000000
          151.190476190476000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Importe'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lblTitulo: TQRLabel
        Left = 656
        Top = 9
        Width = 210
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222230000
          1446.388888888889000000
          19.843750000000000000
          463.020833333333300000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'SITUACION FINANCIERA AL'
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
      object QRLabel12: TQRLabel
        Left = 669
        Top = 33
        Width = 184
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.097222222222230000
          1475.052083333333000000
          72.760416666666680000
          405.694444444444500000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'CUADRADA DE BANCOS'
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
      object qriLogo: TQRImage
        Left = 1321
        Top = 3
        Width = 196
        Height = 77
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          169.774305555555600000
          2912.621527777778000000
          6.614583333333332000
          432.152777777777800000)
        Stretch = True
      end
    end
    object QRBand1: TQRBand
      Left = 45
      Top = 189
      Width = 1522
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        52.916666666666660000
        3355.798611111111000000)
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 0
        Top = 0
        Width = 1524
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Frame.Style = psClear
        Frame.Width = 0
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          0.000000000000000000
          3360.208333333330000000)
        Pen.Style = psClear
        Pen.Width = 0
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText13: TQRDBText
        Left = 351
        Top = 3
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          773.906250000000000000
          6.614583333333330000
          81.579861111111100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'CUENTACONTABLE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
      object QRExpr12: TQRExpr
        Left = 5
        Top = 3
        Width = 341
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          11.024305555555600000
          6.614583333333330000
          751.857638888889000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'BANCO + '#39' N'#186#39' + CUENTA'
        FontSize = 7
      end
      object QRExpr13: TQRExpr
        Left = 1417
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          3124.288194444440000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(ACREEDORES_BANCARIOS = 0, '#39#39', ACREEDORES_BANCARIOS)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr14: TQRExpr
        Left = 1315
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2899.392361111110000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(ACREEDORES_EXIGIBLES = 0, '#39#39', ACREEDORES_EXIGIBLES)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr15: TQRExpr
        Left = 1211
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2670.086805555560000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SLAP = 0, '#39#39', SLAP)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr16: TQRExpr
        Left = 1109
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2445.190972222220000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(NUEVO_SALDO_CONTABLE = 0, '#39#39', NUEVO_SALDO_CONTABLE)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr17: TQRExpr
        Left = 1007
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2220.295138888890000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(CHEQUES_NO_ENTREGADOS = 0, '#39#39', CHEQUES_NO_ENTREGADOS)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr18: TQRExpr
        Left = 905
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1995.399305555560000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SALDO_EXTRACTO = 0, '#39#39', SALDO_EXTRACTO)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr19: TQRExpr
        Left = 802
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1768.298611111110000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(CREDITO_CONTABLE = 0, '#39#39', CREDITO_CONTABLE)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr20: TQRExpr
        Left = 700
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1543.402777777780000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(DEBITO_CONTABLE = 0, '#39#39', DEBITO_CONTABLE)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr21: TQRExpr
        Left = 598
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1318.506944444440000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(CREDITO_EXTRACTO = 0, '#39#39', CREDITO_EXTRACTO)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr22: TQRExpr
        Left = 496
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1093.611111111110000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(DEBITO_EXTRACTO = 0, '#39#39', DEBITO_EXTRACTO)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr23: TQRExpr
        Left = 394
        Top = 3
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          868.715277777778000000
          6.614583333333330000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SALDO_CONTABLE = 0, '#39#39', SALDO_CONTABLE)'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
    end
    object QRBand4: TQRBand
      Left = 45
      Top = 213
      Width = 1522
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        66.145833333333340000
        3355.798611111111000000)
      BandType = rbSummary
      object QRExpr1: TQRExpr
        Left = 394
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          868.715277777778000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(SALDO_CONTABLE) = 0, '#39#39', SUM(SALDO_CONTABLE))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr2: TQRExpr
        Left = 496
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1093.611111111110000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(DEBITO_EXTRACTO) = 0, '#39#39', SUM(DEBITO_EXTRACTO))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 700
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1543.402777777780000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(DEBITO_CONTABLE) = 0, '#39#39', SUM(DEBITO_CONTABLE))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 598
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1318.506944444440000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(CREDITO_EXTRACTO) = 0, '#39#39', SUM(CREDITO_EXTRACTO))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 802
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1768.298611111110000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(CREDITO_CONTABLE) = 0, '#39#39', SUM(CREDITO_CONTABLE))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr6: TQRExpr
        Left = 905
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          1995.399305555560000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(SALDO_EXTRACTO) = 0, '#39#39', SUM(SALDO_EXTRACTO))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr7: TQRExpr
        Left = 1007
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2220.295138888890000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 
          'IF(SUM(CHEQUES_NO_ENTREGADOS) = 0, '#39#39', SUM(CHEQUES_NO_ENTREGADOS' +
          '))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr8: TQRExpr
        Left = 1109
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2445.190972222220000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(NUEVO_SALDO_CONTABLE) = 0, '#39#39', SUM(NUEVO_SALDO_CONTABLE))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr9: TQRExpr
        Left = 1211
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2670.086805555560000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(SLAP) = 0, '#39#39', SUM(SLAP))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 1315
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          2899.392361111110000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(ACREEDORES_EXIGIBLES) = 0, '#39#39', SUM(ACREEDORES_EXIGIBLES))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
      object QRExpr11: TQRExpr
        Left = 1417
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.482638888888900000
          3124.288194444440000000
          13.229166666666700000
          220.486111111111000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = True
        WordWrap = True
        Expression = 'IF(SUM(ACREEDORES_BANCARIOS) = 0, '#39#39', SUM(ACREEDORES_BANCARIOS))'
        Mask = ',0.00;(,0.00)'
        FontSize = 8
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        '  SELECT '#39'ANEXO I - D'#233'bitos en Extracto no Contabilizados'#39' ANEXO' +
        ','
      '         EB_FECHAMOVIMIENTO COLUMNA1,'
      
        '         TO_NUMBER (NULL) CLEARING, CO_DESCRIPCION TIPO, EB_NROC' +
        'OMP CHEQUE,'
      '         TO_NUMBER (NULL) OP, EB_DESCRIPCION DESCRIPCION,'
      '         EB_IMPORTE IMPORTE'
      '    FROM OCO_CODIGOCONCILIACION,'
      '         OCE_CODIGOEXTRACTO,'
      '         OEB_EXTRACTOBANCO,'
      '         OCB_CONCILIACIONBANCARIA'
      '   WHERE EB_DEBITOCREDITO = '#39'D'#39
      '     AND EB_CODOPERACION = CE_CODIGO(+)'
      '     AND CE_IDCODIGOCONC = CO_ID(+)'
      '     AND EB_IDCUENTABANCARIA = :PCUENTA'
      '     AND EB_FECHAMOVIMIENTO <= :PFECHA'
      '     AND EB_ID = CB_IDEXTRACTO(+)'
      '     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :PFECHA'
      'UNION ALL'
      
        '  SELECT '#39'ANEXO II - Cr'#233'ditos en Extracto no Contabilizados'#39' ANE' +
        'XO,'
      '         EB_FECHAMOVIMIENTO COLUMNA1,'
      
        '         TO_NUMBER (NULL) CLEARING, CO_DESCRIPCION TIPO, EB_NROC' +
        'OMP CHEQUE,'
      '         TO_NUMBER (NULL) OP, EB_DESCRIPCION DESCRIPCION,'
      '         EB_IMPORTE IMPORTE'
      '    FROM OCO_CODIGOCONCILIACION,'
      '         OCE_CODIGOEXTRACTO,'
      '         OEB_EXTRACTOBANCO,'
      '         OCB_CONCILIACIONBANCARIA'
      '   WHERE EB_DEBITOCREDITO = '#39'C'#39
      '     AND EB_CODOPERACION = CE_CODIGO(+)'
      '     AND CE_IDCODIGOCONC = CO_ID(+)'
      '     AND EB_IDCUENTABANCARIA = :PCUENTA'
      '     AND EB_FECHAMOVIMIENTO <= :PFECHA'
      '     AND EB_ID = CB_IDEXTRACTO(+)'
      '     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :PFECHA'
      'UNION ALL'
      '  SELECT '#39'ANEXO III - D'#233'bitos en Contabilidad Pendientes'#39' ANEXO,'
      '         SC_FECHA COLUMNA1, SC_CLEARING CLEARING,'
      
        '         SC_TIPOCOMP TIPO, TO_CHAR (SC_NROCOMP) CHEQUE, SC_ORDEN' +
        'PAGO OP,'
      '         SC_TIPOCOMP DESCRIPCION, SC_DEBITO IMPORTE'
      '    FROM ART.V_OSC_SALDOCONTABLEBANCO, OCB_CONCILIACIONBANCARIA'
      '   WHERE SC_DEBITO IS NOT NULL'
      '     AND SC_TIPOCOMP <> '#39'01'#39
      '     AND SC_IDCUENTABANCARIA = :PCUENTA'
      '     AND SC_FECHA <= :PFECHA'
      '     AND SC_ID = CB_IDMOVIMIENTO(+)'
      '     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :PFECHA'
      'UNION ALL'
      '  SELECT '#39'ANEXO IV - Cr'#233'ditos en Contabilidad Pendientes'#39' ANEXO,'
      '         SC_FECHA COLUMNA1, SC_CLEARING CLEARING,'
      
        '         SC_TIPOCOMP TIPO, TO_CHAR (SC_NROCOMP) CHEQUE, SC_ORDEN' +
        'PAGO OP,'
      '         SC_BENEFICIARIO DESCRIPCION, SC_CREDITO IMPORTE'
      '    FROM ART.V_OSC_SALDOCONTABLEBANCO, OCB_CONCILIACIONBANCARIA'
      '   WHERE SC_CREDITO IS NOT NULL'
      '     AND SC_TIPOCOMP <> '#39'01'#39
      '     AND SC_IDCUENTABANCARIA = :PCUENTA'
      '     AND SC_FECHA <= :PFECHA'
      '     AND SC_ID = CB_IDMOVIMIENTO(+)'
      '     AND NVL (TRUNC (CB_FECHACONTABLE), SYSDATE) > :PFECHA'
      'ORDER BY 1')
    Left = 16
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCUENTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pFecha'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCUENTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCUENTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCUENTA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PFECHA'
        ParamType = ptInput
      end>
  end
end
