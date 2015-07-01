inherited fraEstablecimientoContrato: TfraEstablecimientoContrato
  Width = 556
  Height = 47
  Constraints.MinHeight = 47
  Constraints.MinWidth = 445
  OnExit = FrameExit
  DesignSize = (
    556
    47)
  object lbLocalidad: TLabel [0]
    Left = 312
    Top = 4
    Width = 46
    Height = 13
    Anchors = [akRight]
    Caption = 'Localidad'
  end
  object lbEstableci: TLabel [1]
    Left = 4
    Top = 4
    Width = 30
    Height = 13
    Anchors = [akLeft]
    Caption = 'Estab.'
    FocusControl = edCodigo
  end
  object lbCPostal: TLabel [2]
    Left = 478
    Top = 4
    Width = 20
    Height = 13
    Anchors = [akRight]
    Caption = 'C.P.'
  end
  object lbDomicilio: TLabel [3]
    Left = 5
    Top = 28
    Width = 42
    Height = 13
    Anchors = [akLeft]
    Caption = 'Domicilio'
  end
  object lbProvincia: TLabel [4]
    Left = 312
    Top = 28
    Width = 44
    Height = 13
    Anchors = [akRight]
    Caption = 'Provincia'
  end
  object edCodigo: TIntEdit [5]
    Left = 53
    Top = 0
    Width = 49
    Height = 21
    Anchors = [akLeft]
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    AutoExit = True
    MaxLength = 6
  end
  object cmbDescripcion: TArtComboBox [6]
    Left = 105
    Top = 0
    Width = 204
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akRight]
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
    Left = 366
    Top = 0
    Width = 111
    Height = 21
    TabStop = False
    Anchors = [akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edCPostal: TEdit [8]
    Left = 503
    Top = 0
    Width = 48
    Height = 21
    TabStop = False
    Anchors = [akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object edDomicilio: TEdit [9]
    Left = 53
    Top = 24
    Width = 254
    Height = 21
    TabStop = False
    Anchors = [akLeft, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edProvincia: TEdit [10]
    Left = 367
    Top = 24
    Width = 183
    Height = 21
    TabStop = False
    Anchors = [akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'SELECT em_cuit, es_nroestableci, es_nombre, ac_codigo,'
      '       art.utiles.armar_domicilio (es_calle,'
      '                                   es_numero,'
      '                                   es_piso,'
      '                                   es_departamento'
      '                                  ) domicilio,'
      
        '       es_localidad, pv_descripcion provincia, es_cpostal, es_fe' +
        'chabaja,'
      '       es_cpostala, es_id'
      '  FROM afi.aes_establecimiento,'
      '       afi.aco_contrato,'
      '       afi.aem_empresa,'
      '       cac_actividad,'
      '       cpv_provincias'
      ' WHERE pv_codigo(+) = es_provincia'
      '   AND es_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND es_idactividad = ac_id'
      '   AND co_contrato = :contrato')
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  inherited dsDatos: TDataSource
    Top = 28
  end
end
