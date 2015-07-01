inherited fraSMD_MODODETECCION: TfraSMD_MODODETECCION
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
    TableName = 'SIN.SMD_MODODETECCION'
    FieldID = 'MD_ID'
    FieldCodigo = 'MD_CODIGO'
    FieldDesc = 'MD_DESCRIPCION'
    FieldBaja = 'NULL'
    IdType = ctInteger
  end
end
