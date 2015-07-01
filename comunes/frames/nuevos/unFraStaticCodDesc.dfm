inherited fraStaticCodDesc: TfraStaticCodDesc
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
  object Propiedades: TPropiedadesFrame
    CaseSensitive = False
    FindAllOnSameText = False
    CodigoType = ctString
    IdType = ctString
    OnDBAwareChange = PropiedadesDBAwareChange
    Left = 88
    Top = 65532
  end
end
