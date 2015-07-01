object fraCIIU: TfraCIIU
  Left = 0
  Top = 0
  Width = 438
  Height = 21
  TabOrder = 0
  OnExit = FrameExit
  object cmbDescripcion: TArtComboBox
    Left = 48
    Top = 0
    Width = 391
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CIIU'
        Title.Caption = 'Código'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ACTIVIDAD'
        Title.Caption = 'Descripción'
        Width = 140
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'DESC_ACTIVIDAD'
    FieldKey = 'ID_ACTIVIDAD'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
  end
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 45
    Height = 21
    MaxLength = 6
    TabOrder = 0
    OnKeyPress = edCodigoKeyPress
    ExcludePattern = ' '#39
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT ID_ACTIVIDAD, CIIU, DESC_ACTIVIDAD '
      'FROM ACTIVIDAD')
    Top = 24
    object sdqDatosID_ACTIVIDAD: TStringField
      FieldName = 'ID_ACTIVIDAD'
      Required = True
    end
    object sdqDatosCIIU: TStringField
      FieldName = 'CIIU'
      Required = True
      Size = 6
    end
    object sdqDatosDESC_ACTIVIDAD: TStringField
      FieldName = 'DESC_ACTIVIDAD'
      Required = True
      Size = 50
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
