object frmRPT_CH_REEMPLAZADOS: TfrmRPT_CH_REEMPLAZADOS
  Left = 201
  Top = 131
  Width = 815
  Height = 579
  Caption = 'frmRPT_CH_REEMPLAZADOS'
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
  object qrpChequesRechazados: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpChequesRechazadosBeforePrint
    DataSet = sdqChequesRechazados
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
    Page.PaperSize = Letter
    Page.Values = (
      100
      2794
      100
      2159
      100
      100
      0)
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
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 66
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        174.625
        1957.91666666667)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 213
        Top = 2
        Width = 314
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          563.5625
          5.29166666666667
          830.791666666667)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'LISTADO DE REEMPLAZO DE CHEQUES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel2: TQRLabel
        Left = 603
        Top = 3
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1595.4375
          7.9375
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 612
        Top = 20
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1619.25
          52.9166666666667
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Hora:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 647
        Top = 20
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1711.85416666667
          52.9166666666667
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsTime
        Transparent = False
        FontSize = 10
      end
      object QRSysData2: TQRSysData
        Left = 647
        Top = 3
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1711.85416666667
          7.9375
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Transparent = False
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 23
        Top = 45
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          60.8541666666667
          119.0625
          148.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cheques'
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
      object QRLabel5: TQRLabel
        Left = 95
        Top = 45
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          251.354166666667
          119.0625
          203.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Orden Pago'
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
      object QRLabel6: TQRLabel
        Left = 184
        Top = 45
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          119.0625
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha Cheque'
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
      object QRLabel7: TQRLabel
        Left = 297
        Top = 45
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          785.8125
          119.0625
          227.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha Estado'
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
      object QRLabel8: TQRLabel
        Left = 417
        Top = 45
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1103.3125
          119.0625
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Monto'
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
      object QRLabel9: TQRLabel
        Left = 467
        Top = 45
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1235.60416666667
          119.0625
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Beneficiario'
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
      object qrlFiltro: TQRLabel
        Left = 327
        Top = 21
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          865.1875
          55.5625
          227.541666666667)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = '*****************'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 289
      Width = 740
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.5625
        1957.91666666667)
      BandType = rbPageFooter
      object QRLabel10: TQRLabel
        Left = 621
        Top = 2
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1643.0625
          5.29166666666667
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Página Nº'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRSysData3: TQRSysData
        Left = 680
        Top = 2
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1799.16666666667
          5.29166666666667
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Transparent = False
        FontSize = 10
      end
    end
    object qrbDatalle: TQRBand
      Left = 38
      Top = 104
      Width = 740
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = qrbDatalleBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.9791666666667
        1957.91666666667)
      BandType = rbDetail
      object qrdOP: TQRDBText
        Left = 80
        Top = 3
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          211.666666666667
          7.9375
          222.25)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqChequesRechazados
        DataField = 'CE_ORDENPAGO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdFechaCheque: TQRDBText
        Left = 184
        Top = 3
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          7.9375
          248.708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqChequesRechazados
        DataField = 'CE_FECHACHEQUE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdFechaEstado: TQRDBText
        Left = 296
        Top = 3
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          783.166666666667
          7.9375
          219.604166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqChequesRechazados
        DataField = 'CE_FECHAESTADO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdMonto: TQRDBText
        Left = 383
        Top = 3
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1013.35416666667
          7.9375
          193.145833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqChequesRechazados
        DataField = 'CE_MONTO'
        Mask = '#,##0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdBeneficiario: TQRDBText
        Left = 466
        Top = 3
        Width = 271
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          7.9375
          717.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqChequesRechazados
        DataField = 'CE_BENEFICIARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdCheque: TQRDBText
        Left = 2
        Top = 3
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          5.29166666666667
          7.9375
          193.145833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqChequesRechazados
        DataField = 'CE_NUMERO'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object sumTotales: TQRBand
      Left = 38
      Top = 121
      Width = 740
      Height = 168
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = sumTotalesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrbDatalle
      Size.Values = (
        444.5
        1957.91666666667)
      BandType = rbSummary
      object qrTotalAnulados: TQRLabel
        Left = 428
        Top = 9
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1132.41666666667
          23.8125
          76.7291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '$$$$'
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
      object qrTotalEmitidos: TQRLabel
        Left = 428
        Top = 33
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1132.41666666667
          87.3125
          76.7291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '$$$$'
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
      object QRLabelEx27: TQRLabelEx
        Left = 140
        Top = 80
        Width = 300
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          370.416666666667
          211.666666666667
          793.75)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Caption = 'TESORERIA'
        Color = 13816530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Brush.Color = 13816530
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx30: TQRLabelEx
        Left = 140
        Top = 100
        Width = 150
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          370.416666666667
          264.583333333333
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Caption = 'CONFECCIONÓ'
        Color = 13816530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Brush.Color = 13816530
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx29: TQRLabelEx
        Left = 290
        Top = 100
        Width = 150
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          767.291666666667
          264.583333333333
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Caption = 'CONTROLÓ'
        Color = 13816530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Brush.Color = 13816530
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx28: TQRLabelEx
        Left = 440
        Top = 80
        Width = 300
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1164.16666666667
          211.666666666667
          793.75)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Caption = 'CONTADURIA'
        Color = 13816530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Brush.Color = 13816530
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx31: TQRLabelEx
        Left = 440
        Top = 100
        Width = 150
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1164.16666666667
          264.583333333333
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Caption = 'REVISÓ'
        Color = 13816530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Brush.Color = 13816530
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx32: TQRLabelEx
        Left = 590
        Top = 100
        Width = 150
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1561.04166666667
          264.583333333333
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Caption = 'CONTABILIZÓ'
        Color = 13816530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Brush.Color = 13816530
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx33: TQRLabelEx
        Left = 140
        Top = 120
        Width = 150
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333
          370.416666666667
          317.5
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx34: TQRLabelEx
        Left = 290
        Top = 120
        Width = 150
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333
          767.291666666667
          317.5
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx35: TQRLabelEx
        Left = 440
        Top = 120
        Width = 150
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333
          1164.16666666667
          317.5
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
      object QRLabelEx36: TQRLabelEx
        Left = 590
        Top = 120
        Width = 150
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333
          1561.04166666667
          317.5
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        Layout = tlCenter
        Shape = qrsRectangle
        VertAdjust = 0
        Espacio = 0
        FontSize = 10
      end
    end
  end
  object sdqChequesRechazados: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT DISTINCT SC.CHECK_ID, 1, SC.CHEQUE, SC.OP, SC.FECHA_CHEQU' +
        'E, SC.FECHA_ESTADO, SC.MONTO, SC.CE_BENEFICIARIO'
      
        '  FROM SCOTT.SEGUIMIENTO_CHEQUES SC, SCOTT.SEGUIMIENTO_CHEQUES S' +
        'C2, SCOTT.OP_REEMPLAZO_CHEQUES ORC '
      ' WHERE SC2.CHEQUE_REEMP = SC.CHECK_ID'
      '   AND SC2.OP = ORC.OP_ID'
      '        AND ORC.POSTED_FLAG != :sContabilizado'
      '        AND SC2.FECHA_ESTADO >= :dtFechaDesde'
      '        AND SC2.FECHA_ESTADO <= :dtFechaHasta'
      'UNION ALL   '
      
        'SELECT SC2.CHEQUE_REEMP, 2, SC2.CHEQUE, SC2.OP, SC2.FECHA_CHEQUE' +
        ', SC2.FECHA_ESTADO, SC2.MONTO, SC2.CE_BENEFICIARIO'
      
        '  FROM SCOTT.SEGUIMIENTO_CHEQUES SC, SCOTT.SEGUIMIENTO_CHEQUES S' +
        'C2, SCOTT.OP_REEMPLAZO_CHEQUES ORC '
      ' WHERE SC2.CHEQUE_REEMP = SC.CHECK_ID'
      '   AND SC2.OP = ORC.OP_ID'
      '        AND ORC.POSTED_FLAG != :sContabilizado'
      '        AND SC2.FECHA_ESTADO >= :dtFechaDesde'
      '        AND SC2.FECHA_ESTADO <= :dtFechaHasta'
      'ORDER BY 1, 2 ')
    Left = 6
    Top = 3
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sContabilizado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dtFechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dtFechaHasta'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sContabilizado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dtFechaDesde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'dtFechaHasta'
        ParamType = ptInput
      end>
  end
  object dsChequesRechazados: TDataSource
    DataSet = sdqChequesRechazados
    Left = 34
    Top = 4
  end
end
