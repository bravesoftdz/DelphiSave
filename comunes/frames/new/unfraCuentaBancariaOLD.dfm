inherited fraCuentaBancaria: TfraCuentaBancaria
  Height = 23
  Anchors = [akLeft, akTop, akRight]
  OnExit = FrameExit
  object cmbDescripcion: TComboGrid
    Left = 83
    Top = 2
    Width = 361
    Height = 21
    ColCount = 4
    RowCount = 1
    DropCount = 10
    OnDropDown = cmbDescripcionDropDown
    OnCloseUp = cmbDescripcionCloseUp
    OnScroll = cmbDescripcionScroll
    OnGetCellParams = cmbDescripcionGetCellParams
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Cells = (
      'Código'
      'Cuenta Nro.'
      'Sucursal'
      'Banco')
    ColWidths = (
      64
      100
      64
      250)
  end
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
end
