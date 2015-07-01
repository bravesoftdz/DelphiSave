inherited fraLocalidad: TfraLocalidad
  Width = 712
  Height = 23
  Anchors = [akLeft, akTop, akRight]
  object lbCPostal: TLabel [0]
    Left = 3
    Top = 5
    Width = 39
    Height = 13
    Caption = 'C.Postal'
  end
  object lbLocalidad: TLabel [1]
    Left = 103
    Top = 5
    Width = 46
    Height = 13
    Caption = 'Localidad'
  end
  object lbProvincia: TLabel [2]
    Left = 521
    Top = 5
    Width = 44
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Provincia'
  end
  object cmbLocalidad: TArtComboBox [3]
    Left = 152
    Top = 1
    Width = 363
    Height = 21
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 60
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'UB_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 240
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'UB_LOCALIDAD'
    FieldKey = 'UB_LOCALIDAD'
    OnDropDown = cmbLocalidadDropDown
    ClearOnCancel = True
  end
  object cmbProvincia: TCheckCombo [4]
    Left = 567
    Top = 2
    Width = 144
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    OnKeyPress = cmbProvinciaKeyPress
  end
  object edCPostal: TPatternEdit [5]
    Left = 46
    Top = 1
    Width = 50
    Height = 21
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    AutoExit = True
    Pattern = '0123456789,'
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = (
      'SELECT DISTINCT UB_LOCALIDAD'
      '     FROM CUB_UBICACION'
      '')
    Left = 230
    Top = 3
  end
  inherited dsDatos: TDataSource
    Left = 257
    Top = 2
  end
end
