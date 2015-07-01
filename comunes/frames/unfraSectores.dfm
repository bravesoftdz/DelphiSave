object fraSectores: TfraSectores
  Left = 0
  Top = 0
  Width = 522
  Height = 24
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    522
    24)
  object edCodigo: TPatternEdit
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    ExcludePattern = ' '#39'%'
  end
  object cmbDescripcion: TArtComboBox
    Left = 84
    Top = 0
    Width = 437
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'SC_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SC_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 200
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'SC_DESCRIPCION'
    FieldKey = 'SC_CODIGO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT SC_ID, SC_CODIGO, SC_DESCRIPCION, SC_DELEGACION, SC_FECHA' +
        'BAJA'
      'FROM USC_SECTORES')
    Top = 24
    object sdqDatosSC_ID: TFloatField
      FieldName = 'SC_ID'
    end
    object sdqDatosSC_CODIGO: TStringField
      FieldName = 'SC_CODIGO'
      Required = True
      Size = 8
    end
    object sdqDatosSC_DESCRIPCION: TStringField
      FieldName = 'SC_DESCRIPCION'
      Size = 60
    end
    object sdqDatosSC_DELEGACION: TStringField
      DisplayWidth = 4
      FieldName = 'SC_DELEGACION'
      Size = 4
    end
    object sdqDatosSC_FECHABAJA: TDateTimeField
      FieldName = 'SC_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
