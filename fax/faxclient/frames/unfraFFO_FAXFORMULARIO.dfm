inherited fraFFO_FAXFORMULARIO: TfraFFO_FAXFORMULARIO
  inherited edCodigo: TPatternEdit
    Pattern = '0123456789'
  end
  inherited cmbDescripcion: TComboGrid
    Cells = (
      'C�digo'
      'Descripci�n'
      'Id'
      'Fecha de Baja')
    ColWidths = (
      40
      300
      -1
      -1)
  end
end
