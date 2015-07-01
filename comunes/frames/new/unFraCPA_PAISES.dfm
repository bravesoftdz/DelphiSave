inherited fraCPA_PAISES: TfraCPA_PAISES
  inherited cmbDescripcion: TComboGrid
    Cells = (
      'C'#243'digo'
      'Descripci'#243'n'
      'Id'
      'Fecha de Baja')
    ColWidths = (
      40
      300
      -1
      -1)
  end
  inherited Propiedades: TPropiedadesFrame
    TableName = 'CPA_PAISES'
    FieldID = 'PA_CODIGO'
    FieldCodigo = 'PA_CODIGO'
    FieldDesc = 'PA_DESCRIPCION'
    FieldBaja = 'NULL'
  end
end
