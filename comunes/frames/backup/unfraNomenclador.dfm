object fraNomenclador: TfraNomenclador
  Left = 0
  Top = 0
  Width = 617
  Height = 172
  TabOrder = 0
  OnExit = FrameExit
  object Label5: TLabel
    Left = 0
    Top = 4
    Width = 50
    Height = 13
    Caption = 'Prestación'
  end
  object edPrestNomenc: TEdit
    Left = 56
    Top = 0
    Width = 15
    Height = 21
    MaxLength = 1
    TabOrder = 0
    OnKeyUp = edPrestNomencKeyUp
  end
  object edPrestCap: TEdit
    Left = 68
    Top = 0
    Width = 15
    Height = 21
    MaxLength = 1
    TabOrder = 1
    OnKeyPress = edPrestCapKeyPress
    OnKeyUp = edPrestCapKeyUp
  end
  object cmbPrestacion: TArtComboBox
    Left = 124
    Top = 0
    Width = 492
    Height = 21
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'ON_NOMENCLADOR'
        Title.Caption = 'Nom.'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ON_CAPITULO'
        Title.Caption = 'Cap.'
        Width = 24
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ON_CODIGO'
        Title.Caption = 'Código'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ON_DESCRIPCION'
        Title.Caption = 'Concepto de Pago'
        Width = 360
        Visible = True
      end>
    DataSource = dsPrestacion
    FieldList = 'ON_DESCRIPCION'
    FieldKey = 'ON_CODIGO'
    OnCloseUp = cmbPrestacionCloseUp
    OnDropDown = cmbPrestacionDropDown
  end
  object edPrestCodigo: TIntEdit
    Left = 80
    Top = 0
    Width = 42
    Height = 21
    TabOrder = 2
    OnKeyPress = edPrestCodigoKeyPress
    OnKeyUp = edPrestCodigoKeyUp
    MaxLength = 6
  end
  object sdqPrestacion: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT ON_NOMENCLADOR,  ON_CAPITULO, ON_CODIGO, ON_DESCRIPCION'
      'FROM SON_NOMENCLADOR'
      'ORDER BY ON_CODIGO')
    Left = 8
    Top = 21
    object sdqPrestacionON_NOMENCLADOR: TStringField
      FieldName = 'ON_NOMENCLADOR'
      Required = True
      Size = 1
    end
    object sdqPrestacionON_CAPITULO: TStringField
      FieldName = 'ON_CAPITULO'
      Required = True
      Size = 1
    end
    object sdqPrestacionON_CODIGO: TStringField
      FieldName = 'ON_CODIGO'
      Required = True
      Size = 6
    end
    object sdqPrestacionON_DESCRIPCION: TStringField
      FieldName = 'ON_DESCRIPCION'
      Size = 250
    end
  end
  object dsPrestacion: TDataSource
    DataSet = sdqPrestacion
    Left = 36
    Top = 21
  end
end
