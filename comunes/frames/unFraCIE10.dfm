object fraCIE10: TfraCIE10
  Left = 0
  Top = 0
  Width = 500
  Height = 24
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    500
    24)
  object lbCIE10: TLabel
    Left = 2
    Top = 6
    Width = 35
    Height = 13
    Caption = 'CIE-10:'
  end
  object edCodigo: TEdit
    Left = 40
    Top = 2
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 0
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = edCodigoKeyPress
  end
  object cmbDescripcion: TArtComboBox
    Left = 92
    Top = 2
    Width = 409
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'DG_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end>
    DataSource = dsCIE10
    FieldList = 'DG_DESCRIPCION'
    FieldKey = 'DG_CODIGO'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
  end
  object sdqCIE10: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT DG_CODIGO, DG_DESCRIPCION'
      'FROM CDG_DIAGNOSTICO'
      'ORDER BY DG_DESCRIPCION')
    Left = 4
    Top = 28
  end
  object dsCIE10: TDataSource
    DataSet = sdqCIE10
    Left = 32
    Top = 28
  end
end
