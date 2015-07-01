object fraFirmante: TfraFirmante
  Left = 0
  Top = 0
  Width = 381
  Height = 21
  TabOrder = 0
  OnExit = FrameExit
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 41
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    ExcludePattern = ' '#39'%'
  end
  object cmbDescripcion: TArtComboBox
    Left = 44
    Top = 0
    Width = 336
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'DF_CODFIRMA'
        Title.Caption = 'Código'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF_USUARIO'
        Title.Caption = 'Descripción'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF_CARACTER'
        Title.Caption = 'Caracter'
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'DF_USUARIO'
    FieldKey = 'DF_CODFIRMA'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT DF_CODFIRMA, DF_USUARIO, DF_CARACTER, DF_TIPONRODOC, DF_F' +
        'BAJA FROM CDF_FIRMASCARTASDOC'
      'WHERE SUBSTR(DF_ESPECIAL,1,1) = '#39'S'#39
      'AND DF_FBAJA IS NULL'
      'ORDER BY DF_USUARIO')
    Top = 24
    object sdqDatosDF_CODFIRMA: TStringField
      FieldName = 'DF_CODFIRMA'
      Required = True
      Size = 5
    end
    object sdqDatosDF_USUARIO: TStringField
      FieldName = 'DF_USUARIO'
      Size = 50
    end
    object sdqDatosDF_CARACTER: TStringField
      FieldName = 'DF_CARACTER'
      Size = 60
    end
    object sdqDatosDF_TIPONRODOC: TStringField
      FieldName = 'DF_TIPONRODOC'
    end
    object sdqDatosDF_FBAJA: TDateTimeField
      FieldName = 'DF_FBAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
