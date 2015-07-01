inherited fraMAU_AUDITORES: TfraMAU_AUDITORES
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
    TableName = 'MAU_AUDITORES'
    FieldID = 'AU_AUDITOR'
    FieldCodigo = 'AU_AUDITOR'
    FieldDesc = 'AU_NOMBRE'
    FieldBaja = 'AU_FBAJA'
    ExtraFields = ',AU_EMAIL '
    CodigoType = ctInteger
    IdType = ctInteger
  end
end
