object frmLiqListApro: TfrmLiqListApro
  Left = 128
  Top = 209
  Width = 724
  Height = 423
  Caption = 'Listado de Liquidaciones Aprobadas'
  Color = clBtnFace
  Constraints.MinHeight = 247
  Constraints.MinWidth = 695
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 59
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Bevel1: TBevel
      Left = 128
      Top = 6
      Width = 5
      Height = 21
      Shape = bsRightLine
    end
    object Label2: TLabel
      Left = 136
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Destino'
    end
    object Bevel2: TBevel
      Left = 460
      Top = 6
      Width = 5
      Height = 21
      Shape = bsRightLine
    end
    object Label3: TLabel
      Left = 468
      Top = 10
      Width = 71
      Height = 13
      Caption = 'Deleg.de Pago'
    end
    object tbHerramientas: TToolBar
      Left = 4
      Top = 32
      Width = 707
      Height = 24
      Align = alNone
      Anchors = [akLeft, akTop, akRight]
      Caption = 'tbHerramientas'
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        OnClick = tbRefrescarClick
      end
      object ToolButton3: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbOrden: TToolButton
        Left = 31
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'Orden'
        ImageIndex = 5
        OnClick = tbOrdenClick
      end
      object ToolButton2: TToolButton
        Left = 54
        Top = 0
        Width = 4
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 58
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        ImageIndex = 7
        OnClick = tbImprimirClick
      end
      object tbVistaPrevia: TToolButton
        Left = 81
        Top = 0
        Hint = 'Vista Previa (Ctrl+V)'
        Caption = 'tbVistaPrevia'
        ImageIndex = 14
        OnClick = tbVistaPreviaClick
      end
      object ToolButton6: TToolButton
        Left = 104
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbGuardar: TToolButton
        Left = 112
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'tbGuardar'
        ImageIndex = 1
        OnClick = tbGuardarClick
      end
      object ToolButton5: TToolButton
        Left = 135
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 143
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
    object edFecha: TDateComboBox
      Left = 38
      Top = 6
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object cmbDestino: TComboBox
      Left = 176
      Top = 6
      Width = 284
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'Mutual'
        'Provincia A.R.T. (Todos los Sectores)'
        'Provincia A.R.T. (Por Sector)')
    end
    object cmbDelegPago: TArtComboBox
      Left = 543
      Top = 6
      Width = 169
      Height = 21
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 3
      Columns = <
        item
          Expanded = False
          FieldName = 'LG_NOMBRE'
          Title.Caption = 'Nombre'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION'
          Title.Caption = 'Dirección'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LG_LOCALIDAD'
          Title.Caption = 'Localidad'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONO'
          Title.Caption = 'Teléfono'
          Width = 80
          Visible = True
        end>
      DataSource = dsDelegPago
      FieldList = 'LG_NOMBRE'
      FieldKey = 'LG_CODIGO'
    end
  end
  object dbgListado: TArtDBGrid
    Tag = 1
    Left = 0
    Top = 59
    Width = 716
    Height = 337
    Align = alClient
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    OnPaintFooter = dbgListadoPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'LA_DELEGACION'
        Title.Caption = 'Delegación de Pago'
        Width = 118
        Visible = True
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'LA_VOLANTE'
        Title.Caption = 'Volante'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LA_PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LA_TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LA_FACTURA'
        Title.Caption = 'Factura'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LA_FECHAFACTURA'
        Title.Caption = 'Fecha'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LA_NOTADEBITO'
        Title.Caption = 'Nota de Débito'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Caption = 'Importe'
        Visible = True
      end>
  end
  object ScrollBox: TScrollBox
    Left = 12
    Top = 112
    Width = 678
    Height = 247
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Visible = False
    object qrpReporte: TQuickRep
      Left = 8
      Top = 4
      Width = 816
      Height = 1056
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
      ReportTitle = 'Liquidaciones Aprobadas'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      object QRGroup1: TQRGroup
        Left = 38
        Top = 38
        Width = 740
        Height = 59
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = True
        Size.Values = (
          156.104166666667
          1957.91666666667)
        Expression = 'sdqDatos.LA_DELEGACION'
        FooterBand = qrbFooter
        Master = qrpReporte
        ReprintOnNewPage = False
        object QRLabel1: TQRLabel
          Left = 0
          Top = 42
          Width = 61
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            0
            111.125
            161.395833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Volante'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRLabel2: TQRLabel
          Left = 64
          Top = 42
          Width = 237
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            169.333333333333
            111.125
            627.0625)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Prestador'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRLabel3: TQRLabel
          Left = 0
          Top = 24
          Width = 117
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            0
            63.5
            309.5625)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Delegación de Pago'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel4: TQRLabel
          Left = 304
          Top = 42
          Width = 81
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            804.333333333333
            111.125
            214.3125)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Tipo'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRLabel5: TQRLabel
          Left = 388
          Top = 42
          Width = 97
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            1026.58333333333
            111.125
            256.645833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Factura'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRLabel6: TQRLabel
          Left = 488
          Top = 42
          Width = 53
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            1291.16666666667
            111.125
            140.229166666667)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'N.Débito'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object qrlTitulo: TQRLabel
          Left = 4
          Top = 0
          Width = 733
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.5
            10.5833333333333
            0
            1939.39583333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Liquidaciones Aprobadas'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 14
        end
        object QRDBText3: TQRDBText
          Left = 124
          Top = 24
          Width = 108
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            328.083333333333
            63.5
            285.75)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'LA_DELEGACION'
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel7: TQRLabel
          Left = 544
          Top = 42
          Width = 69
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            1439.33333333333
            111.125
            182.5625)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Fecha'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRLabel8: TQRLabel
          Left = 616
          Top = 42
          Width = 125
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            1629.83333333333
            111.125
            330.729166666667)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Monto'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 97
        Width = 740
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        LinkBand = QRGroup1
        Size.Values = (
          47.625
          1957.91666666667)
        BandType = rbDetail
        object QRDBText1: TQRDBText
          Left = 0
          Top = 2
          Width = 61
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            0
            5.29166666666667
            161.395833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'LA_VOLANTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText2: TQRDBText
          Left = 64
          Top = 2
          Width = 237
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            169.333333333333
            5.29166666666667
            627.0625)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'LA_PRESTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText4: TQRDBText
          Left = 304
          Top = 2
          Width = 81
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            804.333333333333
            5.29166666666667
            214.3125)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'LA_TIPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText5: TQRDBText
          Left = 388
          Top = 2
          Width = 97
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            1026.58333333333
            5.29166666666667
            256.645833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'LA_FACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText6: TQRDBText
          Left = 488
          Top = 2
          Width = 53
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            1291.16666666667
            5.29166666666667
            140.229166666667)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'LA_NOTADEBITO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText7: TQRDBText
          Left = 544
          Top = 2
          Width = 69
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            1439.33333333333
            5.29166666666667
            182.5625)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'LA_FECHAFACTURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRDBText8: TQRDBText
          Left = 616
          Top = 2
          Width = 125
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            1629.83333333333
            5.29166666666667
            330.729166666667)
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'MONTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          OnPrint = OnNumPrint
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object QRLabel9: TQRLabel
          Left = 616
          Top = 0
          Width = 8
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1629.83333333333
            0
            21.1666666666667)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = '$'
          Color = 14737632
          Transparent = True
          WordWrap = True
          FontSize = 10
        end
      end
      object qrbFooter: TQRBand
        Left = 38
        Top = 115
        Width = 740
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWindow
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          52.9166666666667
          1957.91666666667)
        BandType = rbGroupFooter
        object QRExpr2: TQRExpr
          Left = 624
          Top = 4
          Width = 116
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1651
            10.5833333333333
            306.916666666667)
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = OnNumPrint
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          WordWrap = True
          Expression = 'SUM(sdqDatos.MONTO)'
          FontSize = 8
        end
        object QRLabel10: TQRLabel
          Left = 568
          Top = 4
          Width = 43
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1502.83333333333
            10.5833333333333
            113.770833333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'SubTotal'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel12: TQRLabel
          Left = 616
          Top = 2
          Width = 8
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.2708333333333
            1629.83333333333
            5.29166666666667
            21.1666666666667)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = '$'
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
      object QRBand3: TQRBand
        Left = 38
        Top = 135
        Width = 740
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWindow
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          63.5
          1957.91666666667)
        BandType = rbSummary
        object QRExpr1: TQRExpr
          Left = 624
          Top = 4
          Width = 116
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1651
            10.5833333333333
            306.916666666667)
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = OnNumPrint
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          WordWrap = True
          Expression = 'SUM(sdqDatos.MONTO)'
          FontSize = 8
        end
        object QRLabel11: TQRLabel
          Left = 584
          Top = 4
          Width = 25
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1545.16666666667
            10.5833333333333
            66.1458333333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Total'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel13: TQRLabel
          Left = 616
          Top = 2
          Width = 8
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.2708333333333
            1629.83333333333
            5.29166666666667
            21.1666666666667)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = '$'
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
      object qrbPgFooter: TQRBand
        Left = 38
        Top = 159
        Width = 740
        Height = 20
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
          52.9166666666667
          1957.91666666667)
        BandType = rbPageFooter
        object QRLabel18: TQRLabel
          Left = 500
          Top = 6
          Width = 30
          Height = 11
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            29.1041666666667
            1322.91666666667
            15.875
            79.375)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Usuario:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 6
        end
        object QRShape13: TQRShape
          Left = 0
          Top = 0
          Width = 1270
          Height = 5
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            13.2291666666667
            0
            0
            3360.20833333333)
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object qrlUsuario: TQRLabel
          Left = 534
          Top = 6
          Width = 133
          Height = 11
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            29.1041666666667
            1412.875
            15.875
            351.895833333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nombre del Usuario'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 6
        end
        object QRSysData2: TQRSysData
          Left = 668
          Top = 6
          Width = 23
          Height = 11
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            29.1041666666667
            1767.41666666667
            15.875
            60.8541666666667)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsDate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          FontSize = 6
        end
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT LA_DELEGACION, LA_VOLANTE, LA_PRESTADOR, LA_DESTINO, LA_F' +
        'ACTURA, '
      '       LA_FECHAFACTURA, LA_MONTO MONTO, LA_FECHAPAGO, '
      '       LA_DESTINATARIO, LA_USUAPRO, LA_TIPO, LA_NOTADEBITO'
      'FROM MLA_LIQUIAPRO'
      'ORDER BY LA_DELEGACION')
    Left = 8
    Top = 84
  end
  object dsConsulta: TDataSource
    DataSet = sdqDatos
    Left = 36
    Top = 84
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 64
    Top = 84
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 92
    Top = 84
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Volante'
        DataField = 'LA_VOLANTE'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Prestador'
        DataField = 'LA_PRESTADOR'
        MaxLength = 35
      end
      item
        Title = 'Tipo'
        DataField = 'LA_TIPO'
        MaxLength = 15
      end
      item
        Title = 'Factura'
        DataField = 'LA_FACTURA'
        Alignment = taCenter
        MaxLength = 15
      end
      item
        Title = 'N.Débito'
        DataField = 'LA_NOTADEBITO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Fecha'
        DataField = 'LA_FECHAFACTURA'
        Alignment = taCenter
        TotalType = ttCustom
        MaxLength = 9
      end
      item
        Title = 'Monto'
        DataField = 'MONTO'
        Alignment = taRightJustify
        TotalType = ttAutoSum
        FormatFloat = '#,##.00'
        MaxLength = 6
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'MS Sans Serif'
    Title.Font.Style = [fsBold]
    Title.Text = 'Listado de Liquidaciones Aprobadas'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -11
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14211288
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -11
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = [fsBold]
    Totals.TotalsStyle = tsFillOnlyData
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -11
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    OnGetTotals = QueryPrintGetTotals
    Left = 184
    Top = 84
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Delegación de Pago'
        DataField = 'LA_DELEGACION'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Volante'
        DataField = 'LA_VOLANTE'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'LA_PRESTADOR'
        FieldIndex = 0
      end
      item
        Title = 'Tipo'
        DataField = 'LA_TIPO'
        FieldIndex = 0
      end
      item
        Title = 'Factura'
        DataField = 'LA_FACTURA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'LA_FECHAFACTURA'
        FieldIndex = 0
      end
      item
        Title = 'Nota de Débito'
        DataField = 'LA_NOTADEBITO'
        FieldIndex = 0
      end
      item
        Title = 'Importe'
        DataField = 'MONTO'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 1
    Left = 212
    Top = 84
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenClick
        LinkControl = tbOrden
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16470
        OnShortCutPress = tbVistaPreviaClick
        LinkControl = tbVistaPrevia
      end
      item
        Key = 16453
        OnShortCutPress = tbGuardarClick
        LinkControl = tbGuardar
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 240
    Top = 84
  end
  object ExportDialog: TExportDialog
    DataSet = sdqDatos
    Separator = #9
    Quote = '"'
    Fields = <>
    Caption = 'Exportación de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      '´')
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 156
    Top = 84
  end
  object sdqDelegPago: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT LG_CODIGO, LG_NOMBRE, LG_LOCALIDAD, '
      
        '               UTILES.Armar_Domicilio(LG_CALLE, LG_NUMERO, LG_PI' +
        'SO, LG_DEPARTAMENTO) DIRECCION, '
      
        '               UTILES.Armar_Telefono(LG_CODAREATELEFONO,null, LG' +
        '_TELEFONO) TELEFONO '
      'FROM DLG_DELEGACIONES'
      'ORDER BY LG_NOMBRE')
    Left = 569
    Top = 1
  end
  object dsDelegPago: TDataSource
    DataSet = sdqDelegPago
    Left = 597
    Top = 1
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 128
    Top = 85
  end
end
