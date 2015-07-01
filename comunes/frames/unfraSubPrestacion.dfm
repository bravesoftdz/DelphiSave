object fraSubPrestacion: TfraSubPrestacion
  Left = 0
  Top = 0
  Width = 289
  Height = 22
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    289
    22)
  object cmbDescripcion: TArtComboBox
    Left = 45
    Top = 1
    Width = 245
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 260
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'TB_DESCRIPCION'
    FieldKey = 'TB_CODIGO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edCodigo: TPatternEdit
    Left = 1
    Top = 1
    Width = 43
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ'
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION, TB_ESPECIAL1, TB_BAJA'
      '   FROM CTB_TABLAS'
      'WHERE TB_CLAVE = '#39'SUBPR'#39
      '      AND TB_CODIGO <> '#39'0'#39)
    Top = 24
    object sdqDatosTB_CODIGO: TStringField
      FieldName = 'TB_CODIGO'
      Required = True
      Size = 10
    end
    object sdqDatosTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqDatosTB_ESPECIAL1: TStringField
      FieldName = 'TB_ESPECIAL1'
      Size = 30
    end
    object sdqDatosTB_BAJA: TStringField
      FieldName = 'TB_BAJA'
      Size = 1
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
