inherited fraSLF_LESIONFORMA: TfraSLF_LESIONFORMA
  inherited cmbDescripcion: TComboGrid
    ColCount = 5
    DropCount = 20
    ListCol = 0
    Cells = (
      'C'#243'digo'
      'Descripci'#243'n'
      'Id'
      'Fecha de Baja'
      'SubTitulo')
    ColWidths = (
      40
      300
      -1
      -1
      -1)
  end
  inherited Propiedades: TPropiedadesFrame
    TableName = 'SIN.SLF_LESIONFORMA'
    FieldID = 'LF_ID'
    FieldCodigo = 'LF_CODIGO'
    FieldDesc = 'LF_DESCRIPCION'
    FieldBaja = 'LF_FECHABAJA'
    ExtraFields = ', NVL(LF_SUBTITULO, '#39'N'#39') AS SUBTITULO '
    IdType = ctInteger
  end
end
