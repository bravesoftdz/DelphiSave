inherited fraSLM_LESIONAGENTEMATERIAL: TfraSLM_LESIONAGENTEMATERIAL
  inherited cmbDescripcion: TComboGrid
    ColCount = 6
    DropCount = 20
    ListCol = 0
    Cells = (
      'C'#243'digo'
      'Descripci'#243'n'
      'Id'
      'Fecha de Baja'
      'SubTitulo'
      'Titulo')
    ColWidths = (
      50
      320
      -1
      -1
      -1
      -1)
  end
  inherited Propiedades: TPropiedadesFrame
    TableName = 'SIN.SLM_LESIONAGENTEMATERIAL'
    FieldID = 'LM_ID'
    FieldCodigo = 'LM_CODIGO'
    FieldDesc = 'LM_DESCRIPCION'
    FieldBaja = 'LM_FECHABAJA'
    ExtraFields = 
      ' , NVL(LM_SUBTITULO, '#39'N'#39') AS SUBTITULO, DECODE(LENGTH(LM_CODIGO)' +
      ', 1, '#39'S'#39', 2, '#39'S'#39', 3, '#39'S'#39', '#39'N'#39') AS TITULO '
    OrderBy = 'LM_ID'
    IdType = ctInteger
  end
end
