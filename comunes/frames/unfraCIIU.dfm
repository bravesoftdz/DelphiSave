object fraCIIU: TfraCIIU
  Left = 0
  Top = 0
  Width = 438
  Height = 21
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    438
    21)
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
        FieldName = 'AV_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AV_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 140
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'AV_DESCRIPCION'
    FieldKey = 'AV_CODIGO'
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
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT AV_CODIGO, AV_DESCRIPCION'
      'FROM CAV_ACTIVIDAD'
      'WHERE LENGTH(AV_CODIGO) = 6')
    Top = 24
    object sdqDatosAV_CODIGO: TStringField
      FieldName = 'AV_CODIGO'
      Required = True
      Size = 6
    end
    object sdqDatosAV_DESCRIPCION: TStringField
      FieldName = 'AV_DESCRIPCION'
      Size = 200
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
