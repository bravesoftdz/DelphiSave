object frmContratoSRT: TfrmContratoSRT
  Left = 208
  Top = 109
  Width = 771
  Height = 458
  Caption = 'S.R.T'
  Color = clBtnFace
  Constraints.MinHeight = 458
  Constraints.MinWidth = 771
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  DesignSize = (
    763
    432)
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 763
    Height = 30
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl -  N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tblSeparador1: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbGuardar: TToolButton
      Left = 28
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object ToolButton1: TToolButton
      Left = 74
      Top = 0
      Width = 5
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbSRT: TToolButton
      Left = 79
      Top = 0
      Hint = 'Obtener datos desde la SRT'
      ImageIndex = 17
      OnClick = tbSRTClick
    end
    object tblSeparador2: TToolButton
      Left = 102
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbImprimir: TToolButton
      Left = 107
      Top = 0
      Hint = 'Imprimir (Ctrl-I)'
      Caption = 'tlbImprimir'
      ImageIndex = 4
      OnClick = tlbImprimirClick
    end
    object ToolButton3: TToolButton
      Left = 130
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 138
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      Wrap = True
      OnClick = tlbSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 6
    Top = 74
    Width = 753
    Height = 178
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = sdDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = ArtDBGridCellClick
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'AR_NOMBRE'
        Title.Caption = 'Descripci'#243'n'
        Width = 281
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_VIGENCIADESDE'
        Title.Caption = 'Vig.Desde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_VIGENCIAHASTA'
        Title.Caption = 'Vig.Hasta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Operaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_NIVEL'
        Title.Caption = 'Nivel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_IDACTIVIDAD1'
        Title.Caption = 'Actividad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_FECHAEXTINCION'
        Title.Caption = 'F.Extinci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_FECHAREGULARIZACION'
        Title.Caption = 'F.Regularizaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IS_IDACTIVIDAD2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IS_IDACTIVIDAD3'
        Visible = False
      end>
  end
  object grbIdentifica: TGroupBox
    Left = 0
    Top = 255
    Width = 763
    Height = 177
    Align = alBottom
    Caption = 'S.R.T'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      763
      177)
    object lbART: TLabel
      Left = 52
      Top = 28
      Width = 22
      Height = 13
      Caption = 'ART'
    end
    object lbContrato: TLabel
      Left = 623
      Top = 28
      Width = 43
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Solicitud:'
    end
    object lbIS_VIGENCIADESDE: TLabel
      Left = 21
      Top = 54
      Width = 52
      Height = 13
      Caption = 'Vig. Desde'
    end
    object lbVigHasta: TLabel
      Left = 171
      Top = 54
      Width = 49
      Height = 13
      Caption = 'Vig. Hasta'
    end
    object lbOperacion: TLabel
      Left = 316
      Top = 54
      Width = 49
      Height = 13
      Caption = 'Operaci'#243'n'
    end
    object Label1: TLabel
      Left = 640
      Top = 54
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nivel'
    end
    object lbActividadUno: TLabel
      Left = 24
      Top = 79
      Width = 50
      Height = 13
      Caption = 'Actividad I'
    end
    object lbActividadDos: TLabel
      Left = 21
      Top = 104
      Width = 53
      Height = 13
      Caption = 'Actividad II'
    end
    object lbActividadTres: TLabel
      Left = 18
      Top = 129
      Width = 56
      Height = 13
      Caption = 'Actividad III'
    end
    object lbFechaExtincion: TLabel
      Left = 19
      Top = 154
      Width = 55
      Height = 13
      Caption = 'F. Extinci'#243'n'
    end
    object lbFRegularizacion: TLabel
      Left = 283
      Top = 154
      Width = 82
      Height = 13
      Caption = 'F. Regularizaci'#243'n'
    end
    object edIS_IDFORMULARIO: TIntEdit
      Left = 668
      Top = 24
      Width = 90
      Height = 21
      Anchors = [akRight]
      Color = clWhite
      ReadOnly = True
      TabOrder = 0
    end
    object edIS_VIGENCIADESDE: TDateComboBox
      Left = 79
      Top = 50
      Width = 88
      Height = 21
      MaxDateCombo = edIS_VIGENCIAHASTA
      TabOrder = 1
    end
    object edIS_VIGENCIAHASTA: TDateComboBox
      Left = 223
      Top = 50
      Width = 88
      Height = 21
      MinDateCombo = edIS_VIGENCIADESDE
      TabOrder = 2
    end
    inline fraIS_OPERACION: TfraCtbTablas
      Left = 367
      Top = 48
      Width = 235
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 182
      end
    end
    inline fraIS_IDACTIVIDAD1: TfraActividad
      Left = 78
      Top = 74
      Width = 681
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Width = 632
      end
    end
    inline fraIS_IDACTIVIDAD2: TfraActividad
      Left = 78
      Top = 99
      Width = 681
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Width = 632
      end
    end
    inline fraIS_IDACTIVIDAD3: TfraActividad
      Left = 78
      Top = 124
      Width = 681
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 632
      end
    end
    object edIS_FECHAEXTINCION: TDateComboBox
      Left = 78
      Top = 150
      Width = 88
      Height = 21
      TabOrder = 8
    end
    object edIS_FECHAREGULARIZACION: TDateComboBox
      Left = 367
      Top = 150
      Width = 88
      Height = 21
      TabOrder = 9
    end
    object edIS_NIVEL: TPatternEdit
      Left = 669
      Top = 50
      Width = 27
      Height = 21
      Anchors = [akRight]
      MaxLength = 1
      TabOrder = 4
      Pattern = '1234'
    end
    inline fraIS_ART: TfraCodigoDescripcion
      Left = 80
      Top = 22
      Width = 530
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      inherited cmbDescripcion: TArtComboBox
        Left = 43
        Width = 479
      end
      inherited edCodigo: TPatternEdit
        Width = 39
      end
    end
  end
  object grbEmpresa: TGroupBox
    Left = 6
    Top = 30
    Width = 643
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      643
      43)
    object lbCUIT: TLabel
      Left = 68
      Top = 18
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbRazonSocial: TLabel
      Left = 180
      Top = 18
      Width = 63
      Height = 13
      Caption = 'Raz'#243'n Social'
    end
    object edCUIT: TMaskEdit
      Left = 97
      Top = 14
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edRazonSocial: TEdit
      Left = 246
      Top = 14
      Width = 392
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object grbSolicitud: TGroupBox
    Left = 653
    Top = 30
    Width = 107
    Height = 42
    Anchors = [akTop, akRight]
    Caption = 'Contrato'
    TabOrder = 4
    DesignSize = (
      107
      42)
    object edCO_CONTRATO: TEdit
      Left = 6
      Top = 13
      Width = 94
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT IS_ID, IS_IDART, AR_NOMBRE, IS_CONTRATO, IS_VIGENCIADESDE' +
        ','
      'IS_VIGENCIAHASTA, T2.TB_DESCRIPCION, IS_NIVEL,'
      'IS_IDACTIVIDAD1, IS_IDACTIVIDAD2, IS_IDACTIVIDAD3,'
      'IS_FECHAEXTINCION, IS_FECHAREGULARIZACION, CO_IDFORMULARIO,'
      'IS_OPERACION, IS_USUBAJA, IS_FECHABAJA'
      'FROM AIS_INFORMACIONSRT, CTB_TABLAS T2, AAR_ART, ACO_CONTRATO'
      'WHERE T2.TB_CLAVE = '#39'COPER'#39
      'AND IS_OPERACION = T2.TB_CODIGO'
      'AND IS_IDART = AR_ID'
      'AND IS_IDFORMULARIO = CO_IDFORMULARIO'
      'AND CO_CONTRATO = :CodigoContrato')
    Left = 14
    Top = 110
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodigoContrato'
        ParamType = ptInput
      end>
  end
  object sdDatos: TDataSource
    DataSet = sdqDatos
    Left = 42
    Top = 110
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16455
        LinkControl = tlbGuardar
      end
      item
        Key = 16462
        LinkControl = tlbNuevo
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end
      item
        Key = 16457
        LinkControl = tlbImprimir
      end
      item
        Key = 16463
      end
      item
        Key = 16468
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16463
      end
      item
        Key = 16453
      end>
    Left = 13
    Top = 149
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = sdDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 101
    Top = 91
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Left = 136
    Top = 88
  end
end
