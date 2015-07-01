inherited frmListGralLiquidaciones: TfrmListGralLiquidaciones
  Left = 442
  Top = 242
  Caption = 'Listado General de Liquidaciones'
  ClientHeight = 389
  ClientWidth = 812
  Constraints.MinHeight = 300
  Constraints.MinWidth = 820
  OldCreateOrder = True
  Scaled = False
  ExplicitLeft = 442
  ExplicitTop = 242
  ExplicitWidth = 820
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 812
    Height = 162
    ExplicitWidth = 812
    ExplicitHeight = 162
    object gbEmpresaTrabajador: TGroupBox
      Left = 0
      Top = 0
      Width = 525
      Height = 76
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa / Trabajador '
      TabOrder = 0
      DesignSize = (
        525
        76)
      object Label2: TLabel
        Left = 5
        Top = 51
        Width = 24
        Height = 13
        Caption = 'CUIL'
      end
      object Label3: TLabel
        Left = 6
        Top = 22
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresa: TfraEmpresa
        Left = 35
        Top = 18
        Width = 486
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
        ExplicitLeft = 35
        ExplicitTop = 18
        ExplicitWidth = 486
        ExplicitHeight = 21
        DesignSize = (
          486
          21)
        inherited lbContrato: TLabel
          Left = 382
          ExplicitLeft = 382
        end
        inherited edContrato: TIntEdit
          Left = 427
          ExplicitLeft = 427
        end
        inherited cmbRSocial: TArtComboBox
          Width = 247
          DataSource = nil
          ExplicitWidth = 247
        end
      end
      inline fraTrabajador: TfraTrabajador
        Left = 34
        Top = 47
        Width = 486
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 34
        ExplicitTop = 47
        ExplicitWidth = 486
        ExplicitHeight = 23
        inherited mskCUIL: TMaskEdit
          Left = 2
          ExplicitLeft = 2
        end
        inherited cmbNombre: TArtComboBox
          Left = 88
          Width = 398
          DataSource = nil
          ExplicitLeft = 88
          ExplicitWidth = 398
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 0
      Top = 76
      Width = 189
      Height = 42
      Caption = ' Fechas de proceso '
      TabOrder = 1
      object Label4: TLabel
        Left = 91
        Top = 19
        Width = 6
        Height = 13
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcProcesoHasta: TDateComboBox
        Left = 98
        Top = 15
        Width = 87
        Height = 21
        MinDateCombo = dcProcesoDesde
        TabOrder = 1
      end
      object dcProcesoDesde: TDateComboBox
        Left = 3
        Top = 15
        Width = 88
        Height = 21
        MaxDateCombo = dcProcesoHasta
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 192
      Top = 76
      Width = 192
      Height = 42
      Caption = ' Fechas de aprobaci'#243'n '
      TabOrder = 2
      object Label1: TLabel
        Left = 92
        Top = 19
        Width = 6
        Height = 13
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcAprobHasta: TDateComboBox
        Left = 101
        Top = 15
        Width = 87
        Height = 21
        MinDateCombo = dcAprobDesde
        Enabled = False
        TabOrder = 1
      end
      object dcAprobDesde: TDateComboBox
        Left = 4
        Top = 15
        Width = 87
        Height = 21
        MaxDateCombo = dcAprobHasta
        Enabled = False
        TabOrder = 0
      end
    end
    object gbSiniestro: TGroupBox
      Left = 527
      Top = 0
      Width = 134
      Height = 38
      Anchors = [akTop, akRight]
      Caption = ' Siniestro '
      TabOrder = 3
      object Label5: TLabel
        Left = 63
        Top = 17
        Width = 6
        Height = 13
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object SinDesde: TSinEdit
        Left = 4
        Top = 13
        Width = 57
        Height = 21
        OnExit = SinDesdeExit
        TabOrder = 0
        ViewStyle = [etSiniestro]
      end
      object SinHasta: TSinEdit
        Left = 73
        Top = 13
        Width = 57
        Height = 21
        TabOrder = 1
        ViewStyle = [etSiniestro]
      end
    end
    object GroupBox4: TGroupBox
      Left = 664
      Top = 0
      Width = 146
      Height = 39
      Anchors = [akTop, akRight]
      Caption = ' Estado '
      TabOrder = 6
      object cmbEstado: TDBCheckCombo
        Left = 5
        Top = 13
        Width = 137
        Height = 21
        TabOrder = 0
        OnChange = cmbEstadoChange
        DataSource = dsEstado
        KeyField = 'li_codigo'
        ListField = 'li_descripcion'
      end
    end
    object rgVIP: TRadioGroup
      Left = 0
      Top = 118
      Width = 189
      Height = 41
      Caption = ' Empresas VIP '
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todas')
      TabOrder = 7
    end
    object rgBloqueoILT: TRadioGroup
      Left = 192
      Top = 118
      Width = 192
      Height = 41
      Caption = ' Empresas con bloqueo de ILT '
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todas')
      TabOrder = 8
    end
    object gbSectorEmpresa: TGroupBox
      Left = 526
      Top = 38
      Width = 283
      Height = 38
      Anchors = [akTop, akRight]
      Caption = 'Sector Empresa'
      TabOrder = 4
      DesignSize = (
        283
        38)
      object cmbSector: TDBCheckCombo
        Left = 5
        Top = 13
        Width = 272
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsSector
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object GroupBox6: TGroupBox
      Left = 580
      Top = 76
      Width = 231
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Concepto de pago'
      TabOrder = 9
      DesignSize = (
        231
        42)
      object dcConcepto: TDBCheckCombo
        Left = 7
        Top = 15
        Width = 219
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsConcepto
        KeyField = 'CP_CONPAGO'
        ListField = 'CP_DENPAGO'
      end
    end
    object GroupBox2: TGroupBox
      Left = 581
      Top = 118
      Width = 98
      Height = 41
      Caption = ' Nro. de cheque '
      TabOrder = 5
      object edNroCheque: TEdit
        Left = 6
        Top = 14
        Width = 86
        Height = 21
        TabOrder = 0
      end
    end
    object rgExtensionILT: TRadioGroup
      Left = 386
      Top = 118
      Width = 192
      Height = 41
      Caption = ' Extensi'#243'n de ILT '
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 10
    end
    object GroupBox5: TGroupBox
      Left = 386
      Top = 76
      Width = 192
      Height = 42
      Caption = ' Fechas derivado GPBA'
      TabOrder = 11
      object Label6: TLabel
        Left = 92
        Top = 19
        Width = 6
        Height = 13
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcDerivadoHasta: TDateComboBox
        Left = 101
        Top = 15
        Width = 87
        Height = 21
        MinDateCombo = dcDerivadoDesde
        TabOrder = 1
      end
      object dcDerivadoDesde: TDateComboBox
        Left = 4
        Top = 15
        Width = 87
        Height = 21
        MaxDateCombo = dcDerivadoHasta
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 162
    Width = 812
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 806
      end>
    ExplicitTop = 162
    ExplicitWidth = 812
    inherited ToolBar: TToolBar
      Width = 799
      ExplicitWidth = 799
    end
  end
  inherited Grid: TArtDBGrid
    Top = 191
    Width = 812
    Height = 198
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTROCOMPLETO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMLIQUI'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Liq.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F.Accid.'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Reca'#237'da'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BAJAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Baja M'#233'dica'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Alta M'#233'dica'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADES'
        Title.Alignment = taCenter
        Title.Caption = 'Liq.Desde'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAHAS'
        Title.Alignment = taCenter
        Title.Caption = 'Liq.Hasta'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DIASAPLICA'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as Liq.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IBASEDIARIA'
        Title.Alignment = taCenter
        Title.Caption = 'Imp.B.Diario'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IBASEMENSUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Imp.B.Mensual'
        Width = 80
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'SUBTOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'ILT'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ICONEMP'
        Title.Alignment = taCenter
        Title.Caption = 'Contribuciones'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IMPORPERI'
        Title.Alignment = taCenter
        Title.Caption = 'Total'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Proceso'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F.Aprobado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FAPROCOB'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprob. Cobranzas'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NROCHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Cheque'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'F.Cheque'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IMPORTEART'
        Title.Alignment = taCenter
        Title.Caption = 'Importe ART'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IMPORTEEMP'
        Title.Alignment = taCenter
        Title.Caption = 'Empresa remun.'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'IMPORTENOREMEMP'
        Title.Alignment = taCenter
        Title.Caption = 'Empresa no remun.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DIFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Diferencia'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_descripcion'
        Title.Caption = 'Sector'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_denpago'
        Title.Caption = 'Concepto de Pago'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGAS'
        Title.Caption = 'Cargas sociales'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APORTES'
        Title.Caption = 'Aportes'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASIGFAMILIAR'
        Title.Caption = 'Asig. Fam.'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ADEUDADDJJ'
        Title.Alignment = taCenter
        Title.Caption = 'Adeuda DDJJ'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ev_fechavencimiento'
        Title.Caption = 'F. Venc. Dict'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVODIFERENCIA'
        Title.Caption = 'Motivo Diferencia'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXTENSIONILT'
        Title.Caption = 'Extensi'#243'n ILT'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fechaderivado'
        Title.Caption = 'Fecha Derivado GPBA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formula'
        Title.Caption = 'F'#243'rmula Liq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'subtotalnorem'
        Title.Caption = 'Imp. no rem. liq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ibasediarianorem'
        Title.Caption = 'Ing. base diario no rem.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOADIC'
        Title.Caption = 'Pago Adic.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPDANOS'
        Title.Caption = 'Comp. Da'#241'os'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROSPAGOS'
        Title.Caption = 'Otros Pagos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTOOP'
        Title.Caption = 'Tipo Otros Pagos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO'
        Title.Caption = 'Juicio'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 300
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox [3]
    Left = 53
    Top = 310
    Width = 1153
    Height = 301
    HorzScrollBar.Position = 232
    TabOrder = 3
    Visible = False
    object qrListGralLiquidaciones: TQuickRep
      Left = -212
      Top = 8
      Width = 1344
      Height = 816
      IDReport = 0
      DataSet = sdqConsulta
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
      Page.PaperSize = Legal
      Page.Continuous = False
      Page.Values = (
        50.000000000000000000
        2159.000000000000000000
        50.000000000000000000
        3556.000000000000000000
        30.000000000000000000
        30.000000000000000000
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
      ReportTitle = 'Listado General de Liquidaciones'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object DetailBand1: TQRBand
        Left = 11
        Top = 185
        Width = 1321
        Height = 24
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          63.500000000000000000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbDetail
        object QRLabel2: TQRLabel
          Left = 136
          Top = 2
          Width = 79
          Height = 17
          Size.Values = (
            44.979166666666670000
            359.833333333333300000
            5.291666666666667000
            209.020833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Nro. de Cheque:'
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
        object QRDBText4: TQRDBText
          Left = 224
          Top = 2
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            592.666666666666700000
            5.291666666666667000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'NROCHEQUE'
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
        object QRLabel22: TQRLabel
          Left = 344
          Top = 2
          Width = 34
          Height = 17
          Size.Values = (
            44.979166666666670000
            910.166666666666700000
            5.291666666666667000
            89.958333333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Fecha:'
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
        object QRDBText24: TQRDBText
          Left = 392
          Top = 2
          Width = 76
          Height = 17
          Size.Values = (
            44.979166666666670000
            1037.166666666667000000
            5.291666666666667000
            201.083333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FECHACHEQUE'
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
      end
      object PageFooterBand1: TQRBand
        Left = 11
        Top = 232
        Width = 1321
        Height = 21
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          55.562500000000000000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageFooter
        object QRSysData2: TQRSysData
          Left = 1273
          Top = 1
          Width = 38
          Height = 17
          Size.Values = (
            44.979166666666700000
            3368.145833333330000000
            2.645833333333330000
            100.541666666667000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          Data = qrsPageNumber
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 9
        end
        object QRLabel23: TQRLabel
          Left = 1248
          Top = 1
          Width = 23
          Height = 17
          Size.Values = (
            44.979166666666670000
            3302.000000000000000000
            2.645833333333333000
            60.854166666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'P'#225'g.'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
      end
      object PageHeaderBand1: TQRBand
        Left = 11
        Top = 19
        Width = 1321
        Height = 63
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          166.687500000000000000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageHeader
        object qrlTitulo: TQRLabel
          Left = 184
          Top = 6
          Width = 953
          Height = 28
          Frame.Width = 3
          Size.Values = (
            74.083333333333300000
            486.833333333333000000
            15.875000000000000000
            2521.479166666670000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'LISTADO GENERAL DE LIQUIDACIONES'
          Color = clScrollBar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 16
        end
        object qrlSeleccion: TQRLabel
          Left = 184
          Top = 38
          Width = 953
          Height = 17
          Size.Values = (
            44.979166666666700000
            486.833333333333000000
            100.541666666667000000
            2521.479166666670000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'qrlSeleccion'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRSysData1: TQRSysData
          Left = 1240
          Top = 8
          Width = 35
          Height = 17
          Size.Values = (
            44.979166666666670000
            3280.833333333333000000
            21.166666666666670000
            92.604166666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          Data = qrsDate
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 9
        end
      end
      object ColumnHeaderBand1: TQRBand
        Left = 11
        Top = 82
        Width = 1321
        Height = 15
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          39.687500000000000000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbColumnHeader
      end
      object QRGroup1: TQRGroup
        Left = 11
        Top = 97
        Width = 1321
        Height = 28
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          74.083333333333330000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        Expression = 'sdqConsulta.SINIESTROCOMPLETO'
        Master = qrListGralLiquidaciones
        ReprintOnNewPage = False
        object QRDBText1: TQRDBText
          Left = 2
          Top = 8
          Width = 117
          Height = 17
          Size.Values = (
            44.979166666666670000
            5.291666666666667000
            21.166666666666670000
            309.562500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'SINIESTROCOMPLETO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 9
        end
        object QRLabel1: TQRLabel
          Left = 120
          Top = 8
          Width = 26
          Height = 17
          Size.Values = (
            44.979166666666670000
            317.500000000000000000
            21.166666666666670000
            68.791666666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'CUIT:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
          Left = 146
          Top = 8
          Width = 72
          Height = 17
          Size.Values = (
            44.979166666666670000
            386.291666666666700000
            21.166666666666670000
            190.500000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'CUIT'
          Font.Charset = ANSI_CHARSET
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
        object QRLabel3: TQRLabel
          Left = 218
          Top = 8
          Width = 46
          Height = 17
          Size.Values = (
            44.979166666666670000
            576.791666666666700000
            21.166666666666670000
            121.708333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'R. Social:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRDBText5: TQRDBText
          Left = 264
          Top = 8
          Width = 245
          Height = 17
          Size.Values = (
            44.979166666666670000
            698.500000000000000000
            21.166666666666670000
            648.229166666666800000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'RAZONSOCIAL'
          Font.Charset = ANSI_CHARSET
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
        object QRLabel4: TQRLabel
          Left = 566
          Top = 8
          Width = 26
          Height = 17
          Size.Values = (
            44.979166666666670000
            1497.541666666667000000
            21.166666666666670000
            68.791666666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'CUIL:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRDBText6: TQRDBText
          Left = 592
          Top = 8
          Width = 74
          Height = 17
          Size.Values = (
            44.979166666666670000
            1566.333333333333000000
            21.166666666666670000
            195.791666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'CUIL'
          Font.Charset = ANSI_CHARSET
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
          Left = 693
          Top = 8
          Width = 184
          Height = 17
          Size.Values = (
            44.979166666666670000
            1833.562500000000000000
            21.166666666666670000
            486.833333333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'NOMBRE'
          Font.Charset = ANSI_CHARSET
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
        object QRLabel5: TQRLabel
          Left = 664
          Top = 8
          Width = 29
          Height = 17
          Size.Values = (
            44.979166666666670000
            1756.833333333333000000
            21.166666666666670000
            76.729166666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Trab.:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRLabel6: TQRLabel
          Left = 881
          Top = 8
          Width = 45
          Height = 17
          Size.Values = (
            44.979166666666670000
            2330.979166666667000000
            21.166666666666670000
            119.062500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'F. accid.:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRDBText8: TQRDBText
          Left = 926
          Top = 8
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            2450.041666666667000000
            21.166666666666670000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FECHAACCIDENTE'
          Font.Charset = ANSI_CHARSET
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
        object QRDBText9: TQRDBText
          Left = 1026
          Top = 8
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            2714.625000000000000000
            21.166666666666670000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FECHARECAIDA'
          Font.Charset = ANSI_CHARSET
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
        object QRLabel7: TQRLabel
          Left = 991
          Top = 8
          Width = 35
          Height = 17
          Size.Values = (
            44.979166666666670000
            2622.020833333333000000
            21.166666666666670000
            92.604166666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'F. rec.:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRDBText10: TQRDBText
          Left = 1142
          Top = 8
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            3021.541666666667000000
            21.166666666666670000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'BAJAMEDICA'
          Font.Charset = ANSI_CHARSET
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
        object QRLabel8: TQRLabel
          Left = 1091
          Top = 8
          Width = 51
          Height = 17
          Size.Values = (
            44.979166666666670000
            2886.604166666667000000
            21.166666666666670000
            134.937500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Baja m'#233'd.:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRDBText11: TQRDBText
          Left = 1255
          Top = 8
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666700000
            3320.520833333330000000
            21.166666666666700000
            171.979166666667000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ALTAMEDICA'
          Font.Charset = ANSI_CHARSET
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
        object QRLabel9: TQRLabel
          Left = 1207
          Top = 8
          Width = 49
          Height = 17
          Size.Values = (
            44.979166666666670000
            3193.520833333333000000
            21.166666666666670000
            129.645833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Alta m'#233'd.:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
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
        object QRShape1: TQRShape
          Left = 1
          Top = 1
          Width = 1320
          Height = 5
          Size.Values = (
            13.229166666666700000
            2.645833333333330000
            2.645833333333330000
            3492.500000000000000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRDBText31: TQRDBText
          Left = 537
          Top = 8
          Width = 28
          Height = 17
          Size.Values = (
            44.979166666666670000
            1420.812500000000000000
            21.166666666666670000
            74.083333333333340000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ADEUDADDJJ'
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
        object QRLabel34: TQRLabel
          Left = 509
          Top = 8
          Width = 28
          Height = 17
          Size.Values = (
            44.979166666666670000
            1346.729166666667000000
            21.166666666666670000
            74.083333333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'DDJJ:'
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
      object QRGroup2: TQRGroup
        Left = 11
        Top = 125
        Width = 1321
        Height = 60
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          158.750000000000000000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        Expression = 'sdqConsulta.NUMLIQUI'
        Master = qrListGralLiquidaciones
        ReprintOnNewPage = False
        object QRDBText3: TQRDBText
          Left = 76
          Top = 6
          Width = 17
          Height = 17
          Size.Values = (
            44.979166666666670000
            201.083333333333300000
            15.875000000000000000
            44.979166666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'NUMLIQUI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 9
        end
        object QRLabel11: TQRLabel
          Left = 116
          Top = 6
          Width = 51
          Height = 17
          Size.Values = (
            44.979166666666670000
            306.916666666666700000
            15.875000000000000000
            134.937500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Liq.desde:'
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
        object QRDBText13: TQRDBText
          Left = 172
          Top = 6
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            455.083333333333300000
            15.875000000000000000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FECHADES'
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
        object QRDBText14: TQRDBText
          Left = 172
          Top = 22
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            455.083333333333300000
            58.208333333333340000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FECHAHAS'
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
        object QRLabel12: TQRLabel
          Left = 116
          Top = 22
          Width = 48
          Height = 17
          Size.Values = (
            44.979166666666670000
            306.916666666666700000
            58.208333333333330000
            127.000000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Liq.hasta:'
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
        object QRDBText15: TQRDBText
          Left = 847
          Top = 22
          Width = 58
          Height = 17
          Size.Values = (
            44.979166666666670000
            2241.020833333333000000
            58.208333333333340000
            153.458333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'DIASAPLICA'
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
        object QRLabel13: TQRLabel
          Left = 803
          Top = 22
          Width = 41
          Height = 17
          Size.Values = (
            44.979166666666670000
            2124.604166666667000000
            58.208333333333330000
            108.479166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'D'#237'as liq.:'
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
        object QRDBText16: TQRDBText
          Left = 460
          Top = 6
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1217.083333333333000000
            15.875000000000000000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'IBASEDIARIA'
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
        object QRLabel14: TQRLabel
          Left = 376
          Top = 6
          Width = 81
          Height = 17
          Size.Values = (
            44.979166666666670000
            994.833333333333300000
            15.875000000000000000
            214.312500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Imp. Base Diario:'
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
        object QRDBText17: TQRDBText
          Left = 460
          Top = 22
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1217.083333333333000000
            58.208333333333340000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'IBASEMENSUAL'
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
          Left = 376
          Top = 22
          Width = 83
          Height = 17
          Size.Values = (
            44.979166666666670000
            994.833333333333300000
            58.208333333333330000
            219.604166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Imp. Base Mens.:'
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
        object QRDBText18: TQRDBText
          Left = 827
          Top = 6
          Width = 62
          Height = 17
          Size.Values = (
            44.979166666666670000
            2188.104166666667000000
            15.875000000000000000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'SUBTOTAL'
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
        object QRLabel16: TQRLabel
          Left = 802
          Top = 6
          Width = 18
          Height = 17
          Size.Values = (
            44.979166666666670000
            2121.958333333333000000
            15.875000000000000000
            47.625000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'ILT:'
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
        object QRDBText19: TQRDBText
          Left = 1036
          Top = 6
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            2741.083333333333000000
            15.875000000000000000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ICONEMP'
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
        object QRLabel17: TQRLabel
          Left = 994
          Top = 6
          Width = 41
          Height = 17
          Size.Values = (
            44.979166666666670000
            2629.958333333333000000
            15.875000000000000000
            108.479166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Contrib.:'
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
        object QRDBText20: TQRDBText
          Left = 1250
          Top = 6
          Width = 70
          Height = 17
          Size.Values = (
            44.979166666666670000
            3307.291666666667000000
            15.875000000000000000
            185.208333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'IMPORPERI'
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
        object QRLabel18: TQRLabel
          Left = 1222
          Top = 6
          Width = 27
          Height = 17
          Size.Values = (
            44.979166666666670000
            3233.208333333333000000
            15.875000000000000000
            71.437500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Total:'
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
        object QRDBText21: TQRDBText
          Left = 1148
          Top = 22
          Width = 63
          Height = 17
          Size.Values = (
            44.979166666666670000
            3037.416666666667000000
            58.208333333333340000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FEMISION'
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
        object QRLabel19: TQRLabel
          Left = 1095
          Top = 22
          Width = 52
          Height = 17
          Size.Values = (
            44.979166666666670000
            2897.187500000000000000
            58.208333333333330000
            137.583333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'F. emisi'#243'n:'
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
        object QRDBText22: TQRDBText
          Left = 308
          Top = 6
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            814.916666666666800000
            15.875000000000000000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FPROCESO'
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
        object QRLabel20: TQRLabel
          Left = 241
          Top = 6
          Width = 56
          Height = 17
          Size.Values = (
            44.979166666666670000
            637.645833333333300000
            15.875000000000000000
            148.166666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'F. proceso:'
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
        object QRDBText23: TQRDBText
          Left = 308
          Top = 22
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            814.916666666666800000
            58.208333333333340000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FAPROBADO'
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
        object QRLabel21: TQRLabel
          Left = 241
          Top = 22
          Width = 62
          Height = 17
          Size.Values = (
            44.979166666666670000
            637.645833333333300000
            58.208333333333330000
            164.041666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'F. aprobado:'
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
        object QRLabel25: TQRLabel
          Left = 37
          Top = 6
          Width = 40
          Height = 17
          Size.Values = (
            44.979166666666670000
            97.895833333333330000
            15.875000000000000000
            105.833333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Liq. N'#186':'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRLabel26: TQRLabel
          Left = 665
          Top = 6
          Width = 63
          Height = 17
          Size.Values = (
            44.979166666666670000
            1759.479166666667000000
            15.875000000000000000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Importe ART:'
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
        object QRDBText12: TQRDBText
          Left = 735
          Top = 6
          Width = 58
          Height = 17
          Size.Values = (
            44.979166666666670000
            1944.687500000000000000
            15.875000000000000000
            153.458333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'IMPORTEART'
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
        object QRDBText25: TQRDBText
          Left = 602
          Top = 6
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1592.791666666667000000
            15.875000000000000000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'IMPORTEEMP'
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
        object QRLabel27: TQRLabel
          Left = 524
          Top = 6
          Width = 68
          Height = 17
          Size.Values = (
            44.979166666666670000
            1386.416666666667000000
            15.875000000000000000
            179.916666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Imp. empresa:'
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
        object QRLabel28: TQRLabel
          Left = 524
          Top = 22
          Width = 78
          Height = 17
          Size.Values = (
            44.979166666666670000
            1386.416666666667000000
            58.208333333333330000
            206.375000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Emp. no remun.:'
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
        object QRDBText26: TQRDBText
          Left = 602
          Top = 22
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1592.791666666667000000
            58.208333333333340000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'IMPORTENOREMEMP'
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
        object QRLabel29: TQRLabel
          Left = 665
          Top = 22
          Width = 53
          Height = 17
          Size.Values = (
            44.979166666666670000
            1759.479166666667000000
            58.208333333333330000
            140.229166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Diferencia:'
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
        object QRDBText27: TQRDBText
          Left = 736
          Top = 22
          Width = 61
          Height = 17
          Size.Values = (
            44.979166666666670000
            1947.333333333334000000
            58.208333333333340000
            161.395833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'DIFERENCIA'
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
        object QRDBText28: TQRDBText
          Left = 1028
          Top = 22
          Width = 65
          Height = 17
          Size.Values = (
            44.979166666666670000
            2719.916666666667000000
            58.208333333333340000
            171.979166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'FAPROCOB'
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
        object QRLabel30: TQRLabel
          Left = 908
          Top = 22
          Width = 118
          Height = 17
          Size.Values = (
            44.979166666666670000
            2402.416666666667000000
            58.208333333333330000
            312.208333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'F. aprobado Cobranzas:'
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
        object QRLabel31: TQRLabel
          Left = 116
          Top = 38
          Width = 92
          Height = 17
          Size.Values = (
            44.979166666666670000
            306.916666666666700000
            100.541666666666700000
            243.416666666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Concepto de pago:'
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
        object qrlConceptoPago: TQRLabel
          Left = 215
          Top = 38
          Width = 83
          Height = 17
          Size.Values = (
            44.979166666666670000
            568.854166666666700000
            100.541666666666700000
            219.604166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'qrlConceptoPago'
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
        object QRLabel32: TQRLabel
          Left = 890
          Top = 6
          Width = 43
          Height = 17
          Size.Values = (
            44.979166666666670000
            2354.791666666667000000
            15.875000000000000000
            113.770833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Aportes:'
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
        object QRDBText29: TQRDBText
          Left = 934
          Top = 6
          Width = 57
          Height = 17
          Size.Values = (
            44.979166666666670000
            2471.208333333333000000
            15.875000000000000000
            150.812500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'APORTES'
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
        object QRLabel33: TQRLabel
          Left = 1102
          Top = 6
          Width = 55
          Height = 17
          Size.Values = (
            44.979166666666670000
            2915.708333333333000000
            15.875000000000000000
            145.520833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Asig. Fam.:'
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
        object QRDBText30: TQRDBText
          Left = 1158
          Top = 6
          Width = 63
          Height = 17
          Size.Values = (
            44.979166666666670000
            3063.875000000000000000
            15.875000000000000000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ASIGFAMILIAR'
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
        object QRLabel35: TQRLabel
          Left = 1212
          Top = 22
          Width = 48
          Height = 17
          Size.Values = (
            44.979166666666670000
            3206.750000000000000000
            58.208333333333330000
            127.000000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Ven. Dict.'
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
        object QRDBText32: TQRDBText
          Left = 1257
          Top = 22
          Width = 64
          Height = 17
          Size.Values = (
            44.979166666666670000
            3325.812500000000000000
            58.208333333333340000
            169.333333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'ev_fechavencimiento'
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
        object QRLabel36: TQRLabel
          Left = 308
          Top = 38
          Width = 87
          Height = 17
          Size.Values = (
            44.979166666666670000
            814.916666666666700000
            100.541666666666700000
            230.187500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Motivo Diferencia:'
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
        object QRDBText33: TQRDBText
          Left = 397
          Top = 38
          Width = 124
          Height = 17
          Size.Values = (
            44.979166666666670000
            1050.395833333333000000
            100.541666666666700000
            328.083333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'MOTIVODIFERENCIA'
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
        object QRLabel37: TQRLabel
          Left = 524
          Top = 38
          Width = 28
          Height = 17
          Size.Values = (
            44.979166666666670000
            1386.416666666667000000
            100.541666666666700000
            74.083333333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Juicio'
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
        object QRDBText34: TQRDBText
          Left = 557
          Top = 38
          Width = 106
          Height = 17
          Size.Values = (
            44.979166666666670000
            1473.729166666667000000
            100.541666666666700000
            280.458333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'JUICIO'
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
        object QRLabel38: TQRLabel
          Left = 665
          Top = 38
          Width = 41
          Height = 17
          Size.Values = (
            44.979166666666670000
            1759.479166666667000000
            100.541666666666700000
            108.479166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Car'#225'tula'
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
        object QRDBText35: TQRDBText
          Left = 718
          Top = 38
          Width = 600
          Height = 17
          Size.Values = (
            44.979166666666670000
            1899.708333333333000000
            100.541666666666700000
            1587.500000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqConsulta
          DataField = 'CARATULA'
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
      end
      object SummaryBand1: TQRBand
        Left = 11
        Top = 209
        Width = 1321
        Height = 23
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          60.854166666666670000
          3495.145833333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbSummary
        object QRLabel24: TQRLabel
          Left = 8
          Top = 4
          Width = 88
          Height = 17
          Size.Values = (
            44.979166666666670000
            21.166666666666670000
            10.583333333333330000
            232.833333333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Cant. de casos:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRExpr1: TQRExpr
          Left = 99
          Top = 4
          Width = 41
          Height = 17
          Size.Values = (
            44.979166666666670000
            261.937500000000000000
            10.583333333333330000
            108.479166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'COUNT'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRShape2: TQRShape
          Left = 1
          Top = -1
          Width = 1320
          Height = 5
          Size.Values = (
            13.229166666666700000
            2.645833333333330000
            -2.645833333333330000
            3492.500000000000000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object QRExpr2: TQRExpr
          Left = 1083
          Top = 4
          Width = 173
          Height = 17
          Size.Values = (
            44.979166666666670000
            2865.437500000000000000
            10.583333333333330000
            457.729166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          ParentFont = False
          ResetAfterPrint = False
          Transparent = False
          Expression = 'SUM(sdqConsulta.IMPORPERI)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRLabel10: TQRLabel
          Left = 1048
          Top = 4
          Width = 32
          Height = 17
          Size.Values = (
            44.979166666666670000
            2772.833333333333000000
            10.583333333333330000
            84.666666666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Total:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   liq.mp_siniestrocompleto siniestrocompleto, liq.mp_numl' +
        'iqui numliqui, '
      
        '         liq.mp_cuil cuil, liq.mp_nombre nombre, liq.mp_fechaacc' +
        'idente fechaaccidente, '
      
        '         liq.mp_fecharecaida fecharecaida, liq.mp_bajamedica baj' +
        'amedica,'
      
        '         liq.mp_altamedica altamedica, liq.mp_fechades fechades,' +
        ' liq.mp_fechahas fechahas, '
      
        '         liq.mp_diasaplica diasaplica, liq.mp_ibasediaria ibased' +
        'iaria, '
      
        '         liq.mp_ibasemensual ibasemensual, liq.mp_subtotal subto' +
        'tal, '
      
        '         liq.mp_iconemp iconemp, liq.mp_imporperi imporperi, liq' +
        '.mp_femision femision, '
      
        '         liq.mp_fproceso fproceso, liq.mp_faprobado faprobado, l' +
        'iqcheques.mp_nrocheque nrocheque, '
      
        '         liqcheques.mp_fechacheque fechacheque, liq.mp_cuit cuit' +
        ', liq.mp_razonsocial razonsocial, '
      
        '         liq.mp_asigfamiliar asigfamiliar, liq.mp_importeart imp' +
        'orteart, '
      
        '         liq.mp_declaraemp importeemp, liq.mp_noremundeclaraemp ' +
        'importenorememp, '
      
        '         liq.mp_diferencia diferencia, liq.mp_fechaprocobranzas ' +
        'faprocob,'
      '         liq.mp_cargassociales cargas, liq.mp_icontra aportes,'
      
        '         liq.mp_adeudaddjj adeudaddjj,  md_descripcion motivodif' +
        'erencia,'
      
        '         liq.mp_montopagoadic pagoadic, liq.mp_montocompdanios c' +
        'ompdanos,'
      
        '         liq.mp_montootrospagos otrospagos, b.cp_denpago concept' +
        'oop,'
      
        '         art.sin.get_caratulajuicio(liq.mp_siniestro, liq.mp_ord' +
        'en, liq.mp_recaida) caratula,'
      
        '         art.SIN.get_listanrosjuicioexp(liq.mp_siniestro, liq.mp' +
        '_orden, liq.mp_recaida) juicio'
      
        '    FROM tmp_lstliquidcheques liqcheques, tmp_lstliquidaciones l' +
        'iq, sin.smd_motivodiferencia, art.scp_conpago b'
      '     where liq.mp_usuario = liqcheques.mp_usuario(+)'
      '     AND liq.mp_siniestro = liqcheques.mp_siniestro(+)'
      '     AND liq.mp_orden = liqcheques.mp_orden(+)'
      '     AND liq.mp_recaida = liqcheques.mp_recaida(+)'
      '     AND liq.mp_numliqui = liqcheques.mp_numliqui(+)'
      '     AND liq.mp_idmotivodiferencia = md_codigo(+)'
      '     AND b.cp_conpago(+) = liq.mp_conceptootrospagos'
      
        'ORDER BY liq.mp_siniestro, liq.mp_orden, liq.mp_recaida, liq.mp_' +
        'numliqui'
      '')
    Left = 80
    Top = 220
    object sdqConsultaSINIESTROCOMPLETO: TStringField
      FieldName = 'SINIESTROCOMPLETO'
    end
    object sdqConsultaNUMLIQUI: TFloatField
      FieldName = 'NUMLIQUI'
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 11
    end
    object sdqConsultaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object sdqConsultaFECHAACCIDENTE: TDateTimeField
      FieldName = 'FECHAACCIDENTE'
    end
    object sdqConsultaFECHARECAIDA: TDateTimeField
      FieldName = 'FECHARECAIDA'
    end
    object sdqConsultaBAJAMEDICA: TDateTimeField
      FieldName = 'BAJAMEDICA'
    end
    object sdqConsultaALTAMEDICA: TDateTimeField
      FieldName = 'ALTAMEDICA'
    end
    object sdqConsultaFECHADES: TDateTimeField
      FieldName = 'FECHADES'
    end
    object sdqConsultaFECHAHAS: TDateTimeField
      FieldName = 'FECHAHAS'
    end
    object sdqConsultaDIASAPLICA: TFloatField
      FieldName = 'DIASAPLICA'
    end
    object sdqConsultaIBASEDIARIA: TFloatField
      FieldName = 'IBASEDIARIA'
    end
    object sdqConsultaIBASEMENSUAL: TFloatField
      FieldName = 'IBASEMENSUAL'
    end
    object sdqConsultaSUBTOTAL: TFloatField
      FieldName = 'SUBTOTAL'
    end
    object sdqConsultaICONEMP: TFloatField
      FieldName = 'ICONEMP'
    end
    object sdqConsultaIMPORPERI: TFloatField
      FieldName = 'IMPORPERI'
    end
    object sdqConsultaFEMISION: TDateTimeField
      FieldName = 'FEMISION'
    end
    object sdqConsultaFPROCESO: TDateTimeField
      FieldName = 'FPROCESO'
    end
    object sdqConsultaFAPROBADO: TDateTimeField
      FieldName = 'FAPROBADO'
    end
    object sdqConsultaNROCHEQUE: TStringField
      FieldName = 'NROCHEQUE'
      Size = 30
    end
    object sdqConsultaFECHACHEQUE: TDateTimeField
      FieldName = 'FECHACHEQUE'
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
    object sdqConsultaRAZONSOCIAL: TStringField
      FieldName = 'RAZONSOCIAL'
      Size = 200
    end
    object sdqConsultaASIGFAMILIAR: TFloatField
      FieldName = 'ASIGFAMILIAR'
    end
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 100
    end
    object sdqConsultaIMPORTEART: TFloatField
      FieldName = 'IMPORTEART'
    end
    object sdqConsultaIMPORTEEMP: TFloatField
      FieldName = 'IMPORTEEMP'
    end
    object sdqConsultaIMPORTENOREMEMP: TFloatField
      FieldName = 'IMPORTENOREMEMP'
    end
    object sdqConsultaDIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
    object sdqConsultaFAPROCOB: TDateTimeField
      FieldName = 'FAPROCOB'
    end
    object sdqConsultatb_descripcion: TStringField
      FieldName = 'tb_descripcion'
      Size = 120
    end
    object sdqConsultacp_denpago: TStringField
      FieldName = 'cp_denpago'
      Size = 200
    end
    object sdqConsultaCARGAS: TFloatField
      FieldName = 'CARGAS'
    end
    object sdqConsultaAPORTES: TFloatField
      FieldName = 'APORTES'
    end
    object sdqConsultaADEUDADDJJ: TStringField
      FieldName = 'ADEUDADDJJ'
      Size = 1
    end
    object sdqConsultaev_fechavencimiento: TDateTimeField
      FieldName = 'ev_fechavencimiento'
    end
    object sdqConsultaMOTIVODIFERENCIA: TStringField
      FieldName = 'MOTIVODIFERENCIA'
    end
    object sdqConsultaEXTENSIONILT: TStringField
      FieldName = 'EXTENSIONILT'
      Size = 1
    end
    object sdqConsultafechaderivado: TDateTimeField
      FieldName = 'fechaderivado'
    end
    object sdqConsultaformula: TStringField
      FieldName = 'formula'
      Size = 300
    end
    object sdqConsultasubtotalnorem: TFloatField
      FieldName = 'subtotalnorem'
    end
    object sdqConsultaibasediarianorem: TFloatField
      FieldName = 'ibasediarianorem'
    end
    object sdqConsultaPAGOADIC: TFloatField
      FieldName = 'PAGOADIC'
    end
    object sdqConsultaCOMPDANOS: TFloatField
      FieldName = 'COMPDANOS'
    end
    object sdqConsultaOTROSPAGOS: TFloatField
      FieldName = 'OTROSPAGOS'
    end
    object sdqConsultaCONCEPTOOP: TStringField
      FieldName = 'CONCEPTOOP'
      Size = 40
    end
    object sdqConsultaCARATULA: TStringField
      FieldName = 'CARATULA'
      Size = 4000
    end
    object sdqConsultaJUICIO: TStringField
      FieldName = 'JUICIO'
      Size = 4000
    end
  end
  inherited dsConsulta: TDataSource
    Left = 108
    Top = 220
  end
  inherited SortDialog: TSortDialog
    Left = 80
    Top = 248
  end
  inherited ExportDialog: TExportDialog
    Title = 'Listado General de Liquidaciones - ILT'
    Left = 108
    Top = 248
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Title.Text = 'Listado General de Liquidaciones - ILT'
    Left = 108
    Top = 276
  end
  inherited Seguridad: TSeguridad
    Left = 80
    Top = 192
  end
  inherited FormStorage: TFormStorage
    Left = 108
    Top = 192
  end
  inherited PrintDialog: TPrintDialog
    Left = 80
    Top = 276
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end>
    Left = 136
    Top = 192
  end
  inherited FieldHider: TFieldHider
    Left = 136
    Top = 220
  end
  object sdqConcepto: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT   cp_conpago, cp_denpago'
      '    FROM art.scp_conpago'
      '   WHERE cp_tipo IN('#39'I'#39', '#39'P'#39', '#39'M'#39')'
      'ORDER BY cp_denpago')
    Left = 728
    Top = 85
  end
  object dsConcepto: TDataSource
    DataSet = sdqConcepto
    Left = 700
    Top = 85
  end
  object sdqSector: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT tb_codigo, tb_descripcion'
      '  FROM art.ctb_tablas'
      ' WHERE tb_clave = '#39'SECT'#39
      '   AND tb_codigo > 0')
    Left = 629
    Top = 48
  end
  object dsSector: TDataSource
    DataSet = sdqSector
    Left = 601
    Top = 48
  end
  object dsEstado: TDataSource
    DataSet = sdqEstado
    Left = 716
    Top = 10
  end
  object sdqEstado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT li_codigo, li_descripcion'
      '  FROM art.sli_estadosliquidacion'
      ' WHERE li_fechabaja IS NULL'
      '   AND li_mostrarenlistado = '#39'S'#39
      '   AND li_otrospagos = '#39'N'#39
      '   order by li_id')
    Left = 744
    Top = 10
  end
end
