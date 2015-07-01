inherited fraCodigoDescripcion: TfraCodigoDescripcion
  Width = 357
  Height = 23
  OnExit = FrameExit
  ExplicitWidth = 357
  ExplicitHeight = 23
  DesignSize = (
    357
    23)
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
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'DESCRIPCION'
    FieldKey = 'ID'
    RowColor1 = clBtnHighlight
    RowColor2 = clBtnText
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
    Options = []
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
