object fraPrestadorAMP: TfraPrestadorAMP
  Left = 0
  Top = 0
  Width = 320
  Height = 21
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    320
    21)
  object cmbDescripcion: TArtComboBox
    Left = 48
    Top = 0
    Width = 272
    Height = 21
    Hint = 'Descripci'#243'n del Prestador'
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'PR_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 100
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'PR_NOMBRE'
    FieldKey = 'PR_CODIGO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edCodigo: TIntEdit
    Left = 0
    Top = 0
    Width = 45
    Height = 21
    Hint = 'C'#243'digo del Prestador'
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    MaxLength = 6
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT PR_CODIGO, PR_NOMBRE,'
      
        '       UTILES.ARMAR_DOMICILIO(PR_CALLE, PR_NUMERO, PR_PISO, PR_D' +
        'EPARTAMENTO) DOMICILIO,'
      
        '       PR_LOCALIDAD, PV_DESCRIPCION PROVINCIA, PR_CPOSTAL, PR_FE' +
        'CHABAJA'
      'FROM CPV_PROVINCIAS, APR_PRESTADORES'
      'WHERE PR_PROVINCIA = PV_CODIGO(+)'
      'ORDER BY PR_NOMBRE')
    Top = 24
    object sdqDatosPR_CODIGO: TFloatField
      FieldName = 'PR_CODIGO'
      Required = True
    end
    object sdqDatosPR_NOMBRE: TStringField
      DisplayWidth = 150
      FieldName = 'PR_NOMBRE'
      Required = True
      Size = 150
    end
    object sdqDatosDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqDatosPR_LOCALIDAD: TStringField
      FieldName = 'PR_LOCALIDAD'
      Size = 60
    end
    object sdqDatosPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object sdqDatosPR_CPOSTAL: TStringField
      FieldName = 'PR_CPOSTAL'
      Size = 5
    end
    object sdqDatosPR_FECHABAJA: TDateTimeField
      FieldName = 'PR_FECHABAJA'
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 28
    Top = 24
  end
end
