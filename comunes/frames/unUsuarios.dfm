object fraUsuario: TfraUsuario
  Left = 0
  Top = 0
  Width = 565
  Height = 25
  TabOrder = 0
  OnExit = FrameExit
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
    OnKeyPress = edCodigoKeyPress
    ExcludePattern = ' '#39'%'
  end
  object cmbDescripcion: TArtComboBox
    Left = 76
    Top = 0
    Width = 489
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'IT_CODIGO'
        Title.Caption = 'Código'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 200
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'IT_NOMBRE'
    FieldKey = 'IT_CODIGO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT IT_CODIGO, IT_NOMBRE, IT_PRESTADORA, IT_FECHABAJA'
      'FROM PIT_FIRMANTES'
      'WHERE IT_FECHABAJA IS NULL')
    Top = 24
    object sdqDatosIT_CODIGO: TStringField
      FieldName = 'IT_CODIGO'
      Required = True
      Size = 8
    end
    object sdqDatosIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Required = True
      Size = 255
    end
    object sdqDatosIT_PRESTADORA: TStringField
      FieldName = 'IT_PRESTADORA'
      Size = 8
    end
    object sdqDatosIT_FECHABAJA: TDateTimeField
      FieldName = 'IT_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
