inherited fraTipoRegimen: TfraTipoRegimen
  Width = 276
  ExplicitWidth = 276
  inherited cmbDescripcion: TArtComboBox
    Left = 46
    Width = 230
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
    ExplicitLeft = 46
    ExplicitWidth = 311
  end
  inherited edCodigo: TPatternEdit
    Width = 42
    MaxLength = 20
    ExplicitWidth = 42
  end
end
