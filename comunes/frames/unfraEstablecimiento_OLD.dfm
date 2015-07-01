inherited fraEstablecimiento_OLD: TfraEstablecimiento_OLD
  Width = 519
  Height = 47
  OnExit = FrameExit
  DesignSize = (
    519
    47)
  object lbLocalidad: TLabel [0]
    Left = 285
    Top = 4
    Width = 46
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Localidad'
  end
  object lbEstableci: TLabel [1]
    Left = 4
    Top = 4
    Width = 30
    Height = 13
    Caption = 'Estab.'
    FocusControl = edCodigo
  end
  object lbCPostal: TLabel [2]
    Left = 448
    Top = 4
    Width = 20
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'C.P.'
  end
  object lbDomicilio: TLabel [3]
    Left = 4
    Top = 28
    Width = 42
    Height = 13
    Caption = 'Domicilio'
  end
  object lbProvincia: TLabel [4]
    Left = 285
    Top = 28
    Width = 44
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Provincia'
  end
  object edCodigo: TIntEdit [5]
    Left = 36
    Top = 0
    Width = 45
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    AutoExit = True
    MaxLength = 6
  end
  object cmbDescripcion: TArtComboBox [6]
    Left = 83
    Top = 0
    Width = 198
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    ReadOnly = True
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'ST_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_CLAVE'
        Title.Alignment = taCenter
        Title.Caption = 'Clave'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ST_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ST_CPOSTAL'
        Title.Alignment = taCenter
        Title.Caption = 'C.P.'
        Width = 30
        Visible = True
      end>
    DataSource = dsDatos
    DropCount = 20
    FieldList = 'ST_NOMBRE'
    FieldKey = 'ST_CLAVE'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edLocalidad: TEdit [7]
    Left = 337
    Top = 0
    Width = 108
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edCPostal: TEdit [8]
    Left = 472
    Top = 0
    Width = 45
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edDomicilio: TEdit [9]
    Left = 53
    Top = 24
    Width = 228
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edProvincia: TEdit [10]
    Left = 337
    Top = 24
    Width = 180
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'SELECT ST_CUIT, ST_CLAVE, ST_NOMBRE, '
      
        '        UTILES.Armar_Domicilio(ST_CALLE, ST_NUMERO, ST_PISO, ST_' +
        'DEPARTAMENTO) DOMICILIO,'
      
        '        ST_LOCALIDAD, PV_DESCRIPCION PROVINCIA, ST_CPOSTAL, ST_F' +
        'BAJA, ST_CPOSTALA, ST_ID'
      'FROM CST_ESTABLECI, CPV_PROVINCIAS'
      'WHERE PV_CODIGO = ST_PROVINCIA')
    object sdqDatosST_CUIT: TStringField
      FieldName = 'ST_CUIT'
      Required = True
      Size = 11
    end
    object sdqDatosST_CLAVE: TFloatField
      FieldName = 'ST_CLAVE'
      Required = True
    end
    object sdqDatosST_NOMBRE: TStringField
      FieldName = 'ST_NOMBRE'
      Size = 100
    end
    object sdqDatosDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqDatosST_LOCALIDAD: TStringField
      FieldName = 'ST_LOCALIDAD'
      Size = 60
    end
    object sdqDatosPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object sdqDatosST_CPOSTAL: TStringField
      FieldName = 'ST_CPOSTAL'
      Size = 5
    end
    object sdqDatosST_FBAJA: TDateTimeField
      FieldName = 'ST_FBAJA'
    end
    object sdqDatosST_ACTIVIDAD: TStringField
      FieldName = 'ST_ACTIVIDAD'
      Size = 6
    end
    object sdqDatosST_CPOSTALA: TStringField
      FieldName = 'ST_CPOSTALA'
      Size = 8
    end
    object sdqDatosST_ID: TFloatField
      FieldName = 'ST_ID'
      Required = True
    end
  end
end
