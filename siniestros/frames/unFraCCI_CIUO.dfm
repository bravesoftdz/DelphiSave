inherited fraCCI_CIUO: TfraCCI_CIUO
  inherited cmbDescripcion: TComboGrid
    Cells = (
      'Código'
      'Descripción'
      'Id'
      'Fecha de Baja')
    ColWidths = (
      40
      500
      -1
      -1)
  end
  inherited Propiedades: TPropiedadesFrame
    TableName = 'COMUNES.CCI_CIUO'
    FieldID = 'CI_ID'
    FieldCodigo = 'CI_CODIGO'
    FieldDesc = 'CI_DESCRIPCION'
    ExtraCondition = ' AND LENGTH(CI_CODIGO) = 4 '
    IdType = ctInteger
  end
end
