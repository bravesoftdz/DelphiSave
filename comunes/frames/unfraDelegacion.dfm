inherited fraDelegacion: TfraDelegacion
  inherited cmbDescripcion: TArtComboBox
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
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 120
        Visible = True
      end>
  end
  inherited edCodigo: TPatternEdit
    Left = 2
    ExplicitLeft = 2
  end
end
