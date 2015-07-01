object fraFirmantes: TfraFirmantes
  Left = 0
  Top = 0
  Width = 381
  Height = 21
  TabOrder = 0
  DesignSize = (
    381
    21)
  object cmbDescripcion: TArtComboBox
    Left = 44
    Top = 0
    Width = 337
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'FI_ID'
        Title.Caption = 'C'#243'digo'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_FIRMANTE'
        Title.Caption = 'Descripci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FI_CARACTER'
        Title.Caption = 'Caracter'
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'FI_FIRMANTE'
    FieldKey = 'FI_ID'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edCodigo: TIntEdit
    Left = 0
    Top = 0
    Width = 40
    Height = 21
    TabOrder = 0
    OnExit = edCodigoExit
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT   fi_id, fi_firmante, fi_caracter, fi_fechabaja'
      '    FROM cfi_firma, cfa_firmantearea, cat_areatexto'
      '   WHERE fi_id = fa_idfirmante'
      '     AND fa_idareatexto = at_id'
      '     AND fa_fechabaja IS NULL'
      '     AND at_fechabaja IS NULL'
      '     AND at_area = :area'
      'ORDER BY fi_firmante')
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'area'
        ParamType = ptInput
      end>
    object sdqDatosFI_ID: TFloatField
      FieldName = 'FI_ID'
      Required = True
    end
    object sdqDatosFI_FIRMANTE: TStringField
      FieldName = 'FI_FIRMANTE'
      Required = True
      Size = 60
    end
    object sdqDatosFI_CARACTER: TStringField
      FieldName = 'FI_CARACTER'
      Required = True
      Size = 60
    end
    object sdqDatosFI_FECHABAJA: TDateTimeField
      FieldName = 'FI_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
