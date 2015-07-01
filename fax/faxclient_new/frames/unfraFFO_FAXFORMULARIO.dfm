inherited fraFFO_FAXFORMULARIO: TfraFFO_FAXFORMULARIO
  inherited edCodigo: TPatternEdit
    Pattern = '0123456789'
  end
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
end
