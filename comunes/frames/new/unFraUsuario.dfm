inherited fraUsuarios: TfraUsuarios
  inherited cmbDescripcion: TArtComboBox
    Left = 92
    Width = 264
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Apellido y Nombre'
        Width = 300
        Visible = True
      end>
    ExplicitLeft = 92
    ExplicitWidth = 264
  end
  inherited edCodigo: TPatternEdit
    Width = 88
    MaxLength = 20
    ExplicitWidth = 88
  end
end
