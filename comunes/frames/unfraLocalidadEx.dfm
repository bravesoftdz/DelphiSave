inherited fraLocalidadEx: TfraLocalidadEx
  inherited cmbLocalidad: TArtComboBox
    Columns = <
      item
        Expanded = False
        FieldName = 'CP_LOCALIDAD'
        PickList.Strings = ()
        Title.Caption = 'Localidad'
        Width = 240
        Visible = True
      end>
    FieldList = 'CP_LOCALIDAD'
    FieldKey = 'CP_LOCALIDAD'
    OnCloseUp = cmbLocalidadCloseUp
  end
  inherited cmbProvincia: TCheckCombo
    OnDropDown = cmbProvinciaDropDown
    OnCloseUp = cmbProvinciaCloseUp
  end
  inherited edCPostal: TPatternEdit
    OnKeyPress = edCPostalKeyPress
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      
        'SELECT CP_LOCALIDAD, CP_PROVINCIA, CP_CODIGO, PV_DESCRIPCION DES' +
        'CPROVINCIA'
      'FROM ccp_codigopostal, cpv_provincias '
      'WHERE CP_PROVINCIA = PV_CODIGO'
      '')
  end
end
