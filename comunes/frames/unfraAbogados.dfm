inherited fraAbogados: TfraAbogados
  inherited cmbDescripcion: TArtComboBox
    Left = 39
    Top = 0
    Width = 318
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Apellido y Nombre'
        Width = 300
        Visible = True
      end>
  end
  inherited edCodigo: TPatternEdit
    Top = 0
    Width = 34
    MaxLength = 3
    Pattern = '1234567890'
  end
end
