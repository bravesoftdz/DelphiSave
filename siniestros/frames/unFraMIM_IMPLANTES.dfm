inherited fraMIM_IMPLANTES: TfraMIM_IMPLANTES
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
    TableName = 'MIM_IMPLANTES'
    FieldID = 'IM_CODIGO'
    FieldCodigo = 'IM_CODIGO'
    FieldDesc = 'IM_MARCA'
    FieldBaja = 'IM_FBAJA'
    ExtraFields = ', IM_EMPRESA '
  end
end
