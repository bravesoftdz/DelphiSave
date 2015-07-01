inherited frmTableroControl: TfrmTableroControl
  Caption = 'Tablero de Control'
  ClientHeight = 370
  ClientWidth = 692
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  ExplicitWidth = 700
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 104
    ExplicitWidth = 692
    ExplicitHeight = 104
    DesignSize = (
      692
      104)
    object gbPeriodo: TGroupBox
      Left = 139
      Top = 51
      Width = 129
      Height = 49
      Caption = 'Rango de  Periodos '
      TabOrder = 2
      object Label3: TLabel
        Left = 60
        Top = 24
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
      object edPeriodoDesde: TPeriodoPicker
        Left = 8
        Top = 20
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
      object edPeriodoHasta: TPeriodoPicker
        Left = 74
        Top = 20
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
      Left = 139
      Top = 3
      Width = 545
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuarios'
      TabOrder = 1
      DesignSize = (
        545
        49)
      object cmbUsuarios: TDBCheckCombo
        Left = 10
        Top = 16
        Width = 523
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsUsuarios
        KeyField = 'SE_USUARIO'
        ListField = 'SE_NOMBRE'
      end
    end
    object rgTipo: TRadioGroup
      Left = 7
      Top = 3
      Width = 126
      Height = 97
      Caption = 'Tipo de Estad'#237'stica'
      ItemIndex = 0
      Items.Strings = (
        'Por Usuario'
        'General')
      TabOrder = 0
      OnClick = rgTipoClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 104
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 104
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 133
    Width = 692
    Height = 237
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Usuario'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTREGALEGAJOS'
        Title.Alignment = taCenter
        Title.Caption = 'Entrega Leg.'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVOLUCLEGAJOS'
        Title.Alignment = taCenter
        Title.Caption = 'Devoluci'#243'n Leg.'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANCELACSOLICITUDES'
        Title.Alignment = taCenter
        Title.Caption = 'Cancelac. Solicitudes'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENVIOLOTESADMIN'
        Title.Alignment = taCenter
        Title.Caption = 'Env'#237'o Lotes Admin.'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGENESDIGITALIZ'
        Title.Alignment = taCenter
        Title.Caption = 'Im'#225'genes Digitaliz.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGDIGMESANT'
        Title.Alignment = taCenter
        Title.Caption = 'Im'#225'genes Digitaliz. Mes Ant.'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGDIGMESANTTERMINO'
        Title.Alignment = taCenter
        Title.Caption = 'Im'#225'genes Digitaliz. Mes Ant. en T'#233'rmino'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMAGDIGMES'
        Title.Alignment = taCenter
        Title.Caption = 'Im'#225'genes Digitaliz. del Mes'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTCAJASENTERMINO'
        Title.Alignment = taCenter
        Title.Caption = 'Cajas en T'#233'rmino'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTCAJASFUERATERMINO'
        Title.Alignment = taCenter
        Title.Caption = 'Cajas Fuera T'#233'rmino'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTCAJASTOTALES'
        Title.Alignment = taCenter
        Title.Caption = 'Cajas Totales'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAJASCOMPRADAS'
        Title.Alignment = taCenter
        Title.Caption = 'Cajas Compradas'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTBULTOS'
        Title.Alignment = taCenter
        Title.Caption = 'Bultos Enviados Admin.'
        Width = 119
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CO_PERIODO PERIODO, SE_NOMBRE USUARIO, CO_ENTREGALEGAJOS ' +
        'ENTREGALEGAJOS, CO_DEVOLUCLEGAJOS DEVOLUCLEGAJOS,'
      
        '       CO_CANCELACSOLICITUDES CANCELACSOLICITUDES, CO_ENVIOLOTES' +
        'ADMIN ENVIOLOTESADMIN,'
      
        '       CO_IMAGENESDIGITALIZ IMAGENESDIGITALIZ, CO_CANTCAJASENTER' +
        'MINO CANTCAJASENTERMINO,'
      
        '       CO_CANTCAJASFUERATERMINO CANTCAJASFUERATERMINO, CO_CANTCA' +
        'JASTOTALES CANTCAJASTOTALES'
      '  FROM ARCHIVO.RCO_TABLEROCONTROL'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 80
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
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT SE_USUARIO, SE_NOMBRE || DECODE(SE_FECHABAJA, NULL, '#39#39', '#39 +
        ' (Dado de baja)'#39') SE_NOMBRE, SE_FECHABAJA'
      '  FROM USE_USUARIOS'
      ' WHERE SE_SECTOR = '#39'LSG'#39
      '   AND SE_USUARIOGENERICO = '#39'N'#39
      ' ORDER BY SE_NOMBRE')
    Left = 199
    Top = 16
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 227
    Top = 16
  end
  object ShortCutControl1: TShortCutControl
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
      end>
    Left = 113
    Top = 200
  end
end
