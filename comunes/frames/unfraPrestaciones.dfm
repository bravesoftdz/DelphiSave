object fraPrestacion: TfraPrestacion
  Left = 0
  Top = 0
  Width = 258
  Height = 24
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    258
    24)
  object edCodigo: TEdit
    Left = 1
    Top = 2
    Width = 43
    Height = 21
    MaxLength = 6
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
  end
  object cmbDescripcion: TArtComboBox
    Left = 45
    Top = 2
    Width = 214
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'PR_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 340
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'PR_DESCRIPCION'
    FieldKey = 'PR_CODIGO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT pr_codigo, pr_descripcion, pr_diasevo, pr_fbaja, pr_formu' +
        'lario, '
      
        '       pr_diasevop, pr_gtrabajo, pr_requiereturnos, pr_multiples' +
        'prestaciones,'
      
        '       pr_exigeturno, pr_canttiempo, pr_permiteespera, pr_presup' +
        'uestos, pr_excluyevalidfechas'
      '  FROM mpr_prestaciones')
    Left = 4
    Top = 28
    object sdqDatosPR_CODIGO: TStringField
      FieldName = 'PR_CODIGO'
      Required = True
      Size = 6
    end
    object sdqDatosPR_DESCRIPCION: TStringField
      FieldName = 'PR_DESCRIPCION'
      Size = 50
    end
    object sdqDatosPR_DIASEVO: TFloatField
      FieldName = 'PR_DIASEVO'
    end
    object sdqDatosPR_FBAJA: TDateTimeField
      FieldName = 'PR_FBAJA'
    end
    object sdqDatosPR_FORMULARIO: TStringField
      FieldName = 'PR_FORMULARIO'
      Required = True
      Size = 1
    end
    object sdqDatosPR_DIASEVOP: TFloatField
      FieldName = 'PR_DIASEVOP'
    end
    object sdqDatosPR_GTRABAJO: TStringField
      FieldName = 'PR_GTRABAJO'
      Size = 2
    end
    object sdqDatosPR_REQUIERETURNOS: TStringField
      FieldName = 'PR_REQUIERETURNOS'
      Size = 1
    end
    object sdqDatosPR_MULTIPLESPRESTACIONES: TStringField
      FieldName = 'PR_MULTIPLESPRESTACIONES'
      Size = 1
    end
    object sdqDatosPR_EXIGETURNO: TStringField
      FieldName = 'PR_EXIGETURNO'
      Size = 1
    end
    object sdqDatospr_canttiempo: TStringField
      FieldName = 'pr_canttiempo'
    end
    object sdqDatosPR_PERMITEESPERA: TStringField
      FieldName = 'PR_PERMITEESPERA'
    end
    object sdqDatospr_presupuestos: TStringField
      FieldName = 'pr_presupuestos'
    end
    object sdqDatosPR_EXCLUYEVALIDFECHAS: TStringField
      FieldName = 'PR_EXCLUYEVALIDFECHAS'
      Size = 1
    end
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 32
    Top = 28
  end
end
