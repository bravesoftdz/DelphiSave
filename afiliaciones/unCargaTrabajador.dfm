object frmCargaTrabajador: TfrmCargaTrabajador
  Left = 225
  Top = 113
  Width = 774
  Height = 481
  Caption = 'Carga de Trabajadores'
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 774
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    766
    455)
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 766
    Height = 27
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl - N)'
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
    object ToolButton3: TToolButton
      Left = 74
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object tlbReactivar: TToolButton
      Left = 82
      Top = 0
      Hint = 'Reactivar (Ctrl-A)'
      ImageIndex = 28
      OnClick = tlbReactivarClick
    end
    object tblSeparador2: TToolButton
      Left = 105
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbEstablecimiento: TToolButton
      Left = 110
      Top = 0
      Hint = 'Establacimiento (Ctrl-E)'
      Caption = 'tlbEstablecimiento'
      ImageIndex = 20
      OnClick = tlbEstablecimientoClick
    end
    object tlbSolicitud: TToolButton
      Left = 133
      Top = 0
      Hint = 'Solicitud (Ctrl-T)'
      Caption = 'tlbSolicitud'
      ImageIndex = 15
      OnClick = tlbSolicitudClick
    end
    object tlbSRT: TToolButton
      Left = 156
      Top = 0
      Hint = 'SRT (Ctrl-R)'
      Caption = 'tlbSRT'
      ImageIndex = 17
      OnClick = tlbSRTClick
    end
    object ToolButton1: TToolButton
      Left = 179
      Top = 0
      Width = 5
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbOrdenar: TToolButton
      Left = 184
      Top = 0
      Caption = 'tbOrdenar'
      ImageIndex = 2
      OnClick = tbOrdenarClick
    end
    object tlbImprimir: TToolButton
      Left = 207
      Top = 0
      Hint = 'Imprimir (Ctrl-I)'
      Caption = 'tlbImprimir'
      ImageIndex = 4
      OnClick = tlbImprimirClick
    end
    object tlbSalir: TToolButton
      Left = 230
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
    object ToolButton2: TToolButton
      Left = 253
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 1
    Top = 76
    Width = 765
    Height = 121
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = sdDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = ArtDBGridGetCellParams
    OnContextPopup = ArtDBGridContextPopup
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'ST_CUIL'
        Title.Caption = 'Cuil'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 334
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHAINGRESO'
        Title.Caption = 'Fecha Ing.'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 423
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_FECHABAJA'
        Title.Caption = 'F. Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 93
        Visible = True
      end>
  end
  object grbIdentifica: TGroupBox
    Left = 0
    Top = 205
    Width = 766
    Height = 232
    Align = alBottom
    Caption = 'Identificaci'#243'n del Establecimiento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      766
      232)
    object lbNombre: TLabel
      Left = 142
      Top = 112
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lbAlta: TLabel
      Left = 103
      Top = 184
      Width = 68
      Height = 13
      Caption = 'Fecha Ingreso'
    end
    object lbFNacimiento: TLabel
      Left = 267
      Top = 184
      Width = 65
      Height = 13
      Caption = 'F. Nacimiento'
    end
    object lbTarea: TLabel
      Left = 23
      Top = 136
      Width = 26
      Height = 13
      Caption = 'CUIO'
    end
    object lbSexo: TLabel
      Left = 617
      Top = 112
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Sexo'
    end
    object lbMasaSalarial: TLabel
      Left = 428
      Top = 184
      Width = 63
      Height = 13
      Caption = 'Masa Salarial'
    end
    object lbCategoria: TLabel
      Left = 5
      Top = 184
      Width = 45
      Height = 13
      Caption = 'Categoria'
    end
    object lbCUIL: TLabel
      Left = 25
      Top = 112
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    object lbEstablecimento: TLabel
      Left = 5
      Top = 21
      Width = 74
      Height = 13
      Caption = 'Establecimiento'
    end
    object Label1: TLabel
      Left = 21
      Top = 160
      Width = 28
      Height = 13
      Caption = 'Tarea'
    end
    object Label2: TLabel
      Left = 8
      Top = 208
      Width = 74
      Height = 13
      Caption = 'Origen del Dato'
    end
    object edST_NOMBRE: TEdit
      Left = 182
      Top = 108
      Width = 429
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 3
    end
    object edST_FECHAINGRESO: TDateComboBox
      Left = 174
      Top = 180
      Width = 88
      Height = 20
      TabOrder = 5
      OnExit = edST_FECHAINGRESOExit
    end
    object edST_FNACIMIENTO: TDateComboBox
      Left = 337
      Top = 180
      Width = 88
      Height = 20
      TabOrder = 6
      OnExit = edST_FNACIMIENTOExit
    end
    object edST_SUELDO: TCurrencyEdit
      Left = 494
      Top = 180
      Width = 89
      Height = 20
      AutoSize = False
      MaxLength = 13
      TabOrder = 8
      OnExit = edST_SUELDOExit
    end
    object edST_CATEGORIA: TPatternEdit
      Left = 53
      Top = 180
      Width = 46
      Height = 21
      MaxLength = 5
      TabOrder = 10
      Pattern = '1234'
    end
    object edST_CUIL: TMaskEdit
      Left = 52
      Top = 108
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 2
      OnExit = edST_CUILExit
    end
    object cmbST_SEXO: TComboBox
      Left = 644
      Top = 108
      Width = 118
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
        'Femenino'
        'Masculino')
    end
    object chST_PREOCUPACIONAL: TCheckBox
      Left = 623
      Top = 135
      Width = 118
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ex. Preocupacional'
      TabOrder = 11
    end
    object chST_PREEXISTENTE: TCheckBox
      Left = 623
      Top = 161
      Width = 118
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ex. Preexistente'
      TabOrder = 12
    end
    inline fraST_CUIO: TfraCtbTablas
      Left = 52
      Top = 132
      Width = 562
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      inherited cmbDescripcion: TArtComboBox
        Width = 508
      end
    end
    inline fraEstablecimiento: TfraCodigoDescripcion
      Left = 82
      Top = 16
      Width = 680
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnExit = fraEstablecimientoExit
      inherited cmbDescripcion: TArtComboBox
        Width = 615
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOMICILIO'
            Title.Caption = 'Domicilio'
            Width = 50
            Visible = True
          end>
      end
    end
    object grbDomicilio: TGroupBox
      Left = 5
      Top = 40
      Width = 756
      Height = 64
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        756
        64)
      inline fraDomicilio: TfraDomicilio
        Left = 2
        Top = 11
        Width = 750
        Height = 51
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited lbCalle: TLabel
          Left = 20
          Caption = 'C&alle'
          FocusControl = fraDomicilio.cmbCalle
        end
        inherited lbNro: TLabel
          Left = 535
        end
        inherited lbPiso: TLabel
          Left = 607
        end
        inherited lbDto: TLabel
          Left = 683
        end
        inherited lbCPostal: TLabel
          Left = 2
          Caption = '&C.Postal'
          FocusControl = fraDomicilio.edCPostal
        end
        inherited lbLocalidad: TLabel
          Caption = '&Localidad'
          FocusControl = fraDomicilio.cmbLocalidad
        end
        inherited lbProvincia: TLabel
          Left = 588
        end
        inherited cmbCalle: TArtComboBox
          Width = 450
        end
        inherited edNumero: TEdit
          Left = 557
        end
        inherited edPiso: TEdit
          Left = 633
        end
        inherited edDto: TEdit
          Left = 705
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 318
        end
        inherited edProvincia: TEdit
          Left = 637
        end
        inherited btnBuscar: TButton
          Left = 500
          Visible = False
        end
      end
    end
    object edST_TAREA: TListSearchEdit
      Left = 52
      Top = 156
      Width = 560
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      HideSelection = False
      TabOrder = 4
      ValidateOnExit = False
      MinSearchLength = 1
    end
    inline fraOrigenDato: TfraCodDesc
      Left = 88
      Top = 204
      Width = 470
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      inherited cmbDescripcion: TArtComboBox
        Width = 405
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ' AND OD_CODIGO IN ('#39'MS'#39', '#39'ANX'#39', '#39'INICIAL'#39')'
        FieldBaja = 'od_fechabaja'
        FieldCodigo = 'od_codigo'
        FieldDesc = 'od_detalle'
        FieldID = 'od_id'
        IdType = ctInteger
        OrderBy = 'od_detalle'
        TableName = 'afi.aod_origendato'
      end
    end
    object chST_CONFIRMAPUESTO: TCheckBox
      Left = 623
      Top = 189
      Width = 134
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No Confirmado al puesto'
      TabOrder = 14
    end
  end
  object grbEmpresa: TGroupBox
    Left = 1
    Top = 30
    Width = 634
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Empresa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      634
      43)
    object lbCUIT: TLabel
      Left = 4
      Top = 18
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbRazonSocial: TLabel
      Left = 116
      Top = 18
      Width = 63
      Height = 13
      Caption = 'Razon Social'
    end
    object edCUIT: TMaskEdit
      Left = 33
      Top = 14
      Width = 81
      Height = 21
      Enabled = False
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
    end
    object edRazonSocial: TEdit
      Left = 182
      Top = 14
      Width = 446
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 1
    end
  end
  object grbSolicitud: TGroupBox
    Left = 639
    Top = 30
    Width = 127
    Height = 42
    Anchors = [akTop, akRight]
    Caption = 'Solicitud'
    TabOrder = 4
    DesignSize = (
      127
      42)
    object edSA_FORMULARIO: TEdit
      Left = 6
      Top = 13
      Width = 114
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Color = clInactiveCaption
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 437
    Width = 766
    Height = 18
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  object fpBusqueda: TFormPanel
    Left = 231
    Top = 102
    Width = 221
    Height = 129
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsSingle
    Position = poScreenCenter
    object GroupBox1: TGroupBox
      Left = 5
      Top = 4
      Width = 208
      Height = 94
      Caption = 'Opciones de B'#250'squeda'
      TabOrder = 0
      DesignSize = (
        208
        94)
      object rbCUIL: TRadioButton
        Left = 11
        Top = 19
        Width = 53
        Height = 17
        Caption = 'Cuil'
        TabOrder = 0
      end
      object rbNombre: TRadioButton
        Left = 9
        Top = 69
        Width = 113
        Height = 17
        Caption = 'Nombre'
        TabOrder = 1
      end
      object edNombre: TEdit
        Left = 77
        Top = 67
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnChange = edNombreChange
        OnEnter = edNombreEnter
      end
      object edCUIL: TMaskEdit
        Left = 77
        Top = 17
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 3
        OnChange = edCUILChange
        OnEnter = edCUILEnter
      end
      object rbDocumento: TRadioButton
        Left = 11
        Top = 44
        Width = 53
        Height = 17
        Caption = 'DNI'
        Checked = True
        TabOrder = 4
        TabStop = True
      end
      object edDocumento: TMaskEdit
        Left = 77
        Top = 42
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        EditMask = '99999999;0;'
        MaxLength = 8
        TabOrder = 5
        OnChange = edDocumentoChange
        OnEnter = edDocumentoEnter
      end
    end
    object btSalir: TButton
      Left = 155
      Top = 102
      Width = 60
      Height = 22
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btSalirClick
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT st_idsolicitud, sa_cuit, st_id, st_cuil, st_nombre, st_fe' +
        'chaingreso, se_nroestableci, se_nombre, st_usubaja,'
      
        '       st_fechabaja, se_calle, se_cpostal, se_localidad, se_prov' +
        'incia, pv_descripcion,'
      
        '       art.utiles.armar_domicilio(se_calle, se_numero, se_piso, ' +
        'se_departamento, NULL)'
      
        '       || art.utiles.armar_localidad(se_cpostal, NULL, se_locali' +
        'dad, se_provincia) domicilio,'
      
        '       st_cuio, st_tarea, st_categoria, st_preocupacional, st_pr' +
        'eexistente, st_sexo, st_sueldo, st_fnacimiento,'
      
        '       st_idsolicitudest, se_numero, se_piso, se_departamento, s' +
        'e_cpostala, st_idorigendato, st_confirmapuesto'
      
        '  FROM ase_solicitudestablecimiento, ast_solicitudtrabajador, as' +
        'a_solicitudafiliacion, cpv_provincias'
      ' WHERE st_idsolicitudest = se_id'
      '   AND st_idsolicitud = sa_id'
      '   AND sa_provincia = pv_codigo(+)'
      '   AND sa_id = :iidparam'
      '')
    Left = 15
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iIDParam'
        ParamType = ptInput
      end>
  end
  object sdDatos: TDataSource
    DataSet = sdqDatos
    Left = 43
    Top = 113
  end
  object sdqCUIT: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT SA_CUIT, SA_NOMBRE, SA_IDFORMULARIO, FO_FORMULARIO'
      'FROM ASA_SOLICITUDAFILIACION, AFO_FORMULARIO '
      'WHERE SA_IDFORMULARIO = FO_ID '
      '  AND SA_ID = :iIDParam')
    Left = 42
    Top = 41
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iIDParam'
        ParamType = ptInput
      end>
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
        LinkControl = tlbSRT
      end
      item
        Key = 16468
        LinkControl = tlbSolicitud
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16453
        LinkControl = tlbEstablecimiento
      end
      item
        Key = 16449
        LinkControl = tlbReactivar
      end>
    Left = 15
    Top = 141
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermiteGuardar'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 43
    Top = 141
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Cuil'
        DataField = 'ST_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Nombre'
        DataField = 'ST_NOMBRE'
        FieldIndex = 1
      end
      item
        Title = 'Fecha Ing.'
        DataField = 'ST_FECHAINGRESO'
        FieldIndex = 2
      end
      item
        Title = 'Domicilio'
        DataField = 'SE_CALLE'
        FieldIndex = 3
      end
      item
        Title = 'Usuario Baja'
        DataField = 'ST_USUBAJA'
        FieldIndex = 4
      end
      item
        Title = 'F. Baja'
        DataField = 'ST_FECHABAJA'
        FieldIndex = 5
      end
      item
        Title = 'Establecimiento'
        DataField = 'SE_NOMBRE'
        FieldIndex = 6
      end>
    FixedRows = 0
    Left = 71
    Top = 112
  end
end
