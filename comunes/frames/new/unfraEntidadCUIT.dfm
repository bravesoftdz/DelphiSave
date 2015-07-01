inherited fraEntidadCUIT: TfraEntidadCUIT
  Width = 617
  Height = 24
  ExplicitWidth = 617
  ExplicitHeight = 24
  DesignSize = (
    617
    24)
  object Label1: TLabel [0]
    Left = 119
    Top = 5
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbRSocial: TLabel [1]
    Left = 6
    Top = 5
    Width = 18
    Height = 13
    Caption = 'Cuit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 229
    Top = 29
    Width = 59
    Height = 13
    Caption = 'Ent. de Ref.'
    Visible = False
  end
  object Label2: TLabel [3]
    Left = 215
    Top = 5
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  inherited cmbDescripcion: TArtComboBox
    Left = 256
    Width = 360
    CharCase = ecUpperCase
    TabOrder = 3
    Columns = <
      item
        Expanded = False
        FieldName = 'CODBANCO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end>
    ExplicitLeft = 256
    ExplicitWidth = 360
  end
  inherited edCodigo: TPatternEdit
    Left = 155
    Top = 33
    Width = 42
    Color = clSilver
    Enabled = False
    ReadOnly = True
    TabOrder = 1
    Visible = False
    ExplicitLeft = 155
    ExplicitTop = 33
    ExplicitWidth = 42
  end
  object mskCuit: TMaskEdit [6]
    Left = 27
    Top = 1
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 0
    OnExit = mskCuitExit
    OnKeyDown = mskCuitKeyDown
    OnKeyPress = mskCuitKeyPress
  end
  object edEN_CODBANCO: TPatternEdit [7]
    Left = 154
    Top = 1
    Width = 47
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 2
    OnKeyDown = edEN_CODBANCOKeyDown
  end
end
