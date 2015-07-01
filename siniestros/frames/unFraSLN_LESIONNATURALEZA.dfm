inherited fraSLN_LESIONNATURALEZA: TfraSLN_LESIONNATURALEZA
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
    TableName = 'SIN.SLN_LESIONNATURALEZA'
    FieldID = 'LN_ID'
    FieldCodigo = 'LN_CODIGO'
    FieldDesc = 'LN_DESCRIPCION'
    IdType = ctInteger
  end
end
