inherited fraOperativo: TfraOperativo
  Width = 420
  Height = 23
  OnExit = FrameExit
  DesignSize = (
    420
    23)
  object edPeriodo: TPeriodoPicker
    Left = 0
    Top = 0
    Width = 49
    Height = 21
    OnExit = edPeriodoExit
    TabOrder = 0
    TabStop = True
    Color = clWindow
    Periodo.AllowNull = True
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 0
    Periodo.Ano = 0
    Periodo.MaxPeriodo = '205010'
    Periodo.MinPeriodo = '199801'
    WidthMes = 19
    Separation = 0
    ShowButton = False
    ShowOrder = poAnoMes
    ReadOnly = False
    Enabled = True
    OnKeyDown = edPeriodoKeyDown
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NullDropDown = SetMax
    AutoExit = True
  end
  object cmbDescripcion: TArtComboBox
    Left = 52
    Top = 0
    Width = 368
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'PE_PERIODO'
        Title.Caption = 'Periodo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 240
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'PE_DESCRIPCION'
    FieldKey = 'PE_PERIODO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT PE_PERIODO, PE_DESCRIPCION'
      'FROM AMP_PERIODOS'
      'WHERE 1=2')
    Top = 24
    object sdqDatosPE_PERIODO: TStringField
      FieldName = 'PE_PERIODO'
      Required = True
      Size = 6
    end
    object sdqDatosPE_DESCRIPCION: TStringField
      FieldName = 'PE_DESCRIPCION'
      Size = 60
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
