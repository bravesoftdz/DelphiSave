object frmPartesReceptadas: TfrmPartesReceptadas
  Left = 74
  Top = 118
  Width = 805
  Height = 573
  Caption = 'Recepción de Partes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 57
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 10
      Width = 37
      Height = 13
      Caption = ' Desde:'
    end
    object Bevel1: TBevel
      Left = 267
      Top = 6
      Width = 5
      Height = 21
      Shape = bsRightLine
    end
    object Label2: TLabel
      Left = 283
      Top = 9
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Bevel2: TBevel
      Left = 462
      Top = 6
      Width = 5
      Height = 21
      Shape = bsRightLine
    end
    object Label3: TLabel
      Left = 474
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Prestador:'
    end
    object Label4: TLabel
      Left = 139
      Top = 10
      Width = 31
      Height = 13
      Caption = 'Hasta:'
    end
    object tbHerramientas: TToolBar
      Left = 2
      Top = 31
      Width = 793
      Height = 24
      Align = alBottom
      ButtonWidth = 32
      Caption = 'tbHerramientas'
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsDivider
      end
      object tbRefrescar: TToolButton
        Left = 8
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        OnClick = tbRefrescarClick
      end
      object ToolButton3: TToolButton
        Left = 40
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbOrden: TToolButton
        Left = 48
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'Orden'
        ImageIndex = 5
        OnClick = tbOrdenClick
      end
      object ToolButton2: TToolButton
        Left = 80
        Top = 0
        Width = 4
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 84
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        ImageIndex = 7
        OnClick = tbImprimirClick
      end
      object tbVistaPrevia: TToolButton
        Left = 116
        Top = 0
        Hint = 'Vista Previa (Ctrl+V)'
        Caption = 'tbVistaPrevia'
        ImageIndex = 14
        OnClick = tbVistaPreviaClick
      end
      object tbCorregidoManualmente: TToolButton
        Left = 148
        Top = 0
        Caption = 'Marcar como '#39'Corregido Manualmente'#39
        ImageIndex = 13
        OnClick = tbCorregidoManualmenteClick
      end
      object ToolButton6: TToolButton
        Left = 180
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 188
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
    object edFechaDesde: TDateComboBox
      Left = 43
      Top = 6
      Width = 89
      Height = 21
      MinDate = 37987
      MaxDateCombo = edFechaHasta
      TabOrder = 1
    end
    object cmbEstados: TComboBox
      Left = 323
      Top = 6
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Correctos'
        'Con Error'
        'Corregidos'
        'Todos')
    end
    object edFechaHasta: TDateComboBox
      Left = 175
      Top = 6
      Width = 89
      Height = 21
      MinDateCombo = edFechaDesde
      TabOrder = 2
    end
    object cmbPrestadores: TComboBox
      Left = 526
      Top = 6
      Width = 229
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object dbgListado: TArtDBGrid
    Tag = 1
    Left = 0
    Top = 57
    Width = 797
    Height = 104
    Align = alTop
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'AR_DESCRIPCION'
        Title.Caption = 'Tipo Archivo'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_NOMBREARCHIVOFINAL'
        Title.Caption = 'Archivo Respaldo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_OBSERVACIONES'
        Title.Caption = 'Observaciones Archivo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_REGISTROPROCESADOS'
        Title.Caption = 'Reg.Proc.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_REGISTROSCORRECTO'
        Title.Caption = 'Reg.Correctos'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_FECHARECEPCION'
        Title.Caption = 'F.Recepción'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_EMAILEMISOR'
        Title.Caption = 'Remitente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_OBSERVACIONES'
        Title.Caption = 'Observaciones Mensaje'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MR_MOTIVOMENSAJE'
        Title.Caption = 'Motivo Mensaje'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CM_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CM_IDMENSAJERECIBIDO'
        Visible = False
      end>
  end
  object DbgDetalle: TArtDBGrid
    Tag = 1
    Left = 0
    Top = 171
    Width = 797
    Height = 375
    Align = alClient
    DataSource = dsDetalle
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DbgDetalleDblClick
    IniStorage = FormPlacement
    OnGetCellParams = DbgDetalleGetCellParams
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'IS_ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_NRODOCUMENTO'
        Title.Caption = 'Nro.Documento'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_CONTROLES'
        Title.Caption = 'Controles'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_HIVELISA'
        Title.Caption = 'HIV Elisa'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_HEP_C'
        Title.Caption = 'Hep. C'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_HBS_AG'
        Title.Caption = 'HBS Ag.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_ANTICORE'
        Title.Caption = 'Anticore'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_HEP_B_ACT'
        Title.Caption = 'Hep. B Act.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_CITOME_IGG'
        Title.Caption = 'Citome IGG'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_ORDEN'
        Title.Caption = 'Orden'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_NROSINIESTRO'
        Title.Caption = 'Nro Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_ORDENSINIESTRO'
        Title.Caption = 'Orden Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_NROPARTESINIESTRO'
        Title.Caption = 'Nro. Parte Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_REGISTROORIGINAL'
        Title.Caption = 'Registro Original'
        Visible = True
      end>
  end
  object ScrollBox: TScrollBox
    Left = 10
    Top = 224
    Width = 787
    Height = 228
    VertScrollBar.Position = 48
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Visible = False
    object qrpReporte: TQuickRep
      Left = 8
      Top = -44
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
        Height = 83
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
          219.604166666667
          1957.91666666667)
        Expression = 'CM_NOMBREARCHIVOFINAL'
        Master = qrpReporte
        ReprintOnNewPage = False
        object QRLabel2: TQRLabel
          Left = 96
          Top = 64
          Width = 156
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            254
            169.333333333333
            412.75)
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
        object QRLabel4: TQRLabel
          Left = 256
          Top = 64
          Width = 51
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            677.333333333333
            169.333333333333
            134.9375)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Estado'
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
          Left = 312
          Top = 64
          Width = 133
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            825.5
            169.333333333333
            351.895833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Arch.Resplando'
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
        object QRLabel8: TQRLabel
          Left = 448
          Top = 64
          Width = 293
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            1185.33333333333
            169.333333333333
            775.229166666667)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Observaciones'
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
        object QRLabel1: TQRLabel
          Left = 0
          Top = 64
          Width = 93
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            0
            169.333333333333
            246.0625)
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
        object qrlDesde: TQRLabel
          Left = 0
          Top = 24
          Width = 82
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
            216.958333333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Fecha Desde:'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlHasta: TQRLabel
          Left = 192
          Top = 24
          Width = 79
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            508
            63.5
            209.020833333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Fecha Hasta:'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlPrestador: TQRLabel
          Left = 376
          Top = 24
          Width = 61
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            994.833333333333
            63.5
            161.395833333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Prestador:'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object qrlEstado: TQRLabel
          Left = 552
          Top = 24
          Width = 46
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1460.5
            63.5
            121.708333333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Estado:'
          Color = clWhite
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 121
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
          Width = 93
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
            246.0625)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'AR_DESCRIPCION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = False
          FontSize = 8
        end
        object QRDBText2: TQRDBText
          Left = 96
          Top = 2
          Width = 155
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            254
            5.29166666666667
            410.104166666667)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'CA_DESCRIPCION'
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
          Left = 255
          Top = 2
          Width = 52
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            674.6875
            5.29166666666667
            137.583333333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'CM_ESTADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = False
          FontSize = 8
        end
        object QRDBText8: TQRDBText
          Left = 448
          Top = 2
          Width = 291
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            1185.33333333333
            5.29166666666667
            769.9375)
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'CM_OBSERVACIONES'
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
          Left = 310
          Top = 2
          Width = 135
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            820.208333333334
            5.29166666666667
            357.1875)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = 14737632
          DataSet = sdqDatos
          DataField = 'CM_NOMBREARCHIVOFINAL'
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
      end
      object qrbPgFooter: TQRBand
        Left = 38
        Top = 219
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
      object QRSubDetail1: TQRSubDetail
        Left = 38
        Top = 184
        Width = 740
        Height = 35
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
          92.6041666666667
          1957.91666666667)
        Master = qrpReporte
        DataSet = sdqDetalles
        PrintBefore = False
        PrintIfEmpty = True
        object QRDBText6: TQRDBText
          Left = 0
          Top = 2
          Width = 93
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
            246.0625)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalles
          DataField = 'IS_NRODOCUMENTO'
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
          Left = 96
          Top = 2
          Width = 93
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            254
            5.29166666666667
            246.0625)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalles
          DataField = 'IS_CONTROLES'
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
        object QRDBText9: TQRDBText
          Left = 192
          Top = 2
          Width = 93
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            508
            5.29166666666667
            246.0625)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalles
          DataField = 'IS_FECHAALTA'
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
        object QRDBText10: TQRDBText
          Left = 392
          Top = 2
          Width = 349
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            1037.16666666667
            5.29166666666667
            923.395833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalles
          DataField = 'IS_CONTROLES'
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
        object QRDBText11: TQRDBText
          Left = 304
          Top = 2
          Width = 83
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
            219.604166666667)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDetalles
          DataField = 'IS_ESTADO'
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
        object QRDBText12: TQRDBText
          Left = 0
          Top = 18
          Width = 742
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.0416666666667
            0
            47.625
            1963.20833333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDetalles
          DataField = 'IS_OBSERVACIONES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
      end
      object QRGroup2: TQRGroup
        Left = 38
        Top = 139
        Width = 740
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
          119.0625
          1957.91666666667)
        Master = QRSubDetail1
        ReprintOnNewPage = False
        object QRLabel12: TQRLabel
          Left = 0
          Top = 8
          Width = 95
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            0
            21.1666666666667
            251.354166666667)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nro.Documento'
          Color = clSilver
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
        object QRLabel13: TQRLabel
          Left = 99
          Top = 8
          Width = 90
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            261.9375
            21.1666666666667
            238.125)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Control'
          Color = clSilver
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
        object QRLabel14: TQRLabel
          Left = 193
          Top = 8
          Width = 91
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            510.645833333333
            21.1666666666667
            240.770833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Fecha Alta'
          Color = clSilver
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
        object QRLabel15: TQRLabel
          Left = 289
          Top = 8
          Width = 97
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            764.645833333333
            21.1666666666667
            256.645833333333)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Estado'
          Color = clSilver
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
        object QRLabel16: TQRLabel
          Left = 392
          Top = 8
          Width = 348
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            1037.16666666667
            21.1666666666667
            920.75)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Resultado Controles'
          Color = clSilver
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
          Left = 1
          Top = 25
          Width = 739
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.6875
            2.64583333333333
            66.1458333333333
            1955.27083333333)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Observaciones'
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
      end
    end
  end
  object splitter: TRxSplitter
    Left = 0
    Top = 161
    Width = 797
    Height = 10
    ControlFirst = dbgListado
    ControlSecond = DbgDetalle
    Align = alTop
    BevelOuter = bvNone
    object ToolBar1: TToolBar
      Left = 0
      Top = 2
      Width = 797
      Height = 8
      Align = alBottom
      ButtonWidth = 32
      Caption = 'Correccion de '
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT iar_archivo.ar_descripcion, cpr_prestador.ca_descripcion,'
      
        'decode(ccm_contenidomensajerecibido.cm_estado,'#39'C'#39', '#39'Corregido'#39', ' +
        #39'E'#39', '#39'Error'#39
      
        '                                             , '#39'O'#39', '#39'Sin Error'#39',' +
        ' '#39'N/A'#39') as cm_estado,'
      'ccm_contenidomensajerecibido.cm_nombrearchivofinal,'
      'ccm_contenidomensajerecibido.cm_observaciones,'
      'ccm_contenidomensajerecibido.cm_registroprocesados,'
      'ccm_contenidomensajerecibido.cm_registroscorrecto, '
      'cmr_mensajerecibido.mr_fecharecepcion,'
      'cmr_mensajerecibido.mr_emailemisor, '
      'cmr_mensajerecibido.mr_observaciones, '
      'cmr_mensajerecibido.mr_motivomensaje,'
      'cm_id, cm_idmensajerecibido'
      
        'FROM comunes.ccm_contenidomensajerecibido, comunes.cam_tipoarchi' +
        'vomensaje, '
      'comunes.cmr_mensajerecibido, impoexpo.iar_archivo, cpr_prestador'
      'WHERE ('
      
        '(ccm_contenidomensajerecibido.cm_idmensajerecibido = cmr_mensaje' +
        'recibido.mr_id)'
      
        'AND (ccm_contenidomensajerecibido.cm_idarchivo = cam_tipoarchivo' +
        'mensaje.am_id )'
      
        'AND (cam_tipoarchivomensaje.am_idarchivo = iar_archivo.ar_id) AN' +
        'D'
      
        '(cmr_mensajerecibido.mr_idprestador = cpr_prestador.ca_identific' +
        'ador(+)))'
      'AND AM_IDTIPOARCHIVO IS NULL'
      ' ')
    Left = 64
    Top = 76
  end
  object dsConsulta: TDataSource
    DataSet = sdqDatos
    Left = 60
    Top = 116
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 16
    Top = 196
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 36
    Top = 404
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
    Left = 120
    Top = 404
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Tipo Archivo'
        DataField = 'AR_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 1
      end
      item
        Title = 'Estado'
        DataField = 'CM_ESTADO'
        FieldIndex = 2
      end
      item
        Title = 'Archivo Respaldo'
        DataField = 'CM_NOMBREARCHIVOFINAL'
        FieldIndex = 3
      end
      item
        Title = 'Observaciones Archivo'
        DataField = 'CM_OBSERVACIONES'
        FieldIndex = 4
      end
      item
        Title = 'Reg.Proc.'
        DataField = 'CM_REGISTROPROCESADOS'
        FieldIndex = 5
      end
      item
        Title = 'Reg.Correctos'
        DataField = 'CM_REGISTROSCORRECTO'
        FieldIndex = 6
      end
      item
        Title = 'F.Recepción'
        DataField = 'MR_FECHARECEPCION'
        FieldIndex = 7
      end
      item
        Title = 'Remitente'
        DataField = 'MR_EMAILEMISOR'
        FieldIndex = 8
      end
      item
        Title = 'Observaciones Mensaje'
        DataField = 'MR_OBSERVACIONES'
        FieldIndex = 9
      end
      item
        Title = 'Motivo Mensaje'
        DataField = 'MR_MOTIVOMENSAJE'
        FieldIndex = 10
      end>
    IniStorage = FormPlacement
    FixedRows = 1
    Left = 92
    Top = 404
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        LinkControl = tbOrden
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16470
        LinkControl = tbVistaPrevia
      end
      item
        Key = 16453
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 148
    Top = 404
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
    Left = 64
    Top = 404
  end
  object sdqDetalles: TSDQuery
    DatabaseName = 'dbprincipal'
    DataSource = dsConsulta
    SQL.Strings = (
      'SELECT'
      '       tis_informeserologia.is_idprestador,'
      '       tis_informeserologia.is_nrodocumento,'
      
        '       tis_informeserologia.is_controles, tis_informeserologia.i' +
        's_fechaalta,'
      
        '       tis_informeserologia.is_hivelisa, tis_informeserologia.is' +
        '_hep_c,'
      
        '       tis_informeserologia.is_hbs_ag, tis_informeserologia.is_a' +
        'nticore,'
      
        '       tis_informeserologia.is_hep_b_act, tis_informeserologia.i' +
        's_citome_igg,'
      
        '       tis_informeserologia.is_orden, tis_informeserologia.is_nr' +
        'osiniestro,'
      '       tis_informeserologia.is_ordensiniestro,'
      '       tis_informeserologia.is_nropartesiniestro,'
      
        '       decode(tis_informeserologia.is_estado,'#39'C'#39', '#39'Corregido'#39', '#39 +
        'E'#39', '#39'Error'#39', '#39'O'#39', '#39'Sin Error'#39', '#39'N/A'#39') as is_estado, '
      '       tis_informeserologia.is_observaciones,'
      '       tis_informeserologia.is_registrooriginal,'
      '       cpr_prestador.ca_clave,'
      '       ctj_trabajadores.tj_cuil,'
      '       tis_informeserologia.is_idarchivo,'
      '       tis_informeserologia.is_idmail,'
      '       tis_informeserologia.is_orden       '
      '  FROM tmp.tis_informeserologia, CTJ_TRABAJADORES, CPR_PRESTADOR'
      
        ' WHERE tmp.tis_informeserologia.is_idprestador = CPR_PRESTADOR.c' +
        'a_identificador(+) AND '
      
        '       tmp.tis_informeserologia.is_nrodocumento = CTJ_TRABAJADOR' +
        'ES.tj_documento(+) and '
      
        '       (    (tis_informeserologia.is_idmail = :cm_idmensajerecib' +
        'ido)        '
      '        AND (tis_informeserologia.is_idarchivo =  :cm_id))  '
      ' ')
    Left = 176
    Top = 404
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CM_IDMENSAJERECIBIDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CM_ID'
        ParamType = ptInput
      end>
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalles
    Left = 182
    Top = 450
  end
  object sdqPrestadores: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      '')
    Left = 562
    Top = 12
  end
  object FieldHiderDatos: TFieldHider
    DBGrid = DbgDetalle
    Left = 248
    Top = 408
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 204
    Top = 404
  end
end
