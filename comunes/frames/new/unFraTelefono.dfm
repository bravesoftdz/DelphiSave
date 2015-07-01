inherited fraTelefono: TfraTelefono
  Width = 332
  Height = 21
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ExplicitWidth = 332
  ExplicitHeight = 21
  object lbTelefonoTitulo: TLabel
    Left = 28
    Top = 4
    Width = 14
    Height = 13
    Caption = 'Tel'
  end
  object btnABMTelefonos: TButton
    Left = 312
    Top = 0
    Width = 19
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = btnABMTelefonosClick
    OnEnter = btnABMTelefonosEnter
  end
  object cmbTelefonos: TComboGrid
    Left = 48
    Top = 0
    Width = 264
    Height = 21
    TabOrder = 0
    OnChange = cmbTelefonosChange
    OnEnter = cmbTelefonosEnter
    OnKeyPress = cmbTelefonosKeyPress
    Cells = ()
    ColWidths = (
      64
      64)
  end
  object sdqTelefonos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 4
    Top = 36
  end
  object dsTelefonos: TDataSource
    DataSet = sdqTelefonos
    Left = 32
    Top = 36
  end
end
