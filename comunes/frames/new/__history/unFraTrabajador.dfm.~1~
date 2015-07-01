inherited fraTrabajador: TfraTrabajador
  Height = 22
  OnExit = FrameExit
  ExplicitHeight = 22
  DesignSize = (
    445
    22)
  object mskCUIL: TMaskEdit [0]
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    Hint = 'CUIL del Trabajador'
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 0
    OnKeyDown = mskCUILKeyDown
    OnKeyPress = mskCUILKeyPress
  end
  object cmbNombre: TArtComboBox [1]
    Left = 84
    Top = 0
    Width = 361
    Height = 21
    Hint = 'Apellido y Nombre del Trabajador'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 180
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'NOMBRE'
    FieldKey = 'ID'
    OnCloseUp = cmbNombreCloseUp
    OnDropDown = cmbNombreDropDown
    ClearOnCancel = True
  end
  inherited sdqDatos: TSDQuery
    AfterOpen = sdqDatosAfterOpen
    SQL.Strings = ()
  end
end
