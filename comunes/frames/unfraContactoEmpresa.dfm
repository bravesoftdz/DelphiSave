inherited fraContactoEmpresa: TfraContactoEmpresa
  inherited cmbDescripcion: TArtComboBox
    CharCase = ecUpperCase
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        PickList.Strings = ()
        Title.Caption = 'Código'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        PickList.Strings = ()
        Title.Caption = 'Contacto'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        PickList.Strings = ()
        Title.Caption = 'Empresa'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGODESC'
        PickList.Strings = ()
        Title.Caption = 'Cargo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAREADESC'
        PickList.Strings = ()
        Title.Caption = 'Area'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_FECHAALTA'
        PickList.Strings = ()
        Title.Caption = 'F. Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_USUALTA'
        PickList.Strings = ()
        Title.Caption = 'U. Alta'
        Visible = True
      end>
  end
end
