inherited frmSobres: TfrmSobres
  Left = 272
  Top = 83
  Caption = 'Sobres'
  ClientHeight = 663
  ClientWidth = 792
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  OldCreateOrder = True
  Scaled = False
  ExplicitLeft = 272
  ExplicitTop = 83
  ExplicitWidth = 800
  ExplicitHeight = 693
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 168
    ExplicitTop = -4
    ExplicitWidth = 792
    ExplicitHeight = 168
    DesignSize = (
      792
      168)
    object gbBeneficiario: TGroupBox
      Left = 154
      Top = 2
      Width = 405
      Height = 41
      Caption = ' Beneficiario '
      TabOrder = 1
      DesignSize = (
        405
        41)
      object edBeneficiario: TEdit
        Left = 4
        Top = 14
        Width = 397
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object gbFechaCheque: TGroupBox
      Left = 154
      Top = 43
      Width = 201
      Height = 41
      Caption = ' Fecha del Cheque '
      TabOrder = 4
      object Label3: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaChequeDesde: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaChequeHasta
        TabOrder = 0
      end
      object edFechaChequeHasta: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaChequeDesde
        TabOrder = 1
      end
    end
    object rgImpresos: TRadioGroup
      Left = 1
      Top = 125
      Width = 249
      Height = 41
      Caption = ' Tipo '
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Impresos'
        'No Impresos'
        'Todos')
      TabOrder = 11
    end
    object gbNumCheque: TGroupBox
      Left = 1
      Top = 2
      Width = 149
      Height = 41
      Caption = ' N'#250'mero de Cheque '
      TabOrder = 0
      object Label1: TLabel
        Left = 69
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edChequeDesde: TPatternEdit
        Left = 4
        Top = 14
        Width = 61
        Height = 21
        MaxLength = 20
        TabOrder = 0
        Pattern = '0123456789'
      end
      object edChequeHasta: TPatternEdit
        Left = 84
        Top = 14
        Width = 61
        Height = 21
        MaxLength = 20
        TabOrder = 1
        OnEnter = edChequeHastaEnter
        Pattern = '0123456789'
      end
    end
    object gbNroOP: TGroupBox
      Left = 1
      Top = 43
      Width = 149
      Height = 41
      Caption = ' N'#250'mero de Orden de Pago '
      TabOrder = 3
      object Label2: TLabel
        Left = 69
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edOrdPagoDesde: TIntEdit
        Left = 4
        Top = 14
        Width = 61
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
      object edOrdPagoHasta: TIntEdit
        Left = 82
        Top = 14
        Width = 61
        Height = 21
        TabOrder = 1
        OnEnter = edOrdPagoHastaEnter
        MaxLength = 8
      end
    end
    object gbNroAcuse: TGroupBox
      Left = 562
      Top = 2
      Width = 226
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Nro. de Acuse'
      TabOrder = 2
      DesignSize = (
        226
        41)
      object edNroAcuse: TEdit
        Left = 4
        Top = 14
        Width = 217
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 358
      Top = 43
      Width = 201
      Height = 41
      Caption = ' Fecha del Sobre '
      TabOrder = 5
      object Label4: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaAltaDesde: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAltaHasta
        TabOrder = 0
      end
      object edFechaAltaHasta: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaAltaDesde
        TabOrder = 1
      end
    end
    object gbFechaImpresion: TGroupBox
      Left = 562
      Top = 43
      Width = 202
      Height = 41
      Caption = ' Fecha de Impresi'#243'n '
      TabOrder = 6
      object Label5: TLabel
        Left = 94
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaImprDesde: TDateComboBox
        Left = 4
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaImprHasta
        TabOrder = 0
      end
      object edFechaImprHasta: TDateComboBox
        Left = 108
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaImprDesde
        TabOrder = 1
      end
    end
    object grpMetodoPago: TGroupBox
      Left = 1
      Top = 84
      Width = 249
      Height = 41
      Caption = ' M'#233'todo de Pago '
      TabOrder = 7
      DesignSize = (
        249
        41)
      object cmbMetodoPago: TDBCheckCombo
        Left = 4
        Top = 13
        Width = 241
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsMetodoPagoFiltro
        KeyField = 'DESCRIPTION'
        ListField = 'DESCRIPTION'
      end
    end
    object grpSituacion: TGroupBox
      Left = 256
      Top = 84
      Width = 220
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Situaci'#243'n'
      TabOrder = 8
      DesignSize = (
        220
        41)
      object cmbSituaciones: TDBCheckCombo
        Left = 5
        Top = 13
        Width = 210
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsSituaciones
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object grpUsuAlta: TGroupBox
      Left = 253
      Top = 125
      Width = 535
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Usuario de Carga'
      TabOrder = 12
      DesignSize = (
        535
        41)
      inline fraUsuAlta: TfraUsuario
        Left = 6
        Top = 14
        Width = 524
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 14
        ExplicitWidth = 524
        DesignSize = (
          524
          21)
        inherited cmbDescripcion: TArtComboBox
          Width = 440
          ExplicitWidth = 440
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 481
      Top = 84
      Width = 93
      Height = 41
      Anchors = [akTop, akRight]
      Caption = ' Archivo BAPRO'
      TabOrder = 9
      object edArchivoBAPRO: TIntEdit
        Left = 5
        Top = 14
        Width = 82
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 577
      Top = 84
      Width = 212
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Transferencias'
      TabOrder = 10
      DesignSize = (
        212
        41)
      object Label26: TLabel
        Left = 94
        Top = 17
        Width = 20
        Height = 13
        Caption = 'Nro.'
      end
      object chkTransferencias: TCheckBox
        Left = 7
        Top = 16
        Width = 79
        Height = 17
        Caption = 'Con Transf.'
        TabOrder = 0
      end
      object edTransferencia: TIntEdit
        Left = 118
        Top = 13
        Width = 88
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        MaxLength = 8
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 168
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 168
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 0
        Wrap = True
        ExplicitLeft = 0
        ExplicitHeight = 30
      end
      inherited tbSalir: TToolButton
        Left = 0
        Top = 30
        Visible = False
        ExplicitLeft = 0
        ExplicitTop = 30
      end
      object tbAcuse: TToolButton
        Left = 23
        Top = 30
        Hint = 'Cargar Fecha Acuse (Ctrl+A)'
        ImageIndex = 7
        OnClick = tbAcuseClick
      end
      object tbFechaEntrega: TToolButton
        Left = 46
        Top = 30
        Hint = 'Cargar Fecha Entrega (Ctrl+F)'
        ImageIndex = 16
        OnClick = tbFechaEntregaClick
      end
      object tbNroAcuse: TToolButton
        Left = 69
        Top = 30
        Hint = 'Cargar Nro. Acuse (Ctrl+R)'
        DropdownMenu = mnuCargaAcuses
        ImageIndex = 9
        Style = tbsDropDown
        OnClick = tbNroAcuseClick
      end
      object tbBuscarCodigoBarras: TToolButton
        Left = 107
        Top = 30
        Hint = 'Buscar C'#243'digo de Barras (F4)'
        ImageIndex = 15
        OnClick = tbBuscarCodigoBarrasClick
      end
      object ToolButton2: TToolButton
        Left = 130
        Top = 30
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 138
        Top = 30
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 161
        Top = 30
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 169
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlTotalRegistros: TPanel
        Left = 192
        Top = 30
        Width = 130
        Height = 22
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Cant. Reg.'
        TabOrder = 0
        Visible = False
        object edTotalRegistros: TCardinalEdit
          Left = 58
          Top = 1
          Width = 70
          Height = 21
          TabStop = False
          Color = clWhite
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlBusqueda: TPanel
        Left = 322
        Top = 30
        Width = 91
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object chkSoloActivos: TCheckBox
          Left = 4
          Top = 2
          Width = 83
          Height = 17
          Caption = 'Solo Activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 197
    Width = 792
    Height = 466
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = mnuSeleccion
    MultiSelect = True
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SO_ID'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Sobre'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_NUMERO'
        Title.Caption = 'N'#250'mero de Cheque'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_BENEFICIARIO'
        Title.Caption = 'Beneficiario del Cheque'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_ORDENPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Orden de Pago'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FECHACHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha del Cheque'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_CALLE'
        Title.Caption = 'Calle'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NUMERO'
        Title.Caption = 'Nro.'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_PISO'
        Title.Caption = 'Piso'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_DEPARTAMENTO'
        Title.Caption = 'Depto.'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_CPOSTAL'
        Title.Alignment = taCenter
        Title.Caption = 'C. Postal'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 97
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_FECHAIMPRESION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Impresi'#243'n'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_FECHAACUSE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Acuse'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NROACUSE'
        Title.Caption = 'Nro. de Acuse'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. del Sobre'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. de Baja'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUAC_DESCRIPCION'
        Title.Caption = 'Situaci'#243'n del Cheque'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = 'M'#233'todo de Pago'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_USUALTA'
        Title.Caption = 'Usuario de Carga'
        Width = 121
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SO_FECHAENTREGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Entrega'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODOENVIO_DESCRIPCION'
        Title.Caption = 'Modo de Env'#237'o'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Destinatario del Sobre'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDARCHIVOBAPRO'
        Title.Alignment = taCenter
        Title.Caption = 'Arch. BAPRO'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTRANSFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Transf.'
        Width = 71
        Visible = True
      end>
  end
  object rptSobres: TQuickRep [3]
    Left = 96
    Top = 248
    Width = 638
    Height = 277
    IDReport = 0
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
    Page.PaperSize = Env10
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      1048.000000000000000000
      100.000000000000000000
      2413.000000000000000000
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
    SnapToGrid = True
    Units = MM
    Zoom = 70
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object TitleBand1: TQRBand
      Left = 26
      Top = 26
      Width = 585
      Height = 223
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        842.886904761904800000
        2211.160714285714000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object qrlDestinatario: TQRDBText
        Left = 174
        Top = 79
        Width = 262
        Height = 12
        Size.Values = (
          45.357142857142900000
          657.678571428571000000
          298.601190476190000000
          990.297619047618900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'BENEFICIARIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlDomicilio: TQRDBText
        Left = 174
        Top = 97
        Width = 262
        Height = 12
        Size.Values = (
          45.357142857142900000
          657.678571428571000000
          366.636904761905000000
          990.297619047618900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'DOMICILIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlCPLocalidad: TQRDBText
        Left = 174
        Top = 115
        Width = 262
        Height = 12
        Size.Values = (
          45.357142857142900000
          657.678571428571000000
          434.672619047619000000
          990.297619047618900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'CPLOCALIDAD'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlProvincia: TQRDBText
        Left = 174
        Top = 134
        Width = 262
        Height = 12
        Size.Values = (
          45.357142857142900000
          657.678571428571000000
          506.488095238095000000
          990.297619047618900000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqConsulta
        DataField = 'PV_DESCRIPCION'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
  end
  object rptAcuses: TQuickRep [4]
    Left = 368
    Top = 289
    Width = 794
    Height = 1123
    IDReport = 0
    DataSet = cdsAcuses
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
      0.000000000000000000
      2970.000000000000000000
      0.000000000000000000
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
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbDetalleAcuses: TQRBand
      Left = 38
      Top = 0
      Width = 718
      Height = 374
      AlignToBottom = False
      BeforePrint = qrbDetalleAcusesBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        989.541666666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 381
        Top = 90
        Width = 320
        Height = 20
        Size.Values = (
          52.916666666666700000
          1009.196428571430000000
          238.125000000000000000
          846.666666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'CE_BENEFICIARIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 381
        Top = 164
        Width = 270
        Height = 17
        Size.Values = (
          45.357142857142900000
          1009.196428571430000000
          434.672619047619000000
          714.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'DOMICILIO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 381
        Top = 197
        Width = 51
        Height = 17
        Size.Values = (
          45.357142857142900000
          1009.196428571430000000
          521.607142857143000000
          136.071428571429000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'SO_CPOSTAL'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 570
        Top = 197
        Width = 80
        Height = 17
        Size.Values = (
          45.357142857142900000
          1508.125000000000000000
          521.607142857143000000
          211.666666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'PV_DESCRIPCION'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 437
        Top = 197
        Width = 129
        Height = 17
        Size.Values = (
          45.357142857142900000
          1156.607142857140000000
          521.607142857143000000
          340.178571428571000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'SO_LOCALIDAD'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 30
        Top = 200
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          79.375000000000000000
          529.166666666666700000
          264.583333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROVINCIA ART'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 30
        Top = 233
        Width = 258
        Height = 17
        Size.Values = (
          44.979166666666670000
          79.375000000000000000
          616.479166666666700000
          682.625000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C. PELLEGRINI 91 - TESORER'#205'A 1er. PISO'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 30
        Top = 263
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          79.375000000000000000
          695.854166666666700000
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '1009'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 240
        Top = 263
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          635.000000000000000000
          695.854166666666700000
          312.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CAPITAL FEDERAL'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 57
        Top = 18
        Width = 316
        Height = 20
        Size.Values = (
          52.916666666666670000
          150.812500000000000000
          47.625000000000000000
          836.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'CE_ORDENPAGO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 30
        Top = 19
        Width = 20
        Height = 20
        Size.Values = (
          52.916666666666670000
          79.375000000000000000
          50.270833333333330000
          52.916666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'OP'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 57
        Top = 42
        Width = 316
        Height = 20
        Size.Values = (
          52.916666666666670000
          150.812500000000000000
          111.125000000000000000
          836.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'CE_METODOPAGO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlUsuario: TQRLabel
        Left = 57
        Top = 66
        Width = 316
        Height = 20
        Size.Values = (
          52.916666666666670000
          150.812500000000000000
          174.625000000000000000
          836.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlUsuario'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 57
        Top = 90
        Width = 316
        Height = 20
        Size.Values = (
          52.916666666666670000
          150.812500000000000000
          238.125000000000000000
          836.083333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsAcuses
        DataField = 'SO_FECHAALTA'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlBarras: TArtQRLabel
        Left = 30
        Top = 138
        Width = 344
        Height = 24
        Size.Values = (
          63.500000000000000000
          79.375000000000000000
          365.125000000000000000
          910.166666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = '**'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = '3 of 9 Barcode'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
      object qrlNumero: TQRLabel
        Left = 30
        Top = 164
        Width = 344
        Height = 17
        Size.Values = (
          44.979166666666670000
          79.375000000000000000
          433.916666666666700000
          910.166666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumero'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object fpNroAcuse: TFormPanel [5]
    Left = 16
    Top = 434
    Width = 361
    Height = 84
    Caption = 'Carga del Nro. de Acuse'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 148
    OnEnter = fpNroAcuseEnter
    DesignSize = (
      361
      84)
    object Bevel2: TBevel
      Left = 4
      Top = 48
      Width = 353
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbNroAcuse: TLabel
      Left = 12
      Top = 18
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. de Acuse'
    end
    object btnNroAcuseAceptar: TButton
      Left = 206
      Top = 54
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnNroAcuseAceptarClick
    end
    object btnNroAcuseCancelar: TButton
      Left = 281
      Top = 54
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    object edAltaNroAcuse: TEdit
      Left = 85
      Top = 14
      Width = 266
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
    end
  end
  object fpListCorreo: TFormPanel [6]
    Left = 82
    Top = 524
    Width = 273
    Height = 73
    Caption = 'Listado de Correo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu, biMaximize]
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    ActiveControl = edFSobreDesde
    Constraints.MaxHeight = 148
    OnEnter = fpListCorreoEnter
    DesignSize = (
      273
      73)
    object Bevel1: TBevel
      Left = 4
      Top = 37
      Width = 265
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 7
      Top = 14
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'F. del Sobre'
    end
    object Label7: TLabel
      Left = 163
      Top = 14
      Width = 12
      Height = 13
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnAceptarListCorreo: TButton
      Left = 118
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarListCorreoClick
    end
    object btnCancelarListCorreo: TButton
      Left = 193
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edFSobreDesde: TDateComboBox
      Left = 73
      Top = 10
      Width = 88
      Height = 21
      MaxDateCombo = edFSobreHasta
      TabOrder = 2
    end
    object edFSobreHasta: TDateComboBox
      Left = 177
      Top = 10
      Width = 88
      Height = 21
      MinDateCombo = edFSobreDesde
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CE_NUMERO, CE_BENEFICIARIO, CE_ORDENPAGO, CE_FECHACHEQUE,' +
        ' CE_MONTO, '
      
        '       SO_CALLE, SO_NUMERO, SO_PISO, SO_DEPARTAMENTO, SO_LOCALID' +
        'AD, SO_CPOSTAL,'
      '       PV_DESCRIPCION, SO_FECHAIMPRESION'
      '  FROM CPV_PROVINCIAS, RCE_CHEQUEEMITIDO, RSO_SOBRE'
      ' WHERE CE_ID = SO_IDCHEQUEEMITIDO'
      '   AND SO_PROVINCIA = PV_CODIGO')
    Left = 6
    Top = 269
  end
  inherited dsConsulta: TDataSource
    Left = 34
    Top = 269
  end
  inherited SortDialog: TSortDialog
    Left = 6
    Top = 297
  end
  inherited ExportDialog: TExportDialog
    Left = 34
    Top = 297
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcNone
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 34
    Top = 325
  end
  inherited Seguridad: TSeguridad
    Left = 6
    Top = 241
  end
  inherited FormStorage: TFormStorage
    Left = 34
    Top = 241
  end
  inherited PrintDialog: TPrintDialog
    Left = 6
    Top = 325
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
        LinkControl = tbSalir2
      end
      item
        Key = 16449
        LinkControl = tbAcuse
      end
      item
        Key = 16466
        LinkControl = tbNroAcuse
      end
      item
        Key = 16454
        LinkControl = tbFechaEntrega
      end
      item
        Key = 115
        LinkControl = tbBuscarCodigoBarras
      end>
    Left = 62
    Top = 241
  end
  inherited FieldHider: TFieldHider
    Left = 62
    Top = 269
  end
  object mnuImprimir: TPopupMenu
    Left = 62
    Top = 297
    object mnuImprimirSobres: TMenuItem
      Caption = 'Imprimir &Sobres'
      OnClick = mnuImprimirSobresClick
    end
    object mnuImprimirAcuses: TMenuItem
      Caption = 'Imprimir &Acuses'
      OnClick = mnuImprimirAcusesClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir &Resultados'
      OnClick = mnuImprimirResultadosClick
    end
    object mnuImprimirListCorreo: TMenuItem
      Caption = 'Imprimir Listado &Correo'
      OnClick = mnuImprimirListCorreoClick
    end
  end
  object mnuSeleccion: TPopupMenu
    Left = 91
    Top = 297
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object cdsAcuses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcuses'
    Left = 6
    Top = 362
    object cdsAcusesCE_BENEFICIARIO: TStringField
      FieldName = 'CE_BENEFICIARIO'
      Required = True
      Size = 100
    end
    object cdsAcusesDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object cdsAcusesSO_CPOSTAL: TStringField
      FieldName = 'SO_CPOSTAL'
      Size = 5
    end
    object cdsAcusesSO_LOCALIDAD: TStringField
      FieldName = 'SO_LOCALIDAD'
      Size = 60
    end
    object cdsAcusesPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object cdsAcusesCE_ORDENPAGO: TFloatField
      FieldName = 'CE_ORDENPAGO'
      Required = True
    end
    object cdsAcusesCE_METODOPAGO: TStringField
      FieldName = 'CE_METODOPAGO'
      Size = 80
    end
    object cdsAcusesSO_FECHAALTA: TDateTimeField
      FieldName = 'SO_FECHAALTA'
    end
  end
  object dspAcuses: TDataSetProvider
    DataSet = sdqAcuses
    Left = 34
    Top = 362
  end
  object sdqAcuses: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT NVL(TJ_NOMBRE, CE_BENEFICIARIO) CE_BENEFICIARIO, UTILES.A' +
        'RMAR_DOMICILIO(SO_CALLE, SO_NUMERO, SO_PISO, SO_DEPARTAMENTO, NU' +
        'LL) DOMICILIO,'
      
        '       SO_CPOSTAL, SO_LOCALIDAD, PV_DESCRIPCION, CE_ORDENPAGO, C' +
        'E_METODOPAGO, SO_FECHAALTA'
      
        '  FROM CTJ_TRABAJADOR, CPV_PROVINCIAS, RCE_CHEQUEEMITIDO, RSO_SO' +
        'BRE'
      ' WHERE CE_ID = SO_IDCHEQUEEMITIDO'
      '   AND SO_PROVINCIA = PV_CODIGO'
      '   AND SO_IDTRABAJADOR = TJ_ID(+)'
      '   AND 1 = 2'
      '')
    Left = 62
    Top = 362
    object sdqAcusesCE_BENEFICIARIO: TStringField
      FieldName = 'CE_BENEFICIARIO'
      Required = True
      Size = 100
    end
    object sdqAcusesDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqAcusesSO_CPOSTAL: TStringField
      FieldName = 'SO_CPOSTAL'
      Size = 5
    end
    object sdqAcusesSO_LOCALIDAD: TStringField
      FieldName = 'SO_LOCALIDAD'
      Size = 60
    end
    object sdqAcusesPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqAcusesCE_ORDENPAGO: TFloatField
      FieldName = 'CE_ORDENPAGO'
      Required = True
    end
    object sdqAcusesCE_METODOPAGO: TStringField
      FieldName = 'CE_METODOPAGO'
      Size = 80
    end
    object sdqAcusesSO_FECHAALTA: TDateTimeField
      FieldName = 'SO_FECHAALTA'
    end
  end
  object sdqSituaciones: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE='#39'SITCH'#39
      '   AND TB_CODIGO<>'#39'0'#39
      '   AND TB_FECHABAJA IS NULL'
      ' ORDER BY TB_DESCRIPCION')
    Left = 343
    Top = 94
  end
  object dsSituaciones: TDataSource
    DataSet = sdqSituaciones
    Left = 371
    Top = 94
  end
  object sdqMetodoPagoFiltro: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      
        '  SELECT DISTINCT NULL CHECK_STOCK_ID, ACS.ATTRIBUTE2 DESCRIPTIO' +
        'N, NULL BANK_ACCOUNT_NUM,'
      '         NULL ID_CUENTA'
      '    FROM AP_CHECK_STOCKS_ALL ACS'
      '   WHERE ACS.INACTIVE_DATE IS NULL'
      '     AND ACS.ATTRIBUTE2 IS NOT NULL'
      'ORDER BY DESCRIPTION'
      ''
      ' '
      ' ')
    Left = 140
    Top = 94
  end
  object dsMetodoPagoFiltro: TDataSource
    DataSet = sdqMetodoPagoFiltro
    Left = 168
    Top = 94
  end
  object mnuCargaAcuses: TPopupMenu
    Left = 122
    Top = 297
    object mnuAcusesCargaIndividual: TMenuItem
      Caption = 'Carga Individual'
      OnClick = DoCargaAcuses
    end
    object mnuAcusesCargaMasiva: TMenuItem
      Caption = 'Carga Masiva por C'#243'd. Barras'
      OnClick = DoCargaAcuses
    end
  end
end
