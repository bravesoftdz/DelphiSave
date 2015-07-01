inherited fraUsuario: TfraUsuario
  Width = 301
  Height = 21
  OnExit = FrameExit
  ExplicitWidth = 301
  ExplicitHeight = 21
  DesignSize = (
    301
    21)
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
    Width = 217
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'SE_USUARIO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 200
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'SE_NOMBRE'
    FieldKey = 'SE_USUARIO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
    ClearOnCancel = True
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT SE_USUARIO, SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABAJA' +
        ' '
      'FROM USE_USUARIOS'
      'WHERE SE_FECHABAJA IS NULL'
      '')
    Top = 24
    object sdqDatosSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
      Required = True
    end
    object sdqDatosSE_NOMBRE: TStringField
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqDatosSE_SECTOR: TStringField
      FieldName = 'SE_SECTOR'
      Size = 8
    end
    object sdqDatosSE_PERFIL: TStringField
      FieldName = 'SE_PERFIL'
      Required = True
      Size = 8
    end
    object sdqDatosSE_FECHABAJA: TDateTimeField
      FieldName = 'SE_FECHABAJA'
    end
    object sdqDatosSE_MAIL: TStringField
      FieldName = 'SE_MAIL'
      Size = 100
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
