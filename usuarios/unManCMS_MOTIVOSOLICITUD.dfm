inherited frmManCMS_MOTIVOSOLICITUD: TfrmManCMS_MOTIVOSOLICITUD
  Left = 370
  Top = 156
  Caption = 'Motivos de solicitud'
  ClientWidth = 969
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  Font.Name = 'Tahoma'
  ExplicitWidth = 977
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 969
    Height = 57
    Visible = True
    ExplicitWidth = 969
    ExplicitHeight = 57
    object Label13: TLabel
      Left = 8
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Motivo padre'
    end
    inline fraMS_IDPADRE: TfraCodDesc
      Left = 4
      Top = 24
      Width = 277
      Height = 23
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 277
      DesignSize = (
        277
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 212
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
        ExplicitWidth = 212
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = ' and ms_idpadre = -1 '
        ExtraFields = ', ms_nivel'
        FieldBaja = 'null'
        FieldCodigo = 'ms_id'
        FieldDesc = 'ms_descripcion'
        FieldID = 'ms_id'
        IdType = ctInteger
        OrderBy = 'ms_descripcion'
        TableName = 'computos.cms_motivosolicitud'
        OnChange = tbRefrescarClick
        Left = 116
      end
    end
    object chkNoVerBajas: TCheckBox
      Left = 284
      Top = 24
      Width = 133
      Height = 17
      Caption = 'No ver dados de baja'
      TabOrder = 1
      OnClick = tbRefrescarClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 57
    Width = 969
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 963
      end>
    ExplicitTop = 57
    ExplicitWidth = 969
    inherited ToolBar: TToolBar
      Width = 956
      ExplicitWidth = 956
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 86
    Width = 969
    Height = 353
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'MS_ID'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_NIVEL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NIVEL_REQUERIDO'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_VISIBLE'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_IDPADRE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PADRE'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_IDSECTORDEFAULT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SECTOR_DEFAULT'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_TIEMPORESOLUCION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DIAS_RESOLUCION'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORAS_RESOLUCION'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINUTOS_RESOLUCION'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_EJECUTABLEOBLIGATORIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAX_PRIORIDAD'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOLICITUD_REQUERIDA'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAZO_ESTIMADO_USUARIO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INICIO_PROBABLE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_FIN_PROBABLE'
        Width = 80
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 136
    Width = 640
    Height = 249
    Constraints.MaxWidth = 640
    Constraints.MinHeight = 189
    Constraints.MinWidth = 640
    ExplicitLeft = 124
    ExplicitTop = 136
    ExplicitWidth = 640
    ExplicitHeight = 249
    DesignSize = (
      640
      249)
    inherited BevelAbm: TBevel
      Top = 213
      Width = 632
      ExplicitTop = 213
      ExplicitWidth = 632
    end
    object Label2: TLabel [1]
      Left = 20
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label4: TLabel [2]
      Left = 292
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 20
      Top = 60
      Width = 63
      Height = 13
      Caption = 'Motivo padre'
    end
    object Label6: TLabel [4]
      Left = 236
      Top = 60
      Width = 89
      Height = 13
      Caption = 'Nivel de resoluci'#243'n'
    end
    object Label1: TLabel [5]
      Left = 344
      Top = 60
      Width = 100
      Height = 13
      Caption = 'Tiempo de resoluci'#243'n'
    end
    object Label5: TLabel [6]
      Left = 20
      Top = 104
      Width = 110
      Height = 13
      Caption = 'Sector predeterminado'
    end
    object Label7: TLabel [7]
      Left = 382
      Top = 80
      Width = 19
      Height = 13
      Caption = 'd'#237'as'
    end
    object Label8: TLabel [8]
      Left = 442
      Top = 80
      Width = 15
      Height = 13
      Caption = 'hs.'
    end
    object Label9: TLabel [9]
      Left = 498
      Top = 80
      Width = 20
      Height = 13
      Caption = 'min.'
    end
    object Label10: TLabel [10]
      Left = 236
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label11: TLabel [11]
      Left = 236
      Top = 104
      Width = 69
      Height = 13
      Caption = 'M'#225'x. Prioridad'
    end
    object Label12: TLabel [12]
      Left = 20
      Top = 153
      Width = 86
      Height = 26
      Hint = 'Es la fecha en que el usuario quiere que su pedido sea resuelto'
      Caption = 'Fecha de Solicitud'#13#10'Requerida'
    end
    object Label14: TLabel [13]
      Left = 119
      Top = 152
      Width = 71
      Height = 26
      Hint = 'Es la fecha en que el usuario quiere que su pedido sea resuelto'
      Caption = 'Plazo estimado'#13#10'por el usuario'
    end
    object Label15: TLabel [14]
      Left = 219
      Top = 152
      Width = 72
      Height = 26
      Hint = 'Es la fecha en que el usuario quiere que su pedido sea resuelto'
      Caption = 'Fecha de Inicio'#13#10'probable'
    end
    object Label16: TLabel [15]
      Left = 319
      Top = 152
      Width = 61
      Height = 26
      Hint = 'Es la fecha en que el usuario quiere que su pedido sea resuelto'
      Caption = 'Fecha de Fin'#13#10'probable'
    end
    inherited btnAceptar: TButton
      Left = 485
      Top = 219
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      ExplicitLeft = 485
      ExplicitTop = 219
    end
    inherited btnCancelar: TButton
      Left = 560
      Top = 219
      TabOrder = 18
      ExplicitLeft = 560
      ExplicitTop = 219
    end
    inline fraMotivo: TfraCodDesc
      Left = 16
      Top = 32
      Width = 213
      Height = 23
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 32
      ExplicitWidth = 213
      DesignSize = (
        213
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 148
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
        ExplicitWidth = 148
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = ', ms_nivel'
        FieldBaja = 'null'
        FieldCodigo = 'ms_id'
        FieldDesc = 'ms_descripcion'
        FieldID = 'ms_id'
        IdType = ctInteger
        OrderBy = 'ms_descripcion'
        TableName = 'computos.cms_motivosolicitud'
        Left = 116
      end
    end
    object edMS_DESCRIPCION: TEdit
      Left = 288
      Top = 33
      Width = 341
      Height = 21
      TabOrder = 2
    end
    inline fraMotivoPadre: TfraCodDesc
      Left = 16
      Top = 76
      Width = 213
      Height = 23
      TabOrder = 3
      ExplicitLeft = 16
      ExplicitTop = 76
      ExplicitWidth = 213
      DesignSize = (
        213
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 148
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
        ExplicitWidth = 148
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = ' and ms_idpadre = -1 '
        ExtraFields = ', ms_nivel'
        FieldBaja = 'null'
        FieldCodigo = 'ms_id'
        FieldDesc = 'ms_descripcion'
        FieldID = 'ms_id'
        IdType = ctInteger
        OrderBy = 'ms_descripcion'
        TableName = 'computos.cms_motivosolicitud'
        Left = 116
      end
    end
    object cmbMS_NIVEL: TComboBox
      Left = 232
      Top = 76
      Width = 109
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      Items.Strings = (
        'Sector'
        'Jefatura'
        'Gerencia'
        'Ejecutivo')
    end
    inline fraMS_IDSECTORDEFAULT: TfraCodDesc
      Left = 16
      Top = 120
      Width = 189
      Height = 23
      TabOrder = 8
      ExplicitLeft = 16
      ExplicitTop = 120
      ExplicitWidth = 189
      DesignSize = (
        189
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 124
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
        ExplicitWidth = 124
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraCondition = 
          ' and se_nivel = 4 and exists(select 1 from computos.csu_sectorus' +
          'uario where su_idsector = se_id) '
        ExtraFields = ', se_nivel'
        FieldBaja = 'se_fechabaja'
        FieldCodigo = 'se_id'
        FieldDesc = 'se_descripcion'
        FieldID = 'se_id'
        IdType = ctInteger
        OrderBy = 'se_descripcion'
        TableName = 'computos.cse_sector'
        Left = 116
      end
    end
    object edDIAS_RESOLUCION: TIntEdit
      Left = 344
      Top = 76
      Width = 33
      Height = 21
      Hint = 'Medido en d'#237'as'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edHORAS_RESOLUCION: TIntEdit
      Left = 404
      Top = 76
      Width = 33
      Height = 21
      Hint = 'Medido en horas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edMINUTOS_RESOLUCION: TIntEdit
      Left = 460
      Top = 76
      Width = 33
      Height = 21
      Hint = 'Medido en minutos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edMS_ID: TIntEdit
      Left = 232
      Top = 33
      Width = 53
      Height = 21
      Hint = 'Medido en d'#237'as'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Alignment = taRightJustify
      MaxLength = 0
    end
    object chkMS_EJECUTABLEOBLIGATORIO: TJvXPCheckbox
      Left = 312
      Top = 116
      Width = 150
      Height = 25
      Caption = 'Debe indicar la aplicaci'#243'n del Portal correspondiente'
      TabOrder = 11
      StyleManager = JvXPStyleManager
    end
    object cmbMS_MAXIMAPRIORIDAD: TComboBox
      Left = 232
      Top = 120
      Width = 77
      Height = 21
      Style = csDropDownList
      TabOrder = 10
      Items.Strings = (
        'Alta'
        'Media'
        'Baja')
    end
    object chkMS_VISIBLE: TJvXPCheckbox
      Left = 464
      Top = 116
      Width = 65
      Height = 25
      Caption = 'Visible en la web'
      TabOrder = 12
      StyleManager = JvXPStyleManager
    end
    object ToolBarSectores: TToolBar
      Left = 205
      Top = 120
      Width = 23
      Height = 22
      Align = alNone
      AutoSize = True
      Images = ImageListSectores
      TabOrder = 9
      object tbArbolSectores: TToolButton
        Left = 0
        Top = 0
        Hint = 'Despliega el '#225'rbol de sectores'
        Caption = 'tbArbolSectores'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = tbArbolSectoresClick
      end
    end
    object cmbMS_FECHA_SOLICITUD_REQUERIDA: TComboBox
      Left = 16
      Top = 183
      Width = 93
      Height = 21
      Style = csDropDownList
      TabOrder = 13
      Items.Strings = (
        'No permite'
        'Obligatoria'
        'Optativa')
    end
    object cmbMS_PLAZO_ESTIMADO_USUARIO: TComboBox
      Left = 115
      Top = 182
      Width = 93
      Height = 21
      Style = csDropDownList
      TabOrder = 14
      Items.Strings = (
        'No permite'
        'Obligatorio'
        'Optativo')
    end
    object cmbMS_FECHA_INICIO_PROBABLE: TComboBox
      Left = 215
      Top = 182
      Width = 93
      Height = 21
      Style = csDropDownList
      TabOrder = 15
      Items.Strings = (
        'No permite'
        'Obligatoria'
        'Optativa')
    end
    object cmbMS_FECHA_FIN_PROBABLE: TComboBox
      Left = 315
      Top = 182
      Width = 93
      Height = 21
      Style = csDropDownList
      TabOrder = 16
      Items.Strings = (
        'No permite'
        'Obligatoria'
        'Optativa')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ms_id,'
      '       ms_descripcion,'
      '       ms_nivel,'
      '       ms_visible,'
      '       ms_idpadre,'
      '       (SELECT padre.ms_descripcion'
      '          FROM computos.cms_motivosolicitud padre'
      '         WHERE padre.ms_id = motivo.ms_idpadre)'
      '         AS padre,'
      '       ms_idsectordefault,'
      '       ms_tiemporesolucion,'
      '       TRUNC(ms_tiemporesolucion / 24 / 60) AS dias_resolucion,'
      
        '       TRUNC(ms_tiemporesolucion / 60) - (TRUNC(ms_tiemporesoluc' +
        'ion / 24 / 60) * 24) AS horas_resolucion,'
      
        '       ms_tiemporesolucion - (TRUNC(ms_tiemporesolucion / 60) - ' +
        '(TRUNC(ms_tiemporesolucion / 24 / 60) * 24)) * 60 - (TRUNC('
      '       ms_tiemporesolucion / 24 / 60) * 24 * 60)'
      '         AS minutos_resolucion,'
      '       ms_usualta,'
      '       ms_fechaalta,'
      '       ms_usumodif,'
      '       ms_fechamodif,'
      '       ms_usubaja,'
      '       ms_fechabaja,'
      '       (SELECT se_descripcion'
      '          FROM computos.cse_sector'
      '         WHERE se_id = ms_idsectordefault)'
      '         AS sector_default,'
      '       ms_ejecutableobligatorio,'
      '       ms_maximaprioridad,'
      '       ms_fecha_solicitud_requerida,'
      '       ms_plazo_estimado_usuario,'
      '       ms_fecha_inicio_probable,'
      '       ms_fecha_fin_probable,'
      '       CASE ms_nivel'
      '         WHEN 0 THEN '#39'Sector'#39
      '         WHEN 1 THEN '#39'Jefatura'#39
      '         WHEN 2 THEN '#39'Gerencia'#39
      '         WHEN 3 THEN '#39'Ejecutivo'#39
      '       END'
      '         AS nivel_requerido,'
      '       CASE ms_maximaprioridad'
      '         WHEN 1 THEN '#39'Alta'#39
      '         WHEN 2 THEN '#39'Media'#39
      '         WHEN 3 THEN '#39'Baja'#39
      '       END'
      '         AS max_prioridad,'
      '       CASE ms_fecha_solicitud_requerida'
      '         WHEN '#39'S'#39' THEN '#39'Obligatoria'#39
      '         WHEN '#39'N'#39' THEN '#39'No permite'#39
      '         WHEN '#39'O'#39' THEN '#39'Optativa'#39
      '       END'
      '         AS solicitud_requerida,'
      '       CASE ms_fecha_solicitud_requerida'
      '         WHEN '#39'N'#39' THEN 0'
      '         WHEN '#39'S'#39' THEN 1'
      '         WHEN '#39'O'#39' THEN 2'
      '         ELSE -1'
      '       END'
      '         AS num_fecha_solicitud_requerida,'
      '       CASE ms_plazo_estimado_usuario'
      '         WHEN '#39'S'#39' THEN '#39'Obligatorio'#39
      '         WHEN '#39'N'#39' THEN '#39'No permite'#39
      '         WHEN '#39'O'#39' THEN '#39'Optativo'#39
      '       END'
      '         AS plazo_estimado_usuario,'
      '       CASE ms_plazo_estimado_usuario'
      '         WHEN '#39'N'#39' THEN 0'
      '         WHEN '#39'S'#39' THEN 1'
      '         WHEN '#39'O'#39' THEN 2'
      '         ELSE -1'
      '       END'
      '         AS num_plazo_estimado_usuario,'
      '       CASE ms_fecha_inicio_probable'
      '         WHEN '#39'S'#39' THEN '#39'Obligatoria'#39
      '         WHEN '#39'N'#39' THEN '#39'No permite'#39
      '         WHEN '#39'O'#39' THEN '#39'Optativa'#39
      '       END'
      '         AS fecha_inicio_probable,'
      '       CASE ms_fecha_inicio_probable'
      '         WHEN '#39'N'#39' THEN 0'
      '         WHEN '#39'S'#39' THEN 1'
      '         WHEN '#39'O'#39' THEN 2'
      '         ELSE -1'
      '       END'
      '         AS num_fecha_inicio_probable,'
      '       CASE ms_fecha_fin_probable'
      '         WHEN '#39'S'#39' THEN '#39'Obligatoria'#39
      '         WHEN '#39'N'#39' THEN '#39'No permite'#39
      '         WHEN '#39'O'#39' THEN '#39'Optativa'#39
      '       END'
      '         AS fecha_fin_probable,'
      '       CASE ms_fecha_fin_probable'
      '         WHEN '#39'N'#39' THEN 0'
      '         WHEN '#39'S'#39' THEN 1'
      '         WHEN '#39'O'#39' THEN 2'
      '         ELSE -1'
      '       END'
      '         AS num_fecha_fin_probable'
      
        '  FROM computos.cms_motivosolicitud motivo, computos.cts_tickets' +
        'ector cts'
      
        ' WHERE art.agenda_pkg.is_sectordependiente(cts.ts_idsector, moti' +
        'vo.ms_idsectordefault) = '#39'S'#39
      '   AND cts.ts_idsistematicket IN'
      '           (SELECT DISTINCT ts_idsistematicket'
      '              FROM computos.cms_motivosolicitud cms2,'
      '                   computos.cts_ticketsector,'
      '                   computos.cse_sector sector,'
      '                   art.use_usuarios users'
      '             WHERE cms2.ms_id = motivo.ms_id'
      '               AND sector.se_id = users.se_idsector'
      '               AND users.se_usuario = %usuario%/*art.getosuser*/'
      
        '               --AND art.agenda_pkg.is_sectordependiente(sector.' +
        'se_id, motivo.ms_idsectordefault) = '#39'S'#39
      
        '               AND art.agenda_pkg.is_sectordependiente(ts_idsect' +
        'or, sector.se_id) = '#39'S'#39')')
    object sdqConsultaMS_ID: TFloatField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'MS_ID'
      Required = True
    end
    object sdqConsultaMS_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'MS_DESCRIPCION'
      Size = 100
    end
    object sdqConsultaMS_NIVEL: TFloatField
      DisplayLabel = 'Nivel'
      FieldName = 'MS_NIVEL'
      Required = True
    end
    object sdqConsultaMS_VISIBLE: TStringField
      DisplayLabel = 'Visible'
      FieldName = 'MS_VISIBLE'
      Required = True
      Size = 1
    end
    object sdqConsultaMS_IDPADRE: TFloatField
      DisplayLabel = 'C'#243'digo sector padre'
      FieldName = 'MS_IDPADRE'
      Required = True
    end
    object sdqConsultaMS_IDSECTORDEFAULT: TFloatField
      DisplayLabel = 'Default'
      FieldName = 'MS_IDSECTORDEFAULT'
    end
    object sdqConsultaMS_TIEMPORESOLUCION: TFloatField
      DisplayLabel = 'Resoluci'#243'n'
      FieldName = 'MS_TIEMPORESOLUCION'
    end
    object sdqConsultaPADRE: TStringField
      DisplayLabel = 'Motivo padre'
      FieldName = 'PADRE'
      Size = 100
    end
    object sdqConsultaMS_USUALTA: TStringField
      FieldName = 'MS_USUALTA'
    end
    object sdqConsultaMS_FECHAALTA: TDateTimeField
      FieldName = 'MS_FECHAALTA'
    end
    object sdqConsultaMS_USUMODIF: TStringField
      FieldName = 'MS_USUMODIF'
    end
    object sdqConsultaMS_FECHAMODIF: TDateTimeField
      FieldName = 'MS_FECHAMODIF'
    end
    object sdqConsultaMS_USUBAJA: TStringField
      FieldName = 'MS_USUBAJA'
    end
    object sdqConsultaMS_FECHABAJA: TDateTimeField
      FieldName = 'MS_FECHABAJA'
    end
    object sdqConsultaSECTOR_DEFAULT: TStringField
      DisplayLabel = 'Sector default'
      FieldName = 'SECTOR_DEFAULT'
      Size = 50
    end
    object sdqConsultaDIAS_RESOLUCION: TFloatField
      DisplayLabel = 'D'#237'as'
      FieldName = 'DIAS_RESOLUCION'
    end
    object sdqConsultaHORAS_RESOLUCION: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS_RESOLUCION'
    end
    object sdqConsultaMINUTOS_RESOLUCION: TFloatField
      DisplayLabel = 'Minutos'
      FieldName = 'MINUTOS_RESOLUCION'
    end
    object sdqConsultaMS_EJECUTABLEOBLIGATORIO: TStringField
      DisplayLabel = 'Ejecutable'
      FieldName = 'MS_EJECUTABLEOBLIGATORIO'
      Required = True
      Size = 1
    end
    object sdqConsultaMS_MAXIMAPRIORIDAD: TFloatField
      FieldName = 'MS_MAXIMAPRIORIDAD'
      Required = True
    end
    object sdqConsultaMAX_PRIORIDAD: TStringField
      DisplayLabel = 'M'#225'xima prioridad'
      FieldName = 'MAX_PRIORIDAD'
      Size = 5
    end
    object sdqConsultaNIVEL_REQUERIDO: TStringField
      DisplayLabel = 'Autorizaci'#243'n'
      FieldName = 'NIVEL_REQUERIDO'
      Size = 9
    end
    object sdqConsultaMS_FECHA_SOLICITUD_REQUERIDA: TStringField
      FieldName = 'MS_FECHA_SOLICITUD_REQUERIDA'
      Size = 1
    end
    object sdqConsultaSOLICITUD_REQUERIDA: TStringField
      DisplayLabel = 'Solicitud Requerida'
      FieldName = 'SOLICITUD_REQUERIDA'
      Size = 11
    end
    object sdqConsultaNUM_FECHA_SOLICITUD_REQUERIDA: TFloatField
      FieldName = 'NUM_FECHA_SOLICITUD_REQUERIDA'
    end
    object sdqConsultaMS_PLAZO_ESTIMADO_USUARIO: TStringField
      FieldName = 'MS_PLAZO_ESTIMADO_USUARIO'
      Size = 1
    end
    object sdqConsultaPLAZO_ESTIMADO_USUARIO: TStringField
      DisplayLabel = 'Plazo estimado por el Usuario'
      FieldName = 'PLAZO_ESTIMADO_USUARIO'
      Size = 11
    end
    object sdqConsultaNUM_PLAZO_ESTIMADO_USUARIO: TFloatField
      FieldName = 'NUM_PLAZO_ESTIMADO_USUARIO'
    end
    object sdqConsultaMS_FECHA_INICIO_PROBABLE: TStringField
      FieldName = 'MS_FECHA_INICIO_PROBABLE'
      Size = 1
    end
    object sdqConsultaFECHA_INICIO_PROBABLE: TStringField
      DisplayLabel = 'Fecha de Inicio probable'
      FieldName = 'FECHA_INICIO_PROBABLE'
      Size = 11
    end
    object sdqConsultaNUM_FECHA_INICIO_PROBABLE: TFloatField
      FieldName = 'NUM_FECHA_INICIO_PROBABLE'
    end
    object sdqConsultaMS_FECHA_FIN_PROBABLE: TStringField
      FieldName = 'MS_FECHA_FIN_PROBABLE'
      Size = 1
    end
    object sdqConsultaFECHA_FIN_PROBABLE: TStringField
      DisplayLabel = 'Fecha de Fin probable'
      FieldName = 'FECHA_FIN_PROBABLE'
      Size = 11
    end
    object sdqConsultaNUM_FECHA_FIN_PROBABLE: TFloatField
      FieldName = 'NUM_FECHA_FIN_PROBABLE'
    end
  end
  object JvXPStyleManager: TJvXPStyleManager
    Left = 80
    Top = 256
  end
  object ImageListSectores: TImageList
    Left = 80
    Top = 284
    Bitmap = {
      494C010101000500080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F70084ADC6004284
      A50094B5C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEE7EF0042849C0008638C00106B
      9400005A8C005A8CAD00EFF7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7FF0031739C00186B940039A5C60031B5
      DE0029ADCE0000638C0073A5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00F7F7EF006394B500106B94004AB5D60063D6EF0029C6
      E70042D6EF000884AD00297B9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DECEBD00BDA57B009C845200425239004A7373006BD6EF0042E7FF0039EF
      F7005ADEEF00007BAD0063A5BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF7F700B59C
      6B008C6300009C6B0800A5731000A56B00008C520000737B520039DEE70073FF
      FF0021ADCE000873AD00D6E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD9C6300A573
      0800D69C2100EFB53100EFBD3900E7B53100C68C1800945200007B7B4A0018AD
      D6000073AD0094C6DE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DECEAD00A56B0000E7AD
      4200F7BD4200F7C64200F7C64200FFCE4A00FFCE4200D6A52100945200003163
      6B008CBDDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B2900CE9C3900F7BD
      6300E7AD4200E7AD3900E7AD3100EFB53100F7CE4200F7CE4200AD7B1000A584
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6B0000EFBD7B00F7BD
      6B00EFAD5200E7AD4A00E7A53900E7A52900E7B53100F7C63900C69C2100A573
      3100FFFFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5730800EFC68400FFD6
      A500F7B56300EFB56300EFAD4A00E7A53100E7A52900EFB53100C69418009C73
      3100FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6AD6B00DEA54200FFF7
      EF00FFD69C00F7B56300EFAD5200E7A53900E7A52900E7AD2100A5730800B59C
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF7EF00D6943100EFC6
      8400FFFFF700FFDEB500F7C67B00F7B55A00EFAD4A00BD841000946B1800EFEF
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7EFDE00D69C
      3900D6A54A00E7BD7B00EFBD7B00DEA54A00B57B1000A57B3100EFDECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF7
      EF00DEB58400BD842900AD6B0000AD7B2100C6A57300F7EFE700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FF83000000000000FF01000000000000
      FE01000000000000F801000000000000E001000000000000C001000000000000
      C0030000000000008007000000000000800F0000000000008007000000000000
      8007000000000000800F000000000000800F000000000000C01F000000000000
      E03F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
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
