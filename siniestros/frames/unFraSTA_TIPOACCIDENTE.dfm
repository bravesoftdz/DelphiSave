inherited fraSTA_TIPOACCIDENTE: TfraSTA_TIPOACCIDENTE
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
    TableName = 'STA_TIPOACCIDENTE'
    FieldID = 'TA_CODIGO'
    FieldCodigo = 'TA_DESCRIPCIONABREV'
    FieldDesc = 'TA_DESCRIPCION'
    OrderBy = 'TA_CODIGO'
  end
end
