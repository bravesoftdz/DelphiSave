inherited frmManUsuariosDeAvisos: TfrmManUsuariosDeAvisos
  Caption = 'Mantenimiento de Usuarios de Avisos diarios'
  ClientHeight = 404
  ClientWidth = 557
  Constraints.MinHeight = 434
  Constraints.MinWidth = 565
  OnActivate = FSFormActivate
  ExplicitWidth = 565
  ExplicitHeight = 434
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 262
    Width = 557
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitTop = 291
  end
  inherited pnlFiltros: TPanel
    Width = 557
    Height = 41
    ExplicitWidth = 557
    ExplicitHeight = 41
    object gbVerBajas: TGroupBox
      Left = 3
      Top = 0
      Width = 149
      Height = 38
      Caption = ' Ver Bajas de Avisos '
      TabOrder = 0
      object rbBajas_Si: TRadioButton
        Left = 8
        Top = 16
        Width = 33
        Height = 17
        Caption = 'S'#237
        TabOrder = 0
      end
      object rbBajas_No: TRadioButton
        Left = 50
        Top = 16
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbBajas_Todos: TRadioButton
        Left = 91
        Top = 16
        Width = 52
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 41
    Width = 557
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 551
      end>
    ExplicitTop = 41
    ExplicitWidth = 557
    inherited ToolBar: TToolBar
      Left = 9
      Width = 544
      ExplicitLeft = 9
      ExplicitWidth = 544
      inherited tbNuevo: TToolButton
        Hint = 'Nuevo Usuario (Ctrl+N)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbEliminar: TToolButton
        Hint = 'Eliminar Usuario (Ctrl+Del)'
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 70
    Width = 557
    Height = 192
    Hint = 'Avisos'
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'Cod. Aviso'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FBAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 65
        Visible = True
      end>
  end
  object fpABM: TFormPanel [4]
    Left = 36
    Top = 103
    Width = 513
    Height = 103
    Caption = 'Cartas Documento'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    OnBeforeShow = fpABMBeforeShow
    OnShow = fpABMShow
    DesignSize = (
      513
      103)
    object BevelAbm: TBevel
      Left = 4
      Top = 69
      Width = 505
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 18
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Aviso: '
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object btnAceptarDatosCartasDoc: TButton
      Left = 355
      Top = 74
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Default = True
      TabOrder = 0
      OnClick = btnAceptarDatosCartasDocClick
    end
    object btnCancelarDatosCartasDoc: TButton
      Left = 433
      Top = 74
      Width = 75
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object edCodAviso: TEdit
      Left = 54
      Top = 11
      Width = 80
      Height = 19
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clGradientInactiveCaption
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edDescAviso: TEdit
      Left = 140
      Top = 11
      Width = 363
      Height = 19
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clGradientInactiveCaption
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    inline fraUsuario: TfraUsuario
      Left = 54
      Top = 40
      Width = 450
      Height = 21
      TabOrder = 4
      ExplicitLeft = 54
      ExplicitTop = 40
      ExplicitWidth = 450
      inherited cmbDescripcion: TArtComboBox
        Width = 366
        ExplicitWidth = 366
      end
    end
  end
  object GridDetail: TArtDBGrid [5]
    Left = 0
    Top = 270
    Width = 557
    Height = 134
    Hint = 'Usuarios'
    Align = alClient
    DataSource = dsDetailUsuarios
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnKeyDown = GridKeyDown
    IniStorage = FormStorage
    OnGetCellParams = GridDetailGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CODUSUARIO'
        Title.Caption = 'Usuario'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREUSUARIO'
        Title.Caption = 'Nombre Usuario'
        Width = 250
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 65
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    Top = 160
  end
  inherited dsConsulta: TDataSource
    Top = 160
  end
  inherited SortDialog: TSortDialog
    Top = 188
  end
  inherited ExportDialog: TExportDialog
    Top = 188
  end
  inherited QueryPrint: TQueryPrint
    Top = 216
  end
  inherited Seguridad: TSeguridad
    Top = 132
  end
  inherited FormStorage: TFormStorage
    Top = 132
  end
  inherited PrintDialog: TPrintDialog
    Top = 216
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
        LinkControl = tbSalir
      end
      item
        Key = 0
      end>
    Top = 132
  end
  inherited FieldHider: TFieldHider
    Top = 160
  end
  object sdqDetailUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 16
    Top = 336
  end
  object dsDetailUsuarios: TDataSource
    DataSet = sdqDetailUsuarios
    Left = 44
    Top = 336
  end
end
