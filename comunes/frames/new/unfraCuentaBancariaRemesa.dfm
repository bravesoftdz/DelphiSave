inherited fraCuentaBancariaRemesa: TfraCuentaBancariaRemesa
  Height = 24
  OnExit = FrameExit
  DesignSize = (
    445
    24)
  object edCodigo: TPatternEdit
    Left = 1
    Top = 2
    Width = 79
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
  end
  object cmbDescripcion: TComboGrid
    Left = 83
    Top = 2
    Width = 362
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ColCount = 6
    RowCount = 1
    DropCount = 10
    ListCol = 0
    OnDropDown = cmbDescripcionDropDown
    OnCloseUp = cmbDescripcionCloseUp
    OnScroll = cmbDescripcionScroll
    OnGetCellParams = cmbDescripcionGetCellParams
    FixedRows = 0
    Cells = (
      'Remesa'
      'C'#243'digo'
      'Banco'
      'Nro. Cuenta'
      'Sin Imputar'
      'Fecha')
    ColWidths = (
      64
      48
      200
      120
      80
      65)
  end
end
