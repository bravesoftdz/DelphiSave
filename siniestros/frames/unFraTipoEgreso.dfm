inherited fraTipoEgreso: TfraTipoEgreso
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
    ShowBajas = True
    TableName = 'SIN.STE_TIPOEGRESO'
    FieldID = 'TE_ID'
    FieldCodigo = 'TE_CODIGO'
    FieldDesc = 'TE_DESCRIPCION'
    FieldBaja = 'TE_FECHABAJA'
    OrderBy = 'TE_CODIGO'
    IdType = ctInteger
  end
end
