inherited fraStaticCodigoDescripcion: TfraStaticCodigoDescripcion
  Width = 200
  Height = 23
  OnExit = FrameExit
  DesignSize = (
    200
    23)
  object edCodigo: TPatternEdit
    Left = 1
    Top = 1
    Width = 60
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 10
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
  end
  object cmbDescripcion: TComboGrid
    Left = 63
    Top = 1
    Width = 137
    Height = 21
    HelpContext = 1
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ColCount = 4
    RowCount = 2
    DropCount = 10
    OnDropDown = cmbDescripcionDropDown
    OnCloseUp = cmbDescripcionCloseUp
    OnScroll = cmbDescripcionScroll
    OnGetCellParams = cmbDescripcionGetCellParams
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
