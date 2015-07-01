inherited fraSLZ_LESIONZONA: TfraSLZ_LESIONZONA
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
    TableName = 'SIN.SLZ_LESIONZONA'
    FieldID = 'LZ_ID'
    FieldCodigo = 'LZ_CODIGO'
    FieldDesc = 'LZ_DESCRIPCION'
    FieldBaja = 'LZ_FECHABAJA'
    CodigoType = ctInteger
    IdType = ctInteger
  end
end
