object fraTrabajador: TfraTrabajador
  Left = 0
  Top = 0
  Width = 452
  Height = 21
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    452
    21)
  object lbTrabCUIL: TLabel
    Left = 4
    Top = 4
    Width = 24
    Height = 13
    Caption = 'CUIL'
    FocusControl = mskCUIL
  end
  object lbTrabNombre: TLabel
    Left = 124
    Top = 4
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = cmbNombre
  end
  object mskCUIL: TMaskEdit
    Left = 36
    Top = 0
    Width = 81
    Height = 21
    EditMask = '99-########-c;0; '
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskCUILKeyPress
  end
  object cmbNombre: TArtComboBox
    Left = 168
    Top = 0
    Width = 284
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Apellido y Nombre'
        Width = 220
        Visible = True
      end>
    DataSource = dsTrabajador
    FieldList = 'TJ_NOMBRE'
    FieldKey = 'TJ_CUIL'
    RowColor1 = 15263976
    RowColor2 = 13750737
    OnCloseUp = cmbNombreCloseUp
    OnDropDown = cmbNombreDropDown
  end
  object sdqTrabajador: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT TJ_NOMBRE, TJ_CUIL, DL_FECEGRESO, DL_CUIT, DL_ESTABLECIMI' +
        'ENTO'
      'FROM CTJ_TRABAJADORES, CDL_DATOSLABORALES'
      'WHERE TJ_CUIL = DL_CUIL')
    Left = 4
    Top = 28
    object sdqTrabajadorTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqTrabajadorTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqTrabajadorDL_FECEGRESO: TDateTimeField
      FieldName = 'DL_FECEGRESO'
    end
    object sdqTrabajadorDL_CUIT: TStringField
      FieldName = 'DL_CUIT'
      Size = 11
    end
    object sdqTrabajadorDL_ESTABLECIMIENTO: TFloatField
      FieldName = 'DL_ESTABLECIMIENTO'
    end
  end
  object dsTrabajador: TDataSource
    DataSet = sdqTrabajador
    Left = 32
    Top = 28
  end
end
