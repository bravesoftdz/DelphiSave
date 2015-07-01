inherited fraCDG_DIAGNOSTICO: TfraCDG_DIAGNOSTICO
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
    FieldBaja = 'DG_FECHABAJA'
    FieldCodigo = 'DG_CODIGO'
    FieldDesc = 'DG_DESCRIPCION'
    FieldID = 'DG_ID'
    IdType = ctInteger
    OrderBy = 'DG_CODIGO'
    ShowBajas = True
    TableName = 'CDG_DIAGNOSTICO'
  end
end
