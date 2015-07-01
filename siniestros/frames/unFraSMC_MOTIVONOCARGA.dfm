inherited fraSMC_MOTIVONOCARGA: TfraSMC_MOTIVONOCARGA
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
    TableName = 'SIN.SMC_MOTIVONOCARGA'
    FieldID = 'MC_ID'
    FieldCodigo = 'MC_CODIGO'
    FieldDesc = 'MC_DESCRIPCION'
    FieldBaja = 'MC_FECHABAJA'
    OrderBy = 'MC_CODIGO'
    IdType = ctInteger
  end
end
