inherited frmMonitorAlertas: TfrmMonitorAlertas
  Left = 174
  Top = 153
  Width = 789
  Height = 529
  Caption = 'Monitor de Alertas'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 781
    object lblAlerta: TLabel
      Left = 12
      Top = 12
      Width = 29
      Height = 13
      Caption = 'Alerta'
    end
    object edDESCRIPCION_LIKE: TEdit
      Left = 44
      Top = 8
      Width = 189
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  inherited CoolBar: TCoolBar
    Width = 781
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 777
      end>
    inherited ToolBar: TToolBar
      Width = 764
      inherited tbNuevo: TToolButton
        Hint = 'Ejecutar inmediatamente'
        ImageIndex = 35
        Visible = True
        OnClick = tbNuevoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 781
    Height = 436
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'AL_CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL_DESCRIPCION'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL_ACTIVO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL_PROGRAMACIONALTERADA'
        Title.Caption = 'P.Alterada'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL_PROXIMAEJECUCION'
        Title.Caption = 'Pr'#243'x.ejec. Alerta'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL_EJECUTARDEINMEDIATO'
        Title.Caption = 'Now!'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_IDALERTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_ORDEN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_TIPOPROGRAMACION'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_TIPOFRECUENCIA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_FRECUENCIA'
        Title.Caption = 'Frecuencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_FRECUENCIADESDE'
        Title.Caption = 'Desde'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_FRECUENCIAHASTA'
        Title.Caption = 'Hasta'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_PROXIMAEJECUCION'
        Title.Caption = 'Pr'#243'x. ejec. Programaci'#243'n'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PG_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_USUALTA'
        Title.Caption = 'Usuario de alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_FECHAMODIF'
        Title.Caption = 'Fecha de modificaci'#243'n'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_USUMODIF'
        Title.Caption = 'Usuario de modificaci'#243'n'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_FECHABAJA'
        Title.Caption = 'Fecha de baja'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_USUBAJA'
        Title.Caption = 'Usuario de baja'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PG_UNIDADFRECUENCIA'
        Title.Caption = 'U.de frec.'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT al_id,'
      '               al_codigo,'
      '               al_descripcion,'
      '               al_activo,'
      '               al_programacionalterada,'
      '               al_proximaejecucion,'
      '               al_ejecutardeinmediato,'
      '               pg_idalerta,'
      '               pg_orden,'
      '               pg_tipoprogramacion,'
      '               pg_valor,'
      '               pg_tipofrecuencia,'
      '               pg_frecuencia,'
      '               pg_frecuenciadesde,'
      '               pg_frecuenciahasta,'
      '               pg_proximaejecucion,'
      '               pg_fechaalta,'
      '               pg_usualta,'
      '               pg_fechamodif,'
      '               pg_usumodif,'
      '               pg_fechabaja,'
      '               pg_usubaja,'
      '               pg_unidadfrecuencia,'
      '               UPPER (al_descripcion) descripcion'
      
        '          FROM comunes.cal_alerta cal, comunes.cpg_alertaprogram' +
        'acion'
      '         WHERE pg_idalerta = al_id'
      '           AND cal.al_activo = '#39'S'#39
      '           AND cal.al_fechabaja IS NULL)'
      ' WHERE 1 = 1')
    object sdqConsultaAL_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'AL_CODIGO'
      Required = True
      Size = 5
    end
    object sdqConsultaAL_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'AL_DESCRIPCION'
      Required = True
      Size = 200
    end
    object sdqConsultaAL_ACTIVO: TStringField
      DisplayLabel = 'Activa'
      FieldName = 'AL_ACTIVO'
      Required = True
      Size = 1
    end
    object sdqConsultaAL_PROGRAMACIONALTERADA: TStringField
      FieldName = 'AL_PROGRAMACIONALTERADA'
      Required = True
      Size = 1
    end
    object sdqConsultaAL_PROXIMAEJECUCION: TDateTimeField
      FieldName = 'AL_PROXIMAEJECUCION'
    end
    object sdqConsultaAL_EJECUTARDEINMEDIATO: TStringField
      FieldName = 'AL_EJECUTARDEINMEDIATO'
      Size = 1
    end
    object sdqConsultaPG_IDALERTA: TFloatField
      FieldName = 'PG_IDALERTA'
      Required = True
    end
    object sdqConsultaPG_ORDEN: TFloatField
      FieldName = 'PG_ORDEN'
      Required = True
    end
    object sdqConsultaPG_TIPOPROGRAMACION: TStringField
      FieldName = 'PG_TIPOPROGRAMACION'
      Required = True
      Size = 1
    end
    object sdqConsultaPG_VALOR: TFloatField
      FieldName = 'PG_VALOR'
      Required = True
    end
    object sdqConsultaPG_TIPOFRECUENCIA: TStringField
      FieldName = 'PG_TIPOFRECUENCIA'
      Size = 1
    end
    object sdqConsultaPG_FRECUENCIA: TFloatField
      FieldName = 'PG_FRECUENCIA'
    end
    object sdqConsultaPG_FRECUENCIADESDE: TFloatField
      FieldName = 'PG_FRECUENCIADESDE'
    end
    object sdqConsultaPG_FRECUENCIAHASTA: TFloatField
      FieldName = 'PG_FRECUENCIAHASTA'
    end
    object sdqConsultaPG_PROXIMAEJECUCION: TDateTimeField
      FieldName = 'PG_PROXIMAEJECUCION'
    end
    object sdqConsultaPG_FECHAALTA: TDateTimeField
      FieldName = 'PG_FECHAALTA'
    end
    object sdqConsultaPG_USUALTA: TStringField
      FieldName = 'PG_USUALTA'
      Size = 30
    end
    object sdqConsultaPG_FECHAMODIF: TDateTimeField
      FieldName = 'PG_FECHAMODIF'
    end
    object sdqConsultaPG_USUMODIF: TStringField
      FieldName = 'PG_USUMODIF'
      Size = 30
    end
    object sdqConsultaPG_FECHABAJA: TDateTimeField
      FieldName = 'PG_FECHABAJA'
    end
    object sdqConsultaPG_USUBAJA: TStringField
      FieldName = 'PG_USUBAJA'
      Size = 30
    end
    object sdqConsultaPG_UNIDADFRECUENCIA: TStringField
      FieldName = 'PG_UNIDADFRECUENCIA'
      Size = 1
    end
    object sdqConsultaAL_ID: TFloatField
      FieldName = 'AL_ID'
      Required = True
    end
    object sdqConsultaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 200
    end
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
  object Timer: TTimer
    Interval = 5000
    OnTimer = TimerTimer
    Left = 80
    Top = 256
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
