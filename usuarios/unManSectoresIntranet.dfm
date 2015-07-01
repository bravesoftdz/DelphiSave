inherited frmManSectoresIntranet: TfrmManSectoresIntranet
  Left = 349
  Top = 156
  Width = 776
  Height = 476
  Caption = 'Matenimiento de los Sectores de la Intranet'
  Constraints.MinHeight = 440
  Constraints.MinWidth = 714
  Font.Name = 'Tahoma'
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitter: TJvOutlookSplitter [0]
    Left = 0
    Top = 305
    Width = 768
  end
  object JvOutlookSplitter1: TJvOutlookSplitter [1]
    Left = 365
    Top = 86
    Width = 7
    Height = 219
    Cursor = crSizeWE
    Align = alRight
  end
  inherited Grid: TArtDBGrid [2]
    Top = 86
    Width = 365
    Height = 219
    Constraints.MinHeight = 200
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_ID'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_DESCRIPCION'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NIVELRESOLUTIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NIVEL_RESOLUTIVO'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_IDSECTORPADRE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SE_DEFAULT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIVEL'
        Title.Caption = 'Nivel'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NIVEL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_SECTOR_PADRE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_SECTOR_PADRE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_USUARIOS'
        Title.Caption = 'Usuarios'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_VISIBLE'
        Title.Caption = 'Visible'
        Width = 36
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [3]
    Width = 768
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Visible = True
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label7: TLabel
      Left = 244
      Top = 11
      Width = 67
      Height = 13
      Caption = 'Nivel del '#225'rbol'
    end
    object Label8: TLabel
      Left = 356
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Sector padre'
    end
    object Label9: TLabel
      Left = 588
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Nivel resolutivo'
    end
    inline fraSE_ID: TfraCodDesc
      Left = 8
      Top = 26
      Width = 229
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 164
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
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SE_NIVEL'
            Title.Caption = 'Nivel'
            Visible = True
          end>
        DataSource = nil
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = ' , se_nivel '
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = Actualizar
        Left = 116
      end
    end
    object cmbSE_NIVEL: TJvComboBox
      Left = 240
      Top = 27
      Width = 109
      Height = 21
      Style = csDropDownList
      DropDownCount = 5
      EmptyValue = '[Todos]'
      ItemHeight = 13
      TabOrder = 1
      OnChange = ActualizarNivel
      Items.Strings = (
        '[Ninguno]'
        'Ejecutivo'
        'Gerencia'
        'Jefatura'
        'Sector')
    end
    inline fraSE_IDSECTORPADRE: TfraCodDesc
      Left = 352
      Top = 26
      Width = 229
      Height = 23
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 164
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
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SE_NIVEL'
            Title.Caption = 'Nivel'
            Visible = True
          end>
        DataSource = nil
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = ' , se_nivel '
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = Actualizar
        Left = 116
      end
    end
    object cmbSE_NIVELRESOLUTIVO: TJvComboBox
      Left = 584
      Top = 27
      Width = 109
      Height = 21
      Style = csDropDownList
      DropDownCount = 5
      EmptyValue = '[Todos]'
      ItemHeight = 13
      TabOrder = 3
      OnChange = Actualizar
      Items.Strings = (
        'Nivel 0'
        'Nivel 1'
        'Nivel 2'
        'Nivel 3'
        'Nivel 4')
    end
    object chkVerBajas: TCheckBox
      Left = 696
      Top = 28
      Width = 66
      Height = 17
      Caption = 'Ver bajas'
      TabOrder = 4
      OnClick = Actualizar
    end
  end
  inherited CoolBar: TCoolBar [4]
    Top = 57
    Width = 768
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 764
      end>
    inherited ToolBar: TToolBar
      Width = 751
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver '#225'rbol de sectores'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  object GridUsuarios: TArtDBGrid [5]
    Left = 0
    Top = 312
    Width = 768
    Height = 137
    Align = alBottom
    Constraints.MinHeight = 100
    DataSource = dsUsuarios
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    IniStorage = FormStorage
    OnGetCellProps = GridUsuariosGetCellProps
    FooterBand = False
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_USUARIO'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JEFE'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RU_DETALLE'
        Width = 81
        Visible = True
      end>
  end
  object pnlArbol: TPanel [6]
    Left = 372
    Top = 86
    Width = 396
    Height = 219
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 192
    Width = 588
    Height = 149
    OnShow = fpAbmShow
    Constraints.MaxHeight = 149
    Constraints.MaxWidth = 588
    Constraints.MinHeight = 149
    Constraints.MinWidth = 588
    DesignSize = (
      588
      149)
    inherited BevelAbm: TBevel
      Top = 113
      Width = 580
    end
    object Label2: TLabel [1]
      Left = 20
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Sector'
    end
    object Label3: TLabel [2]
      Left = 20
      Top = 60
      Width = 62
      Height = 13
      Caption = 'Sector padre'
    end
    object Label4: TLabel [3]
      Left = 344
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lbNivelResolutivo: TLabel [4]
      Left = 456
      Top = 60
      Width = 73
      Height = 13
      Caption = 'Nivel resolutivo'
    end
    object Label6: TLabel [5]
      Left = 344
      Top = 60
      Width = 67
      Height = 13
      Caption = 'Nivel del '#225'rbol'
    end
    inherited btnAceptar: TButton
      Left = 433
      Top = 119
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 508
      Top = 119
      TabOrder = 7
    end
    inline fraSector: TfraCodDesc
      Left = 16
      Top = 32
      Width = 321
      Height = 23
      TabOrder = 0
      DesignSize = (
        321
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 256
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
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Width = 50
            Visible = True
          end>
        DataSource = nil
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = ', se_nivel'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = fraSectorPropiedadesChange
        Left = 116
      end
    end
    inline fraSectorPadre: TfraCodDesc
      Left = 16
      Top = 76
      Width = 321
      Height = 23
      TabOrder = 3
      DesignSize = (
        321
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 256
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
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'se_nivel'
            Title.Caption = 'Nivel'
            Width = 50
            Visible = True
          end>
        DataSource = nil
        OnDropDown = fraSectorPadrecmbDescripcionDropDown
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = ', se_nivel'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = fraSectorPadrePropiedadesChange
        Left = 116
      end
    end
    object edSE_DESCRIPCION: TEdit
      Left = 340
      Top = 33
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object cmbNivelResolutivo: TComboBox
      Left = 452
      Top = 77
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Nivel 0 - Sin permiso'
        'Nivel 1 - Sector'
        'Nivel 2 - Jefatura'
        'Nivel 3 - Gerencia'
        'Nivel 4 - Ejecutivo')
    end
    object cmbNivel: TComboBox
      Left = 340
      Top = 77
      Width = 109
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cmbNivelChange
      Items.Strings = (
        'Ejecutivo'
        'Gerencia'
        'Jefatura'
        'Sector')
    end
    object chkVisible: TCheckBox
      Left = 524
      Top = 12
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      AllowGrayed = True
      Caption = 'Visible'
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeOpen = sdqConsultaBeforeOpen
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT se_id, se_descripcion, se_nivelresolutivo, se_idsectorpad' +
        're, se_default, se_nivel, se_visible,'
      '       case se_nivel'
      '         when 1 then '#39'Ejecutivo'#39
      '         when 2 then '#39'Gerencia'#39
      '         when 3 then '#39'Jefatura'#39
      '         when 4 then '#39'Sector'#39
      '       end as nivel,'
      '       case'
      
        '         when (se_nivel = 4) and (se_nivelresolutivo = 0) then '#39 +
        'Nivel 0 - Sin permiso'#39
      
        '         when (se_nivel = 4) and (se_nivelresolutivo = 1) then '#39 +
        'Nivel 1 - Sector'#39
      
        '         when (se_nivel = 4) and (se_nivelresolutivo = 2) then '#39 +
        'Nivel 2 - Jefatura'#39
      
        '         when (se_nivel = 4) and (se_nivelresolutivo = 3) then '#39 +
        'Nivel 3 - Gerencia'#39
      
        '         when (se_nivel = 4) and (se_nivelresolutivo = 4) then '#39 +
        'Nivel 4 - Ejecutivo'#39
      '         else '#39'-'#39
      '       end as nivel_resolutivo,'
      '       (SELECT sector_padre.se_id'
      '          FROM computos.cse_sector sector_padre'
      
        '         WHERE sectores.se_idsectorpadre = sector_padre.se_id) A' +
        'S id_sector_padre,'
      '       (SELECT sector_padre.se_descripcion'
      '          FROM computos.cse_sector sector_padre'
      
        '         WHERE sectores.se_idsectorpadre = sector_padre.se_id) A' +
        'S desc_sector_padre,'
      
        '       se_usualta, se_fechaalta, se_usumodif, se_fechamodif, se_' +
        'usubaja, se_fechabaja,'
      '       (SELECT COUNT(*)'
      '          FROM art.use_usuarios usuarios'
      '         WHERE usuarios.se_idsector = sectores.se_id'
      '           AND usuarios.se_fechabaja IS NULL) AS total_usuarios'
      '  FROM computos.cse_sector sectores'
      ' WHERE 1 = 1')
    Left = 8
    Top = 164
    object sdqConsultaSE_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'SE_ID'
      Required = True
    end
    object sdqConsultaSE_DESCRIPCION: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SE_DESCRIPCION'
      Required = True
      Size = 50
    end
    object sdqConsultaSE_NIVELRESOLUTIVO: TFloatField
      DisplayLabel = 'Resolutivo'
      FieldName = 'SE_NIVELRESOLUTIVO'
      Required = True
    end
    object sdqConsultaSE_IDSECTORPADRE: TFloatField
      DisplayLabel = 'Id Padre'
      FieldName = 'SE_IDSECTORPADRE'
      Required = True
    end
    object sdqConsultaSE_DEFAULT: TStringField
      DisplayLabel = 'Default'
      FieldName = 'SE_DEFAULT'
      Size = 1
    end
    object sdqConsultaSE_NIVEL: TFloatField
      DisplayLabel = 'Nivel'
      FieldName = 'SE_NIVEL'
    end
    object sdqConsultaID_SECTOR_PADRE: TFloatField
      DisplayLabel = 'Id Padre'
      FieldName = 'ID_SECTOR_PADRE'
    end
    object sdqConsultaDESC_SECTOR_PADRE: TStringField
      DisplayLabel = 'Sector Padre'
      FieldName = 'DESC_SECTOR_PADRE'
      Size = 50
    end
    object sdqConsultaSE_USUALTA: TStringField
      FieldName = 'SE_USUALTA'
    end
    object sdqConsultaSE_FECHAALTA: TDateTimeField
      FieldName = 'SE_FECHAALTA'
    end
    object sdqConsultaSE_USUMODIF: TStringField
      FieldName = 'SE_USUMODIF'
    end
    object sdqConsultaSE_FECHAMODIF: TDateTimeField
      FieldName = 'SE_FECHAMODIF'
    end
    object sdqConsultaSE_USUBAJA: TStringField
      FieldName = 'SE_USUBAJA'
    end
    object sdqConsultaSE_FECHABAJA: TDateTimeField
      FieldName = 'SE_FECHABAJA'
    end
    object sdqConsultaTOTAL_USUARIOS: TFloatField
      FieldName = 'TOTAL_USUARIOS'
    end
    object sdqConsultaNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 9
    end
    object sdqConsultaNIVEL_RESOLUTIVO: TStringField
      DisplayLabel = 'Nivel resolutivo'
      FieldName = 'NIVEL_RESOLUTIVO'
      Size = 21
    end
    object sdqConsultaSE_VISIBLE: TStringField
      FieldName = 'SE_VISIBLE'
      Size = 1
    end
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 164
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 192
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 192
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    Left = 36
    Top = 220
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 136
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 136
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 220
  end
  inherited ShortCutControl: TShortCutControl
    Left = 64
    Top = 136
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 164
  end
  object ShortCutControlHijo: TShortCutControl
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
        LinkControl = tbSalir
      end>
    Left = 64
    Top = 136
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 36
    Top = 248
  end
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqUsuariosAfterOpen
    SQL.Strings = (
      
        'SELECT usuarios.se_usuario, usuarios.se_nombre, sc_descripcion, ' +
        'ru_detalle, sectores.se_fechabaja as baja_sector,'
      '       (SELECT jefes.se_nombre'
      '          FROM ART.USE_USUARIOS jefes'
      
        '         WHERE jefes.SE_USUARIO = usuarios.SE_RESPONDEA) as jefe' +
        ','
      '       (SELECT jefes.se_fechabaja'
      '          FROM ART.USE_USUARIOS jefes'
      
        '         WHERE jefes.SE_USUARIO = usuarios.SE_RESPONDEA) as baja' +
        '_jefe'
      
        '  FROM computos.cse_sector sectores, art.use_usuarios usuarios, ' +
        'art.usc_sectores, comunes.cru_relacionlaboralusuario'
      ' WHERE usuarios.se_idsector = sectores.se_id'
      '   AND sectores.se_id = :id'
      '   AND usuarios.se_sector = sc_codigo'
      '   AND usuarios.se_fechabaja IS NULL'
      '   AND usuarios.se_contrato = ru_id(+)'
      'ORDER BY 4, 3, 5, 2')
    Left = 8
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    object sdqUsuariosSE_USUARIO: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'SE_USUARIO'
      Required = True
    end
    object sdqUsuariosSE_NOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqUsuariosSC_DESCRIPCION: TStringField
      DisplayLabel = 'Sector'
      FieldName = 'SC_DESCRIPCION'
      Required = True
      Size = 60
    end
    object sdqUsuariosJEFE: TStringField
      DisplayLabel = 'Jefe'
      FieldName = 'JEFE'
      Size = 50
    end
    object sdqUsuariosRU_DETALLE: TStringField
      DisplayLabel = 'Relaci'#243'n Laboral'
      FieldName = 'RU_DETALLE'
      Size = 40
    end
    object sdqUsuariosBAJA_SECTOR: TDateTimeField
      FieldName = 'BAJA_SECTOR'
    end
    object sdqUsuariosBAJA_JEFE: TDateTimeField
      FieldName = 'BAJA_JEFE'
    end
  end
end
