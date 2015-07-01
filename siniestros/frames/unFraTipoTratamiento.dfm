inherited fraTipoTratamiento: TfraTipoTratamiento
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
    TableName = 'SIN.STT_TIPOTRATAMIENTO'
    FieldID = 'TT_ID'
    FieldCodigo = 'TT_CODIGO'
    FieldDesc = 'TT_DESCRIPCION'
    OrderBy = 'TT_CODIGO'
    IdType = ctInteger
  end
end
