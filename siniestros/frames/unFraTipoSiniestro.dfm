inherited fraTipoSiniestro: TfraTipoSiniestro
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
    TableName = 'SIN.STA_TIPOACCIDENTE'
    FieldID = 'TA_ID'
    FieldCodigo = 'TA_CODIGO'
    FieldDesc = 'TA_DESCRIPCION'
    FieldBaja = 'NULL'
    ExtraCondition = ' '
    OrderBy = 'TA_CODIGO'
    IdType = ctInteger
  end
end
