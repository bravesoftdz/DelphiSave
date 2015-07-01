inherited frmManPerfiles: TfrmManPerfiles
  Left = 551
  Top = 371
  Width = 450
  Height = 419
  Caption = 'Mantenimiento de Perfiles de Usuarios'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 450
  Font.Name = 'Tahoma'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TRxDBGrid [0]
    Left = 0
    Top = 30
    Width = 442
    Height = 362
    Align = alClient
    DataSource = dsDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    IniStorage = FormPlacement
    TitleButtons = True
    OnGetCellParams = DBGridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'PF_PERFIL'
        Title.Caption = 'C'#243'digo'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 233
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOS'
        Title.Caption = 'Usuarios Activos'
        Width = 88
        Visible = True
      end>
  end
  object CoolBar1: TCoolBar [1]
    Left = 0
    Top = 0
    Width = 442
    Height = 30
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 27
        Width = 438
      end>
    ParentShowHint = False
    ShowHint = True
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 425
      Height = 27
      Align = alNone
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = frmPrincipal.ImgColor2
      Images = frmPrincipal.imgBN2
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 5
        OnClick = tbRefrescarClick
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'tbSep1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbNuevo: TToolButton
        Left = 31
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        DropdownMenu = pmnuNuevos
        ImageIndex = 2
        Style = tbsDropDown
        OnClick = tbNuevoClick
      end
      object tbModificar: TToolButton
        Left = 69
        Top = 0
        Hint = 'Modificar (Enter)'
        ImageIndex = 3
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 92
        Top = 0
        Hint = 'Eliminar (Sup)'
        ImageIndex = 4
        OnClick = tbEliminarClick
      end
      object ToolButton11: TToolButton
        Left = 115
        Top = 0
        Width = 8
        Caption = 'tbSep2'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbOrdenar: TToolButton
        Left = 123
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 6
        OnClick = tbOrdenarClick
      end
      object ToolButton5: TToolButton
        Left = 146
        Top = 0
        Width = 8
        Caption = 'tbSep3'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbBuscar: TToolButton
        Left = 154
        Top = 0
        Hint = 'Buscar (F3)'
        Caption = 'tbBuscar'
        ImageIndex = 13
        OnClick = tbBuscarClick
      end
      object ToolButton4: TToolButton
        Left = 177
        Top = 0
        Width = 8
        Caption = 'tbSep4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 185
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        ImageIndex = 8
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 208
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 7
        OnClick = tbImprimirClick
      end
      object ToolButton3: TToolButton
        Left = 231
        Top = 0
        Width = 8
        Caption = 'tbSep5'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 239
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 0
        OnClick = tbSalirClick
      end
      object Panel1: TPanel
        Left = 262
        Top = 0
        Width = 136
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkBajas: TCheckBox
          Left = 12
          Top = 4
          Width = 124
          Height = 17
          Caption = 'No ver dados de baja'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkBajasClick
        end
      end
    end
  end
  object fpPermisos: TFormPanel [2]
    Left = 148
    Top = 204
    Width = 401
    Height = 221
    Caption = 'Permisos del Perfil'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu, biMaximize]
    Position = poScreenCenter
    object tvPermisos: TTreeView
      Left = 0
      Top = 0
      Width = 401
      Height = 221
      Align = alClient
      AutoExpand = True
      BevelWidth = 0
      Images = frmPrincipal.ImgPermisos
      Indent = 19
      RightClickSelect = True
      TabOrder = 0
      OnChanging = tvPermisosChanging
      OnDblClick = tvPermisosDblClick
      OnDeletion = tvPermisosDeletion
      OnEditing = tvPermisosEditing
      OnExpanding = tvPermisosExpanding
    end
  end
  object fpABM: TFormPanel [3]
    Left = 168
    Top = 56
    Width = 449
    Height = 165
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    OnClose = fpABMClose
    Constraints.MinWidth = 200
    DesignSize = (
      449
      165)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 8
      Top = 36
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 132
      Width = 441
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 56
      Width = 441
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object edCodigo: TPatternEdit
      Left = 72
      Top = 4
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 8
      TabOrder = 0
      ExcludePattern = ' %'#39
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 32
      Width = 373
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 1
    end
    object btnABMAceptar: TButton
      Left = 292
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnABMAceptarClick
    end
    object btnABMCancelar: TButton
      Left = 370
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object btnPermisos: TButton
      Left = 4
      Top = 136
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Permisos'
      TabOrder = 3
      OnClick = btnPermisosClick
    end
    object pnlSeguridad: TPanel
      Left = 4
      Top = 60
      Width = 441
      Height = 69
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        441
        69)
      object Label3: TLabel
        Left = 4
        Top = 2
        Width = 48
        Height = 13
        Caption = 'Seguridad'
      end
      inline fraPerfilesCopia: TfraPerfiles
        Left = 140
        Top = 44
        Width = 301
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          301
          22)
        inherited cmbDescripcion: TArtComboBox
          Width = 217
        end
      end
      object rbCopia: TRadioButton
        Left = 68
        Top = 48
        Width = 69
        Height = 17
        Caption = 'Copiar de'
        TabOrder = 1
        OnClick = rbSeguridadClick
      end
      object rbHabilitado: TRadioButton
        Left = 68
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Todo Habilitado'
        TabOrder = 2
        OnClick = rbSeguridadClick
      end
      object rbNegado: TRadioButton
        Left = 68
        Top = 0
        Width = 113
        Height = 17
        Caption = 'Todo Negado'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rbSeguridadClick
      end
    end
  end
  object fpBusqueda: TFormPanel [4]
    Left = 144
    Top = 300
    Width = 453
    Height = 93
    Caption = 'Buscar Usuario'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsSingle
    Position = poScreenCenter
    ActiveControl = fraPerfilesBusq.edCodigo
    DesignSize = (
      453
      93)
    object Bevel3: TBevel
      Left = 4
      Top = 60
      Width = 445
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object btnBuscCancelar: TButton
      Left = 372
      Top = 64
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object btnBuscBuscar: TButton
      Left = 292
      Top = 64
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Buscar'
      ModalResult = 1
      TabOrder = 4
    end
    inline fraPerfilesBusq: TfraPerfiles
      Left = 72
      Top = 8
      Width = 377
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        377
        22)
      inherited cmbDescripcion: TArtComboBox
        Width = 293
      end
    end
    object rbPerfil: TRadioButton
      Left = 8
      Top = 12
      Width = 57
      Height = 17
      Caption = '&Perfil'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbBusquedaClick
    end
    object rbUsuario: TRadioButton
      Left = 8
      Top = 40
      Width = 57
      Height = 17
      Caption = '&Usuario'
      TabOrder = 2
      OnClick = rbBusquedaClick
    end
    inline fraUsuarioBusq: TfraUsuario
      Left = 72
      Top = 36
      Width = 377
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 3
      DesignSize = (
        377
        21)
      inherited cmbDescripcion: TArtComboBox
        Width = 293
      end
    end
  end
  inherited FormStorage: TFormStorage
    Left = 20
    Top = 144
  end
  inherited XPMenu: TXPMenu
    Left = 48
    Top = 144
  end
  inherited ilByN: TImageList
    Left = 20
    Top = 172
  end
  inherited ilColor: TImageList
    Left = 48
    Top = 172
  end
  inherited IconosXP: TImageList
    Left = 76
    Top = 172
  end
  object Seguridad: TSeguridad
    AfterExecute = SeguridadAfterExecute
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 20
    Top = 116
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 48
    Top = 116
  end
  object pmnuAcciones: TPopupMenu
    OwnerDraw = True
    Left = 156
    Top = 236
    object mnuActivar: TMenuItem
      Caption = 'Activar'
      ImageIndex = 2
      OnClick = mnuActivarClick
    end
    object mnuDesactivar: TMenuItem
      Caption = 'Desactivar'
      ImageIndex = 3
      OnClick = mnuDesactivarClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuActivarTodos: TMenuItem
      Caption = 'Activar para Todos los Usuarios'
      OnClick = mnuActivarTodosClick
    end
    object mnuDesActivarTodos: TMenuItem
      Caption = 'Desactivar para Todos los Usuarios'
      OnClick = mnuDesActivarTodosClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuVer: TMenuItem
      Caption = 'Ver'
      object mnuVerUsuariosHab: TMenuItem
        Caption = 'Usuarios Habilitados'
      end
      object mnuVerUsuariosDes: TMenuItem
        Caption = 'Usuarios Deshabilitados'
      end
    end
  end
  object pmnuRefrescar: TPopupMenu
    OwnerDraw = True
    Left = 184
    Top = 236
    object mnuRefrescar: TMenuItem
      Caption = 'Refrescar'
      ImageIndex = 5
      OnClick = mnuRefrescarClick
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      
        '  SELECT pf_perfil, pf_descripcion, pf_fechabaja, SUM(DECODE(se_' +
        'usuario, NULL, '#39'0'#39', '#39'1'#39')) usuarios'
      '    FROM art.use_usuarios, art.upf_perfiles'
      '   WHERE se_perfil(+) = pf_perfil'
      '     AND se_fechabaja(+) IS NULL'
      'GROUP BY pf_perfil, pf_descripcion, pf_fechabaja')
    Left = 20
    Top = 52
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 48
    Top = 52
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 20
    Top = 80
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        OnShortCutPress = tbNuevoClick
        LinkControl = tbNuevo
      end
      item
        Key = 13
        OnShortCutPress = tbModificarClick
        LinkControl = tbModificar
      end
      item
        Key = 46
        OnShortCutPress = tbEliminarClick
        LinkControl = tbEliminar
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 114
        OnShortCutPress = tbBuscarClick
        LinkControl = tbBuscar
      end
      item
        Key = 16453
        OnShortCutPress = tbExportarClick
        LinkControl = tbExportar
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 48
    Top = 80
  end
  object pmnuNuevos: TPopupMenu
    OwnerDraw = True
    Left = 76
    Top = 52
    object mnuNuevoUsuario: TMenuItem
      Caption = 'Nuevo Usuario'
      ImageIndex = 2
      OnClick = tbNuevoClick
    end
    object mnuCrearCopia: TMenuItem
      Caption = 'Crear Copia'
      ImageIndex = 3
      OnClick = tbNuevoClick
    end
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <
      item
        DataField = 'PF_PERFIL'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'PF_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'PF_FECHABAJA'
        Title = 'Fecha de Baja'
      end>
    IniStorage = FormPlacement
    OutputFile = 'Perfiles'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    RemoveCR = True
    RemoveLF = True
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 76
    Top = 80
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'PF_PERFIL'
        TotalType = ttCount
        MaxLength = 15
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'PF_DESCRIPCION'
        MaxLength = 112
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Perfiles'
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
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 11184810
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWhite
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = [fsBold]
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    OnGetCellParams = QueryPrintGetCellParams
    Left = 76
    Top = 116
  end
end
