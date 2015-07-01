inherited frmManSectores: TfrmManSectores
  Left = 290
  Top = 185
  Width = 626
  Height = 474
  Caption = 'Mantenimiento de Sectores'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 420
  Font.Name = 'Tahoma'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TRxDBGrid [0]
    Left = 0
    Top = 29
    Width = 618
    Height = 418
    Align = alClient
    DataSource = dsDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        FieldName = 'SC_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USADO'
        Title.Caption = 'En uso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOS'
        Title.Caption = 'Usuarios'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_VISIBLE'
        Title.Caption = 'Visible'
        Width = 35
        Visible = True
      end>
  end
  object CoolBar1: TCoolBar [1]
    Left = 0
    Top = 0
    Width = 618
    Height = 29
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        Width = 614
      end>
    ParentShowHint = False
    ShowHint = True
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 601
      Height = 25
      Align = alNone
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
        Caption = 'ToolButton2'
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
        Left = 67
        Top = 0
        Hint = 'Modificar (Enter)'
        ImageIndex = 3
        OnClick = tbModificarClick
      end
      object tbEliminar: TToolButton
        Left = 90
        Top = 0
        Hint = 'Eliminar (Sup)'
        ImageIndex = 4
        OnClick = tbEliminarClick
      end
      object ToolButton11: TToolButton
        Left = 113
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbOrdenar: TToolButton
        Left = 121
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 6
        OnClick = tbOrdenarClick
      end
      object ToolButton5: TToolButton
        Left = 144
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbBuscar: TToolButton
        Left = 152
        Top = 0
        Hint = 'Buscar (F3)'
        Caption = 'tbBuscar'
        ImageIndex = 13
        OnClick = tbBuscarClick
      end
      object ToolButton4: TToolButton
        Left = 175
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 183
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        ImageIndex = 8
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 206
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 7
        OnClick = tbImprimirClick
      end
      object ToolButton3: TToolButton
        Left = 229
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 237
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 0
        OnClick = tbSalirClick
      end
      object Panel1: TPanel
        Left = 260
        Top = 0
        Width = 132
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkBajas: TCheckBox
          Left = 8
          Top = 4
          Width = 123
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
  object fpBusqueda: TFormPanel [2]
    Left = 12
    Top = 336
    Width = 453
    Height = 93
    Caption = 'Buscar Usuario'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsSingle
    Position = poScreenCenter
    ActiveControl = fraSectoresBusq.edCodigo
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
      Left = 297
      Top = 64
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 4
    end
    object rbSector: TRadioButton
      Left = 8
      Top = 12
      Width = 57
      Height = 17
      Caption = '&Sector'
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
      inherited cmbDescripcion: TArtComboBox
        Width = 293
      end
    end
    inline fraSectoresBusq: TfraSectores
      Left = 72
      Top = 8
      Width = 378
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 293
        Columns = <
          item
            Expanded = False
            FieldName = 'SC_CODIGO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SC_DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 200
            Visible = True
          end>
      end
    end
  end
  object fpAplicaciones: TFormPanel [3]
    Left = 8
    Top = 228
    Width = 325
    Height = 101
    Caption = 'Buscar Usuario'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    OnShow = fpAplicacionesShow
    ActiveControl = fraEjecutables.edCodigo
    DesignSize = (
      325
      101)
    object Bevel2: TBevel
      Left = 4
      Top = 60
      Width = 317
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 96
      Height = 13
      Caption = 'Aplicaci'#243'n o Sistema'
    end
    object btnAceptarAplicacion: TButton
      Left = 165
      Top = 68
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      OnClick = btnAceptarAplicacionClick
    end
    object btnCancelarAplicacion: TButton
      Left = 240
      Top = 68
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraEjecutables: TfraCodDesc
      Left = 8
      Top = 28
      Width = 309
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 244
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        FieldBaja = 'ej_fechabaja'
        FieldCodigo = 'ej_id'
        FieldDesc = 'ej_descripcion'
        FieldID = 'ej_id'
        IdType = ctInteger
        OrderBy = 'ej_descripcion'
        TableName = 'comunes.cej_ejecutable'
      end
    end
  end
  object fpABM: TFormPanel [4]
    Left = 180
    Top = 72
    Width = 405
    Height = 500
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    Constraints.MinWidth = 200
    DesignSize = (
      405
      500)
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
      Top = 467
      Width = 397
      Height = 5
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    object Label4: TLabel
      Left = 8
      Top = 92
      Width = 58
      Height = 13
      Hint = 'Estas son las aplicaciones que ve este sector en el Portal'
      Caption = 'Aplicaciones'
      ParentShowHint = False
      ShowHint = True
    end
    object Label5: TLabel
      Left = 14
      Top = 108
      Width = 45
      Height = 13
      Hint = 'Estas son las aplicaciones que ve este sector en el Portal'
      Caption = 'del Portal'
      ParentShowHint = False
      ShowHint = True
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
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 1
    end
    object btnABMAceptar: TButton
      Left = 251
      Top = 471
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
      TabOrder = 5
      OnClick = btnABMAceptarClick
    end
    object btnABMCancelar: TButton
      Left = 326
      Top = 471
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object btnUsuarios: TButton
      Left = 4
      Top = 471
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Usuarios'
      TabOrder = 3
      OnClick = btnUsuariosClick
    end
    object cmbDelegaciones: TArtComboBox
      Left = 72
      Top = 60
      Width = 329
      Height = 21
      DirectInput = False
      GlyphKind = gkDropDown
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'EL_ID'
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EL_NOMBRE'
          Title.Caption = 'Descripci'#243'n'
          Width = 300
          Visible = True
        end>
      DataSource = dsDelegaciones
      DropCount = 12
      FieldList = 'EL_NOMBRE'
      FieldKey = 'EL_ID'
    end
    object chkSistemaArchivo: TCheckBox
      Left = 84
      Top = 475
      Width = 157
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Utiliza el sistema de archivo'
      TabOrder = 4
    end
    object dbgAplicaciones: TJvDBGrid
      Left = 72
      Top = 88
      Width = 325
      Height = 372
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsAplicaciones
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AutoSizeColumns = True
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.RealNamesOption = '[With the real field name]'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'EJ_DESCRIPCION'
          Title.Caption = 'Sistema'
          Width = 320
          Visible = True
        end>
    end
    object btnAgregar: TButton
      Left = 8
      Top = 132
      Width = 61
      Height = 25
      Caption = 'Agregar'
      TabOrder = 8
      OnClick = btnAgregarClick
    end
    object btnRemover: TButton
      Left = 8
      Top = 160
      Width = 61
      Height = 25
      Caption = 'Remover'
      TabOrder = 9
      OnClick = btnRemoverClick
    end
    object chkVisible: TCheckBox
      Left = 140
      Top = 7
      Width = 157
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Visible'
      TabOrder = 10
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
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'SC_CODIGO'
        Title = 'C'#243'digo'
      end
      item
        DataField = 'SC_DESCRIPCION'
        Title = 'Descripci'#243'n'
      end
      item
        DataField = 'EL_NOMBRE'
        Title = 'Delegaci'#243'n'
      end>
    IniStorage = FormPlacement
    OutputFile = 'Sectores'
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
        DataField = 'SC_CODIGO'
        MaxLength = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'SC_DESCRIPCION'
        MaxLength = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'EL_NOMBRE'
        MaxLength = 0
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Sectores'
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
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = (
      
        'SELECT sc_codigo, sc_descripcion, sc_mostrar, sc_delegacion, el_' +
        'nombre, sc_fechabaja, sc_sistemaarchivo, sc_visible,'
      '       DECODE((SELECT -1'
      '                 FROM DUAL'
      '                WHERE EXISTS(SELECT 1'
      '                               FROM art.use_usuarios'
      '                              WHERE sc_codigo = se_sector'
      
        '                                AND se_fechabaja is null)), -1, ' +
        #39'SI'#39', '#39'NO'#39') usado, (SELECT COUNT(*)'
      
        '                                                                ' +
        '                      FROM art.use_usuarios'
      
        '                                                                ' +
        '                     WHERE sc_codigo = se_sector'
      
        '                                                                ' +
        '                       AND se_fechabaja is null) usuarios'
      '  FROM art.usc_sectores, del_delegacion'
      ' WHERE el_id = sc_delegacion')
    Left = 20
    Top = 52
  end
  object dsDelegaciones: TDataSource
    DataSet = sdqDelegaciones
    Left = 272
    Top = 144
  end
  object sdqDelegaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT EL_ID, EL_NOMBRE'
      'FROM DEL_DELEGACION'
      'ORDER BY EL_NOMBRE')
    Left = 244
    Top = 144
  end
  object sdqAplicaciones: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqAplicacionesAfterOpen
    SQL.Strings = (
      '  SELECT ej_descripcion, pe_idejecutable, pe_idgrupo'
      '    FROM comunes.cej_ejecutable, comunes.cpe_perfilejecutable'
      '   WHERE ej_id = pe_idejecutable'
      '     AND pe_idgrupo = :sector'
      'ORDER BY ej_descripcion')
    Left = 244
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sector'
        ParamType = ptInput
      end>
  end
  object dsAplicaciones: TDataSource
    DataSet = sdqAplicaciones
    Left = 272
    Top = 172
  end
end
