inherited frmManATS_TIPOEVENTOSECTOR: TfrmManATS_TIPOEVENTOSECTOR
  Left = 456
  Top = 243
  Width = 740
  Height = 580
  Caption = 'Publicaciones de Eventos y Tareas'
  Constraints.MinHeight = 580
  Constraints.MinWidth = 740
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  object JvgSplitter: TJvNetscapeSplitter [0]
    Left = 366
    Top = 174
    Height = 328
    Align = alRight
    Visible = False
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  inherited pnlFiltros: TPanel
    Width = 732
    Height = 145
    Visible = True
    object pnlFiltrosFiltrables: TPanel
      Left = 0
      Top = 0
      Width = 577
      Height = 145
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        577
        145)
      object Label2: TLabel
        Left = 11
        Top = 7
        Width = 74
        Height = 13
        Caption = 'Evento o Tarea'
      end
      object Label7: TLabel
        Left = 199
        Top = 7
        Width = 38
        Height = 13
        Caption = 'Proceso'
      end
      object Label9: TLabel
        Left = 363
        Top = 7
        Width = 115
        Height = 13
        Caption = 'Motivo de Evento padre'
      end
      object Label18: TLabel
        Left = 364
        Top = 56
        Width = 137
        Height = 13
        Caption = 'Destinatario predeterminado'
      end
      object Label19: TLabel
        Left = 364
        Top = 100
        Width = 117
        Height = 13
        Caption = 'Sector seg'#250'n la Intranet'
      end
      inline fraTE_ID: TfraCodDesc
        Left = 7
        Top = 23
        Width = 185
        Height = 23
        TabOrder = 0
        DesignSize = (
          185
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 120
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'TE_FECHABAJA'
          FieldCodigo = 'TE_ID'
          FieldDesc = 'TE_DESCRIPCION'
          FieldID = 'TE_ID'
          OrderBy = 'TE_DESCRIPCION'
          ShowBajas = True
          TableName = 'AGENDA.ATE_TIPOEVENTO'
          Left = 100
        end
      end
      object rgTipoEvento: TRadioGroup
        Left = 8
        Top = 53
        Width = 74
        Height = 59
        Caption = ' Tipo '
        ItemIndex = 0
        Items.Strings = (
          'Ambos'
          'Evento'
          'Tarea')
        TabOrder = 3
        TabStop = True
        OnClick = tbRefrescarClick
      end
      inline fraTE_IDPADRE: TfraCodDesc
        Left = 360
        Top = 23
        Width = 208
        Height = 23
        TabOrder = 2
        DesignSize = (
          208
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 143
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND TE_TIPOEVENTO = '#39'E'#39' '
          FieldBaja = 'TE_FECHABAJA'
          FieldCodigo = 'TE_ID'
          FieldDesc = 'TE_DESCRIPCION'
          FieldID = 'TE_ID'
          IdType = ctInteger
          OrderBy = 'TE_DESCRIPCION'
          ShowBajas = True
          TableName = 'AGENDA.ATE_TIPOEVENTO'
          Left = 116
        end
      end
      object rgSQL: TRadioGroup
        Left = 87
        Top = 53
        Width = 120
        Height = 59
        Caption = ' Respuesta sugerida '
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Con respuesta'
          'Sin respuesta')
        TabOrder = 4
        TabStop = True
        OnClick = tbRefrescarClick
      end
      object rgBajas: TRadioGroup
        Left = 211
        Top = 53
        Width = 141
        Height = 59
        Caption = ' Registros dados de baja '
        ItemIndex = 1
        Items.Strings = (
          'Todos'
          'S'#243'lo activos'
          'Dados de baja')
        TabOrder = 5
        TabStop = True
        OnClick = tbRefrescarClick
      end
      object Panel6: TPanel
        Left = 8
        Top = 114
        Width = 168
        Height = 25
        Anchors = [akTop, akRight]
        BevelInner = bvLowered
        Caption = 'Tiene Respuesta Sugerida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object Panel5: TPanel
        Left = 184
        Top = 114
        Width = 168
        Height = 25
        Anchors = [akTop, akRight]
        BevelInner = bvLowered
        Caption = 'NO Tiene Respuesta Sugerida'
        TabOrder = 7
      end
      inline fraTE_IDPROCESO: TfraCodDesc
        Left = 196
        Top = 23
        Width = 157
        Height = 23
        TabOrder = 1
        DesignSize = (
          157
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 28
          Width = 125
        end
        inherited edCodigo: TPatternEdit
          Width = 24
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'PO_ID'
          FieldDesc = 'PO_DESCRIPCION'
          FieldID = 'PO_ID'
          IdType = ctInteger
          OrderBy = 'PO_DESCRIPCION'
          ShowBajas = True
          TableName = 'AGENDA.APO_PROCESO'
          Left = 68
        end
      end
      inline fraTE_IDDESTINATARIO: TfraCodDesc
        Left = 360
        Top = 72
        Width = 209
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        DesignSize = (
          209
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 24
          Width = 183
        end
        inherited edCodigo: TPatternEdit
          Width = 20
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'TD_FECHABAJA'
          FieldCodigo = 'TD_ID'
          FieldDesc = 'TD_DESCRIPCION'
          FieldID = 'TD_ID'
          IdType = ctInteger
          OrderBy = 'TD_DESCRIPCION'
          ShowBajas = True
          TableName = 'AGENDA.ATD_TIPODESTINATARIO'
          Left = 88
        end
      end
      inline fraTS_IDSECTOR: TfraCodDesc
        Left = 360
        Top = 116
        Width = 208
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        DesignSize = (
          208
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 48
          Width = 159
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
              FieldName = 'GERENCIA'
              Title.Caption = 'Gerencia'
              Visible = True
            end>
        end
        inherited edCodigo: TPatternEdit
          Width = 44
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = ' AND SE_NIVEL = 4'
          ExtraFields = 
            ', se_nivel, (SELECT ger.se_descripcion FROM computos.cse_sector ' +
            'ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FROM computos' +
            '.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idsectorpadre F' +
            'ROM computos.cse_sector sec WHERE sec.se_id = computos.cse_secto' +
            'r.se_id))) AS gerencia'
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_ID'
          FieldDesc = 'SE_DESCRIPCION'
          FieldID = 'SE_ID'
          OrderBy = 'SE_DESCRIPCION'
          ShowBajas = True
          TableName = 'COMPUTOS.CSE_SECTOR'
          Left = 88
        end
      end
    end
    object clbFiltroMotivosIngreso: TARTCheckListBox
      Left = 577
      Top = 0
      Width = 155
      Height = 145
      Align = alClient
      BevelEdges = []
      Columns = 1
      ItemHeight = 13
      TabOrder = 1
      OnClick = tbRefrescarClick
      AutoAjustarColumnas = True
      Locked = False
      SQL = 
        'SELECT MI_DESCRIPCION, MI_ID FROM AGENDA.AMI_MOTIVOINGRESO ORDER' +
        ' BY MI_DESCRIPCION'
    end
  end
  inherited CoolBar: TCoolBar
    Top = 145
    Width = 732
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 728
      end>
    inherited ToolBar: TToolBar
      Width = 715
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      object chkVerUsuarios: TCheckBox
        Left = 370
        Top = 0
        Width = 139
        Height = 22
        Alignment = taLeftJustify
        Caption = '  Ver usuarios con acceso'
        TabOrder = 0
        OnClick = chkVerUsuariosClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 174
    Width = 366
    Height = 328
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TE_DESCRIPCION'
        Title.Caption = 'Motivo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GERENCIA'
        Title.Caption = 'Gerencia'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JEFATURA'
        Title.Caption = 'Jefatura'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIVACIDAD'
        Title.Caption = 'Privacidad'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS_FECHAALTA'
        Title.Caption = 'Alta'
        Visible = True
      end>
  end
  object GridUsuarios: TArtDBGrid [4]
    Left = 562
    Top = 174
    Width = 170
    Height = 328
    Align = alRight
    DataSource = dsUsuarios
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    IniStorage = FormStorage
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SECTOR'
        Title.Caption = 'Sector'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Usuario'
        Width = 55
        Visible = True
      end>
  end
  object pnlBottom: TPanel [5]
    Left = 0
    Top = 502
    Width = 732
    Height = 51
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 5
    object Label1: TLabel
      Left = 10
      Top = 8
      Width = 19
      Height = 13
      Caption = 'Alta'
    end
    object Label3: TLabel
      Left = 226
      Top = 8
      Width = 88
      Height = 13
      Caption = #218'ltima modifcaci'#243'n'
    end
    object Label4: TLabel
      Left = 442
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Baja'
    end
    object edTS_USUALTA: TDBEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      DataField = 'TS_USUALTA'
      DataSource = dsConsulta
      TabOrder = 0
    end
    object edTS_USUMODIF: TDBEdit
      Left = 224
      Top = 24
      Width = 121
      Height = 21
      DataField = 'TS_USUMODIF'
      DataSource = dsConsulta
      TabOrder = 1
    end
    object edTS_USUBAJA: TDBEdit
      Left = 440
      Top = 24
      Width = 121
      Height = 21
      DataField = 'TS_USUBAJA'
      DataSource = dsConsulta
      TabOrder = 2
    end
    object edTS_FECHAALTA: TDBDateEdit
      Left = 132
      Top = 24
      Width = 89
      Height = 21
      DataField = 'TS_FECHAALTA'
      DataSource = dsConsulta
      NumGlyphs = 2
      TabOrder = 3
    end
    object edTS_FECHAMODIF: TDBDateEdit
      Left = 348
      Top = 24
      Width = 89
      Height = 21
      DataField = 'TS_FECHAMODIF'
      DataSource = dsConsulta
      NumGlyphs = 2
      TabOrder = 4
    end
    object edTS_FECHABAJA: TDBDateEdit
      Left = 564
      Top = 24
      Width = 89
      Height = 21
      DataField = 'TS_FECHABAJA'
      DataSource = dsConsulta
      NumGlyphs = 2
      TabOrder = 5
    end
  end
  object pnlTodos: TJvPanel [6]
    Left = 376
    Top = 174
    Width = 186
    Height = 328
    MultiLine = False
    Align = alRight
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object Label5: TLabel
      Left = 16
      Top = 16
      Width = 157
      Height = 26
      Alignment = taCenter
      Caption = 
        'Todos los usuarios tienen acceso'#13#10'porque la visibilidad es p'#250'bli' +
        'ca.'
    end
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 204
    Width = 373
    Height = 262
    Position = poScreenCenter
    OnShow = fpAbmShow
    DesignSize = (
      373
      262)
    inherited BevelAbm: TBevel
      Top = 226
      Width = 365
    end
    object Label6: TLabel [1]
      Left = 12
      Top = 56
      Width = 117
      Height = 13
      Caption = 'Sector seg'#250'n la Intranet'
    end
    object Label8: TLabel [2]
      Left = 12
      Top = 96
      Width = 49
      Height = 13
      Caption = 'Privacidad'
    end
    object Label10: TLabel [3]
      Left = 12
      Top = 140
      Width = 49
      Height = 13
      Caption = 'Operaci'#243'n'
    end
    object Label11: TLabel [4]
      Left = 11
      Top = 11
      Width = 74
      Height = 13
      Caption = 'Evento o Tarea'
    end
    inherited btnAceptar: TButton
      Left = 218
      Top = 232
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 293
      Top = 232
      TabOrder = 6
    end
    inline fraSector: TfraCodDesc
      Left = 8
      Top = 72
      Width = 349
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        349
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 298
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
            FieldName = 'GERENCIA'
            Title.Caption = 'Gerencia'
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 44
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ' AND SE_NIVEL = 4'
        ExtraFields = 
          ', se_nivel, (SELECT ger.se_descripcion FROM computos.cse_sector ' +
          'ger WHERE ger.se_id = (SELECT jef.se_idsectorpadre FROM computos' +
          '.cse_sector jef WHERE jef.se_id = (SELECT sec.se_idsectorpadre F' +
          'ROM computos.cse_sector sec WHERE sec.se_id = computos.cse_secto' +
          'r.se_id))) AS gerencia'
        FieldBaja = 'SE_FECHABAJA'
        FieldCodigo = 'SE_ID'
        FieldDesc = 'SE_DESCRIPCION'
        FieldID = 'SE_ID'
        OrderBy = 'SE_DESCRIPCION'
        ShowBajas = True
        TableName = 'COMPUTOS.CSE_SECTOR'
        Left = 88
      end
    end
    object cmbPrivacidad: TComboBox
      Left = 8
      Top = 116
      Width = 181
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'PR - Privado'
        'PG - Protegido'
        'PU - P'#250'blico'
        'SE - Sector'
        'JE - Jefatura'
        'GE - Gerencia')
    end
    object cmbOperacion: TComboBox
      Left = 8
      Top = 156
      Width = 181
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Autom'#225'tico'
        'Manual')
    end
    object chkRequiereRespuesta: TCheckBox
      Left = 8
      Top = 184
      Width = 189
      Height = 17
      AllowGrayed = True
      Caption = 'Requiere respuesta'
      TabOrder = 4
      OnClick = chkRequiereRespuestaClick
    end
    inline fraEventoTarea: TfraCodDesc
      Left = 7
      Top = 27
      Width = 350
      Height = 23
      TabOrder = 0
      DesignSize = (
        350
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 297
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
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = 
          ' AND NOT EXISTS (SELECT 1 FROM AGENDA.ATS_TIPOEVENTOSECTOR WHERE' +
          ' TS_IDTIPOEVENTO = TE_ID AND TS_PRIVACIDAD = '#39'PU'#39' AND TS_FECHABA' +
          'JA IS NULL) '
        ExtraFields = 
          ', case when te_tipoevento = '#39'E'#39' then '#39'Evento'#39' else '#39'Tarea'#39' end a' +
          's TIPO'
        FieldBaja = 'TE_FECHABAJA'
        FieldCodigo = 'TE_ID'
        FieldDesc = 'TE_DESCRIPCION'
        FieldID = 'TE_ID'
        OrderBy = 'TE_DESCRIPCION'
        ShowBajas = True
        TableName = 'AGENDA.ATE_TIPOEVENTO'
        Left = 100
      end
    end
    object chkRequiereRespuestaTabulada: TCheckBox
      Left = 8
      Top = 204
      Width = 189
      Height = 17
      AllowGrayed = True
      Caption = 'Requiere respuesta tabulada'
      TabOrder = 7
      OnClick = chkRequiereRespuestaTabuladaClick
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      'SELECT *'
      
        '  FROM (SELECT ts_id, ts_idtipoevento, ts_idsector, ts_privacida' +
        'd,'
      '               DECODE(ts_privacidad,'
      '                      '#39'PU'#39', '#39'P'#250'blico'#39','
      '                      '#39'PR'#39', '#39'Privado'#39','
      '                      '#39'PG'#39', '#39'Protegido'#39','
      '                      '#39'SE'#39', '#39'Sector'#39','
      '                      '#39'JE'#39', '#39'Jefatura'#39','
      '                      '#39'GE'#39', '#39'Gerencia'#39','
      '                      '#39'No se sabe'#39') AS privacidad,'
      
        '               ts_tipooperacion, DECODE(ts_tipooperacion, '#39'A'#39', '#39 +
        'Autom'#225'tico'#39', '#39'M'#39', '#39'Manual'#39', '#39'Otro'#39') AS tipo, ts_usualta,'
      
        '               ts_fechaalta, ts_usumodif, ts_fechamodif, ts_usub' +
        'aja, ts_fechabaja, ts_requiererespuesta, ts_hito,'
      
        '               ts_obligatorio, te_id, te_descripcion, sector.se_' +
        'id idsector, sector.se_descripcion sector,'
      
        '               jefatura.se_id idjefatura, jefatura.se_descripcio' +
        'n jefatura, gerencia.se_id idgerencia,'
      
        '               gerencia.se_descripcion gerencia, te_sql, te_tipo' +
        'evento, te_idproceso, te_idpadre, te_iddestinatario,'
      '               ts_requiererespuestatabulada'
      
        '          FROM computos.cse_sector gerencia, computos.cse_sector' +
        ' jefatura, computos.cse_sector sector,'
      
        '               agenda.ate_tipoevento, agenda.ats_tipoeventosecto' +
        'r'
      '         WHERE ts_idsector = sector.se_id'
      '           AND sector.se_idsectorpadre = jefatura.se_id'
      '           AND jefatura.se_idsectorpadre = gerencia.se_id'
      '           AND ts_idtipoevento = te_id)'
      ' WHERE 1 = 1')
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
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
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqUsuariosAfterOpen
    SQL.Strings = (
      
        'SELECT   usuario.se_nombre usuario, sector.se_descripcion AS sec' +
        'tor'
      '    FROM art.use_usuarios usuario, computos.cse_sector sector'
      '   WHERE usuario.se_idsector = sector.se_id'
      
        '     AND art.agenda_pkg.get_privacidad(usuario.se_id, :idmotivo,' +
        ' usuario.se_id, '#39'S'#39') = '#39'S'#39
      '     AND usuario.se_fechabaja IS NULL'
      '     AND usuario.se_mail IS NOT NULL     '
      'ORDER BY 2, 1')
    Left = 24
    Top = 312
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'idmotivo'
        ParamType = ptInput
      end>
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 52
    Top = 312
  end
end
