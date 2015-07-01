inherited fraEmpresa: TfraEmpresa
  Width = 566
  Height = 21
  OnExit = FrameExit
  object lbRSocial: TLabel [0]
    Left = 86
    Top = 4
    Width = 40
    Height = 13
    Caption = 'R.Social'
    FocusControl = cmbRSocial
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbContrato: TLabel [1]
    Left = 464
    Top = 4
    Width = 40
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Contrato'
    FocusControl = edContrato
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object mskCUIT: TMaskEdit [2]
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 0
    OnKeyDown = mskCUITKeyDown
    OnKeyPress = mskCUITKeyPress
  end
  object edContrato: TIntEdit [3]
    Left = 509
    Top = 0
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    OnKeyDown = mskCUITKeyDown
    OnKeyPress = edContratoKeyPress
    MaxLength = 8
  end
  object cmbRSocial: TArtComboBox [4]
    Left = 130
    Top = 0
    Width = 327
    Height = 21
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Razón Social'
        Width = 260
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'NOMBRE'
    FieldKey = 'CUIT'
    OnCloseUp = cmbRSocialCloseUp
    OnDropDown = cmbRSocialDropDown
    OnGetCellParams = cmbRSocialGetCellParams
    ClearOnCancel = True
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = ()
  end
end
