inherited fraArchJuicio: TfraArchJuicio
  inherited cmbDescripcion: TArtComboBox
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'N'#250'mero'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Car'#225'tula'
        Width = 300
        Visible = True
      end>
  end
  inherited edCodigo: TPatternEdit
    Pattern = '0123456789-'
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      '')
  end
end
