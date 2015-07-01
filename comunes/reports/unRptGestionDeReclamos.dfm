object frmRptGestionDeReclamos: TfrmRptGestionDeReclamos
  Left = 199
  Top = 107
  Width = 1036
  Height = 780
  Caption = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
  Color = clBtnFace
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
  object Hoja1: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = Hoja1BeforePrint
    DataSet = sdqReclamo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object BandaDetalleH1: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 451
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = BandaDetalleH1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1193.270833333333000000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 2
        Top = 74
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          195.791666666667000000
          1852.083333333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qriLogo: TQRImage
        Left = 537
        Top = 0
        Width = 165
        Height = 65
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666666700000
          1420.812500000000000000
          0.000000000000000000
          436.562499999999900000)
        Stretch = True
      end
      object QRLabel1: TQRLabel
        Left = 348
        Top = 28
        Width = 181
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          920.750000000000000000
          74.083333333333340000
          478.895833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Aseguradora de Riesgos del Trabajo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 45
        Width = 179
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          119.062500000000000000
          473.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RECLAMO - EXPEDIENTE N'#176' '
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
      object QRLabel3: TQRLabel
        Left = 6
        Top = 76
        Width = 693
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          201.083333333333000000
          1833.562500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RESPUESTA PARA LA GESTION DE RECLAMOS'
        Color = 14671839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 2
        Top = 102
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          269.875000000000000000
          1852.083333333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 6
        Top = 104
        Width = 401
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          275.166666666667000000
          1060.979166666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATOS DEL TRABAJADOR ACCIDENTADO'
        Color = 14671839
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
      object QRShape3: TQRShape
        Left = 2
        Top = 262
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          693.208333333333000000
          1852.083333333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 6
        Top = 264
        Width = 401
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          698.500000000000000000
          1060.979166666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATOS DEL EMPLEADOR'
        Color = 14671839
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
      object QRShape4: TQRShape
        Left = 2
        Top = 403
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          1066.270833333330000000
          1852.083333333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 6
        Top = 405
        Width = 401
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          1071.562500000000000000
          1060.979166666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATOS DE LA ART O EMPLEADOR AUTOASEGURADO'
        Color = 14671839
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
      object QRShape6: TQRShape
        Left = 2
        Top = 121
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          320.145833333333000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 2
        Top = 140
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          370.416666666667000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 2
        Top = 178
        Width = 700
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          5.291666666666670000
          470.958333333333000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 2
        Top = 217
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          574.145833333333000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 2
        Top = 236
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          624.416666666667000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 57
        Top = 122
        Width = 133
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          150.812500000000000000
          322.791666666667000000
          351.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Datos seg'#250'n ROAM'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 248
        Top = 122
        Width = 108
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          656.166666666667000000
          322.791666666667000000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' Siniestro ART:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 486
        Top = 122
        Width = 87
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1285.875000000000000000
          322.791666666667000000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' Denuncia:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 7
        Top = 142
        Width = 117
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          375.708333333333000000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Apellido y Nombres'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 487
        Top = 142
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1288.520833333330000000
          375.708333333333000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CUIL/DNI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape11: TQRShape
        Left = 2
        Top = 159
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          420.687500000000000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel14: TQRLabel
        Left = 7
        Top = 161
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          425.979166666667000000
          179.916666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fecha Nac.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 215
        Top = 161
        Width = 32
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          568.854166666667000000
          425.979166666667000000
          84.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Sexo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel16: TQRLabel
        Left = 435
        Top = 161
        Width = 94
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1150.937500000000000000
          425.979166666667000000
          248.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(1) Nacionalidad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 7
        Top = 183
        Width = 258
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          484.187500000000000000
          682.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Domicilio del Accidentado (Calle y N'#186')'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 295
        Top = 183
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          780.520833333333000000
          484.187500000000000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tel'#233'fono'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel19: TQRLabel
        Left = 415
        Top = 183
        Width = 42
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1098.020833333330000000
          484.187500000000000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C.P.A.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel20: TQRLabel
        Left = 485
        Top = 183
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1283.229166666670000000
          484.187500000000000000
          113.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Ciudad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel21: TQRLabel
        Left = 595
        Top = 183
        Width = 58
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1574.270833333330000000
          484.187500000000000000
          153.458333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel22: TQRLabel
        Left = 7
        Top = 219
        Width = 242
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          579.437500000000000000
          640.291666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Ocupaci'#243'n del trabajador accidentado (2):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel23: TQRLabel
        Left = 555
        Top = 219
        Width = 34
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1468.437500000000000000
          579.437500000000000000
          89.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CIUO:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel24: TQRLabel
        Left = 7
        Top = 238
        Width = 222
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          629.708333333333000000
          587.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(3) Antig'#252'edad en el puesto de trabajo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel25: TQRLabel
        Left = 403
        Top = 238
        Width = 115
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1066.270833333330000000
          629.708333333333000000
          304.270833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(4) Tipo de contrato:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 127
        Top = 142
        Width = 350
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          336.020833333333000000
          375.708333333333000000
          926.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TJ_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 76
        Top = 161
        Width = 132
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          201.083333333333000000
          425.979166666667000000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TJ_FNACIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 251
        Top = 161
        Width = 179
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          664.104166666667000000
          425.979166666667000000
          473.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'SEXO_CTJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 358
        Top = 122
        Width = 119
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          947.208333333333000000
          322.791666666667000000
          314.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'SINIESTRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape12: TQRShape
        Left = 481
        Top = 121
        Width = 1
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667000000
          1272.645833333330000000
          320.145833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 591
        Top = 179
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1563.687500000000000000
          473.604166666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 481
        Top = 179
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1272.645833333330000000
          473.604166666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 410
        Top = 179
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1084.791666666670000000
          473.604166666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 289
        Top = 179
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          764.645833333333000000
          473.604166666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 2
        Top = 300
        Width = 700
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          5.291666666666670000
          793.750000000000000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 7
        Top = 304
        Width = 258
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          804.333333333333000000
          682.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Domicilio de la Raz'#243'n Social (Calle y N'#186')'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel26: TQRLabel
        Left = 297
        Top = 304
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          785.812500000000000000
          804.333333333333000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tel'#233'fono'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel27: TQRLabel
        Left = 419
        Top = 304
        Width = 42
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1108.604166666670000000
          804.333333333333000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C.P.A.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel28: TQRLabel
        Left = 487
        Top = 304
        Width = 42
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1288.520833333330000000
          804.333333333333000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Ciudad'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel29: TQRLabel
        Left = 596
        Top = 304
        Width = 58
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1576.916666666670000000
          804.333333333333000000
          153.458333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Provincia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape18: TQRShape
        Left = 2
        Top = 281
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          743.479166666667000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel30: TQRLabel
        Left = 7
        Top = 303
        Width = 79
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          801.687500000000000000
          209.020833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Raz'#243'n Social'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 7
        Top = 283
        Width = 469
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          748.770833333333000000
          1240.895833333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'EM_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel31: TQRLabel
        Left = 487
        Top = 283
        Width = 30
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1288.520833333330000000
          748.770833333333000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CUIT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape19: TQRShape
        Left = 481
        Top = 281
        Width = 1
        Height = 60
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          158.750000000000000000
          1272.645833333330000000
          743.479166666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 591
        Top = 301
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          1563.687500000000000000
          796.395833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 411
        Top = 301
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          1087.437500000000000000
          796.395833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 293
        Top = 301
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          775.229166666667000000
          796.395833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText6: TQRDBText
        Left = 543
        Top = 142
        Width = 157
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1436.687500000000000000
          375.708333333333000000
          415.395833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TJ_CUIL_LINDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText7: TQRDBText
        Left = 575
        Top = 122
        Width = 124
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1521.354166666670000000
          322.791666666667000000
          328.083333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_NRODENUNCIASRT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 7
        Top = 200
        Width = 279
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          529.166666666667000000
          738.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'DOMICILIO_CTJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText9: TQRDBText
        Left = 291
        Top = 200
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          769.937500000000000000
          529.166666666667000000
          312.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TJ_TELEFONO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText10: TQRDBText
        Left = 413
        Top = 200
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1092.729166666670000000
          529.166666666667000000
          179.916666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TJ_CPOSTAL_LINDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText11: TQRDBText
        Left = 484
        Top = 200
        Width = 104
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1280.583333333330000000
          529.166666666667000000
          275.166666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TJ_LOCALIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText12: TQRDBText
        Left = 595
        Top = 200
        Width = 104
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1574.270833333330000000
          529.166666666667000000
          275.166666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'PROVINCIA_CTJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText13: TQRDBText
        Left = 532
        Top = 161
        Width = 165
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1407.583333333330000000
          425.979166666667000000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'NA_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText14: TQRDBText
        Left = 7
        Top = 322
        Width = 282
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          851.958333333333000000
          746.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'DOMICILIO_EMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText15: TQRDBText
        Left = 295
        Top = 322
        Width = 114
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          780.520833333333000000
          851.958333333333000000
          301.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'DC_TELEFONOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText16: TQRDBText
        Left = 413
        Top = 322
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1092.729166666670000000
          851.958333333333000000
          179.916666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'DC_CPOSTAL_LINDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText17: TQRDBText
        Left = 483
        Top = 322
        Width = 107
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1277.937500000000000000
          851.958333333333000000
          283.104166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'DC_LOCALIDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText18: TQRDBText
        Left = 595
        Top = 322
        Width = 105
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1574.270833333330000000
          851.958333333333000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'PROVINCIA_EMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape23: TQRShape
        Left = 2
        Top = 339
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          896.937500000000000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel32: TQRLabel
        Left = 7
        Top = 341
        Width = 327
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          902.229166666667000000
          865.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(5) Grupo de Fiscalizaci'#243'n al que pertenece el empleador:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText19: TQRDBText
        Left = 340
        Top = 341
        Width = 358
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          899.583333333333000000
          902.229166666667000000
          947.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'PROGRAMA_EMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape24: TQRShape
        Left = 2
        Top = 358
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          947.208333333333000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel33: TQRLabel
        Left = 7
        Top = 360
        Width = 282
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          952.500000000000000000
          746.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(6) Actividad econ'#243'mica principal del empleador:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText20: TQRDBText
        Left = 291
        Top = 360
        Width = 266
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          769.937500000000000000
          952.500000000000000000
          703.791666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AC_DESCRIPCION_EMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel34: TQRLabel
        Left = 561
        Top = 360
        Width = 31
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1484.312500000000000000
          952.500000000000000000
          82.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CIIU:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText21: TQRDBText
        Left = 595
        Top = 360
        Width = 105
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1574.270833333330000000
          952.500000000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AC_CODIGO_EMP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape26: TQRShape
        Left = 2
        Top = 377
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          997.479166666667000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText22: TQRDBText
        Left = 277
        Top = 380
        Width = 422
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          732.895833333333000000
          1005.416666666670000000
          1116.541666666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_DOTACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel35: TQRLabel
        Left = 7
        Top = 380
        Width = 268
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          1005.416666666670000000
          709.083333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(7) Dotaci'#243'n de personal actual del empleador:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape27: TQRShape
        Left = 2
        Top = 422
        Width = 700
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          5.291666666666670000
          1116.541666666670000000
          1852.083333333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel36: TQRLabel
        Left = 7
        Top = 424
        Width = 329
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          1121.833333333330000000
          870.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(8) Denominaci'#243'n ART '#243' Empleador Autoasegurado (EA):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel60: TQRLabel
        Left = 488
        Top = 424
        Width = 96
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1291.166666666670000000
          1121.833333333330000000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'C'#243'digo ART / EA:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText55: TQRDBText
        Left = 520
        Top = 283
        Width = 177
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1375.833333333330000000
          748.770833333333000000
          468.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'EM_CUIT_LINDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText56: TQRDBText
        Left = 520
        Top = 238
        Width = 179
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1375.833333333330000000
          629.708333333333000000
          473.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatosLaborales
        DataField = 'MC_DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText57: TQRDBText
        Left = 231
        Top = 238
        Width = 158
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          611.187500000000000000
          629.708333333333000000
          418.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatosLaborales
        DataField = 'ANTIGUEDAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText58: TQRDBText
        Left = 595
        Top = 219
        Width = 104
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1574.270833333330000000
          579.437500000000000000
          275.166666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatosLaborales
        DataField = 'CIUO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText59: TQRDBText
        Left = 251
        Top = 219
        Width = 298
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          664.104166666667000000
          579.437500000000000000
          788.458333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDatosLaborales
        DataField = 'TAREA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText23: TQRLabel
        Left = 343
        Top = 424
        Width = 138
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          907.520833333333000000
          1121.833333333330000000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Provincia ART'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText37: TQRLabel
        Left = 593
        Top = 424
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1568.979166666670000000
          1121.833333333330000000
          227.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '00051'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape33: TQRShape
        Left = 432
        Top = 159
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1143.000000000000000000
          420.687500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape61: TQRShape
        Left = 211
        Top = 159
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          558.270833333333000000
          420.687500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape66: TQRShape
        Left = 550
        Top = 217
        Width = 1
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1455.208333333330000000
          574.145833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape67: TQRShape
        Left = 396
        Top = 236
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1047.750000000000000000
          624.416666666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape68: TQRShape
        Left = 558
        Top = 358
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1476.375000000000000000
          947.208333333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape72: TQRShape
        Left = 484
        Top = 422
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1280.583333333330000000
          1116.541666666670000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel135: TQRLabel
        Left = 8
        Top = 26
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          68.791666666666680000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' Siniestro ART:'
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
      object QRDBText102: TQRDBText
        Left = 120
        Top = 26
        Width = 119
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          68.791666666666680000
          314.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'SINIESTRO'
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
      object QRLabel138: TQRLabel
        Left = 8
        Top = 8
        Width = 191
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          505.354166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Caption = 'FORMULARIO DE RESPUESTA'
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
      object QRDBText104: TQRDBText
        Left = 194
        Top = 45
        Width = 109
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          513.291666666666800000
          119.062500000000000000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqReclamo
        DataField = 'VR_NRORECLAMO_SRT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object Hoja2: TQuickRep
    Left = 832
    Top = 0
    Width = 816
    Height = 295
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = Hoja2BeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      780.520833333333000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object BandaDetalleH2: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 158
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
        418.041666666666700000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape29: TQRShape
        Left = 0
        Top = 5
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          13.229166666666700000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel38: TQRLabel
        Left = 6
        Top = 7
        Width = 293
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          18.520833333333300000
          775.229166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DATOS DEL ACCIDENTE'
        Color = 14671839
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
      object QRShape47: TQRShape
        Left = 0
        Top = 24
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          63.500000000000000000
          1860.020833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 0
        Top = 43
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          113.770833333333000000
          1860.020833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape62: TQRShape
        Left = 0
        Top = 62
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          164.041666666667000000
          1860.020833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape63: TQRShape
        Left = 0
        Top = 81
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          214.312500000000000000
          1860.020833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape64: TQRShape
        Left = 0
        Top = 100
        Width = 703
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          0.000000000000000000
          264.583333333333000000
          1860.020833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel45: TQRLabel
        Left = 7
        Top = 26
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          68.791666666666700000
          179.916666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(31) Fecha:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText64: TQRDBText
        Left = 76
        Top = 26
        Width = 132
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          201.083333333333000000
          68.791666666666700000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'EX_FECHAACCIDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel47: TQRLabel
        Left = 7
        Top = 45
        Width = 185
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          119.062500000000000000
          489.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(33) Turno Habitual         Rotativo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel50: TQRLabel
        Left = 7
        Top = 64
        Width = 312
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          169.333333333333000000
          825.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(34) Realizaba horas extras al momento del accidente:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel81: TQRLabel
        Left = 7
        Top = 83
        Width = 133
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          219.604166666667000000
          351.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(35) Tareas habituales:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText67: TQRDBText
        Left = 144
        Top = 83
        Width = 548
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          381.000000000000000000
          219.604166666667000000
          1449.916666666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_TAREASHABITUALES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel82: TQRLabel
        Left = 383
        Top = 26
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1013.354166666670000000
          68.791666666666700000
          161.395833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(32) Hora:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText68: TQRDBText
        Left = 448
        Top = 26
        Width = 132
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1185.333333333330000000
          68.791666666666700000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'EX_HORAACCIDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel83: TQRLabel
        Left = 7
        Top = 103
        Width = 365
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          272.520833333333000000
          965.729166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(36) Tareas que realizaba al momento del accidente:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText69: TQRDBText
        Left = 7
        Top = 120
        Width = 685
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          317.500000000000000000
          1812.395833333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_TAREASACCIDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape65: TQRShape
        Left = 0
        Top = 138
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          365.125000000000000000
          1860.020833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel84: TQRLabel
        Left = 7
        Top = 140
        Width = 164
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          370.416666666667000000
          433.916666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(37) Testigos del accidente:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrLabelHuboTestigos: TQRLabel
        Left = 175
        Top = 140
        Width = 389
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          463.020833333333000000
          370.416666666667000000
          1029.229166666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'No se registraron.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = qrLabelHuboTestigosPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText85: TQRDBText
        Left = 432
        Top = 45
        Width = 103
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1143.000000000000000000
          119.062500000000000000
          272.520833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_HORARIODESDE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel100: TQRLabel
        Left = 299
        Top = 45
        Width = 96
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          791.104166666667000000
          119.062500000000000000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Horario Habitual'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText86: TQRDBText
        Left = 580
        Top = 45
        Width = 103
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1534.583333333330000000
          119.062500000000000000
          272.520833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_HORARIOHASTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel101: TQRLabel
        Left = 407
        Top = 45
        Width = 24
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1076.854166666670000000
          119.062500000000000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'De'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel102: TQRLabel
        Left = 543
        Top = 45
        Width = 36
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1436.687500000000000000
          119.062500000000000000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Hasta'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape83: TQRShape
        Left = 377
        Top = 24
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          997.479166666667000000
          63.500000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape84: TQRShape
        Left = 129
        Top = 43
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          341.312500000000000000
          113.770833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape85: TQRShape
        Left = 207
        Top = 43
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          547.687500000000000000
          113.770833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape86: TQRShape
        Left = 295
        Top = 43
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          780.520833333333000000
          113.770833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape87: TQRShape
        Left = 400
        Top = 43
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1058.333333333330000000
          113.770833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape88: TQRShape
        Left = 540
        Top = 43
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1428.750000000000000000
          113.770833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qshAE_TURNOROTATIVO: TQRShape
        Left = 233
        Top = 45
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          616.479166666667000000
          119.062500000000000000
          39.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qshAE_TURNOROTATIVO2: TQRShape
        Left = 275
        Top = 45
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          727.604166666667000000
          119.062500000000000000
          39.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qAE_TURNOROTATIVO: TQRLabel
        Left = 233
        Top = 44
        Width = 14
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          616.479166666667000000
          116.416666666667000000
          37.041666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
      object QRLabel133: TQRLabel
        Left = 215
        Top = 45
        Width = 17
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          568.854166666667000000
          119.062500000000000000
          44.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel134: TQRLabel
        Left = 253
        Top = 45
        Width = 19
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          669.395833333333000000
          119.062500000000000000
          50.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape34: TQRShape
        Left = 345
        Top = 64
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          912.812500000000000000
          169.333333333333000000
          39.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel136: TQRLabel
        Left = 365
        Top = 64
        Width = 19
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          965.729166666667000000
          169.333333333333000000
          50.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qshAE_HORASEXTRAS2: TQRShape
        Left = 387
        Top = 64
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1023.937500000000000000
          169.333333333333000000
          39.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel137: TQRLabel
        Left = 327
        Top = 64
        Width = 17
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          865.187500000000000000
          169.333333333333000000
          44.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SI'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qAE_HORASEXTRAS: TQRLabel
        Left = 345
        Top = 63
        Width = 14
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          912.812500000000000000
          166.687500000000000000
          37.041666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 12
      end
    end
    object BandaTestigos: TQRLoopBand
      Left = 76
      Top = 196
      Width = 703
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = BandaTestigosAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1860.020833333333000000)
      Master = BandaDetalleH2
      PrintCount = 0
      PrintBefore = False
      object QRLabel39: TQRLabel
        Left = 7
        Top = 3
        Width = 110
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          7.937500000000000000
          291.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Apellido / Nombres'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText78: TQRDBText
        Left = 119
        Top = 3
        Width = 574
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          314.854166666667000000
          7.937500000000000000
          1518.708333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel41: TQRLabel
        Left = 7
        Top = 20
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          52.916666666666700000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DNI/CUIL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText79: TQRDBText
        Left = 63
        Top = 20
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          166.687500000000000000
          52.916666666666700000
          312.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_DOCUMENTO_CUIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel42: TQRLabel
        Left = 187
        Top = 20
        Width = 38
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          494.770833333333000000
          52.916666666666700000
          100.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cargo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText80: TQRDBText
        Left = 227
        Top = 20
        Width = 246
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          600.604166666667000000
          52.916666666666700000
          650.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_CARGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText81: TQRDBText
        Left = 608
        Top = 20
        Width = 85
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1608.666666666670000000
          52.916666666666700000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_FECHA_ENTREVISTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel43: TQRLabel
        Left = 479
        Top = 20
        Width = 126
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1267.354166666670000000
          52.916666666666700000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fecha de la entrevista'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object Sumario38: TQRBand
      Left = 76
      Top = 236
      Width = 703
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
        52.916666666666660000
        1860.020833333333000000)
      BandType = rbSummary
      object QRDBText82: TQRDBText
        Left = 208
        Top = 1
        Width = 489
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          550.333333333333000000
          2.645833333333330000
          1293.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_DESCRIPCIONACCIDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel85: TQRLabel
        Left = 7
        Top = 1
        Width = 198
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          2.645833333333330000
          523.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(38) Descripci'#243'n del accidente:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object Hoja3: TQuickRep
    Left = 832
    Top = 314
    Width = 816
    Height = 176
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = Hoja3BeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39)
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      465.666666666667000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object BandaDetalleH3: TQRBand
      Left = 76
      Top = 78
      Width = 703
      Height = 38
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
        100.541666666666700000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape32: TQRShape
        Left = 0
        Top = 16
        Width = 703
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          42.333333333333300000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel86: TQRLabel
        Left = 6
        Top = 18
        Width = 401
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          47.625000000000000000
          1060.979166666670000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(40) RESUMEN DE CAUSAS DEL ACCIDENTE'
        Color = 14671839
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
    end
    object BandaCausas: TQRLoopBand
      Left = 76
      Top = 116
      Width = 703
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = BandaCausasAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = BandaDetalleH3
      Size.Values = (
        50.270833333333330000
        1860.020833333333000000)
      Master = Hoja3
      PrintCount = 0
      PrintBefore = False
      object QRDBText71: TQRDBText
        Left = 47
        Top = 1
        Width = 651
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          124.354166666667000000
          2.645833333333330000
          1722.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqCausas
        DataField = 'DC_DESCRIPCION'
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
      object QRDBText66: TQRDBText
        Left = 7
        Top = 1
        Width = 37
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          2.645833333333330000
          97.895833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqCausas
        DataField = 'DC_NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object Titulo39: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = BandaDetalleH3
      Size.Values = (
        105.833333333333300000
        1860.020833333333000000)
      BandType = rbTitle
      object QRLabel90: TQRLabel
        Left = 7
        Top = 2
        Width = 430
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          5.291666666666670000
          1137.708333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '(39) '#191'Qu'#233' hechos fueron necesarios para que ocurriera el acciden' +
          'te?'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText83: TQRDBText
        Left = 8
        Top = 19
        Width = 685
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          21.166666666666700000
          50.270833333333300000
          1812.395833333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_HECHOSADICIONALES'
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
  end
  object Hoja4: TQuickRep
    Left = 832
    Top = 524
    Width = 816
    Height = 255
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = Hoja4BeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1'
      'BANDAMEDIDAS'
      'BANDAIMPLEMENTACION')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39
      '0'
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      674.687500000000000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object Titulo41: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 61
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
        161.395833333333300000
        1860.020833333333000000)
      BandType = rbTitle
      object QRShape42: TQRShape
        Left = 0
        Top = 20
        Width = 703
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          105.833333333333000000
          0.000000000000000000
          52.916666666666700000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel88: TQRLabel
        Left = 6
        Top = 23
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          60.854166666666700000
          219.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(41) N'#186' de'
        Color = 14671839
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
      object QRLabel87: TQRLabel
        Left = 6
        Top = 40
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          105.833333333333000000
          187.854166666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CAUSA'
        Color = 14671839
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
      object QRLabel89: TQRLabel
        Left = 110
        Top = 23
        Width = 279
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          291.041666666667000000
          60.854166666666700000
          738.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MEDIDAS CORRECTIVAS A IMPLEMENTAR'
        Color = 14671839
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
      object QRLabel91: TQRLabel
        Left = 502
        Top = 23
        Width = 139
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1328.208333333330000000
          60.854166666666700000
          367.770833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FECHA'
        Color = 14671839
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
      object QRLabel92: TQRLabel
        Left = 458
        Top = 42
        Width = 111
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1211.791666666670000000
          111.125000000000000000
          293.687500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DE EJECUCION'
        Color = 14671839
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
      object QRLabel93: TQRLabel
        Left = 576
        Top = 42
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1524.000000000000000000
          111.125000000000000000
          320.145833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DE VERIFICACION'
        Color = 14671839
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
      object QRShape90: TQRShape
        Left = 97
        Top = 20
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          256.645833333333000000
          52.916666666666700000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape91: TQRShape
        Left = 453
        Top = 20
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          1198.562500000000000000
          52.916666666666700000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape94: TQRShape
        Left = 572
        Top = 40
        Width = 1
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1513.416666666670000000
          105.833333333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape95: TQRShape
        Left = 453
        Top = 40
        Width = 250
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1198.562500000000000000
          105.833333333333000000
          661.458333333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object BandaMedidas: TQRLoopBand
      Left = 76
      Top = 99
      Width = 703
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = BandaMedidasAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = Titulo41
      Size.Values = (
        50.270833333333330000
        1860.020833333333000000)
      Master = Hoja4
      PrintCount = 0
      PrintBefore = True
      object QRShape89: TQRShape
        Left = 0
        Top = -1
        Width = 98
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          -2.645833333333330000
          259.291666666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape92: TQRShape
        Left = 453
        Top = -1
        Width = 120
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          1198.562500000000000000
          -2.645833333333330000
          317.500000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape93: TQRShape
        Left = 573
        Top = -1
        Width = 129
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          1516.062500000000000000
          -2.645833333333330000
          341.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText73: TQRDBText
        Left = 15
        Top = 1
        Width = 74
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          39.687500000000000000
          2.645833333333333000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqMedidas
        DataField = 'DC_NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText76: TQRDBText
        Left = 459
        Top = 1
        Width = 110
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1214.437500000000000000
          2.645833333333330000
          291.041666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMedidas
        DataField = 'MC_FECHAEJECUCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText77: TQRDBText
        Left = 579
        Top = 1
        Width = 110
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1531.937500000000000000
          2.645833333333330000
          291.041666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMedidas
        DataField = 'MC_FECHAVERIFICACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText70: TArtQRDBText
        Left = 101
        Top = 0
        Width = 348
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          267.229166666667000000
          0.000000000000000000
          920.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMedidas
        DataField = 'MC_DESCRIPCION'
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
    object BandaDetalleH4: TQRBand
      Left = 76
      Top = 118
      Width = 703
      Height = 79
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
        209.020833333333300000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape30: TQRShape
        Left = 0
        Top = 19
        Width = 703
        Height = 59
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          156.104166666667000000
          0.000000000000000000
          50.270833333333300000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel94: TQRLabel
        Left = 6
        Top = 20
        Width = 543
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          52.916666666666700000
          1436.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(42) SEGUIMIENTO DE LA IMPLEMENTACION DE LAS MEDIDAS CORRECTIVAS'
        Color = 14671839
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
      object QRLabel95: TQRLabel
        Left = 6
        Top = 39
        Width = 163
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          103.187500000000000000
          431.270833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'MEDIDA CORRECTIVA'
        Color = 14671839
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
      object QRLabel96: TQRLabel
        Left = 308
        Top = 58
        Width = 141
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          814.916666666667000000
          153.458333333333000000
          373.062500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Primera Verificaci'#243'n'
        Color = 14671839
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
      object QRLabel97: TQRLabel
        Left = 454
        Top = 58
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1201.208333333330000000
          153.458333333333000000
          298.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cumplimiento'
        Color = 14671839
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
      object QRLabel98: TQRLabel
        Left = 438
        Top = 39
        Width = 139
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1158.875000000000000000
          103.187500000000000000
          367.770833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FECHA'
        Color = 14671839
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
      object QRLabel99: TQRLabel
        Left = 572
        Top = 58
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1513.416666666670000000
          153.458333333333000000
          320.145833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Incumplimiento'
        Color = 14671839
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
      object QRShape96: TQRShape
        Left = 304
        Top = 38
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          804.333333333333000000
          100.541666666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape97: TQRShape
        Left = 304
        Top = 56
        Width = 399
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          804.333333333333000000
          148.166666666667000000
          1055.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape98: TQRShape
        Left = 0
        Top = 37
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          97.895833333333300000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape99: TQRShape
        Left = 569
        Top = 57
        Width = 1
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1505.479166666670000000
          150.812500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape100: TQRShape
        Left = 451
        Top = 57
        Width = 1
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1193.270833333330000000
          150.812500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object BandaImplementacion: TQRLoopBand
      Left = 76
      Top = 197
      Width = 703
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = BandaImplementacionAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = Titulo41
      Size.Values = (
        50.270833333333330000
        1860.020833333333000000)
      Master = Hoja4
      PrintCount = 0
      PrintBefore = False
      object QRDBText74: TQRDBText
        Left = 6
        Top = 1
        Width = 295
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          2.645833333333330000
          780.520833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqImplementacion
        DataField = 'MC_DESCRIPCION'
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
      object QRDBText72: TQRDBText
        Left = 325
        Top = 1
        Width = 109
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          859.895833333333000000
          2.645833333333330000
          288.395833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqImplementacion
        DataField = 'SV_FECHAVERIFICACION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText75: TQRDBText
        Left = 459
        Top = 1
        Width = 107
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1214.437500000000000000
          2.645833333333330000
          283.104166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqImplementacion
        DataField = 'SV_FECHACUMPLIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText84: TQRDBText
        Left = 583
        Top = 1
        Width = 109
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1542.520833333330000000
          2.645833333333330000
          288.395833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqImplementacion
        DataField = 'SV_FECHAINCUMPLIMIENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape101: TQRShape
        Left = 451
        Top = -1
        Width = 1
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1193.270833333330000000
          -2.645833333333330000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape102: TQRShape
        Left = 569
        Top = -1
        Width = 1
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1505.479166666670000000
          -2.645833333333330000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape103: TQRShape
        Left = 304
        Top = -1
        Width = 1
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          804.333333333333000000
          -2.645833333333330000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  object Hoja5: TQuickRep
    Left = 832
    Top = 800
    Width = 816
    Height = 216
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = Hoja5BeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1'
      'BANDAMEDIDAS'
      'BANDAIMPLEMENTACION'
      'QRLOOPBAND2'
      'BANDAMULTIPLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39
      '0'
      '0'
      '0'
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      571.500000000000000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object Titulo43: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 59
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
        156.104166666666700000
        1860.020833333333000000)
      BandType = rbTitle
      object QRShape104: TQRShape
        Left = 0
        Top = 20
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          52.916666666666700000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel103: TQRLabel
        Left = 6
        Top = 21
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          55.562500000000000000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '(43) DATOS COMPLEMENTARIOS DE OTROS ACCIDENTADOS EN CASO DE ACCI' +
          'DENTE MULTIPLE'
        Color = 14671839
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
      object QRLabel104: TQRLabel
        Left = 6
        Top = 41
        Width = 124
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          108.479166666667000000
          328.083333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Apellido y Nombre'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel105: TQRLabel
        Left = 202
        Top = 41
        Width = 44
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          534.458333333333000000
          108.479166666667000000
          116.416666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CUIL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel106: TQRLabel
        Left = 314
        Top = 41
        Width = 84
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          830.791666666667000000
          108.479166666667000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo Lesi'#243'n'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel107: TQRLabel
        Left = 598
        Top = 41
        Width = 96
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1582.208333333330000000
          108.479166666667000000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' de Denuncia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape106: TQRShape
        Left = 194
        Top = 39
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          513.291666666667000000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape107: TQRShape
        Left = 305
        Top = 39
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          806.979166666667000000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape108: TQRShape
        Left = 584
        Top = 39
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          1545.166666666670000000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape109: TQRShape
        Left = -1
        Top = 39
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          -1.322916666666670000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape121: TQRShape
        Left = 702
        Top = 39
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          1857.375000000000000000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object BandaMultiple: TQRLoopBand
      Left = 76
      Top = 97
      Width = 703
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = BandaMultipleAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = Titulo43
      Size.Values = (
        50.270833333333330000
        1860.020833333333000000)
      Master = Hoja5
      PrintCount = 0
      PrintBefore = True
      object QRDBText87: TQRDBText
        Left = 9
        Top = 1
        Width = 177
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          23.812500000000000000
          2.645833333333330000
          468.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMultiple
        DataField = 'TJ_NOMBRE'
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
      object QRDBText89: TQRDBText
        Left = 311
        Top = 1
        Width = 267
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          822.854166666667000000
          2.645833333333330000
          706.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMultiple
        DataField = 'AM_DETALLELESION'
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
      object QRDBText90: TQRDBText
        Left = 593
        Top = 1
        Width = 104
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1568.979166666670000000
          2.645833333333330000
          275.166666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMultiple
        DataField = 'DG_NRODENUNCIASRT'
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
      object QRShape110: TQRShape
        Left = 305
        Top = 0
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          806.979166666667000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape111: TQRShape
        Left = 584
        Top = 0
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          1545.166666666670000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText88: TQRDBText
        Left = 199
        Top = 1
        Width = 99
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          526.520833333333000000
          2.645833333333330000
          261.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqMultiple
        DataField = 'TJ_CUIL'
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
      object QRShape105: TQRShape
        Left = 194
        Top = 0
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          513.291666666667000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object BandaDetalleH5: TQRBand
      Left = 76
      Top = 116
      Width = 703
      Height = 61
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
        161.395833333333300000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape112: TQRShape
        Left = 0
        Top = 19
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          50.270833333333300000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel109: TQRLabel
        Left = 6
        Top = 20
        Width = 352
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          52.916666666666700000
          931.333333333334000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(44) OBSERVACIONES / OTROS DATOS DEL INFORME'
        Color = 14671839
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
      object QRDBText95: TQRDBText
        Left = 9
        Top = 41
        Width = 685
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          23.812500000000000000
          108.479166666667000000
          1812.395833333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_OTROSDATOS'
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
      object QRShape114: TQRShape
        Left = 673
        Top = 0
        Width = 47
        Height = 18
        Frame.Color = clWhite
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          47.625000000000000000
          1780.645833333330000000
          0.000000000000000000
          124.354166666667000000)
        Pen.Color = clWhite
        Pen.Mode = pmWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape113: TQRShape
        Left = -18
        Top = 0
        Width = 48
        Height = 18
        Frame.Color = clWhite
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          -47.625000000000000000
          0.000000000000000000
          127.000000000000000000)
        Pen.Color = clWhite
        Pen.Mode = pmWhite
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object Hoja6: TQuickRep
    Left = 1672
    Top = 0
    Width = 816
    Height = 340
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = Hoja6BeforePrint
    DataSet = sdqTestigos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1'
      'BANDAMEDIDAS'
      'BANDAIMPLEMENTACION'
      'QRLOOPBAND2'
      'BANDAMULTIPLE'
      'BANDAENTREVISTADOS')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39
      '0'
      '0'
      '0'
      '0'
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      899.583333333333000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object Titulo45: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 139
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
        367.770833333333400000
        1860.020833333333000000)
      BandType = rbTitle
      object QRShape115: TQRShape
        Left = -1
        Top = 20
        Width = 704
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666700000
          -2.645833333333330000
          52.916666666666700000
          1862.666666666670000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel108: TQRLabel
        Left = 6
        Top = 21
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          55.562500000000000000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(45) RESPONSABLES DE LOS DATOS CONTENIDOS EN ESTE INFORME'
        Color = 14671839
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
      object QRLabel110: TQRLabel
        Left = 6
        Top = 41
        Width = 108
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          108.479166666667000000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Apellido y Nombre'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel111: TQRLabel
        Left = 6
        Top = 61
        Width = 40
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          161.395833333333000000
          105.833333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T'#237'tulo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape117: TQRShape
        Left = 369
        Top = 59
        Width = 1
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          976.312500000000000000
          156.104166666667000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape128: TQRShape
        Left = 0
        Top = 59
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          156.104166666667000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape129: TQRShape
        Left = 0
        Top = 79
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          209.020833333333000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape130: TQRShape
        Left = 0
        Top = 99
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          261.937500000000000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel117: TQRLabel
        Left = 6
        Top = 101
        Width = 412
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          267.229166666667000000
          1090.083333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Fecha de la investigaci'#243'n del accidente y firma del profesional ' +
          'actuante:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText97: TQRDBText
        Left = 118
        Top = 42
        Width = 577
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          312.208333333333000000
          111.125000000000000000
          1526.645833333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'RESPONSABLE'
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
      object QRDBText98: TQRDBText
        Left = 49
        Top = 62
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          129.645833333333000000
          164.041666666667000000
          833.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_TITULO'
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
      object QRDBText103: TQRDBText
        Left = 421
        Top = 102
        Width = 279
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1113.895833333330000000
          269.875000000000000000
          738.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_FECHA'
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
      object QRShape131: TQRShape
        Left = 0
        Top = 119
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          314.854166666667000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape132: TQRShape
        Left = -1
        Top = 39
        Width = 1
        Height = 100
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          264.583333333333000000
          -2.645833333333330000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape133: TQRShape
        Left = 702
        Top = 39
        Width = 1
        Height = 100
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          264.583333333333000000
          1857.375000000000000000
          103.187500000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel118: TQRLabel
        Left = 6
        Top = 121
        Width = 528
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          320.145833333333000000
          1397.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Datos de las personas entrevistadas para elaborar el informe de ' +
          'investigaci'#243'n del accidente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape116: TQRShape
        Left = 226
        Top = 79
        Width = 1
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          597.958333333333000000
          209.020833333333000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel115: TQRLabel
        Left = 6
        Top = 81
        Width = 92
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          214.312500000000000000
          243.416666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N'#186' de Matr'#237'cula:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel116: TQRLabel
        Left = 234
        Top = 81
        Width = 176
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          619.125000000000000000
          214.312500000000000000
          465.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Colegio '#243' Consejo Profesional:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText96: TQRDBText
        Left = 101
        Top = 82
        Width = 119
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          267.229166666667000000
          216.958333333333000000
          314.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_NUMEROMATRICULA'
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
      object QRDBText101: TQRDBText
        Left = 415
        Top = 82
        Width = 285
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1098.020833333330000000
          216.958333333333000000
          754.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'AE_INSTITUCIONOTORGANTE'
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
      object QRLabel112: TQRLabel
        Left = 378
        Top = 61
        Width = 108
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1000.125000000000000000
          161.395833333333000000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tipo de Matr'#237'cula:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText99: TQRDBText
        Left = 491
        Top = 62
        Width = 209
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1299.104166666670000000
          164.041666666667000000
          552.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = sdqAccidenteEstablecimiento
        DataField = 'TIPOMATRICULA_CTB'
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
    object BandaEntrevistados: TQRLoopBand
      Left = 76
      Top = 177
      Width = 703
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AfterPrint = BandaTestigosAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1860.020833333333000000)
      Master = Hoja6
      PrintCount = 0
      PrintBefore = True
      object QRLabel119: TQRLabel
        Left = 7
        Top = 3
        Width = 110
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          7.937500000000000000
          291.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Apellido / Nombres'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText91: TQRDBText
        Left = 119
        Top = 3
        Width = 574
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          314.854166666667000000
          7.937500000000000000
          1518.708333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_NOMBRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel120: TQRLabel
        Left = 7
        Top = 20
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          52.916666666666700000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DNI/CUIL'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText92: TQRDBText
        Left = 63
        Top = 20
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          166.687500000000000000
          52.916666666666700000
          312.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_DOCUMENTO_CUIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel121: TQRLabel
        Left = 187
        Top = 20
        Width = 38
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          494.770833333333000000
          52.916666666666700000
          100.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cargo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText93: TQRDBText
        Left = 227
        Top = 20
        Width = 246
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          600.604166666667000000
          52.916666666666700000
          650.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_CARGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText94: TQRDBText
        Left = 608
        Top = 20
        Width = 85
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1608.666666666670000000
          52.916666666666700000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqTestigos
        DataField = 'PE_FECHA_ENTREVISTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel122: TQRLabel
        Left = 479
        Top = 20
        Width = 126
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1267.354166666670000000
          52.916666666666700000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fecha de la entrevista'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object BandaDetalleH6: TQRBand
      Left = 76
      Top = 217
      Width = 703
      Height = 64
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
        169.333333333333300000
        1860.020833333333000000)
      BandType = rbDetail
      object QRLabel114: TQRLabel
        Left = 7
        Top = 3
        Width = 159
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          18.520833333333300000
          7.937500000000000000
          420.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Firma del/los entrevistados'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand1: TQRBand
      Left = 76
      Top = 281
      Width = 703
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666660000
        1860.020833333333000000)
      BandType = rbSummary
    end
  end
  object Hoja7: TQuickRep
    Left = 1672
    Top = 356
    Width = 816
    Height = 257
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqAccidenteEstablecimiento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1'
      'BANDAMEDIDAS'
      'BANDAIMPLEMENTACION'
      'QRLOOPBAND2'
      'BANDAMULTIPLE'
      'BANDAENTREVISTADOS'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      679.979166666667000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object Titulo46: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 180
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
        476.250000000000000000
        1860.020833333333000000)
      BandType = rbTitle
      object QRShape119: TQRShape
        Left = 0
        Top = 0
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          0.000000000000000000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel123: TQRLabel
        Left = 6
        Top = 1
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          2.645833333333330000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '(46) REGISTRO DE CAUSAS Y CIRCUSTANCIAS DEL ACCIDENTE DE TRABAJO' +
          ' (a completar por la SRT)'
        Color = 14671839
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
      object QRLabel124: TQRLabel
        Left = 6
        Top = 21
        Width = 168
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          55.562500000000000000
          444.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(47) Descripci'#243'n de la lesi'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel126: TQRLabel
        Left = 354
        Top = 21
        Width = 184
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          936.625000000000000000
          55.562500000000000000
          486.833333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(48) Parte del cuerpo lesionada:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape122: TQRShape
        Left = 349
        Top = 19
        Width = 1
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          923.395833333333000000
          50.270833333333300000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape124: TQRShape
        Left = 0
        Top = 39
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          103.187500000000000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape125: TQRShape
        Left = 0
        Top = 59
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          156.104166666667000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape126: TQRShape
        Left = 0
        Top = 79
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          209.020833333333000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape127: TQRShape
        Left = 0
        Top = 99
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          261.937500000000000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape118: TQRShape
        Left = 265
        Top = 20
        Width = 1
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          701.145833333333000000
          52.916666666666700000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape123: TQRShape
        Left = 621
        Top = 20
        Width = 1
        Height = 99
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          261.937500000000000000
          1643.062500000000000000
          52.916666666666700000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel113: TQRLabel
        Left = 6
        Top = 41
        Width = 120
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          108.479166666667000000
          317.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(49) Tipo de lugar:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel125: TQRLabel
        Left = 354
        Top = 41
        Width = 184
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          936.625000000000000000
          108.479166666667000000
          486.833333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(50) Tipo de trabajo:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel127: TQRLabel
        Left = 6
        Top = 61
        Width = 188
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          161.395833333333000000
          497.416666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(51) Actividad f'#237'sica espec'#237'fica:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel128: TQRLabel
        Left = 6
        Top = 81
        Width = 324
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          214.312500000000000000
          857.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(52) Agente material de la actividad f'#237'sica espec'#237'fica:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel129: TQRLabel
        Left = 6
        Top = 101
        Width = 324
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          267.229166666667000000
          857.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(53) Desviaci'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape120: TQRShape
        Left = 0
        Top = 119
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          314.854166666667000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel130: TQRLabel
        Left = 6
        Top = 121
        Width = 324
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          320.145833333333000000
          857.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(54) Agente material de la desviaci'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape134: TQRShape
        Left = 0
        Top = 139
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          367.770833333333000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel131: TQRLabel
        Left = 6
        Top = 141
        Width = 324
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          373.062500000000000000
          857.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(55) Forma (contacto - modalidad de la lesi'#243'n):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape135: TQRShape
        Left = 0
        Top = 159
        Width = 703
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          0.000000000000000000
          420.687500000000000000
          1860.020833333330000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel132: TQRLabel
        Left = 6
        Top = 161
        Width = 324
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          15.875000000000000000
          425.979166666667000000
          857.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(56) Agente material causante de la lesi'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  object qrArticulo11iA2: TQuickRep
    Left = 1670
    Top = 636
    Width = 816
    Height = 176
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqDetalleRemuneraciones
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1'
      'BANDAMEDIDAS'
      'BANDAIMPLEMENTACION'
      'QRLOOPBAND2'
      'BANDAMULTIPLE'
      'BANDAENTREVISTADOS'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      465.700000000000000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object qrbArticulo11i2Title: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 40
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
        105.833333333333300000
        1860.020833333333000000)
      BandType = rbTitle
      object QRShape46: TQRShape
        Left = 0
        Top = 0
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          0.000000000000000000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel139: TQRLabel
        Left = 6
        Top = 1
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          2.645833333333330000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valor mensual del ingreso base (V.M.I.B)'
        Color = 14671839
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
      object QRLabel140: TQRLabel
        Left = 6
        Top = 21
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          15.875000000000000000
          55.562500000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Valor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText107: TQRDBText
        Left = 67
        Top = 21
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          177.270833333333300000
          55.562500000000000000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqArticulo11
        DataField = 'IBM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrbArticulo11i2Detail: TQRBand
      Left = 76
      Top = 118
      Width = 703
      Height = 17
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
        44.979166666666670000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape57: TQRShape
        Left = 100
        Top = 0
        Width = 13
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          42.333333333333340000
          264.583333333333400000
          0.000000000000000000
          34.395833333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText105: TQRDBText
        Left = 23
        Top = 0
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          60.854166666666680000
          0.000000000000000000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDetalleRemuneraciones
        DataField = 'PERIODO'
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
      object QRDBText106: TQRDBText
        Left = 140
        Top = 0
        Width = 74
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          370.416666666666700000
          0.000000000000000000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDetalleRemuneraciones
        DataField = 'IMPORTEAMPO'
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
    object qrbArticulo11i2Titulos: TQRChildBand
      Left = 76
      Top = 78
      Width = 703
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = 14671839
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1860.020833333333000000)
      ParentBand = qrbArticulo11i2Title
      object QRLabel148: TQRLabel
        Left = 6
        Top = 1
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          2.645833333333330000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Detalle de las remuneraciones sujetas a aportes consideradas par' +
          'a su c'#225'lculo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 76
      Top = 99
      Width = 703
      Height = 19
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
        50.270833333333330000
        1860.020833333333000000)
      BandType = rbColumnHeader
      object QRLabel150: TQRLabel
        Left = 162
        Top = 0
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          428.625000000000000000
          0.000000000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Importe'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRShape25: TQRShape
        Left = 100
        Top = 0
        Width = 13
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666660000
          264.583333333333400000
          0.000000000000000000
          34.395833333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel149: TQRLabel
        Left = 18
        Top = 0
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          0.000000000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Per'#237'odo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qrArticulo11iA5: TQuickRep
    Left = 1670
    Top = 820
    Width = 816
    Height = 176
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = sdqDetalleDerechohabientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BANDATESTIGOS'
      'BANDACAUSAS'
      'QRSTRINGSBAND1'
      'BANDAMEDIDAS'
      'BANDAIMPLEMENTACION'
      'QRLOOPBAND2'
      'BANDAMULTIPLE'
      'BANDAENTREVISTADOS'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0'
      #39#39
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
    IDReport = 0
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      465.700000000000000000
      100.000000000000000000
      2159.000000000000000000
      200.000000000000000000
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
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    object QRBand2: TQRBand
      Left = 76
      Top = 38
      Width = 703
      Height = 40
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
        105.833333333333300000
        1860.020833333333000000)
      BandType = rbTitle
      object QRShape28: TQRShape
        Left = 0
        Top = 0
        Width = 703
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666700000
          0.000000000000000000
          0.000000000000000000
          1860.020833333330000000)
        Brush.Color = 14671839
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel37: TQRLabel
        Left = 6
        Top = 1
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          2.645833333333330000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Fecha de recepci'#243'n de los antecedentes presentados por los derec' +
          'hohabientes en la ART.'
        Color = 14671839
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
      object QRLabel40: TQRLabel
        Left = 6
        Top = 21
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          15.875000000000000000
          55.562500000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText28: TQRDBText
        Left = 67
        Top = 21
        Width = 118
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          177.270833333333300000
          55.562500000000000000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = sdqArticulo11
        DataField = 'CB_FRECEPMORT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand3: TQRBand
      Left = 76
      Top = 118
      Width = 703
      Height = 17
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
        44.979166666666670000
        1860.020833333333000000)
      BandType = rbDetail
      object QRShape31: TQRShape
        Left = 372
        Top = 0
        Width = 13
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          42.333333333333340000
          984.249999999999900000
          0.000000000000000000
          34.395833333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText29: TQRDBText
        Left = 19
        Top = 0
        Width = 63
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          50.270833333333330000
          0.000000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDetalleDerechohabientes
        DataField = 'EB_NOMBRE'
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
      object QRDBText30: TQRDBText
        Left = 444
        Top = 0
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1174.750000000000000000
          0.000000000000000000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = sdqDetalleDerechohabientes
        DataField = 'EB_PORCENTAJE'
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
    object QRChildBand1: TQRChildBand
      Left = 76
      Top = 78
      Width = 703
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = 14671839
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1860.020833333333000000)
      ParentBand = QRBand2
      object QRLabel51: TQRLabel
        Left = 6
        Top = 1
        Width = 688
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          15.875000000000000000
          2.645833333333330000
          1820.333333333330000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Detalle de los derechohabientes reconocidos por la ART'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 76
      Top = 99
      Width = 703
      Height = 19
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
        50.270833333333330000
        1860.020833333333000000)
      BandType = rbColumnHeader
      object QRLabel52: TQRLabel
        Left = 458
        Top = 0
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1211.791666666667000000
          0.000000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Porcentaje'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRShape36: TQRShape
        Left = 372
        Top = 0
        Width = 13
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          52.916666666666660000
          984.249999999999900000
          0.000000000000000000
          34.395833333333340000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel53: TQRLabel
        Left = 18
        Top = 0
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          0.000000000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nombre'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object sdqAccidenteEstablecimiento: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT UTILES.ARMAR_DOMICILIO(DC_Calle, DC_Numero, DC_Piso, DC_D' +
        'epartamento) as DOMICILIO_EMP,'
      
        '       UTILES.ARMAR_DOMICILIO(TJ_Calle, TJ_Numero, TJ_Piso, TJ_D' +
        'epartamento) as DOMICILIO_CTJ,'
      
        '       UTILES.ARMAR_DOMICILIO(AE_Calle, AE_Numero, AE_Piso, AE_D' +
        'epartamento) as DOMICILIO_PAE,'
      
        '       UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA' +
        ') as SINIESTRO,'
      '       PAE_ACCIDENTEESTABLECIMIENTO.*,'
      
        '       NVL ((SELECT it_nombre FROM art.pit_firmantes WHERE it_id' +
        ' = ae_idit),'
      
        '            PAE_ACCIDENTEESTABLECIMIENTO.ae_responsable) respons' +
        'able,'
      '       CTJ_TRABAJADOR.*,'
      '       AEM_EMPRESA.*,'
      '       ADC_DOMICILIOCONTRATO.*,'
      '       ACO_CONTRATO.*,'
      '       DG_ANTIGUEDADPUESTO,'
      ''
      '       CPV_CTJ.PV_DESCRIPCION PROVINCIA_CTJ,'
      '       CPV_EMP.PV_DESCRIPCION PROVINCIA_EMP,'
      '       CPV_PAE.PV_DESCRIPCION PROVINCIA_PAE,'
      '       EX_TIPO, EX_FECHAACCIDENTE, EX_HORAACCIDENTE,'
      '       UTILES.ARMAR_CUIT(TJ_CUIL) as TJ_CUIL_LINDO,'
      '       UTILES.ARMAR_CUIT(EM_CUIT) as EM_CUIT_LINDO,'
      '       UTILES.ARMAR_CUIT(AE_CUIT) as AE_CUIT_LINDO,'
      ''
      ''
      
        '       IIF_CHAR(TJ_CPOSTALA,'#39'99999999'#39', TJ_CPOSTAL, NVL(TJ_CPOST' +
        'ALA, TJ_CPOSTAL)) as TJ_CPOSTAL_LINDO,'
      
        '       IIF_CHAR(DC_CPOSTALA,'#39'99999999'#39', DC_CPOSTAL, NVL(DC_CPOST' +
        'ALA, DC_CPOSTAL)) as DC_CPOSTAL_LINDO,'
      
        '       IIF_CHAR(AE_CPOSTALA,'#39'99999999'#39', AE_CPOSTAL, NVL(AE_CPOST' +
        'ALA, AE_CPOSTAL)) as AE_CPOSTAL_LINDO,'
      ''
      '       AC_EMP.AC_CODIGO as AC_CODIGO_EMP,'
      '       AC_EMP.AC_DESCRIPCION as AC_DESCRIPCION_EMP,'
      ''
      '       AC_PAE.AC_CODIGO as AC_CODIGO_PAE,'
      '       AC_PAE.AC_DESCRIPCION as AC_DESCRIPCION_PAE,'
      ''
      '       NA_DESCRIPCION,'
      ''
      '       CTJ_SEXO.TB_DESCRIPCION as SEXO_CTJ,'
      '       CTB_PROGRAMA.TB_DESCRIPCION as PROGRAMA_EMP,'
      
        '       CTB_PROGRAMA_EMPRESA.TB_DESCRIPCION as PROGRAMA_EMPRESA_E' +
        'MP,'
      '       CTB_ZONA.TB_DESCRIPCION as ZONA_CTB,'
      '       CTB_ZONA.TB_CODIGO as ZONA_COD_CTB,'
      '       CTB_NATURALEZA.TB_DESCRIPCION as NATURALEZA_CTB,'
      '       CTB_NATURALEZA.TB_CODIGO as NATURALEZA_COD_CTB,'
      '       CTB_FORMA.TB_DESCRIPCION as FORMA_CTB,'
      '       CTB_FORMA.TB_CODIGO as FORMA_COD_CTB,'
      '       CTB_AGENTE.TB_DESCRIPCION as AGENTE_CTB,'
      '       CTB_AGENTE.TB_CODIGO as AGENTE_COD_CTB,'
      '       CTB_TIPOMAT.TB_DESCRIPCION as TIPOMATRICULA_CTB,'
      '       CTB_PROGRAMASEG.TB_DESCRIPCION as PROGRAMASEGURIDAD_CTB,'
      '       CTB_LUGAR.TB_DESCRIPCION as LUGAROCURRENCIA_CTB,'
      '       CTB_TIPOOBRA.TB_DESCRIPCION as TIPOOBRA_CTB,'
      '       CTB_ETAPAOBRA.TB_DESCRIPCION as ETAPAOBRA_CTB,'
      '       CTB_PAEOBRA.TB_DESCRIPCION as AC_DESCRIPCION_PAEOBRA,'
      ''
      '       AR_CODIGOSRT,'
      '       AR_NOMBRE'
      ''
      
        'FROM AAR_ART, ART.CTB_TABLAS CTJ_SEXO, ART.CTB_TABLAS CTB_TIPOMA' +
        'T, ART.CTB_TABLAS CTB_PROGRAMASEG,'
      
        '     ART.CTB_TABLAS CTB_PROGRAMA, ART.CTB_TABLAS CTB_PROGRAMA_EM' +
        'PRESA,'
      
        '     ART.CTB_TABLAS CTB_AGENTE, ART.CTB_TABLAS CTB_FORMA, ART.CT' +
        'B_TABLAS CTB_LUGAR,'
      '     ART.CTB_TABLAS CTB_NATURALEZA, ART.CTB_TABLAS CTB_ZONA,'
      '     ART.CTB_TABLAS CTB_TIPOOBRA, ART.CTB_TABLAS CTB_ETAPAOBRA,'
      
        '     ART.CPV_PROVINCIAS CPV_EMP, ART.CPV_PROVINCIAS CPV_CTJ, ART' +
        '.CPV_PROVINCIAS CPV_PAE,'
      
        '     CNA_NACIONALIDAD, ART.CTB_TABLAS CTB_PAEOBRA, CAC_ACTIVIDAD' +
        ' AC_PAE,'
      '     CAC_ACTIVIDAD AC_EMP, ADC_DOMICILIOCONTRATO,'
      
        '     ACO_CONTRATO, AEM_EMPRESA, CTJ_TRABAJADOR, ART.SEX_EXPEDIEN' +
        'TES,'
      '     ART.SDG_DENUNCIASGRAVES, PAE_ACCIDENTEESTABLECIMIENTO'
      ''
      'WHERE AE_ID = :ID'
      'AND   AE_NRODENUNCIASRT = DG_NRODENUNCIASRT'
      ''
      'AND DG_SINIESTRO = EX_SINIESTRO'
      'AND DG_ORDEN     = EX_ORDEN'
      'AND DG_RECAIDA   = EX_RECAIDA'
      ''
      'AND EX_CUIL = TJ_CUIL'
      'AND EX_CUIT = EM_CUIT'
      ''
      'AND EM_ID = CO_IDEMPRESA'
      
        'AND CO_CONTRATO = ART.AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX' +
        '_FECHAACCIDENTE)'
      'AND CO_CONTRATO = DC_CONTRATO'
      'AND DC_PROVINCIA = CPV_EMP.PV_CODIGO'
      'AND DC_TIPO = '#39'L'#39
      ''
      'AND CO_IDACTIVIDAD = AC_EMP.AC_ID'
      'AND AE_IDACTIVIDAD = AC_PAE.AC_ID'
      ''
      'AND TJ_PROVINCIA      = CPV_CTJ.PV_CODIGO (+)'
      'AND TJ_IDNACIONALIDAD = NA_ID'
      ''
      'AND '#39'SEXOS'#39' = CTJ_SEXO.TB_CLAVE'
      'AND TJ_SEXO = CTJ_SEXO.TB_CODIGO'
      ''
      'AND '#39'PRSEG'#39'     = CTB_PROGRAMA.TB_CLAVE (+)'
      'AND AE_PROGRAMA = CTB_PROGRAMA.TB_CODIGO (+)'
      ''
      'AND '#39'PRSEG'#39'            = CTB_PROGRAMA_EMPRESA.TB_CLAVE (+)'
      'AND AE_PROGRAMAEMPRESA = CTB_PROGRAMA_EMPRESA.TB_CODIGO (+)'
      ''
      'AND '#39'ZONA'#39'  = CTB_ZONA.TB_CLAVE'
      'AND AE_ZONA = CTB_ZONA.TB_CODIGO'
      ''
      'AND '#39'NATUR'#39'       = CTB_NATURALEZA.TB_CLAVE'
      'AND AE_NATURALEZA = CTB_NATURALEZA.TB_CODIGO'
      ''
      'AND '#39'FORMA'#39'  = CTB_FORMA.TB_CLAVE'
      'AND AE_FORMA = CTB_FORMA.TB_CODIGO'
      ''
      'AND '#39'AGENT'#39'   = CTB_AGENTE.TB_CLAVE'
      'AND AE_AGENTE = CTB_AGENTE.TB_CODIGO'
      'AND UTILES.ISNUMBER(CTB_AGENTE.TB_CODIGO) = 0'
      ''
      'AND '#39'TMATR'#39'          = CTB_TIPOMAT.TB_CLAVE (+)'
      'AND AE_TIPOMATRICULA = CTB_TIPOMAT.TB_CODIGO (+)'
      ''
      'AND '#39'PSEGU'#39'              = CTB_PROGRAMASEG.TB_CLAVE (+)'
      'AND AE_PROGRAMASEGURIDAD = CTB_PROGRAMASEG.TB_CODIGO (+)'
      ''
      'AND '#39'LUOCU'#39'              = CTB_LUGAR.TB_CLAVE'
      'AND AE_LUGARDEOCURRENCIA = CTB_LUGAR.TB_CODIGO'
      ''
      'AND '#39'TOBRA'#39'     = CTB_TIPOOBRA.TB_CLAVE (+)'
      'AND AE_TIPOOBRA = CTB_TIPOOBRA.TB_CODIGO (+)'
      ''
      'AND '#39'EOBRA'#39'      = CTB_ETAPAOBRA.TB_CLAVE (+)'
      'AND AE_ETAPAOBRA = CTB_ETAPAOBRA.TB_CODIGO (+)'
      ''
      'AND '#39'AOBRA'#39'          = CTB_PAEOBRA.TB_CLAVE (+)'
      'AND AE_ACTIVIDADOBRA = CTB_PAEOBRA.TB_CODIGO (+)'
      ''
      'AND AE_IDART     = AR_ID'
      'AND AE_PROVINCIA = CPV_PAE.PV_CODIGO'
      ' '
      ' '
      ' ')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqTestigos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT NVL(PE_CUIL, PE_DOCUMENTO) as PE_DOCUMENTO_CUIL, PPE_PERS' +
        'ONAENTREVISTADA.*'
      '  FROM PPE_PERSONAENTREVISTADA'
      ' WHERE PE_IDACCIDENTEESTABLECIMIENTO = :ID'
      '   AND PE_FECHABAJA IS NULL'
      '   AND PE_TIPO_ENTREVISTA = :TIPO  '
      ' '
      ' '
      ' '
      ' ')
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptInput
      end>
  end
  object CompositeReport: TQRCompositeReport
    OnAddReports = CompositeReportAddReports
    Options = [Compression]
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
    PrinterSettings.PaperSize = Letter
    ReportTitle = 'Informe de Investigaci'#243'n de Enfermedad Profesional'
    Left = 28
  end
  object sdqCausas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT *'
      '    FROM PDC_DIAGNOSTICOCAUSA'
      '   WHERE DC_IDACCIDENTEESTABLECIMIENTO = :ID'
      '     AND DC_FECHABAJA IS NULL'
      'ORDER BY DC_NUMERO')
    Top = 84
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqMedidas: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT PMC_MEDIDACORRECTIVA.*, DC_NUMERO'
      
        '    FROM PMC_MEDIDACORRECTIVA, PCM_CAUSAYMEDIDA, PDC_DIAGNOSTICO' +
        'CAUSA'
      '   WHERE MC_ID = CM_IDMEDIDACORRECTIVA'
      '     AND DC_ID = CM_IDDIAGNOSTICOCAUSA'
      '     AND MC_IDACCIDENTEESTABLECIMIENTO = :ID'
      '     AND MC_FECHABAJA IS NULL'
      'ORDER BY MC_MEDIDA'
      ''
      ''
      ''
      ' '
      ' ')
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqImplementacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        '  SELECT DECODE(SV_TIPO, '#39'V'#39', TO_CHAR(SV_FECHA, '#39'DD/MM/YYYY'#39'), '#39 +
        '--'#39') SV_FECHAVERIFICACION, '
      
        '         DECODE(SV_TIPO, '#39'V'#39', TO_CHAR(SV_FECHA, '#39'DD/MM/YYYY'#39'), '#39 +
        'C'#39', TO_CHAR(SV_FECHA, '#39'DD/MM/YYYY'#39'), '#39'--'#39') SV_FECHACUMPLIMIENTO,' +
        ' '
      
        '         DECODE(SV_TIPO, '#39'I'#39', TO_CHAR(SV_FECHA, '#39'DD/MM/YYYY'#39'), '#39 +
        '--'#39') SV_FECHAINCUMPLIMIENTO, '
      '         MC_DESCRIPCION'
      '    FROM PSV_SEGUIMIENTOVISITA, PMC_MEDIDACORRECTIVA'
      '   WHERE SV_IDMEDIDACORRECTIVA = MC_ID'
      '     AND MC_IDACCIDENTEESTABLECIMIENTO = :ID'
      '     AND SV_FECHABAJA IS NULL'
      'ORDER BY MC_MEDIDA')
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqMultiple: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT AM_ID,'
      '         AM_DETALLELESION,'
      '         EX_SINIESTRO,'
      '         EX_ORDEN,'
      '         TJ_CUIL,'
      '         TJ_NOMBRE,'
      '         DG_NRODENUNCIASRT'
      
        '    FROM SDG_DENUNCIASGRAVES, CTJ_TRABAJADOR, SEX_EXPEDIENTES, P' +
        'AM_ACCIDENTEMULTIPLE'
      '   WHERE AM_IDEXPEDIENTE = EX_ID'
      '     AND DG_SINIESTRO (+) = EX_SINIESTRO'
      '     AND DG_ORDEN     (+) = EX_ORDEN'
      '     AND DG_RECAIDA   (+) = EX_RECAIDA'
      '     AND EX_CUIL = TJ_CUIL'
      '     AND AM_IDACCIDENTEESTABLECIMIENTO = :ID'
      'ORDER BY EX_SINIESTRO, EX_ORDEN'
      ' '
      ' '
      ' '
      ' ')
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqDatosLaborales: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT EL_TAREA as TAREA,'
      '       EL_CIUO as CIUO,'
      '       MC_DESCRIPCION,'
      
        '       SUBSTR(HYS.GET_ANTIGUEDAD(:FechaAccidente, :AntiguedadPue' +
        'sto, EL_FECHAINGRESO),2) ||'
      
        '              DECODE(SUBSTR(HYS.GET_ANTIGUEDAD(:FechaAccidente, ' +
        ':AntiguedadPuesto, EL_FECHAINGRESO),1,1), '#39'M'#39', '#39' (Meses)'#39', '#39' (D'#237 +
        'as)'#39') as ANTIGUEDAD'
      ''
      '  FROM CMC_MODALIDADCONTRATACION, V_CEL_ESTADOLABORAL'
      ''
      ' WHERE EL_IDTRABAJADOR = :Id_Trabajador'
      '   AND EL_CONTRATO = :Contrato'
      '   AND EL_IDMODALIDADCONTRATACION = MC_ID'
      ' ')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FechaAccidente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'AntiguedadPuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FechaAccidente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'AntiguedadPuesto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Id_Trabajador'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end>
  end
  object sdqArticulo11: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT (cb_ibasediaria * 30.4) ibm,'
      
        '       NVL(de_fecharecepcion, de_fechaalta) fecha_recepcion_denu' +
        'ncia, tj_fnacimiento,'
      '       cb_frecepmort'
      
        '  FROM art.secb_cbaseexpsin, SIN.sde_denuncia, comunes.ctj_traba' +
        'jador, art.sex_expedientes,'
      '       comunes.cvr_ventanilla_reclamos'
      ' WHERE cb_siniestro = ex_siniestro'
      '   AND cb_orden = ex_orden'
      '   AND ex_id = vr_idexpediente'
      '   AND ex_id = de_idexpediente(+)'
      '   AND ex_cuil = tj_cuil'
      '   AND vr_id = :idreclamo')
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idreclamo'
        ParamType = ptInput
      end>
    object sdqArticulo11IBM: TFloatField
      FieldName = 'IBM'
      currency = True
    end
    object sdqArticulo11FECHA_RECEPCION_DENUNCIA: TDateTimeField
      FieldName = 'FECHA_RECEPCION_DENUNCIA'
    end
    object sdqArticulo11TJ_FNACIMIENTO: TDateTimeField
      FieldName = 'TJ_FNACIMIENTO'
    end
    object sdqArticulo11CB_FRECEPMORT: TDateTimeField
      FieldName = 'CB_FRECEPMORT'
    end
  end
  object sdqDetalleRemuneraciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   rs_persala periodo,'
      '         LEAST(NVL(rs_impomes, 0),'
      '               DECODE(SUBSTR(rs_persala, 1, 3),'
      '                      '#39'SAC'#39', liq.get_topeampo(rs_persala) / 2,'
      '                      liq.get_topeampo(rs_persala))) importeampo'
      
        '    FROM art.sers_recisalasin, art.sex_expedientes, comunes.cvr_' +
        'ventanilla_reclamos'
      '   WHERE rs_siniestro = ex_siniestro'
      '     AND rs_orden = ex_orden'
      '     AND ex_id = vr_idexpediente'
      '     AND vr_id = :idreclamo'
      
        'ORDER BY DECODE(rs_persala, '#39'SAC 01'#39', '#39'999998'#39', '#39'SAC 02'#39', '#39'99999' +
        '9'#39', rs_persala)')
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idreclamo'
        ParamType = ptInput
      end>
    object sdqDetalleRemuneracionesPERIODO: TStringField
      FieldName = 'PERIODO'
      Required = True
      Size = 6
    end
    object sdqDetalleRemuneracionesIMPORTEAMPO: TFloatField
      FieldName = 'IMPORTEAMPO'
      currency = True
    end
  end
  object sdqReclamo: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT vr_id, vr_idexpediente, vr_nroreclamo_srt, vr_idsubtema, ' +
        'vr_idestado, vr_fechareclamo,'
      
        '       vr_fechavencimiento, vr_contrato, vr_cuil_cuit_denunciant' +
        'e, vr_nombre_denunciante,'
      
        '       ve_descripcion, vs_descripcion, vt_descripcion, ex_id, vs' +
        '_id, vt_id,'
      
        '       ex_siniestro, ex_orden, ex_recaida, vr_tipodocumento_denu' +
        'nciante,'
      
        '       art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) AS siniestro, em_nombre,'
      
        '       vr_usualta, vr_fechaalta, vr_usumodif, vr_fechamodif, vr_' +
        'usubaja, vr_fechabaja'
      
        '  FROM aem_empresa, aco_contrato, art.sex_expedientes, comunes.c' +
        'vr_ventanilla_reclamos,'
      
        '       comunes.cve_ventanilla_estados, comunes.cvs_ventanilla_su' +
        'btemas,'
      '       comunes.cvt_ventanilla_temas'
      ' WHERE vr_idestado = ve_id'
      '   AND vr_idsubtema = vs_id'
      '   AND vs_idtema = vt_id'
      '   AND vr_idexpediente = ex_id(+)'
      '   AND vr_contrato = co_contrato(+)'
      '   AND co_idempresa = em_id(+)'
      '   AND vr_id = :idreclamo')
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idreclamo'
        ParamType = ptInput
      end>
  end
  object sdqDetalleDerechohabientes: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      '  SELECT eb_nombre, eb_porcentaje'
      
        '    FROM art.seb_beneficiarios, art.sex_expedientes, comunes.cvr' +
        '_ventanilla_reclamos'
      '   WHERE eb_siniestro = ex_siniestro'
      '     AND eb_orden = ex_orden'
      '     AND eb_recaida = ex_recaida'
      '     AND eb_porcentaje > 0'
      '     AND eb_fechabaja IS NULL'
      '     AND ex_id = vr_idexpediente'
      '     AND vr_id = :idreclamo'
      'ORDER BY 1')
    Top = 372
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idreclamo'
        ParamType = ptInput
      end>
  end
end
