object fraPlan: TfraPlan
  Left = 0
  Top = 0
  Width = 289
  Height = 23
  TabOrder = 0
  OnExit = FrameExit
  object cmbDescripcion: TArtComboBox
    Left = 45
    Top = 1
    Width = 245
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PLAN'
        Title.Caption = 'Código'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PLAN'
        Title.Caption = 'Descripción'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE_FARMACIA'
        Title.Caption = '% Farmacias'
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'DESC_PLAN'
    FieldKey = 'ID_PLAN'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edCodigo: TPatternEdit
    Left = 1
    Top = 1
    Width = 43
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
    Pattern = '0123456789ABCDEFGHIJKLMNÑOPQRSTUVWXYZ'
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ID_PLAN, COD_PLAN, PORCENTAJE_FARMACIA, DESC_PLAN, CALCUL' +
        'A_CUOTA_MENSUAL, FECHA_BAJA'
      'FROM PLANES')
    Top = 24
    object sdqDatosID_PLAN: TStringField
      FieldName = 'ID_PLAN'
      Required = True
    end
    object sdqDatosCOD_PLAN: TStringField
      FieldName = 'COD_PLAN'
      Required = True
      Size = 10
    end
    object sdqDatosPORCENTAJE_FARMACIA: TFloatField
      FieldName = 'PORCENTAJE_FARMACIA'
    end
    object sdqDatosDESC_PLAN: TStringField
      FieldName = 'DESC_PLAN'
      Required = True
      Size = 50
    end
    object sdqDatosCALCULA_CUOTA_MENSUAL: TStringField
      FieldName = 'CALCULA_CUOTA_MENSUAL'
      Size = 1
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
