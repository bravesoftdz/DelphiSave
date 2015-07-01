object rptNotaReqCarDef: TrptNotaReqCarDef
  Left = 526
  Top = 158
  Caption = 'rptNotaReqCarDef'
  ClientHeight = 694
  ClientWidth = 869
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
  object qrNotaReqCarDef: TQuickRep
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    IDReport = 0
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
    ReportTitle = 'RequerimCarDef'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 943
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2495.020833333333000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qriLogoART: TQRImage
        Left = 456
        Top = 10
        Width = 256
        Height = 51
        Size.Values = (
          134.937500000000000000
          1206.500000000000000000
          26.458333333333330000
          677.333333333333400000)
        XLColumn = 0
        Center = True
      end
      object qrlFecha: TQRLabel
        Left = 232
        Top = 131
        Width = 475
        Height = 20
        Size.Values = (
          52.916666666666660000
          613.833333333333400000
          346.604166666666700000
          1256.770833333333000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 24
        Top = 202
        Width = 125
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          534.458333333333300000
          330.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Expediente SRT N'#176
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 24
        Top = 225
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          595.312500000000000000
          182.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nro. CUIL:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 24
        Top = 248
        Width = 124
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          656.166666666666700000
          328.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Apellido y Nombre:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlExpedienteSRT: TQRLabel
        Left = 168
        Top = 202
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          534.458333333333300000
          304.270833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlExpedienteSRT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlCuil: TQRLabel
        Left = 168
        Top = 225
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          595.312500000000000000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlCuil'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object qrlTrabajador: TQRLabel
        Left = 168
        Top = 248
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          656.166666666666700000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlTrabajador'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 24
        Top = 331
        Width = 432
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          875.770833333333300000
          1143.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'En relaci'#243'n al requerimiento enviado, les informamos lo siguient' +
          'e:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 24
        Top = 390
        Width = 479
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          1031.875000000000000000
          1267.354166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Se adjunta copia de los antecedentes laborales y m'#233'dicos actuali' +
          'zados.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 24
        Top = 699
        Width = 237
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          1849.437500000000000000
          627.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sin otro particular saludo muy atte.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 24
        Top = 799
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2114.020833333333000000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dr. Isaac Fixel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 24
        Top = 822
        Width = 215
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2174.875000000000000000
          568.854166666666800000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Departamento de Incapacidades'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 981
      Width = 718
      Height = 25
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 1006
      Width = 718
      Height = 24
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
    end
  end
  object fpNroExpedienteSRT: TFormPanel
    Left = 630
    Top = 507
    Width = 217
    Height = 70
    Hint = 'Ingrese el Nro. de Expediente de SRT'
    Caption = 'Nro. de Expediente de SRT'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpNroExpedienteSRTBeforeShow
    Constraints.MinHeight = 70
    Constraints.MinWidth = 200
    DesignSize = (
      217
      70)
    object Bevel8: TBevel
      Left = 7
      Top = 39
      Width = 203
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitWidth = 248
    end
    object btnAceptarExpedSRT: TBitBtn
      Left = 138
      Top = 42
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Kind = bkYes
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnAceptarExpedSRTClick
    end
    object edNroExpedienteSRT: TEdit
      Left = 12
      Top = 12
      Width = 197
      Height = 21
      Hint = 'Ingrese el Nro. de Expediente de SRT'
      MaxLength = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select 1 from dual')
    Left = 36
    Top = 4
  end
end
