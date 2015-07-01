inherited fraAGC_GESTORCUENTA: TfraAGC_GESTORCUENTA
  inherited cmbDescripcion: TComboGrid
    Left = 148
    Width = 297
    ColCount = 5
    ListCol = 0
    TabOrder = 2
    Cells = (
      'Código'
      'CUIT'
      'Descripción'
      'Id'
      'Fecha de Baja')
    ColWidths = (
      40
      80
      300
      -1
      -1)
  end
  object mskCUIT: TMaskEdit
    Left = 64
    Top = 1
    Width = 81
    Height = 21
    EditMask = '99-99999999-9;0;'
    MaxLength = 13
    TabOrder = 1
  end
end
