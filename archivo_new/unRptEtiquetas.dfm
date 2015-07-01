object rptEtiquetas: TrptEtiquetas
  Left = 0
  Top = 0
  Width = 794
  Height = 1123
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
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
  OnNeedData = QuickRepNeedData
  Options = []
  Page.Columns = 3
  Page.Orientation = poPortrait
  Page.PaperSize = A4
  Page.Values = (
    0.000000000000000000
    2970.000000000000000000
    10.000000000000000000
    2100.000000000000000000
    5.000000000000000000
    5.000000000000000000
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
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  object DetailBand1: TQRBand
    Left = 2
    Top = 4
    Width = 263
    Height = 117
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
      309.562500000000000000
      695.854166666666700000)
    BandType = rbDetail
    object qrlCodigoBarras: TQRLabel
      Left = -23
      Top = 24
      Width = 309
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        148.166666666666700000
        -60.854166666666670000
        63.500000000000000000
        817.562500000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = True
      Caption = '*2025863407*'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = 'Code-128'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 36
    end
    object qrlTextoInferior: TQRLabel
      Left = 92
      Top = 90
      Width = 79
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        243.416666666666700000
        238.125000000000000000
        209.020833333333300000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '20-2586340-7'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object qrlTextoSuperior: TQRLabel
      Left = 91
      Top = 11
      Width = 81
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        240.770833333333300000
        29.104166666666670000
        214.312500000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '--------------------'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object qrlNumero: TQRLabel
      Left = 97
      Top = 73
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        256.645833333333300000
        193.145833333333300000
        179.916666666666700000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = '0001 - RAD'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
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
