object fraMedico: TfraMedico
  Left = 0
  Top = 0
  Width = 320
  Height = 21
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    320
    21)
  object cmbDescripcion: TArtComboBox
    Left = 56
    Top = 0
    Width = 264
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'ME_MATRICULA'
        Title.Caption = 'Matr'#237'cula'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ME_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 140
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'ME_NOMBRE'
    FieldKey = 'ME_MATRICULA'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 53
    Height = 21
    MaxLength = 8
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    Pattern = '0123456789.'
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT ME_MATRICULA, ME_NOMBRE, ME_FECHABAJA'
      'FROM AME_MEDICO')
    Top = 24
    object sdqDatosME_MATRICULA: TStringField
      FieldName = 'ME_MATRICULA'
      Required = True
      Size = 8
    end
    object sdqDatosME_NOMBRE: TStringField
      FieldName = 'ME_NOMBRE'
      Size = 100
    end
    object sdqDatosME_FECHABAJA: TDateTimeField
      FieldName = 'ME_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
