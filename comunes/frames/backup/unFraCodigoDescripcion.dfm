inherited fraCodigoDescripcion: TfraCodigoDescripcion
  Width = 357
  Height = 24
  OnExit = FrameExit
  object cmbDescripcion: TArtComboBox
    Left = 64
    Top = 1
    Width = 292
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'Código'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripción'
        Width = 300
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'DESCRIPCION'
    FieldKey = 'ID'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
    ClearOnCancel = True
  end
  object edCodigo: TPatternEdit
    Left = 1
    Top = 1
    Width = 60
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT ID_PLAN ID,'
      '       COD_PLAN CODIGO,'
      '       DESC_PLAN DESCRIPCION,'
      '       FECHA_BAJA BAJA'
      'FROM PLANES')
    Top = 24
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
