object fraEmpleador: TfraEmpleador
  Left = 0
  Top = 0
  Width = 368
  Height = 22
  TabOrder = 0
  OnExit = FrameExit
  object mskCUIT: TMaskEdit
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    Hint = 'CUIL / Documento del Afiliado'
    EditMask = '99-99999999-c;0;_'
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskCUITKeyPress
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
        FieldName = 'CUIT'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZON_SOCIAL'
        Title.Caption = 'Razón Social'
        Width = 300
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
      
        'SELECT ID_EMPLEADOR, CUIT, RAZON_SOCIAL, FECHA_BAJA FROM EMPLEAD' +
        'OR')
    Top = 24
    object sdqDatosID_EMPLEADOR: TStringField
      FieldName = 'ID_EMPLEADOR'
      Required = True
    end
    object sdqDatosCUIT: TStringField
      FieldName = 'CUIT'
      Size = 50
    end
    object sdqDatosRAZON_SOCIAL: TStringField
      FieldName = 'RAZON_SOCIAL'
      Required = True
      Size = 40
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
