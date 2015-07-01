inherited fraProveedor: TfraProveedor
  Width = 690
  Height = 25
  VertScrollBar.Range = 49
  VertScrollBar.Visible = False
  OnExit = FrameExit
  ExplicitWidth = 690
  ExplicitHeight = 25
  DesignSize = (
    690
    25)
  object lbCUIT: TLabel [0]
    Left = 4
    Top = 6
    Width = 24
    Height = 13
    Caption = 'CUIT'
  end
  object lbIdentif: TLabel [1]
    Left = 124
    Top = 6
    Width = 36
    Height = 13
    Caption = 'Identif.'
  end
  object lbRSocial: TLabel [2]
    Left = 252
    Top = 6
    Width = 38
    Height = 13
    Caption = 'R.Social'
  end
  object mskCUIT: TMaskEdit [3]
    Left = 36
    Top = 2
    Width = 81
    Height = 21
    Hint = 'CUIT o Clave del Proveedor'
    EditMask = '##-########-c;0;_'
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskCUITKeyPress
  end
  object cmbDescripcion: TArtComboBox [4]
    Left = 296
    Top = 2
    Width = 393
    Height = 21
    Hint = 'Raz'#243'n Social del Proveedor'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'Identif.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 220
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'RSOCIAL'
    FieldKey = 'CUIT'
    OnCloseUp = cmbDescripcionCloseUp
    OnDropDown = cmbDescripcionDropDown
    OnGetCellParams = cmbDescripcionGetCellParams
  end
  object edIdentificador: TIntEdit [5]
    Left = 161
    Top = 2
    Width = 82
    Height = 21
    TabOrder = 1
    OnKeyPress = edIdentificadorKeyPress
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = ()
    Left = 336
    Top = 65535
  end
  inherited dsDatos: TDataSource
    Left = 364
    Top = 65535
  end
end
