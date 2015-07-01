object frmContratoVendedor: TfrmContratoVendedor
  Left = 200
  Top = 106
  BorderIcons = [biSystemMenu]
  Caption = 'Contrato Vendedores'
  ClientHeight = 347
  ClientWidth = 692
  Color = clBtnFace
  Constraints.MaxHeight = 377
  Constraints.MinHeight = 377
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    692
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 692
    Height = 26
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tlbGuardar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tblSeparador1: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbNuevo: TToolButton
      Left = 28
      Top = 0
      Hint = 'Nuevo (Ctrl-N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tblSeparador2: TToolButton
      Left = 74
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbCerrarVigencia: TToolButton
      Left = 79
      Top = 0
      Hint = 'Cerrar Vigencia (Ctrl-C)'
      Caption = 'tlbCerrarVigencia'
      ImageIndex = 22
      OnClick = tlbCerrarVigenciaClick
    end
    object tbSeparador3: TToolButton
      Left = 102
      Top = 0
      Width = 5
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbOrdenar: TToolButton
      Left = 107
      Top = 0
      Caption = 'tlbOrdenar'
      ImageIndex = 2
      OnClick = tlbOrdenarClick
    end
    object tlbImprimir: TToolButton
      Left = 130
      Top = 0
      Hint = 'Imprimir (Ctrl-I)'
      Caption = 'tlbImprimir'
      ImageIndex = 4
      OnClick = tlbImprimirClick
    end
    object tbSeparador4: TToolButton
      Left = 153
      Top = 0
      Width = 8
      Caption = 'tbSeparador4'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbVendedorPrincipal: TToolButton
      Left = 161
      Top = 0
      Hint = 'Vendedor Principal'
      ImageIndex = 26
      Visible = False
      OnClick = tbVendedorPrincipalClick
    end
    object tbVendedorVisible: TToolButton
      Left = 184
      Top = 0
      Hint = 'Visible'
      ImageIndex = 13
      Visible = False
      OnClick = tbVendedorVisibleClick
    end
    object ToolButton3: TToolButton
      Left = 207
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
      Visible = False
    end
    object tlbSalir: TToolButton
      Left = 215
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
    object Panel2: TPanel
      Left = 238
      Top = 0
      Width = 260
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object chkMostrarActivos: TCheckBox
        Left = 12
        Top = 2
        Width = 243
        Height = 17
        Caption = 'Mostrar solo vendedores activos y en vigencia'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = chkMostrarActivosClick
      end
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 0
    Top = 28
    Width = 679
    Height = 197
    Anchors = [akLeft, akTop, akRight]
    DataSource = sdDatos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = ArtDBGridCellClick
    IniStorage = FormStorage
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Caption = 'Entidad de Referencia'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Nombre Entidad'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'digo de vendedor'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Nombre del vendedor'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VC_PORCCOMISION'
        Title.Alignment = taCenter
        Title.Caption = 'Porcentaje'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VC_VIGENCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia desde'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VC_VIGENCIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia hasta'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRCONCEPTO'
        Title.Caption = 'Concepto'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRSUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VC_PRINCIPAL'
        Title.Alignment = taCenter
        Title.Caption = 'Principal'
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VC_VISIBLE'
        Title.Alignment = taCenter
        Title.Caption = 'Visible'
        Width = 47
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = -1
    Top = 227
    Width = 681
    Height = 110
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      681
      110)
    object Label2: TLabel
      Left = 14
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label1: TLabel
      Left = 14
      Top = 38
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Label3: TLabel
      Left = 14
      Top = 90
      Width = 51
      Height = 13
      Caption = 'Porcentaje'
    end
    object Label4: TLabel
      Left = 141
      Top = 90
      Width = 73
      Height = 13
      Caption = 'Vigencia desde'
    end
    object Label5: TLabel
      Left = 293
      Top = 90
      Width = 70
      Height = 13
      Caption = 'Vigencia hasta'
    end
    object Label9: TLabel
      Left = 14
      Top = 65
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label10: TLabel
      Left = 359
      Top = 65
      Width = 41
      Height = 13
      Caption = 'Sucursal'
    end
    inline fraEntidad: TfraEntidades
      Left = 68
      Top = 7
      Width = 607
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 68
      ExplicitTop = 7
      ExplicitWidth = 607
      DesignSize = (
        607
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 542
        ExplicitWidth = 542
      end
    end
    inline fraVendedor: TfraVendedores
      Left = 68
      Top = 33
      Width = 607
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 68
      ExplicitTop = 33
      ExplicitWidth = 607
      DesignSize = (
        607
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 542
        ExplicitWidth = 542
      end
    end
    object edVC_COMISION: TCurrencyEdit
      Left = 69
      Top = 86
      Width = 41
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      MaxLength = 10
      MaxValue = 100.000000000000000000
      TabOrder = 4
      ZeroEmpty = False
      OnChange = edVC_COMISIONChange
    end
    object edVC_VIGENCIADESDE: TPeriodoPicker
      Left = 220
      Top = 86
      Width = 53
      Height = 21
      TabOrder = 5
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 1
      Periodo.Ano = 2003
      Periodo.Valor = '200301'
      Periodo.MaxPeriodo = '205301'
      Periodo.MinPeriodo = '195302'
      WidthMes = 19
      Separation = 2
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edVC_VIGENCIAHASTA: TPeriodoPicker
      Left = 369
      Top = 86
      Width = 53
      Height = 21
      TabOrder = 6
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205301'
      Periodo.MinPeriodo = '195302'
      WidthMes = 19
      Separation = 2
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object btnCrearRelacion: TButton
      Left = 676
      Top = 9
      Width = 22
      Height = 19
      Hint = 'Crear Relaci'#243'n'
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      TabStop = False
      Visible = False
      OnClick = btnCrearRelacionClick
    end
    object chkVC_PLANPAGO: TCheckBox
      Left = 452
      Top = 104
      Width = 112
      Height = 17
      Caption = 'S'#243'lo plan de pago'
      Color = clRed
      ParentColor = False
      TabOrder = 8
      Visible = False
    end
    object chkVC_MANTENIMIENTO: TCheckBox
      Left = 580
      Top = 104
      Width = 94
      Height = 17
      Caption = 'Mantenimiento'
      Color = clRed
      ParentColor = False
      TabOrder = 9
      Visible = False
    end
    inline fraConcepto: TfraStaticCodigoDescripcion
      Left = 68
      Top = 59
      Width = 288
      Height = 23
      TabOrder = 2
      ExplicitLeft = 68
      ExplicitTop = 59
      ExplicitWidth = 288
      DesignSize = (
        288
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 225
        ExplicitWidth = 225
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
    inline fraSucursal: TfraSucursal
      Left = 404
      Top = 59
      Width = 270
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 404
      ExplicitTop = 59
      ExplicitWidth = 270
      DesignSize = (
        270
        23)
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 207
        ExplicitLeft = 64
        ExplicitWidth = 207
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'Entidad'
          'Centro Regional')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          0)
      end
    end
  end
  object fpCierreVigencia: TFormPanel
    Left = 60
    Top = 112
    Width = 167
    Height = 65
    Caption = 'Cierre de Vigencia'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 65
    Constraints.MaxWidth = 167
    Constraints.MinHeight = 65
    Constraints.MinWidth = 167
    DesignSize = (
      167
      65)
    object BevelAbm: TBevel
      Left = 5
      Top = 31
      Width = 158
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 48
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Vig. Hasta'
    end
    object btnAceptar: TButton
      Left = 12
      Top = 38
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 89
      Top = 38
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object edVC_VIGENCIAHASTA1: TPeriodoPicker
      Left = 102
      Top = 6
      Width = 57
      Height = 21
      TabOrder = 2
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 1
      Periodo.Ano = 2003
      Periodo.Valor = '200301'
      Periodo.MaxPeriodo = '205301'
      Periodo.MinPeriodo = '195302'
      WidthMes = 19
      Separation = 2
      ShowButton = False
      ShowOrder = poMesAno
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
  end
  object fpVendedor: TFormPanel
    Left = 436
    Top = 129
    Width = 310
    Height = 70
    Caption = 'Ingrese la Entidad que desea asociar al vendedor'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 70
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    DesignSize = (
      310
      70)
    object Bevel1: TBevel
      Left = 2
      Top = 11
      Width = 302
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label7: TLabel
      Left = 4
      Top = 10
      Width = 70
      Height = 13
      Caption = 'Entidad Banco'
    end
    object btnAceptarVendedor: TButton
      Left = 153
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarVendedorClick
    end
    object btnCancelarVendedor: TButton
      Left = 232
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarVendedorClick
    end
    inline fraEntidadVendedor: TfraEntidades
      Left = 78
      Top = 5
      Width = 228
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 78
      ExplicitTop = 5
      ExplicitWidth = 228
      DesignSize = (
        228
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 40
        Width = 188
        ExplicitLeft = 40
        ExplicitWidth = 188
      end
      inherited edCodigo: TPatternEdit
        Left = 0
        Width = 36
        ExplicitLeft = 0
        ExplicitWidth = 36
      end
    end
  end
  object fpNacion: TFormPanel
    Left = 240
    Top = 113
    Width = 183
    Height = 70
    Caption = 'Ingrese el vendedor'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 70
    Constraints.MinHeight = 70
    Constraints.MinWidth = 183
    OnEnter = fpNacionEnter
    DesignSize = (
      183
      70)
    object Bevel2: TBevel
      Left = 2
      Top = 11
      Width = 175
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label8: TLabel
      Left = 8
      Top = 10
      Width = 81
      Height = 13
      Caption = 'Nro de Vendedor'
    end
    object btnAceptarNacion: TButton
      Left = 26
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnAceptarNacionClick
    end
    object btnCancelarNacion: TButton
      Left = 105
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarNacionClick
    end
    object edVendedorNacion: TMaskEdit
      Left = 102
      Top = 6
      Width = 67
      Height = 21
      EditMask = '9999-99999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '    -     '
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT EN_ID, EN_CODBANCO, EN_NOMBRE, VE_ID, VE_VENDEDOR,'
      '       VE_NOMBRE, VC_ID, VC_PORCCOMISION, VC_VIGENCIADESDE,'
      '       VC_VIGENCIAHASTA, VC_FECHACIERRE, VC_FECHABAJA,'
      '       VC_USUBAJA, VC_USUCIERRE, VC_PLANPAGO'
      '  FROM XEN_ENTIDAD, XVE_VENDEDOR,'
      '       XEV_ENTIDADVENDEDOR, AVC_VENDEDORCONTRATO'
      ' WHERE EV_IDENTIDAD = EN_ID'
      '   AND VC_IDENTIDADVEND = EV_ID'
      '   AND EV_IDVENDEDOR = VE_ID'
      '   AND VC_CONTRATO = :VC_CONTRATO')
    Left = 15
    Top = 111
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VC_CONTRATO'
        ParamType = ptInput
      end>
  end
  object sdDatos: TDataSource
    DataSet = sdqConsulta
    Left = 43
    Top = 139
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
        Key = 16466
      end
      item
        Key = 16468
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16453
      end
      item
        Key = 16451
        LinkControl = tlbCerrarVigencia
      end>
    Left = 15
    Top = 139
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Left = 43
    Top = 167
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
    Left = 15
    Top = 167
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 43
    Top = 111
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 15
    Top = 195
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoPorcComisionAsignado'
      end
      item
        Name = 'VerInvisibles'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 104
    Top = 184
  end
  object sdspInsertarcomisgranorgnizador: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    SessionName = 'Default'
    StoredProcName = 'comision.do_insertarcomisgranorgnizador'
    Left = 43
    Top = 196
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idvendedorcontrato'
        ParamType = ptInput
      end>
  end
end
