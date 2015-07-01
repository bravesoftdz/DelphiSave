object fraAfiliado: TfraAfiliado
  Left = 0
  Top = 0
  Width = 368
  Height = 22
  TabOrder = 0
  OnExit = FrameExit
  object mskCUIL: TMaskEdit
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    Hint = 'CUIL / Documento del Afiliado'
    EditMask = '99-99999999-c;0;_'
    MaxLength = 13
    TabOrder = 0
    OnEnter = mskCUILEnter
    OnKeyPress = mskCUILKeyPress
  end
  object cmbNombre: TArtComboBox
    Left = 84
    Top = 0
    Width = 284
    Height = 21
    Hint = 'Apellido y Nombre del Afiliado'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APELLIDO_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 64
        Visible = True
      end>
    DataSource = dsDatos
    RowColorsUse = True
    RowColor1 = 14811135
    OnCloseUp = cmbNombreCloseUp
    OnDropDown = cmbNombreDropDown
    OnGetCellParams = cmbNombreGetCellParams
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT ID_AFILIADO, CUIL, '
      '    APELLIDO + NOMBRE AS APELLIDO_NOMBRE, '
      '    FECHA_BAJA'
      'FROM AFILIADO')
    Top = 24
    object sdqDatosID_AFILIADO: TStringField
      FieldName = 'ID_AFILIADO'
      Required = True
    end
    object sdqDatosCUIL: TStringField
      FieldName = 'CUIL'
      Required = True
      Size = 11
    end
    object sdqDatosAPELLIDO_NOMBRE: TStringField
      FieldName = 'APELLIDO_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqDatosFECHA_BAJA: TDateTimeField
      FieldName = 'FECHA_BAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
