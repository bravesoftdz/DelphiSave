inherited fraEstablecimiento: TfraEstablecimiento
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
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 360
        Visible = True
      end>
  end
  inherited edCodigo: TPatternEdit
    Pattern = '0123456789'
  end
end
