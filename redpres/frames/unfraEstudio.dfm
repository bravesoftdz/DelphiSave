inherited fraEstudio: TfraEstudio
  inherited cmbDescripcion: TArtComboBox
    Left = 76
    Width = 280
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end>
    ExplicitLeft = 76
    ExplicitWidth = 280
  end
  inherited edCodigo: TPatternEdit
    Width = 73
    MaxLength = 15
    Pattern = '0123456789'
    ExplicitWidth = 73
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = ()
  end
end
