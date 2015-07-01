inherited fraSLA_LESIONAGENTE: TfraSLA_LESIONAGENTE
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
    TableName = 'SIN.SLA_LESIONAGENTE'
    FieldID = 'LA_ID'
    FieldCodigo = 'LA_CODIGO'
    FieldDesc = 'LA_DESCRIPCION'
    FieldBaja = 'LA_FECHABAJA'
    IdType = ctInteger
  end
end
