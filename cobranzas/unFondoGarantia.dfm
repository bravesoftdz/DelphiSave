inherited frmFondoGarantia: TfrmFondoGarantia
  Left = 13
  Top = 46
  Caption = 'Consulta del Fondo de Garant'#237'a'
  ClientHeight = 440
  ClientWidth = 770
  Constraints.MinHeight = 470
  Constraints.MinWidth = 778
  OldCreateOrder = True
  ExplicitLeft = 13
  ExplicitTop = 46
  ExplicitWidth = 778
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 770
    Height = 138
    ExplicitWidth = 770
    ExplicitHeight = 138
    DesignSize = (
      770
      138)
    object gbEmpresa: TGroupBox
      Left = 2
      Top = 1
      Width = 635
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 0
      DesignSize = (
        635
        45)
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraFG_CONTRATO: TfraEmpresa
        Left = 36
        Top = 18
        Width = 589
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
        ExplicitLeft = 36
        ExplicitTop = 18
        ExplicitWidth = 589
        ExplicitHeight = 21
        DesignSize = (
          589
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 485
          ExplicitLeft = 485
        end
        inherited edContrato: TIntEdit
          Left = 532
          ExplicitLeft = 532
        end
        inherited cmbRSocial: TArtComboBox
          Width = 350
          ExplicitWidth = 350
        end
      end
    end
    object gbPeriodo: TGroupBox
      Left = 640
      Top = 1
      Width = 129
      Height = 45
      Anchors = [akTop, akRight]
      Caption = ' Per'#237'odo '
      TabOrder = 1
      object Label3: TLabel
        Left = 59
        Top = 22
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
      object edFG_PERIODODesde: TPeriodoPicker
        Left = 7
        Top = 18
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205511'
        Periodo.MinPeriodo = '195512'
        WidthMes = 19
        Separation = 0
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
      object edFG_PERIODOHasta: TPeriodoPicker
        Left = 73
        Top = 18
        Width = 49
        Height = 21
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205511'
        Periodo.MinPeriodo = '195512'
        WidthMes = 19
        Separation = 0
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
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 91
      Width = 495
      Height = 45
      TabOrder = 5
      object chkFG_ESTADO: TCheckBox
        Left = 9
        Top = 17
        Width = 81
        Height = 17
        Caption = 'Solo Activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkFG_PAGOSAFIP: TCheckBox
        Left = 91
        Top = 17
        Width = 122
        Height = 17
        Caption = 'Solo con Pagos AFIP'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkFG_PAGOSFONDOGTIA: TCheckBox
        Left = 215
        Top = 17
        Width = 98
        Height = 17
        Caption = 'Sin Pagos al FG'
        TabOrder = 2
      end
      object chkFG_AJUSTES: TCheckBox
        Left = 314
        Top = 17
        Width = 73
        Height = 17
        Caption = 'Sin Ajustes'
        TabOrder = 3
      end
      object chkFG_DEBITOS: TCheckBox
        Left = 391
        Top = 17
        Width = 101
        Height = 17
        Caption = 'Sin D'#233'bitos AFIP'
        TabOrder = 4
      end
    end
    object gbMotivoBaja: TGroupBox
      Left = 2
      Top = 46
      Width = 390
      Height = 45
      Caption = ' Motivo de Baja'
      TabOrder = 2
      DesignSize = (
        390
        45)
      object cmbMotivosBaja: TDBCheckCombo
        Left = 7
        Top = 15
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsMotBaja
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object GroupBox2: TGroupBox
      Left = 395
      Top = 46
      Width = 242
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Sector'
      TabOrder = 3
      DesignSize = (
        242
        45)
      object cmbSectores: TDBCheckCombo
        Left = 7
        Top = 15
        Width = 229
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsSector
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object GroupBox3: TGroupBox
      Left = 640
      Top = 46
      Width = 129
      Height = 45
      Anchors = [akTop, akRight, akBottom]
      Caption = ' Per. Fecha Contable'
      TabOrder = 4
      object edPerFechaContable: TPeriodoPicker
        Left = 36
        Top = 16
        Width = 49
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205511'
        Periodo.MinPeriodo = '195512'
        WidthMes = 19
        Separation = 0
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
    end
    object GroupBox4: TGroupBox
      Left = 500
      Top = 91
      Width = 214
      Height = 45
      Caption = ' Importe a Pagar'
      TabOrder = 6
      object Label2: TLabel
        Left = 100
        Top = 19
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
      object edIMPORTE_A_PAGARDesde: TCurrencyEdit
        Left = 8
        Top = 16
        Width = 88
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        TabOrder = 0
      end
      object edIMPORTE_A_PAGARHasta: TCurrencyEdit
        Left = 117
        Top = 16
        Width = 88
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 138
    Width = 770
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 764
      end>
    ExplicitTop = 138
    ExplicitWidth = 770
    inherited ToolBar: TToolBar
      Width = 755
      ExplicitWidth = 755
      inherited tbNuevo: TToolButton
        Hint = 'Pagar (Ctrl+P)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAgregarContratos: TToolButton
        Left = 370
        Top = 0
        Hint = 'Agregar Contratos (Ctrl+A)'
        ImageIndex = 21
        OnClick = tbAgregarContratosClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 401
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 432
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 167
    Width = 770
    Height = 273
    PopupMenu = mnuSeleccion
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 208
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIGENCIA_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MBAJADESCR'
        Title.Caption = 'Motivo Baja'
        Width = 175
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO_COBERTURA_SRT'
        Title.Alignment = taCenter
        Title.Caption = 'Per. Cobertura SRT'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLEADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Empleados'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVENGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Devengado'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS_AFIP'
        Title.Alignment = taCenter
        Title.Caption = 'Pagos AFIP'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS_MANUALES'
        Title.Alignment = taCenter
        Title.Caption = 'Pagos Manuales'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RECAUDACION'
        Title.Alignment = taCenter
        Title.Caption = 'Recaudaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS_FONDO'
        Title.Alignment = taCenter
        Title.Caption = 'Pagos Fondo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS_FONDO_GARANTIA'
        Title.Alignment = taCenter
        Title.Caption = 'Pagos Fondo Gt'#237'a.'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITOS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bitos'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE_RECHAZADO'
        Title.Alignment = taCenter
        Title.Caption = 'Cheque Rech.'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AJUSTES'
        Title.Alignment = taCenter
        Title.Caption = 'Ajustes'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANULA_DEVENGADO_MANUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Anula Dev. Manual'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE_A_PAGAR'
        Title.Alignment = taCenter
        Title.Caption = 'Imp. a Pagar'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTERECLAMADO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Reclamado AFIP'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AJSALDOACREEDOR'
        Title.Alignment = taCenter
        Title.Caption = 'Aj. Saldo Acreedor'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIENENOMINA'
        Title.Alignment = taCenter
        Title.Caption = 'DDJJ'
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FCONTABLE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Contable AFIP'
        Width = 87
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT FG_CONTRATO CONTRATO, FG_NOMBRE NOMBRE, FG_CUIT CUIT, SEC' +
        'T.TB_DESCRIPCION SECTOR, '
      
        '       FG_VIGENCIADESDE VIGENCIA_DESDE, EST.TB_DESCRIPCION ESTAD' +
        'O, FG_FECHABAJA FECHA_BAJA, '
      
        '       FG_PERIODO PERIODO, FG_PERIODOCOBERTURASRT PERIODO_COBERT' +
        'URA_SRT, FG_EMPLEADOS EMPLEADOS, '
      
        '       FG_DEVENGADO DEVENGADO, FG_SALDO SALDO, FG_PAGOSAFIP PAGO' +
        'S_AFIP, FG_PAGOSMANUALES PAGOS_MANUALES,'
      
        '       FG_RECAUDACION RECAUDACION, FG_PAGOSFONDO PAGOS_FONDO, FG' +
        '_PAGOSFONDOGTIA PAGOS_FONDO_GARANTIA, '
      
        '       FG_DEBITOS DEBITOS, FG_CHEQUERECHAZADO CHEQUE_RECHAZADO, ' +
        'FG_AJUSTES AJUSTES, '
      
        '       FG_ANULADEVENGADOMANUAL ANULA_DEVENGADO_MANUAL, FG_DIAS D' +
        'IAS, FG_IMPORTEAPAGAR IMPORTE_A_PAGAR'
      '  FROM CTB_TABLAS EST, CTB_TABLAS SECT, V_ZFG_FONDOGARANTIA'
      ' WHERE SECT.TB_CODIGO = FG_SECTOR'
      '   AND SECT.TB_CLAVE = '#39'SECT'#39
      '   AND EST.TB_CODIGO = FG_ESTADO'
      '   AND EST.TB_CLAVE = '#39'AFEST'#39
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 85
    Options = [qoZoomPrint, qoZoomCalcFontSize]
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16464
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
        LinkControl = tbAgregarContratos
      end>
    Left = 112
    Top = 200
  end
  object mnuSeleccion: TPopupMenu
    Left = 147
    Top = 201
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object sdqMotBaja: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CODIGO <> '#39'0'#39
      '   AND TB_CLAVE = '#39'MOTIB'#39' '
      ' ORDER BY TB_DESCRIPCION'
      ' ')
    Left = 99
    Top = 52
  end
  object dsMotBaja: TDataSource
    DataSet = sdqMotBaja
    Left = 127
    Top = 52
  end
  object sdqSector: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CODIGO <> '#39'0'#39
      '   AND TB_CLAVE = '#39'SECT'#39' '
      ' ORDER BY TB_DESCRIPCION'
      ' ')
    Left = 459
    Top = 52
  end
  object dsSector: TDataSource
    DataSet = sdqSector
    Left = 487
    Top = 52
  end
end
