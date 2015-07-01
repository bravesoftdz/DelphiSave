object frmListSiniSinAltaMed: TfrmListSiniSinAltaMed
  Left = 338
  Top = 114
  Width = 1025
  Height = 665
  Caption = 'Listado de Siniestros sin Alta M'#233'dica'
  Color = clBtnFace
  Constraints.MinHeight = 364
  Constraints.MinWidth = 675
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDatos: TArtDBGrid
    Left = 0
    Top = 187
    Width = 1017
    Height = 451
    Align = alClient
    DataSource = dsDatos
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgDatosCellClick
    OnDrawColumnCell = dbgDatosDrawColumnCell
    OnKeyDown = dbgDatosKeyDown
    IniStorage = FormPlacement
    OnGetCellParams = dbgDatosGetCellParams
    OnContextPopup = dbgDatosContextPopup
    OnPaintFooter = dbgDatosPaintFooter
    TitleHeight = 17
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 22
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINORDREC'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. CUIT'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 177
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. CUIL'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 171
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        Title.Caption = 'CIE-10'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCCIE10'
        Title.Caption = 'Categor'#237'a S/CIE10'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_EVOLUTIVO'
        Title.Caption = 'Ult. Movi. F.de Carga'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Carga'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_PRESTADOR'
        Title.Alignment = taCenter
        Title.Caption = 'Identif. Prestador'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CA_CLAVE'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. CUIT Prestador '
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASCAIDOS'
        Title.Caption = 'D'#237'as Caidos'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHACONTROL'
        Title.Caption = 'Fecha Control'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOACCIDENTE'
        Title.Caption = 'Tipo de Accidente'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTRABAJO'
        Title.Caption = 'G.Trabajo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_ESTADO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DIASPORCIE10'
        Title.Caption = 'D'#237'as por CIE10'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROX_CONTROL'
        Title.Caption = 'Pr'#243'ximo Ctrl'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Title.Caption = 'Categoria'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECCONTINUA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Continua'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECMAXCONTROL'
        Title.Alignment = taCenter
        Title.Caption = 'F. M'#225'x. Control'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECESTI'
        Title.Alignment = taCenter
        Title.Caption = 'F.Estim.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUESTI'
        Title.Caption = 'Usuario Estim.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PORCESTI'
        Title.Alignment = taCenter
        Title.Caption = '% Estim.'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        Title.Caption = 'Gravedad'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTIMABLE'
        Title.Alignment = taCenter
        Title.Caption = 'Estimable'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_POSIBLEEEPP'
        Title.Alignment = taCenter
        Title.Caption = 'Posible enf. prof'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_USUPOSIBLEEEPP'
        Title.Caption = 'Usuario posible enf. prof.'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHAPOSIBLEEEPP'
        Title.Alignment = taCenter
        Title.Caption = 'F. posible enf. prof.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAGESTAUD'
        Title.Caption = 'Fecha Gest.Aud.'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRANSUELDO'
        Title.Alignment = taCenter
        Title.Caption = 'G. sueldo'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TURNODERIVACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. turno deriv.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOPEADO_CIE10'
        Title.Caption = 'Topeado (Cie10)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FTOPE1_CIE10'
        Title.Caption = 'F. Tope 1 (Cie10)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FTOPE2_CIE10'
        Title.Caption = 'F. Tope 2 (Cie10)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOPEADO_AUT'
        Title.Caption = 'Topeado (Aut)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FTOPE1_AUT'
        Title.Caption = 'F. Tope 1 (Aut)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FTOPE2_AUT'
        Title.Caption = 'F. Tope 2 (Aut)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGSANITPREST'
        Title.Caption = 'Reg. Sanit. Prestador'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXTENSIONILT'
        Title.Caption = 'Extensi'#243'n ILT'
        Width = 85
        Visible = True
      end>
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 159
    Width = 1017
    Height = 28
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 24
        Width = 1013
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 1000
      Height = 24
      Align = alNone
      Caption = 'ToolBar1'
      EdgeBorders = []
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
        ParentShowHint = False
        ShowHint = True
        OnClick = tbRefrescarClick
      end
      object ToolButton5: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbPedidoPE: TToolButton
        Left = 31
        Top = 0
        Hint = 'Pedido de Parte Egreso para siniestros vencidos'
        ImageIndex = 21
        OnClick = tbPedidoPEClick
      end
      object tbSolicitarAuditoria: TToolButton
        Left = 54
        Top = 0
        Hint = 'Solicitar Auditor'#237'a'
        Caption = 'tbSolicitarAuditoria'
        ImageIndex = 40
        OnClick = tbSolicitarAuditoriaClick
      end
      object ToolButton4: TToolButton
        Left = 77
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 85
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        Caption = 'tbLimpiar'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'tbOrdenar'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        OnClick = tbOrdenarClick
      end
      object ToolButton3: TToolButton
        Left = 131
        Top = 0
        Width = 7
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbVPrevia: TToolButton
        Left = 138
        Top = 0
        Hint = 'Vista Previa (Ctrl+V)'
        Caption = 'tbVPrevia'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = tbVPreviaClick
      end
      object tbImprimir: TToolButton
        Left = 161
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        ImageIndex = 7
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImprimirClick
      end
      object ToolButton1: TToolButton
        Left = 184
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 192
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Caption = 'tbExportar'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = tbExportarClick
      end
      object ToolButton6: TToolButton
        Left = 215
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbOcultarMostrar: TToolButton
        Left = 223
        Top = 0
        Hint = 'Ocultar Filtros'
        Caption = 'tbOcultarMostrar'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = tbOcultarMostrarClick
      end
      object ToolButton8: TToolButton
        Left = 246
        Top = 0
        Width = 9
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 255
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = tbSalirClick
      end
      object lblTotDCaidos: TLabel
        Left = 278
        Top = 0
        Width = 18
        Height = 22
        Caption = '      '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenu
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblTotSini: TLabel
        Left = 296
        Top = 0
        Width = 18
        Height = 22
        Caption = '      '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenu
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object ScrollBox: TScrollBox
    Left = 20
    Top = 236
    Width = 929
    Height = 317
    Constraints.MinHeight = 196
    TabOrder = 0
    Visible = False
    object qrpReporte: TQuickRep
      Left = 5
      Top = 6
      Width = 1344
      Height = 816
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      BeforePrint = qrpReporteBeforePrint
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
      PrintIfEmpty = False
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      object QRBand1: TQRBand
        Left = 38
        Top = 38
        Width = 1268
        Height = 82
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
          216.958333333333400000
          3354.916666666667000000)
        BandType = rbPageHeader
        object QRLabel14: TQRLabel
          Left = 824
          Top = 13
          Width = 135
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            2180.166666666667000000
            34.395833333333340000
            357.187500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Criterios Seleccionados:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object qrlTitulo: TQRLabel
          Left = 186
          Top = 15
          Width = 11
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            63.500000000000000000
            492.125000000000000000
            39.687500000000000000
            29.104166666666670000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = '  '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 12
        end
        object qrmCriterios: TQRMemo
          Left = 964
          Top = 12
          Width = 289
          Height = 64
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            169.333333333333000000
            2550.583333333330000000
            31.750000000000000000
            764.645833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 6
        end
        object qriLogo: TQRImage
          Left = 8
          Top = 3
          Width = 167
          Height = 64
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            169.333333333333300000
            21.166666666666670000
            7.937500000000000000
            441.854166666666700000)
          Stretch = True
        end
      end
      object QRGroup1: TQRGroup
        Left = 38
        Top = 120
        Width = 1268
        Height = 55
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AlignToBottom = False
        Color = clWhite
        ForceNewColumn = False
        ForceNewPage = False
        LinkBand = QRBand2
        Size.Values = (
          145.520833333333300000
          3354.916666666667000000)
        Expression = 'EX_PRESTADOR'
        Master = qrpReporte
        ReprintOnNewPage = False
        object QRLabel2: TQRLabel
          Left = 2
          Top = 1
          Width = 1264
          Height = 36
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            95.250000000000000000
            5.291666666666670000
            2.645833333333330000
            3344.333333333330000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = '                                      '
          Color = 14737632
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
        object QRLabel1: TQRLabel
          Left = 7
          Top = 3
          Width = 60
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            18.520833333333330000
            7.937500000000000000
            158.750000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Prestador:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object qrdbIdentif: TQRDBText
          Left = 69
          Top = 3
          Width = 77
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            182.562500000000000000
            7.937500000000000000
            203.729166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_PRESTADOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 9
        end
        object QRLabel3: TQRLabel
          Left = 2
          Top = 38
          Width = 63
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            5.291666666666670000
            100.541666666667000000
            166.687500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Siniestro'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel5: TQRLabel
          Left = 67
          Top = 38
          Width = 54
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            177.270833333333000000
            100.541666666667000000
            142.875000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Fecha'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel6: TQRLabel
          Left = 123
          Top = 38
          Width = 65
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            325.437500000000000000
            100.541666666667000000
            171.979166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nro. CUIT'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel7: TQRLabel
          Left = 190
          Top = 38
          Width = 143
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            502.708333333333000000
            100.541666666667000000
            378.354166666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = ' Raz'#243'n Social'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel8: TQRLabel
          Left = 400
          Top = 38
          Width = 138
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            1058.333333333330000000
            100.541666666667000000
            365.125000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = ' Nombre'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel9: TQRLabel
          Left = 602
          Top = 39
          Width = 35
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            1592.791666666670000000
            103.187500000000000000
            92.604166666666700000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'CIE10'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel10: TQRLabel
          Left = 640
          Top = 39
          Width = 194
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            1693.333333333330000000
            103.187500000000000000
            513.291666666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = ' Diagn'#243'stico'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel11: TQRLabel
          Left = 835
          Top = 39
          Width = 90
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2209.270833333330000000
            103.187500000000000000
            238.125000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Ult.Mov.F.de Carg'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel16: TQRLabel
          Left = 334
          Top = 38
          Width = 64
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            883.708333333333000000
            100.541666666667000000
            169.333333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Nro. CUIL'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel17: TQRLabel
          Left = 541
          Top = 38
          Width = 58
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1431.395833333330000000
            100.541666666667000000
            153.458333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Fecha Baja'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel18: TQRLabel
          Left = 928
          Top = 39
          Width = 55
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2455.333333333330000000
            103.187500000000000000
            145.520833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.de Carga'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object qrdbCuit: TQRDBText
          Left = 731
          Top = 3
          Width = 168
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1934.104166666670000000
            7.937500000000000000
            444.500000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'CA_CLAVE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 9
        end
        object qrdbDescrip: TQRDBText
          Left = 165
          Top = 3
          Width = 450
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            436.562500000000000000
            7.937500000000000000
            1190.625000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'CA_DESCRIPCION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 9
        end
        object qrdbLocalidad: TQRDBText
          Left = 134
          Top = 20
          Width = 239
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            354.541666666667000000
            52.916666666666700000
            632.354166666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'CA_LOCALIDAD'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 9
        end
        object qrdbProvincia: TQRDBText
          Left = 415
          Top = 20
          Width = 195
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1098.020833333330000000
            52.916666666666700000
            515.937500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'PV_DESCRIPCION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 9
        end
        object qrdbTelefono: TQRDBText
          Left = 699
          Top = 20
          Width = 306
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1849.437500000000000000
            52.916666666666700000
            809.625000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'CA_TELEFONO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 9
        end
        object QRLabel19: TQRLabel
          Left = 668
          Top = 20
          Width = 24
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            1767.416666666667000000
            52.916666666666670000
            63.500000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Tel.:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel20: TQRLabel
          Left = 669
          Top = 3
          Width = 56
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            1770.062500000000000000
            7.937500000000000000
            148.166666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Nro. CUIT:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel21: TQRLabel
          Left = 148
          Top = 3
          Width = 13
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            391.583333333333400000
            7.937500000000000000
            34.395833333333340000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = ' - '
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
        object QRLabel22: TQRLabel
          Left = 69
          Top = 20
          Width = 57
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            182.562500000000000000
            52.916666666666670000
            150.812500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Localidad:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel23: TQRLabel
          Left = 382
          Top = 20
          Width = 27
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            1010.708333333333000000
            52.916666666666670000
            71.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Pcia:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel25: TQRLabel
          Left = 1009
          Top = 3
          Width = 92
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            2669.645833333333000000
            7.937500000000000000
            243.416666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Cant. Siniestros:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel26: TQRLabel
          Left = 1009
          Top = 21
          Width = 130
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            2669.645833333333000000
            55.562500000000000000
            343.958333333333400000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Sumatoria D'#237'as Ca'#237'dos:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel4: TQRLabel
          Left = 985
          Top = 39
          Width = 38
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2606.145833333330000000
            103.187500000000000000
            100.541666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'D.Ca'#237'd.'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object lbSumSini: TQRLabel
          Left = 1107
          Top = 3
          Width = 56
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            2928.937500000000000000
            7.937500000000000000
            148.166666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'lbSumSini'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          OnPrint = lbSumSiniPrint
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object lbSumDCaidos: TQRLabel
          Left = 1144
          Top = 21
          Width = 81
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            3026.833333333333000000
            55.562500000000000000
            214.312500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'lbSumDCaidos'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          OnPrint = lbSumDCaidosPrint
          ParentFont = False
          Transparent = True
          WordWrap = True
          FontSize = 8
        end
        object QRLabel28: TQRLabel
          Left = 1025
          Top = 39
          Width = 53
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2711.979166666670000000
            103.187500000000000000
            140.229166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'F.Control'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel15: TQRLabel
          Left = 1077
          Top = 39
          Width = 90
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            2849.562500000000000000
            103.187500000000000000
            238.125000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Estado'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel27: TQRLabel
          Left = 1218
          Top = 39
          Width = 50
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            3222.625000000000000000
            103.187500000000000000
            132.291666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'P.Ctrl.'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRLabel24: TQRLabel
          Left = 1166
          Top = 39
          Width = 54
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666700000
            3085.041666666670000000
            103.187500000000000000
            142.875000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Caption = 'Equipo'
          Color = 14737632
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 175
        Width = 1268
        Height = 19
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
          50.270833333333330000
          3354.916666666667000000)
        BandType = rbDetail
        object QRDBText1: TQRDBText
          Left = 2
          Top = 2
          Width = 63
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            5.291666666666670000
            5.291666666666670000
            166.687500000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'SINORDREC'
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
        object QRDBText4: TQRDBText
          Left = 66
          Top = 2
          Width = 55
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            174.625000000000000000
            5.291666666666670000
            145.520833333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'FECHA'
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
        object QRDBText5: TQRDBText
          Left = 123
          Top = 2
          Width = 66
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            325.437500000000000000
            5.291666666666670000
            174.625000000000000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_CUIT'
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
        object QRDBText6: TQRDBText
          Left = 191
          Top = 2
          Width = 141
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            505.354166666667000000
            5.291666666666670000
            373.062500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'MP_NOMBRE'
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
        object QRDBText7: TQRDBText
          Left = 333
          Top = 2
          Width = 65
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            881.062500000000000000
            5.291666666666670000
            171.979166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_CUIL'
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
        object QRDBText8: TQRDBText
          Left = 400
          Top = 2
          Width = 139
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1058.333333333330000000
            5.291666666666670000
            367.770833333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'TJ_NOMBRE'
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
        object QRDBText9: TQRDBText
          Left = 540
          Top = 2
          Width = 58
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1428.750000000000000000
            5.291666666666670000
            153.458333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_BAJAMEDICA'
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
        object QRDBText10: TQRDBText
          Left = 600
          Top = 2
          Width = 35
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1587.500000000000000000
            5.291666666666670000
            92.604166666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_DIAGNOSTICOOMS'
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
        object QRDBText11: TQRDBText
          Left = 637
          Top = 2
          Width = 196
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            1685.395833333330000000
            5.291666666666670000
            518.583333333333000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_DIAGNOSTICO'
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
        object QRDBText12: TQRDBText
          Left = 835
          Top = 2
          Width = 89
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            42.333333333333300000
            2209.270833333330000000
            5.291666666666670000
            235.479166666667000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'SA_EVOLUTIVO'
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
        object QRDBText13: TQRDBText
          Left = 926
          Top = 2
          Width = 56
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            2450.041666666670000000
            5.291666666666670000
            148.166666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_FECHAALTA'
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
        object QRDBText2: TQRDBText
          Left = 984
          Top = 2
          Width = 38
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            2603.500000000000000000
            5.291666666666670000
            100.541666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'DIASCAIDOS'
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
        object QRDBText3: TQRDBText
          Left = 1024
          Top = 2
          Width = 53
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            2709.333333333330000000
            5.291666666666670000
            140.229166666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'SA_FECHACONTROL'
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
        object QRDBText14: TQRDBText
          Left = 1079
          Top = 2
          Width = 90
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            2854.854166666670000000
            5.291666666666670000
            238.125000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'ESTADO'
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
        object QRDBText16: TQRDBText
          Left = 1219
          Top = 2
          Width = 50
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            3225.270833333330000000
            5.291666666666670000
            132.291666666667000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'PROX_CONTROL'
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
        object QRDBText15: TQRDBText
          Left = 1168
          Top = 2
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            3090.333333333330000000
            5.291666666666670000
            137.583333333333000000)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'GTRABAJO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = False
          FontSize = 7
        end
      end
      object QRBand3: TQRBand
        Left = 38
        Top = 239
        Width = 1268
        Height = 22
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
          58.208333333333340000
          3354.916666666667000000)
        BandType = rbPageFooter
        object QRShape1: TQRShape
          Left = 4
          Top = 4
          Width = 1258
          Height = 1
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            2.645833333333330000
            10.583333333333300000
            10.583333333333300000
            3328.458333333330000000)
          Shape = qrsRectangle
          VertAdjust = 0
        end
        object QRSysData1: TQRSysData
          Left = 1189
          Top = 7
          Width = 27
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            31.750000000000000000
            3145.895833333333000000
            18.520833333333340000
            71.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsDate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          FontSize = 7
        end
        object QRLabel12: TQRLabel
          Left = 1154
          Top = 7
          Width = 32
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            31.750000000000000000
            3053.291666666667000000
            18.520833333333340000
            84.666666666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Fecha: '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object QRSysData2: TQRSysData
          Left = 50
          Top = 7
          Width = 35
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            31.750000000000000000
            132.291666666666700000
            18.520833333333330000
            92.604166666666680000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          Color = clWhite
          Data = qrsPageNumber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          FontSize = 7
        end
        object QRLabel13: TQRLabel
          Left = 3
          Top = 7
          Width = 43
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            31.750000000000000000
            7.937500000000000000
            18.520833333333330000
            113.770833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'P'#225'gina N'#186
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
        object qrlUsuario: TQRLabel
          Left = 690
          Top = 7
          Width = 10
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            31.750000000000000000
            1825.625000000000000000
            18.520833333333330000
            26.458333333333330000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = '   '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 7
        end
      end
      object QRBand4: TQRBand
        Left = 38
        Top = 194
        Width = 1268
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
          119.062500000000000000
          3354.916666666667000000)
        BandType = rbSummary
        object qrlTotDCaidos: TQRLabel
          Left = 1057
          Top = 24
          Width = 80
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            2796.645833333333000000
            63.500000000000000000
            211.666666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlTotDCaidos'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
        object qrlTotSini: TQRLabel
          Left = 1057
          Top = 7
          Width = 55
          Height = 14
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            37.041666666666670000
            2796.645833333333000000
            18.520833333333340000
            145.520833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlTotSini'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 8
        end
      end
    end
  end
  object pcFiltros: TPageControl
    Left = 0
    Top = 0
    Width = 1017
    Height = 159
    ActivePage = tsFiltros0
    Align = alTop
    HotTrack = True
    TabOrder = 3
    TabPosition = tpBottom
    object tsFiltros0: TTabSheet
      Caption = '&0 - Filtros >>'
      DesignSize = (
        1009
        133)
      object GroupBox1: TGroupBox
        Left = 0
        Top = -2
        Width = 1008
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Prestador'
        TabOrder = 0
        DesignSize = (
          1008
          43)
        inline fraPrestador: TfraPrestador
          Left = 4
          Top = 13
          Width = 1000
          Height = 25
          VertScrollBar.Range = 49
          VertScrollBar.Visible = False
          Anchors = [akLeft, akTop, akRight]
          AutoScroll = False
          TabOrder = 0
          DesignSize = (
            1000
            25)
          inherited lbCUIT: TLabel
            Width = 24
          end
          inherited lbSec: TLabel
            Width = 21
          end
          inherited lbIdentif: TLabel
            Width = 40
          end
          inherited lbRSocial: TLabel
            Width = 38
          end
          inherited lbDomicilio: TLabel
            Width = 40
          end
          inherited lbLocalidad: TLabel
            Width = 44
          end
          inherited lbCPostal: TLabel
            Left = 928
            Width = 13
          end
          inherited lbTelefono: TLabel
            Left = 840
          end
          inherited cmbPrestFantasia: TArtComboBox
            Width = 545
            DataSource = nil
          end
          inherited cmbPrestador: TArtComboBox
            Width = 670
          end
          inherited edPresLocalidad: TEdit
            Width = 574
          end
          inherited edPresCPostal: TEdit
            Left = 945
          end
          inherited edPresTelefono: TEdit
            Left = 860
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 41
        Width = 825
        Height = 43
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Empresa'
        TabOrder = 1
        DesignSize = (
          825
          43)
        inline fraEmpresa: TfraEmpresa
          Left = 7
          Top = 16
          Width = 812
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          DesignSize = (
            812
            21)
          inherited lbContrato: TLabel
            Left = 708
          end
          inherited edContrato: TIntEdit
            Left = 755
          end
          inherited cmbRSocial: TArtComboBox
            Width = 573
          end
        end
      end
      object Panel2: TPanel
        Left = 828
        Top = 46
        Width = 181
        Height = 38
        Anchors = [akTop, akRight]
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object chkComMed: TCheckBox
          Left = 4
          Top = 2
          Width = 66
          Height = 17
          Hint = 'Citado a comisi'#243'n m'#233'dica'
          Caption = 'Com.m'#233'd.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object chkSRT: TCheckBox
          Left = 4
          Top = 17
          Width = 38
          Height = 17
          Hint = 'Denunciado a SRT'
          Caption = 'SRT'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object chkReqSRT: TCheckBox
          Left = 73
          Top = 2
          Width = 40
          Height = 17
          Hint = 'Requerimiento SRT'
          Caption = 'Req.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object chkEstimable: TCheckBox
          Left = 73
          Top = 17
          Width = 47
          Height = 17
          Hint = 'Estimable'
          Caption = 'Estim.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object chkGSueldos: TCheckBox
          Left = 123
          Top = 2
          Width = 54
          Height = 17
          Hint = 'Grandes sueldos'
          Caption = 'G. Suel.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
      end
      object gbCie10: TGroupBox
        Left = 0
        Top = 84
        Width = 1009
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Cie-10'
        TabOrder = 3
        DesignSize = (
          1009
          41)
        object Label7: TLabel
          Left = 758
          Top = 19
          Width = 61
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Vencimiento:'
        end
        inline fraCIE10: TfraCIE10
          Left = 9
          Top = 13
          Width = 741
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            741
            24)
          inherited lbCIE10: TLabel
            Width = 37
          end
          inherited cmbDescripcion: TArtComboBox
            Width = 650
          end
          inherited sdqCIE10: TSDQuery
            Top = 24
          end
          inherited dsCIE10: TDataSource
            Top = 24
          end
        end
        object cmbVencim: TComboBox
          Left = 821
          Top = 14
          Width = 182
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'por CIE10'
            'por Grupo de Trabajo')
        end
      end
    end
    object tsFiltros1: TTabSheet
      Caption = '&1 - Filtros <<'
      ImageIndex = 1
      DesignSize = (
        1009
        133)
      object GroupBox3: TGroupBox
        Left = 0
        Top = -1
        Width = 192
        Height = 42
        Caption = 'Fecha del siniestro'
        TabOrder = 0
        object Label1: TLabel
          Left = 90
          Top = 19
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object dcSinDesde: TDateComboBox
          Left = 5
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcSinHasta
          TabOrder = 0
        end
        object dcSinHasta: TDateComboBox
          Left = 104
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcSinDesde
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 194
        Top = -1
        Width = 193
        Height = 42
        Caption = 'Fecha de carga del siniestro'
        TabOrder = 1
        object Label2: TLabel
          Left = 90
          Top = 19
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object dcCargaDesde: TDateComboBox
          Left = 4
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcCargaHasta
          TabOrder = 0
        end
        object dcCargaHasta: TDateComboBox
          Left = 104
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcCargaDesde
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 390
        Top = -1
        Width = 193
        Height = 42
        Caption = 'Fecha de posible enf. profesional'
        TabOrder = 2
        object Label3: TLabel
          Left = 90
          Top = 19
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object dcEEPPHasta: TDateComboBox
          Left = 104
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcEEPPDesde
          TabOrder = 0
        end
        object dcEEPPDesde: TDateComboBox
          Left = 5
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcEEPPHasta
          TabOrder = 1
        end
      end
      object GroupBox7: TGroupBox
        Left = 585
        Top = -1
        Width = 193
        Height = 42
        Caption = 'Fecha de gestionado por Auditor'#237'a'
        TabOrder = 3
        object Label4: TLabel
          Left = 90
          Top = 19
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object dcGestAudHasta: TDateComboBox
          Left = 104
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcGestAudDesde
          TabOrder = 0
        end
        object dcGestAudDesde: TDateComboBox
          Left = 5
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcGestAudHasta
          TabOrder = 1
        end
      end
      object gbTipoAccidente: TGroupBox
        Left = 194
        Top = 41
        Width = 263
        Height = 41
        Caption = 'Tipo de accidente'
        TabOrder = 4
        DesignSize = (
          263
          41)
        inline fraTipoAccidente: TfraStaticCTB_TABLAS
          Left = 6
          Top = 14
          Width = 253
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            253
            23)
          inherited cmbDescripcion: TComboGrid
            Width = 189
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja'
              'TB_CLAVE'
              'TB_ESPECIAL1')
            ColWidths = (
              40
              300
              -1
              -1
              -1
              -1)
          end
        end
      end
      object gbDelegacion: TGroupBox
        Left = 460
        Top = 41
        Width = 548
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Delegaci'#243'n'
        TabOrder = 5
        DesignSize = (
          548
          41)
        inline fraDelegacion: TfraDelegacion
          Left = 5
          Top = 14
          Width = 540
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            540
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 475
          end
        end
      end
      object gbGrupoTrabajo: TGroupBox
        Left = 1
        Top = 82
        Width = 582
        Height = 41
        Caption = 'Grupo de trabajo'
        TabOrder = 6
        DesignSize = (
          582
          41)
        inline fraGrupoTrabajo: TfraGrupoTrabajo
          Left = 6
          Top = 14
          Width = 571
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            571
            23)
          inherited lblGestor: TLabel
            Left = 400
            Width = 32
          end
          inherited cmbGestor: TArtComboBox
            Left = 436
            Width = 135
          end
          inherited cmbDescripcion: TArtComboBox
            Width = 346
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 585
        Top = 82
        Width = 423
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Estado'
        TabOrder = 7
        DesignSize = (
          423
          41)
        object cmbEstado: TComboBox
          Left = 6
          Top = 15
          Width = 412
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Siniestros a vencer'
            'Siniestros en curso normal'
            'Siniestros vencidos'
            'Todos')
        end
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 41
        Width = 192
        Height = 41
        Caption = 'Fecha de turno de derivaci'#243'n'
        TabOrder = 8
        object Label5: TLabel
          Left = 90
          Top = 19
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Serif'
          Font.Style = []
          ParentFont = False
        end
        object dcTurnoDesde: TDateComboBox
          Left = 5
          Top = 15
          Width = 85
          Height = 21
          MaxDateCombo = dcTurnoHasta
          TabOrder = 0
        end
        object dcTurnoHasta: TDateComboBox
          Left = 104
          Top = 15
          Width = 85
          Height = 21
          MinDateCombo = dcTurnoDesde
          TabOrder = 1
        end
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, ex_siniestro||'#39'-'#39'||ex' +
        '_orden||'#39'-'#39'||ex_recaida SINORDREC,  nvl(ex_fecharecaida, ex_fech' +
        'aaccidente) fecha,  EX_CUIT,'
      
        '  MP_NOMBRE, EX_CUIL, TJ_NOMBRE,  EX_BAJAMEDICA, EX_DIAGNOSTICOO' +
        'MS,  EX_DIAGNOSTICO, sa_evolutivo,  EX_FECHAALTA,'
      
        '  EX_PRESTADOR,  CA_CLAVE, CA_DESCRIPCION, CA_LOCALIDAD, PV_DESC' +
        'RIPCION,'
      
        '  actualdate -(nvl(ex_fecharecaida,ex_fechaaccidente)) DIASCAIDO' +
        'S, CA_TELEFONO,'
      
        '  sa_fechacontrol, sa_estado,TIPOACC.tb_descripcion TipoAccident' +
        'e,  EST.tb_descripcion Estado, ART.UTILES.IIF_CHAR(ex_Tipo,'#39' '#39','#39 +
        '1'#39', ex_tipo) tipo, ex_tipo,'
      ''
      
        '  art.AMEBPBA.Get_NombreDelegacion(ex_siniestro,ex_orden,ex_reca' +
        'ida) DELEGACION,'
      
        '  art.AMEBPBA.get_nombregtrabajo(ex_gtrabajo) GTRABAJO,ex_gtraba' +
        'jo,'
      
        '  ART.AMEBPBA.Get_Delegacion(ex_siniestro,ex_orden,ex_recaida) C' +
        'OD_DELEGACION,'
      '  nvl(cc_diascaidos/cc_casosalta,0) DiasPorCie10,'
      '  sa_proximocontrol PROX_CONTROL, DL_CATEGORIA Categoria,'
      
        '  art.AMEBPBA.Get_Dictamen_Continua(ex_siniestro, ex_orden, 2) F' +
        'ecContinua,'
      
        '  art.AMEBPBA.Get_MaxControl(ex_siniestro, ex_orden, ex_recaida)' +
        ' FecMaxControl,'
      
        '  substr(art.amebpba.Get_IncaEstimada(sa_siniestro,sa_orden,sa_r' +
        'ecaida),1,10) FecEsti, '
      
        '  substr(art.amebpba.Get_IncaEstimada(sa_siniestro,sa_orden,sa_r' +
        'ecaida),11,20) UsuEsti, '
      
        '  to_number(substr(art.amebpba.Get_IncaEstimada(sa_siniestro,sa_' +
        'orden,sa_recaida),31,6)) PorcEsti, '
      
        '  decode(ex_gravedad,'#39'1'#39','#39'Leve'#39','#39'2'#39','#39'Moderado S/Inter'#39','#39'3'#39','#39'Mode' +
        'rado C/Inter'#39','#39'4'#39','#39'Grave'#39','#39'5'#39','#39'Mortal'#39',null) Gravedad,'
      
        '  inca.is_sini_estimable(ex_siniestro, ex_orden, ex_recaida) est' +
        'imable,'
      
        '  ex_posibleeepp, ex_usuposibleeepp, ex_fechaposibleeepp, art.si' +
        'niestro.get_descripcionCIE10(ex_id) descCIE10,'
      ''
      
        '  art.iif_null (ART.SINIESTRO.GET_SINIESTROTOPEADO(ex_id, null, ' +
        #39'C'#39'), '#39'N'#39', '#39'S'#39') topeado_CIE10, c.st_fechatope1 FTope1_CIE10, c.s' +
        't_fechatope2 FTope2_CIE10,'
      
        '  art.iif_null (ART.SINIESTRO.GET_SINIESTROTOPEADO(ex_id, null, ' +
        #39'A'#39'), '#39'N'#39', '#39'S'#39') topeado_Aut, a.st_fechatope1 FTope1_Aut, a.st_fe' +
        'chatope2 FTope2_Aut,'
      ''
      '  c.st_idexpediente, a.st_idexpediente,'
      ''
      '  region.tb_descripcion RegSanitPrest,'
      ''
      '  art.inca.is_extensionILT(ex_id) ExtensionILT'
      ''
      
        'FROM Ctb_tablas TIPOACC, Ctb_tablas EST, ccc_costoporcie10, Cpv_' +
        'provincias, Cpr_prestador, Cmp_empresas,'
      
        '     Ctj_trabajadores,  CDL_DATOSLABORALES,ssa_siniestrossinalta' +
        ', sex_expedientes,  sin.sst_siniestrostopeados C, sin.sst_sinies' +
        'trostopeados A,'
      '     art.ctb_tablas region, art.crp_regionesprestador'
      'WHERE sa_siniestro = ex_siniestro'
      '  and sa_orden = ex_orden'
      '  and sa_recaida = ex_recaida'
      '  and ex_cuil = tj_cuil'
      '  and ex_cuit = mp_cuit'
      '  and ex_prestador = ca_identificador'
      '  and ca_provincia = pv_codigo(+)'
      '  and TIPOACC.tb_clave = '#39'STIPO'#39
      '   and EST.TB_CLAVE = '#39'ESTSA'#39
      '  and EST.TB_CODIGO = SA_ESTADO'
      '  and ex_siniestro > 0'
      
        '  and TIPOACC.tb_codigo = ART.UTILES.IIF_CHAR(ex_Tipo,'#39' '#39','#39'1'#39', e' +
        'x_tipo)'
      
        '  and Ex_Fechaalta between TO_DATE('#39'03/10/2001'#39', '#39'DD/MM/YYYY'#39') a' +
        'nd TO_DATE('#39'03/10/2001'#39', '#39'DD/MM/YYYY'#39')'
      
        '  AND ART.AMEBPBA.Get_Delegacion(ex_siniestro,ex_orden,ex_recaid' +
        'a) = '#39'993'#39
      '  and ex_diagnosticooms = cc_cie10(+)'
      '  and cc_fecha(+) = '#39'01-11-2001'#39
      '  and ex_cuit=dl_cuit (+)'
      '  and ex_cuil=dl_cuil (+)'
      '  AND EX_SINIESTRO = 19'
      '  AND EX_ORDEN = 1'
      '  AND EX_RECAIDA = 0'
      ''
      '  AND RP_PRESTADOR(+) = ex_prestador'
      '  AND region.tb_clave(+) = '#39'REGSA'#39
      '  AND region.tb_codigo(+) = rp_region'
      ''
      '  AND c.st_idexpediente(+) = ex_id'
      '  AND c.st_fechabaja(+) IS NULL'
      '  AND c.st_tipotopeo(+) = '#39'C'#39
      ''
      '  AND a.st_idexpediente(+) = ex_id'
      '  AND a.st_fechabaja(+) IS NULL'
      '  AND a.st_tipotopeo(+) = '#39'A'#39
      ''
      'ORDER BY EX_PRESTADOR DESC'
      ' ')
    Left = 316
    Top = 143
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 345
    Top = 143
  end
  object sdOrden: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Identif.Prestador'
        DataField = 'EX_PRESTADOR'
        Order = otDescending
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'SINORDREC'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Nro. CUIT'
        DataField = 'EX_CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Nro. CUIL'
        DataField = 'EX_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Nombre'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Baja'
        DataField = 'EX_BAJAMEDICA'
        FieldIndex = 0
      end
      item
        Title = 'CIE-10'
        DataField = 'EX_DIAGNOSTICOOMS'
        FieldIndex = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'EX_DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = 'Ult. Movi.F.de Carga'
        DataField = 'SA_EVOLUTIVO'
        FieldIndex = 0
      end
      item
        Title = 'F. de Carga'
        DataField = 'EX_FECHAALTA'
        FieldIndex = 0
      end
      item
        Title = 'Nro. CUIT Prestador '
        DataField = 'CA_CLAVE'
        FieldIndex = 0
      end
      item
        Title = 'Localidad'
        DataField = 'CA_LOCALIDAD'
        FieldIndex = 0
      end
      item
        Title = 'Tel'#233'fono'
        DataField = 'CA_TELEFONO'
        FieldIndex = 0
      end
      item
        Title = 'D'#237'as Caidos'
        DataField = 'DIASCAIDOS'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Control'
        DataField = 'SA_FECHACONTROL'
        FieldIndex = 0
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        FieldIndex = 0
      end
      item
        Title = 'D'#237'as por CIE10'
        DataField = 'DIASPORCIE10'
        FieldIndex = 0
      end
      item
        Title = 'Categoria'
        DataField = 'CATEGORIA'
        FieldIndex = 0
      end
      item
        Title = 'F. Continua'
        DataField = 'FECCONTINUA'
        FieldIndex = 0
      end
      item
        Title = 'F. M'#225'x. Control'
        DataField = 'FECMAXCONTROL'
        FieldIndex = 0
      end
      item
        Title = 'F.Estim.'
        DataField = 'FECESTI'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Estim.'
        DataField = 'USUESTI'
        FieldIndex = 0
      end
      item
        Title = '% Estim.'
        DataField = 'PORCESTI'
        FieldIndex = 0
      end
      item
        Title = 'Gravedad'
        DataField = 'GRAVEDAD'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Gest.Aud.'
        DataField = 'EX_FECHAGESTAUD'
        FieldIndex = 0
      end
      item
        Title = 'Fecha turno derivaci'#243'n'
        DataField = 'TURNODERIVACION'
        FieldIndex = 0
      end
      item
        Title = 'Reg. Sanit. Prestador'
        DataField = 'REGSANITPREST'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 2
    Left = 469
    Top = 148
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <
      item
        DataField = 'SINORDREC'
        Title = 'Siniestro'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'EX_CUIT'
        Title = 'Nro.Cuit'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'EX_CUIL'
        Title = 'Nro. Cuil'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Nombre'
      end
      item
        DataField = 'EX_BAJAMEDICA'
        Title = 'Fecha Baja'
      end
      item
        DataField = 'EX_DIAGNOSTICOOMS'
        Title = 'CIE-10'
      end
      item
        DataField = 'EX_DIAGNOSTICO'
        Title = 'Diagn'#243'stico'
      end
      item
        DataField = 'SA_EVOLUTIVO'
        Title = 'Ult.Movi.F.Carga'
      end
      item
        DataField = 'EX_FECHAALTA'
        Title = 'Fecha de Carga'
      end
      item
        DataField = 'EX_PRESTADOR'
        Title = 'Identif. Prestador'
      end
      item
        DataField = 'CA_CLAVE'
        Title = 'CUIT Prestador'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'CA_LOCALIDAD'
        Title = 'Localidad Prestador'
      end
      item
        DataField = 'PV_DESCRIPCION'
        Title = 'Provincia Prestador'
      end
      item
        DataField = 'CA_TELEFONO'
        Title = 'Tel'#233'fono Prestador'
      end
      item
        DataField = 'DIASCAIDOS'
        Title = 'D'#237'as Ca'#237'dos'
      end
      item
        DataField = 'GTRABAJO'
        Title = 'G. Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
      end
      item
        DataField = 'DELEGACION'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'SA_FECHACONTROL'
        Title = 'Fecha Control'
      end
      item
        DataField = 'ESTADO'
        Title = 'Estado'
      end
      item
        DataField = 'DIASPORCIE10'
        Title = 'D'#237'as por CIE10'
      end
      item
        DataField = 'descCIE10'
        Title = 'Categoria s/CIE-10'
      end
      item
        DataField = 'FECCONTINUA'
        Title = 'F. Continua'
      end
      item
        DataField = 'FECMAXCONTROL'
        Title = 'F. M'#225'x. Control'
      end
      item
        DataField = 'FECESTI'
        Title = 'F.Estim.'
      end
      item
        DataField = 'USUESTI'
        Title = 'Usuario Estim.'
      end
      item
        DataField = 'PORCESTI'
        Title = '% Estim.'
      end
      item
        DataField = 'GRAVEDAD'
        Title = 'Gravedad'
      end
      item
        DataField = 'estimable'
        Title = 'Estimable'
      end
      item
        DataField = 'EX_FECHAGESTAUD'
        Title = 'Fecha Gest.Aud.'
      end
      item
        DataField = 'PROX_CONTROL'
        Title = 'Pr'#243'ximo Ctrl'
      end
      item
        DataField = 'TURNODERIVACION'
        Title = 'F. turno derivaci'#243'n'
      end
      item
        DataField = 'TOPEADO_CIE10'
        Title = 'Topeado CIE 10'
      end
      item
        DataField = 'FTOPE1_CIE10'
        Title = 'F. Tope 1 (Cie 10)'
      end
      item
        DataField = 'FTOPE2_CIE10'
        Title = 'F. Tope 2 (Cie10)'
      end
      item
        DataField = 'REGSANITPREST'
        Title = 'Reg. Sanit. Prestador'
      end
      item
        DataField = 'TOPEADO_AUT'
        Title = 'Topeado Aut'
      end
      item
        DataField = 'FTOPE1_AUT'
        Title = 'F.Tope 1 (Aut)'
      end
      item
        DataField = 'FTOPE2_AUT'
        Title = 'F.Tope 2 (Aut)'
      end
      item
        DataField = 'EXTENSIONILT'
        Title = 'Extensi'#243'n ILT'
      end>
    IniStorage = FormPlacement
    OutputFile = 'SiniestrosSinAlta'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 497
    Top = 149
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
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 16470
        OnShortCutPress = tbVPreviaClick
        LinkControl = tbVPrevia
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        OnShortCutPress = tbExportarClick
        LinkControl = tbExportar
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 525
    Top = 149
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 413
    Top = 149
  end
  object PrintDialog: TPrintDialog
    Left = 441
    Top = 149
  end
end
