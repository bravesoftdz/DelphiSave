inherited fraAbogadosLegales: TfraAbogadosLegales
  inherited cmbDescripcion: TArtComboBox
    Left = 39
    Top = 0
    Width = 318
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Apellido y Nombre'
        Width = 300
        Visible = True
      end>
    ExplicitLeft = 39
    ExplicitTop = 0
    ExplicitWidth = 318
  end
  inherited edCodigo: TPatternEdit
    Top = 0
    Width = 34
    MaxLength = 8
    Pattern = '1234567890'
    ExplicitTop = 0
    ExplicitWidth = 34
  end
end
