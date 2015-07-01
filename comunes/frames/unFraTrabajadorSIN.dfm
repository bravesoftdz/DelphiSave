inherited fraTrabajadorSIN: TfraTrabajadorSIN
  Width = 560
  Height = 27
  ExplicitWidth = 560
  ExplicitHeight = 27
  DesignSize = (
    560
    27)
  object lbTrabCUIL: TLabel
    Left = 4
    Top = 4
    Width = 23
    Height = 13
    Caption = 'CUIL'
  end
  object lbTrabNombre: TLabel
    Left = 124
    Top = 4
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object mskTrabCUIL: TMaskEdit
    Left = 36
    Top = 0
    Width = 81
    Height = 21
    EditMask = '99-########-c;0; '
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskTrabCUILKeyPress
  end
  object dbcTrabNombre: TArtComboBox
    Left = 168
    Top = 0
    Width = 388
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
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Caption = 'F.Accidente'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHARECAIDA'
        Title.Caption = 'F.Reca'#237'da'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Caption = 'F.Baja'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'F.Alta'
        Width = 66
        Visible = True
      end>
    DataSource = dsTrabajador
    FieldList = 'TJ_NOMBRE'
    FieldKey = 'TJ_CUIL'
    RowColor1 = 15263976
    RowColor2 = 13750737
    OnCloseUp = dbcTrabNombreCloseUp
    OnDropDown = dbcTrabNombreDropDown
  end
  object sdqTrabajador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TJ_CUIL, TJ_NOMBRE, '
      
        '               EX_SINIESTRO || '#39#39'-'#39#39' || EX_ORDEN || '#39#39'-'#39#39' || EX_' +
        'RECAIDA SINIESTRO,'
      
        '               EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_FECHAACCID' +
        'ENTE,'
      
        '               EX_BAJAMEDICA, EX_ALTAMEDICA, EX_FECHARECAIDA, EX' +
        '_CAUSAFIN, EX_ID'
      'FROM CTJ_TRABAJADOR, SEX_EXPEDIENTES'
      'WHERE EX_CUIL = TJ_CUIL'
      'AND 0=1')
    Left = 180
    object sdqTrabajadorTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqTrabajadorTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqTrabajadorSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Required = True
      Size = 80
    end
    object sdqTrabajadorEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqTrabajadorEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqTrabajadorEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqTrabajadorEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqTrabajadorEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object sdqTrabajadorEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqTrabajadorEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object sdqTrabajadorEX_CAUSAFIN: TStringField
      FieldName = 'EX_CAUSAFIN'
      Size = 10
    end
    object sdqTrabajadorEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
  end
  object dsTrabajador: TDataSource
    DataSet = sdqTrabajador
    Left = 208
  end
end
