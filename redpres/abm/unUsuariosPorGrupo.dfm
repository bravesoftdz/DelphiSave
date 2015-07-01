inherited frmUsuariosPorGrupo: TfrmUsuariosPorGrupo
  Left = 388
  Top = 138
  Caption = 'Usuarios por grupo'
  ExplicitLeft = 388
  ExplicitTop = 138
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Visible = True
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 377
      Height = 44
      Caption = 'Grupo'
      TabOrder = 0
      inline fraGrupoFiltro: TfraCodigoDescripcion
        Left = 6
        Top = 15
        Width = 357
        Height = 23
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 15
      end
    end
    object rgVerBajas: TRadioGroup
      Left = 379
      Top = 0
      Width = 169
      Height = 44
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'UG_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UG_USUARIO'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_CODIGO'
        Title.Caption = 'Grupo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UG_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 115
    Width = 438
    Height = 129
    ExplicitLeft = 115
    ExplicitWidth = 438
    ExplicitHeight = 129
    inherited BevelAbm: TBevel
      Top = 93
      Width = 430
    end
    object Label1: TLabel [1]
      Left = 15
      Top = 23
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label2: TLabel [2]
      Left = 15
      Top = 56
      Width = 41
      Height = 13
      Caption = 'Usuarios'
    end
    inherited btnAceptar: TButton
      Left = 280
      Top = 99
    end
    inherited btnCancelar: TButton
      Left = 358
      Top = 99
    end
    inline fraGrupo: TfraCodigoDescripcion
      Left = 62
      Top = 19
      Width = 358
      Height = 23
      TabOrder = 2
      ExplicitLeft = 62
      ExplicitTop = 19
      ExplicitWidth = 358
      DesignSize = (
        358
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 293
      end
    end
    object cmbUsuarios: TDBCheckCombo
      Left = 62
      Top = 53
      Width = 357
      Height = 21
      TabOrder = 3
      DataSource = dsUsuarios
      KeyField = 'ID'
      ListField = 'USUARIO'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select ug_id, gp_codigo, gp_descripcion, ug_usuario, ug_fechabaj' +
        'a'
      'from SIN.sug_usuariosporgrupo, SIN.sgp_gruposprestador'
      'where ug_fechabaja is null and gp_fechabaja is null'
      '  and ug_idgrupo = gp_id')
    object sdqConsultaUG_ID: TFloatField
      FieldName = 'UG_ID'
      Required = True
    end
    object sdqConsultaGP_CODIGO: TStringField
      FieldName = 'GP_CODIGO'
      Size = 10
    end
    object sdqConsultaGP_DESCRIPCION: TStringField
      FieldName = 'GP_DESCRIPCION'
      Size = 200
    end
    object sdqConsultaUG_USUARIO: TStringField
      FieldName = 'UG_USUARIO'
    end
    object sdqConsultaUG_FECHABAJA: TDateTimeField
      FieldName = 'UG_FECHABAJA'
    end
  end
  object sdqUsuarios: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      'SELECT se_usuario id, se_usuario || '#39' | '#39' || se_nombre usuario'
      '  FROM use_usuarios'
      ' WHERE se_fechabaja IS NULL'
      '   AND se_usuariogenerico = '#39'N'#39
      '   AND se_sector = '#39'CONTRATA'#39
      'ORDER BY se_usuario')
    Left = 264
    Top = 212
  end
  object dsUsuarios: TDataSource
    DataSet = sdqUsuarios
    Left = 292
    Top = 212
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
