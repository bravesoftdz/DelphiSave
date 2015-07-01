inherited frmManAEX_EXCEPCIONUSUARIOTAREA: TfrmManAEX_EXCEPCIONUSUARIOTAREA
  Left = 234
  Top = 228
  Width = 680
  Height = 500
  Caption = 'Mantenimiento de Excepciones en la Vista de Tareas'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 680
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 672
    Height = 117
    Visible = True
    object lblSectorExceptuado: TLabel
      Left = 212
      Top = 12
      Width = 108
      Height = 13
      Caption = 'Sector del Exceptuado'
    end
    object lblSectorExceptuante: TLabel
      Left = 212
      Top = 60
      Width = 112
      Height = 13
      Caption = 'Sector del Exceptuante'
    end
    object lblFiltroUsuarioExceptuado: TLabel
      Left = 332
      Top = 12
      Width = 96
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Usuario Exceptuado'
    end
    object lblFiltroUsuarioExceptuante: TLabel
      Left = 332
      Top = 60
      Width = 100
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Usuario Exceptuante'
    end
    object rgTipo: TAdvOfficeRadioGroup
      Left = 8
      Top = 8
      Width = 93
      Height = 101
      Version = '1.2.1.0'
      Caption = ' Tipo de Permiso '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 0
      OnClick = tbRefrescarClick
      Ellipsis = False
      ItemIndex = 0
      Items.Strings = (
        'Ver todo'
        'Eventual'
        'Hist'#243'rico'
        'Permanente')
    end
    inline fraID_SECTOR_EXCEPTUADO: TfraCodDesc
      Left = 208
      Top = 32
      Width = 120
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        120
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 65
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
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'GERENCIA'
            Title.Caption = 'Gerencia'
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 
          ' AND se_id <> 89143 AND se_nivel = 4 AND EXISTS(SELECT 1 FROM ar' +
          't.use_usuarios usu WHERE usu.se_fechabaja IS NULL AND usu.se_ids' +
          'ector = cse_sector.se_id) '
        ExtraFields = 
          ', se_nivel, (SELECT ger.se_descripcion FROM computos.cse_sector ' +
          'ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FROM computos' +
          '.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idsectorpadre F' +
          'ROM computos.cse_sector sec WHERE sec.se_id = computos.cse_secto' +
          'r.se_id))) AS gerencia'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = tbRefrescarClick
        Left = 52
      end
    end
    inline fraID_SECTOR_EXCEPTUANTE: TfraCodDesc
      Left = 208
      Top = 80
      Width = 120
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        120
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 65
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
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'GERENCIA'
            Title.Caption = 'Gerencia'
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 
          ' AND se_id <> 89143 AND se_nivel = 4 AND EXISTS(SELECT 1 FROM ar' +
          't.use_usuarios usu WHERE usu.se_fechabaja IS NULL AND usu.se_ids' +
          'ector = cse_sector.se_id) '
        ExtraFields = 
          ', se_nivel, (SELECT ger.se_descripcion FROM computos.cse_sector ' +
          'ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FROM computos' +
          '.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idsectorpadre F' +
          'ROM computos.cse_sector sec WHERE sec.se_id = computos.cse_secto' +
          'r.se_id))) AS gerencia'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        OnChange = tbRefrescarClick
        Left = 52
      end
    end
    object rgPanelVigencia: TAdvOfficeRadioGroup
      Left = 539
      Top = 8
      Width = 125
      Height = 101
      Version = '1.2.1.0'
      Anchors = [akTop, akRight]
      Caption = ' Vigencia '
      ParentBackground = False
      TabOrder = 5
      Ellipsis = False
    end
    object pnlFechas: TPanel
      Left = 551
      Top = 24
      Width = 105
      Height = 77
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 6
      object lblDesde: TLabel
        Left = 8
        Top = 0
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object lblHasta: TLabel
        Left = 8
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edEX_VIGENCIADESDEDesde: TDateEdit
        Left = 8
        Top = 16
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object edEX_VIGENCIAHASTAHasta: TDateEdit
        Left = 8
        Top = 56
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    inline fraUSUARIO_EXCEPTUADO: TfraUsuario
      Left = 332
      Top = 32
      Width = 201
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 117
      end
    end
    inline fraUSUARIO_EXCEPTUANTE: TfraUsuario
      Left = 332
      Top = 80
      Width = 201
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 117
      end
    end
    object rgBajas: TAdvOfficeRadioGroup
      Left = 104
      Top = 8
      Width = 101
      Height = 101
      Version = '1.2.1.0'
      Caption = ' Anulados '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 7
      OnClick = tbRefrescarClick
      Ellipsis = False
      ItemIndex = 1
      Items.Strings = (
        'Ver todo'
        'No ver bajas'
        'Ver solo bajas')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 117
    Width = 672
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 668
      end>
    inherited ToolBar: TToolBar
      Width = 655
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 146
    Width = 672
    Height = 327
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'USUARIO_EXCEPTUANTE'
        Title.Caption = 'Usuario exceptuante'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCEPTUANTE'
        Title.Caption = 'Exceptuante'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR_EXCEPTUANTE'
        Title.Caption = 'Sector exceptuante'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO_EXCEPTUADO'
        Title.Caption = 'Usuario exceptuado'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCEPTUADO'
        Title.Caption = 'Exceptuado'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR_EXCEPTUADO'
        Title.Caption = 'Sector exceptuado'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_VIGENCIADESDE'
        Title.Caption = 'Desde'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_VIGENCIAHASTA'
        Title.Caption = 'Hasta'
        Width = 46
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DIAS'
        Title.Caption = 'D'#237'as'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHABAJA'
        Title.Caption = 'Anulaci'#243'n'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 51
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 168
    Top = 196
    Width = 329
    Height = 213
    Position = poScreenCenter
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 177
      Width = 321
    end
    object lblUsuarioExceptuado: TLabel [1]
      Left = 12
      Top = 52
      Width = 96
      Height = 13
      Caption = 'Usuario exceptuado'
    end
    object lblUsuarioExceptuante: TLabel [2]
      Left = 12
      Top = 8
      Width = 100
      Height = 13
      Caption = 'Usuario exceptuante'
    end
    object lbl1: TLabel [3]
      Left = 120
      Top = 92
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object lbl2: TLabel [4]
      Left = 120
      Top = 132
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    inherited btnAceptar: TButton
      Left = 174
      Top = 183
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 249
      Top = 183
      TabOrder = 6
    end
    inline fraUsuarioExceptuado: TfraUsuario
      Left = 12
      Top = 70
      Width = 309
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 221
      end
    end
    inline fraUsuarioExceptuante: TfraUsuario
      Left = 12
      Top = 26
      Width = 309
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 221
      end
    end
    object edVigenciaDesde: TDateEdit
      Left = 120
      Top = 108
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object edVigenciaHasta: TDateEdit
      Left = 120
      Top = 148
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object rgTipoPermiso: TAdvOfficeRadioGroup
      Left = 12
      Top = 100
      Width = 97
      Height = 69
      Version = '1.2.1.0'
      Caption = ' Tipo de Permiso '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 2
      OnClick = rgTipoPermisoClick
      Ellipsis = False
      ItemIndex = 0
      Items.Strings = (
        'Eventual'
        'Permanente')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ex_id,'
      '       id_exceptuante,'
      '       usuario_exceptuante,'
      '       exceptuante,'
      '       baja_exceptuante,'
      '       id_sector_exceptuante,'
      '       sector_exceptuante,'
      '       id_exceptuado,'
      '       usuario_exceptuado,'
      '       exceptuado,'
      '       baja_exceptuado,'
      '       id_sector_exceptuado,'
      '       sector_exceptuado,'
      '       ex_vigenciadesde,'
      '       ex_vigenciahasta,'
      '       ex_fechabaja,'
      
        '       DECODE(ex_vigenciahasta, NULL, NULL, ex_vigenciahasta - e' +
        'x_vigenciadesde) dias,'
      '       idtipo,'
      '       CASE idtipo'
      '         WHEN 1 THEN '#39'Eventual'#39
      '         WHEN 2 THEN '#39'Hist'#243'rico'#39
      '         WHEN 3 THEN '#39'Permanente'#39
      '       END'
      '         tipo'
      '  FROM (SELECT ex_id,'
      '               ex_idusuario id_exceptuante,'
      '               exceptuante.se_usuario usuario_exceptuante,'
      '               exceptuante.se_nombre exceptuante,'
      '               exceptuante.se_fechabaja baja_exceptuante,'
      '               sector_orig.se_id AS id_sector_exceptuante,'
      '               sector_orig.se_descripcion AS sector_exceptuante,'
      '               exceptuado.se_id id_exceptuado,'
      '               exceptuado.se_usuario usuario_exceptuado,'
      '               exceptuado.se_nombre AS exceptuado,'
      '               exceptuado.se_fechabaja baja_exceptuado,'
      '               sector_dest.se_id AS id_sector_exceptuado,'
      '               sector_dest.se_descripcion AS sector_exceptuado,'
      '               ex_vigenciadesde,'
      '               ex_vigenciahasta,'
      '               ex_fechabaja,'
      '               CASE'
      
        '                 WHEN SYSDATE BETWEEN ex_vigenciadesde AND NVL (' +
        'ex_vigenciahasta, SYSDATE + 1)'
      '                  AND ex_fechabaja IS NULL'
      '                  AND ex_permanente = '#39'N'#39
      '                 THEN'
      '                   1'
      '                 WHEN (ex_fechabaja IS NOT NULL)'
      
        '                   OR (SYSDATE NOT BETWEEN ex_vigenciadesde AND ' +
        'NVL (ex_vigenciahasta, SYSDATE + 1)'
      '                   AND ex_fechabaja IS NULL'
      '                   AND ex_permanente = '#39'N'#39')'
      '                 THEN'
      '                   2'
      '                 WHEN ex_permanente = '#39'S'#39
      '                  AND ex_fechabaja IS NULL'
      '                 THEN'
      '                   3'
      '               END'
      '                 idtipo'
      '          FROM computos.cse_sector sector_orig,'
      '               computos.cse_sector sector_dest,'
      '               agenda.aex_excepcionusuariotarea,'
      '               art.use_usuarios exceptuado,'
      '               art.use_usuarios exceptuante'
      '         WHERE ex_idexceptuado = exceptuado.se_id'
      '           AND ex_idusuario = exceptuante.se_id'
      '           AND exceptuado.se_idsector = sector_dest.se_id'
      '           AND exceptuante.se_idsector = sector_orig.se_id)'
      ' WHERE 1 = 1')
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
    Left = 80
    Top = 200
  end
end
