inherited frmRptLibroAfiliaciones: TfrmRptLibroAfiliaciones
  Left = 46
  Top = 91
  Width = 722
  Height = 494
  Caption = 'Libro de Afiliaciones'
  Font.Name = 'Arial'
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  object rptLibroAfiliaciones: TQuickRep [0]
    Left = 0
    Top = 0
    Width = 1344
    Height = 816
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = rptLibroAfiliacionesAfterPrint
    BeforePrint = rptLibroAfiliacionesBeforePrint
    DataSet = sdqReporte
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
      100
      2159
      100
      3556
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
    ReportTitle = 'Registro de Afiliaciones'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbDetalles: TQRBand
      Left = 38
      Top = 162
      Width = 1268
      Height = 17
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
        44.9791666666667
        3354.91666666667)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 2
        Top = 1
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          5.29166666666667
          2.64583333333333
          116.416666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CO_CONTRATO'
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
      object QRDBText2: TQRDBText
        Left = 56
        Top = 1
        Width = 81
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          148.166666666667
          2.64583333333333
          214.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EM_CUIT'
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
      object QRDBText3: TQRDBText
        Left = 140
        Top = 1
        Width = 169
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          370.416666666667
          2.64583333333333
          447.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'EM_NOMBRE'
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
      object QRDBText4: TQRDBText
        Left = 310
        Top = 1
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          820.208333333334
          2.64583333333333
          193.145833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CO_FECHAALTA'
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
      object QRDBText5: TQRDBText
        Left = 388
        Top = 1
        Width = 21
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1026.58333333333
          2.64583333333333
          55.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'ART.AFILIACION.GET_CANTESTABLECIMIENTOS(AEM_EMPRES'
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
      object QRDBText6: TQRDBText
        Left = 415
        Top = 1
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1098.02083333333
          2.64583333333333
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CO_VIGENCIADESDE'
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
      object QRDBText7: TQRDBText
        Left = 487
        Top = 1
        Width = 53
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1288.52083333333
          2.64583333333333
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TC_PORCMASA'
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
      object QRDBText8: TQRDBText
        Left = 548
        Top = 1
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1449.91666666667
          2.64583333333333
          171.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TC_SUMAFIJA'
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
      object QRDBText9: TQRDBText
        Left = 619
        Top = 1
        Width = 51
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1637.77083333333
          2.64583333333333
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'AC_CODIGO'
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
      object QRDBText10: TQRDBText
        Left = 672
        Top = 1
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1778
          2.64583333333333
          76.7291666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CO_NIVEL'
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
      object QRDBText11: TQRDBText
        Left = 702
        Top = 1
        Width = 158
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1857.375
          2.64583333333333
          418.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'DOMICILIO'
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
      object QRDBText12: TQRDBText
        Left = 861
        Top = 1
        Width = 76
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2278.0625
          2.64583333333333
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'DC_LOCALIDAD'
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
      object QRDBText13: TQRDBText
        Left = 940
        Top = 1
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2487.08333333333
          2.64583333333333
          127)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'DC_CPOSTAL'
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
      object QRDBText14: TQRDBText
        Left = 989
        Top = 1
        Width = 77
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2616.72916666667
          2.64583333333333
          203.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'PV_DESCRIPCION'
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
      object QRDBText15: TQRDBText
        Left = 1067
        Top = 1
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2823.10416666667
          2.64583333333333
          137.583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CO_TOTEMPLEADOS'
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
      object QRDBText16: TQRDBText
        Left = 1122
        Top = 1
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2968.625
          2.64583333333333
          185.208333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'CO_MASATOTAL'
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
      object QRDBText17: TQRDBText
        Left = 1195
        Top = 1
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          3161.77083333333
          2.64583333333333
          171.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'PRIMATOTAL'
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
    end
    object qrbTitulo: TQRBand
      Left = 38
      Top = 38
      Width = 1268
      Height = 106
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        280.458333333333
        3354.91666666667)
      BandType = rbPageHeader
      object qrlTitulo: TQRLabel
        Left = 520
        Top = 37
        Width = 228
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.5625
          1375.83333333333
          97.8958333333333
          603.25)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'REGISTRO DE AFILIACIONES'
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
      object qrlFolio: TQRLabel
        Left = 1096
        Top = 4
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2899.83333333333
          10.5833333333333
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Folio:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 5
        Top = 24
        Width = 303
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          13.2291666666667
          63.5
          801.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sede legal: Carlos Pellegrini 91 p.5, Capital Federal.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel34: TQRLabel
        Left = 1096
        Top = 24
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2899.83333333333
          63.5
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Período:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object Folio: TQRLabel
        Left = 1133
        Top = 4
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2997.72916666667
          10.5833333333333
          76.7291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Folio'
        Color = clWhite
        OnPrint = FolioPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object Periodo: TQRLabel
        Left = 1148
        Top = 24
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          3037.41666666667
          63.5
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Periodo'
        Color = clWhite
        OnPrint = PeriodoPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlProvinciaART: TQRLabel
        Left = 5
        Top = 4
        Width = 367
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          13.2291666666667
          10.5833333333333
          971.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PROVINCIA ASEGURADORA DE RIESGO DE TRABAJO S.A.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 556
        Top = 79
        Width = 61
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1471.08333333333
          209.020833333333
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SUMA FIJA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 620
        Top = 79
        Width = 51
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1640.41666666667
          209.020833333333
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ACTIVIDAD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel11: TQRLabel
        Left = 672
        Top = 79
        Width = 29
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1778
          209.020833333333
          76.7291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NIVEL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 702
        Top = 79
        Width = 158
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1857.375
          209.020833333333
          418.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DOMICILIO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel13: TQRLabel
        Left = 861
        Top = 79
        Width = 76
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          2278.0625
          209.020833333333
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LOCALIDAD'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel14: TQRLabel
        Left = 939
        Top = 79
        Width = 48
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          2484.4375
          209.020833333333
          127)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel15: TQRLabel
        Left = 989
        Top = 79
        Width = 77
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          2616.72916666667
          209.020833333333
          203.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PROVINCIA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel16: TQRLabel
        Left = 1067
        Top = 79
        Width = 59
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          2823.10416666667
          209.020833333333
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EMPLEADOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel17: TQRLabel
        Left = 1131
        Top = 79
        Width = 63
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          2992.4375
          209.020833333333
          166.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MASA TOTAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel18: TQRLabel
        Left = 1195
        Top = 79
        Width = 71
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          3161.77083333333
          209.020833333333
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PRIMA MENSUAL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel8: TQRLabel
        Left = 484
        Top = 79
        Width = 69
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1280.58333333333
          209.020833333333
          182.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PORC. MASA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel7: TQRLabel
        Left = 421
        Top = 79
        Width = 61
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1113.89583333333
          209.020833333333
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VIGENCIA DESDE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 385
        Top = 79
        Width = 21
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1018.64583333333
          209.020833333333
          55.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EST.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel5: TQRLabel
        Left = 320
        Top = 79
        Width = 61
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          846.666666666667
          209.020833333333
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FECHA DE ALTA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Left = 140
        Top = 79
        Width = 169
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          370.416666666667
          209.020833333333
          447.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ENTE ASEGURADO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel3: TQRLabel
        Left = 56
        Top = 79
        Width = 81
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          148.166666666667
          209.020833333333
          214.3125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C.U.I.T.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLabel2: TQRLabel
        Left = 2
        Top = 79
        Width = 52
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          5.29166666666667
          209.020833333333
          137.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CONTRATO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object qrgAltasBajas: TQRGroup
      Left = 38
      Top = 144
      Width = 1268
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      LinkBand = qrbDetalles
      Size.Values = (
        47.625
        3354.91666666667)
      Expression = 'sdqReporte.TIPO'
      Master = rptLibroAfiliaciones
      ReprintOnNewPage = False
      object QRDBText18: TQRDBText
        Left = 4
        Top = 1
        Width = 102
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          10.5833333333333
          2.64583333333333
          269.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqReporte
        DataField = 'TIPO'
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
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 179
      Width = 1268
      Height = 24
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
        63.5
        3354.91666666667)
      BandType = rbSummary
      object QRLabel19: TQRLabel
        Left = 573
        Top = 2
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1516.0625
          5.29166666666667
          320.145833333333)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Fin del Registro'
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
    end
  end
  object sdqReporte: TSDQuery
    DatabaseName = 'dbprincipal'
    AfterOpen = sdqReporteAfterOpen
    SQL.Strings = (
      
        '  SELECT CPV_PROVINCIAS.PV_DESCRIPCION, ACO_CONTRATO.CO_CONTRATO' +
        ','
      
        '         ACO_CONTRATO.CO_VIGENCIADESDE, ACO_CONTRATO.CO_FECHABAJ' +
        'A,'
      '         ACO_CONTRATO.CO_NIVEL, ACO_CONTRATO.CO_TOTEMPLEADOS,'
      
        '         TRUNC(ACO_CONTRATO.CO_FECHAALTA) as CO_FECHAALTA, UTILE' +
        'S.ARMAR_DOMICILIO('
      
        '         ADC_DOMICILIOCONTRATO.DC_CALLE, ADC_DOMICILIOCONTRATO.D' +
        'C_NUMERO,'
      
        '         ADC_DOMICILIOCONTRATO.DC_PISO, ADC_DOMICILIOCONTRATO.DC' +
        '_DEPARTAMENTO) as DOMICILIO,'
      '         ADC_DOMICILIOCONTRATO.DC_LOCALIDAD,'
      '         ADC_DOMICILIOCONTRATO.DC_CPOSTAL, AEM_EMPRESA.EM_CUIT,'
      '         AEM_EMPRESA.EM_NOMBRE, CAC_ACTIVIDAD.AC_CODIGO,'
      
        '         ART.AFILIACION.GET_CANTESTABLECIMIENTOS (AEM_EMPRESA.EM' +
        '_CUIT),'
      
        '         ACO_CONTRATO.CO_TOTEMPLEADOS * ATC_TARIFARIOCONTRATO.TC' +
        '_SUMAFIJA +'
      
        '         ACO_CONTRATO.CO_MASATOTAL * ATC_TARIFARIOCONTRATO.TC_PO' +
        'RCMASA / 100 as PRIMATOTAL,'
      
        '         ACO_CONTRATO.CO_MASATOTAL, ATC_TARIFARIOCONTRATO.TC_POR' +
        'CMASA,'
      '         ATC_TARIFARIOCONTRATO.TC_SUMAFIJA, '#39'ALTAS'#39' AS TIPO'
      '    FROM ART.CPV_PROVINCIAS CPV_PROVINCIAS,'
      '         AFI.ADC_DOMICILIOCONTRATO ADC_DOMICILIOCONTRATO,'
      '         AFI.AEM_EMPRESA AEM_EMPRESA,'
      '         COMUNES.CAC_ACTIVIDAD CAC_ACTIVIDAD,'
      '         AFI.ATC_TARIFARIOCONTRATO ATC_TARIFARIOCONTRATO,'
      '         AFI.ACO_CONTRATO ACO_CONTRATO'
      '   WHERE (    (AEM_EMPRESA.EM_ID = ACO_CONTRATO.CO_IDEMPRESA)'
      
        '          AND (ACO_CONTRATO.CO_CONTRATO = ADC_DOMICILIOCONTRATO.' +
        'DC_CONTRATO)'
      
        '          AND (CAC_ACTIVIDAD.AC_ID = ACO_CONTRATO.CO_IDACTIVIDAD' +
        ')'
      
        '          AND (ADC_DOMICILIOCONTRATO.DC_PROVINCIA = CPV_PROVINCI' +
        'AS.PV_CODIGO)'
      
        '          AND (ATC_TARIFARIOCONTRATO.TC_CONTRATO = ACO_CONTRATO.' +
        'CO_CONTRATO)'
      '         )'
      '     AND (ADC_DOMICILIOCONTRATO.DC_TIPO = '#39'L'#39')'
      '     AND (TRUNC(ACO_CONTRATO.CO_FECHAALTA)'
      '            BETWEEN UTILES.PERIODO_PRIMERDIA (:PERIODO)'
      
        '                AND   UTILES.PERIODO_PRIMERDIA (UTILES.PERIODO_P' +
        'ROXIMO (:PERIODO) ) - 1 )'
      ''
      'UNION ALL'
      ''
      
        'SELECT   CPV_PROVINCIAS.PV_DESCRIPCION, ACO_CONTRATO.CO_CONTRATO' +
        ','
      
        '         ACO_CONTRATO.CO_VIGENCIADESDE, ACO_CONTRATO.CO_FECHABAJ' +
        'A,'
      '         ACO_CONTRATO.CO_NIVEL, ACO_CONTRATO.CO_TOTEMPLEADOS,'
      
        '         TRUNC(ACO_CONTRATO.CO_FECHAALTA) as CO_FECHAALTA, UTILE' +
        'S.ARMAR_DOMICILIO('
      
        '         ADC_DOMICILIOCONTRATO.DC_CALLE, ADC_DOMICILIOCONTRATO.D' +
        'C_NUMERO,'
      
        '         ADC_DOMICILIOCONTRATO.DC_PISO, ADC_DOMICILIOCONTRATO.DC' +
        '_DEPARTAMENTO) as DOMICILIO,'
      '         ADC_DOMICILIOCONTRATO.DC_LOCALIDAD,'
      '         ADC_DOMICILIOCONTRATO.DC_CPOSTAL, AEM_EMPRESA.EM_CUIT,'
      '         AEM_EMPRESA.EM_NOMBRE, CAC_ACTIVIDAD.AC_CODIGO,'
      
        '         ART.AFILIACION.GET_CANTESTABLECIMIENTOS (AEM_EMPRESA.EM' +
        '_CUIT),'
      
        '         ACO_CONTRATO.CO_TOTEMPLEADOS * ATC_TARIFARIOCONTRATO.TC' +
        '_SUMAFIJA +'
      
        '         ACO_CONTRATO.CO_MASATOTAL * ATC_TARIFARIOCONTRATO.TC_PO' +
        'RCMASA / 100,'
      
        '         ACO_CONTRATO.CO_MASATOTAL, ATC_TARIFARIOCONTRATO.TC_POR' +
        'CMASA,'
      '         ATC_TARIFARIOCONTRATO.TC_SUMAFIJA, '#39'BAJAS'#39' AS TIPO'
      '    FROM ART.CPV_PROVINCIAS CPV_PROVINCIAS,'
      '         AFI.ADC_DOMICILIOCONTRATO ADC_DOMICILIOCONTRATO,'
      '         AFI.AEM_EMPRESA AEM_EMPRESA,'
      '         COMUNES.CAC_ACTIVIDAD CAC_ACTIVIDAD,'
      '         AFI.ATC_TARIFARIOCONTRATO ATC_TARIFARIOCONTRATO,'
      '         AFI.ACO_CONTRATO ACO_CONTRATO'
      '   WHERE (    (AEM_EMPRESA.EM_ID = ACO_CONTRATO.CO_IDEMPRESA)'
      
        '          AND (ACO_CONTRATO.CO_CONTRATO = ADC_DOMICILIOCONTRATO.' +
        'DC_CONTRATO)'
      
        '          AND (CAC_ACTIVIDAD.AC_ID = ACO_CONTRATO.CO_IDACTIVIDAD' +
        ')'
      
        '          AND (ADC_DOMICILIOCONTRATO.DC_PROVINCIA = CPV_PROVINCI' +
        'AS.PV_CODIGO)'
      
        '          AND (ATC_TARIFARIOCONTRATO.TC_CONTRATO = ACO_CONTRATO.' +
        'CO_CONTRATO)'
      '         )'
      '     AND (ADC_DOMICILIOCONTRATO.DC_TIPO = '#39'L'#39')'
      '     AND (TRUNC(ACO_CONTRATO.CO_FECHABAJA)'
      '            BETWEEN UTILES.PERIODO_PRIMERDIA (:PERIODO)'
      
        '                AND   UTILES.PERIODO_PRIMERDIA (UTILES.PERIODO_P' +
        'ROXIMO (:PERIODO) ) - 1 )'
      ''
      'ORDER BY TIPO ASC, CO_CONTRATO ASC')
    Left = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PERIODO'
        ParamType = ptInput
      end>
  end
end
