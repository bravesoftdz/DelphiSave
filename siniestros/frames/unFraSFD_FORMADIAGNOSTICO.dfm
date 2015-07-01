inherited fraSFD_FORMADIAGNOSTICO: TfraSFD_FORMADIAGNOSTICO
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
    TableName = 'SIN.SFD_FORMADIAGNOSTICO'
    FieldID = 'FD_ID'
    FieldCodigo = 'FD_CODIGO'
    FieldDesc = 'FD_DESCRIPCION'
    FieldBaja = 'NULL'
    IdType = ctInteger
  end
end
