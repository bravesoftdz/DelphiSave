object fraFormCartasDocTrab: TfraFormCartasDocTrab
  Left = 0
  Top = 0
  Width = 429
  Height = 22
  TabOrder = 0
  OnExit = FrameExit
  object cmbDescripcion: TArtComboBox
    Left = 52
    Top = 0
    Width = 378
    Height = 21
    DirectInput = False
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'TT_FORMATO'
        Title.Caption = 'Código'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TT_DESCRIPCION'
        Title.Caption = 'Descripción'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TT_FORMATOEMPRESA'
        Title.Caption = 'Formato Empresa'
        Width = 260
        Visible = True
      end>
    DataSource = dsFEmpresa
    FieldList = 'TT_DESCRIPCION'
    FieldKey = 'TT_FORMATO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
  end
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    Pattern = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789'
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT TT_FORMATO, TT_DESCRIPCION, TT_FORMATOEMPRESA, DT_DESCRIP' +
        'CION'
      'FROM CTT_TEXTOSCARTASDOCTRAB, CDT_TEXTOSCARTASDOC'
      'WHERE TT_FORMATOEMPRESA = DT_FORMATO'
      'AND TT_FORMATO LIKE '#39'AB%'#39)
    Top = 28
  end
  object dsFEmpresa: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 28
  end
end
