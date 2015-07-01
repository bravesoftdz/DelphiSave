object fraPerfiles: TfraPerfiles
  Left = 0
  Top = 0
  Width = 521
  Height = 22
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    521
    22)
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 0
    OnKeyPress = edCodigoKeyPress
    ExcludePattern = ' '#39'%'
  end
  object cmbDescripcion: TArtComboBox
    Left = 84
    Top = 0
    Width = 437
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'PF_PERFIL'
        Title.Caption = 'Perfil'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PF_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 200
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'PF_DESCRIPCION'
    FieldKey = 'PF_PERFIL'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT PF_PERFIL, PF_DESCRIPCION, PF_FECHABAJA'
      'FROM UPF_PERFILES'
      'ORDER BY PF_DESCRIPCION')
    Top = 24
    object sdqDatosPF_PERFIL: TStringField
      FieldName = 'PF_PERFIL'
      Required = True
      Size = 8
    end
    object sdqDatosPF_DESCRIPCION: TStringField
      FieldName = 'PF_DESCRIPCION'
      Size = 50
    end
    object sdqDatosPF_FECHABAJA: TDateTimeField
      FieldName = 'PF_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
