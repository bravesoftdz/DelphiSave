inherited fraEmpresa: TfraEmpresa
  Width = 576
  Height = 24
  ParentFont = False
  ParentShowHint = False
  ShowHint = True
  OnExit = FrameExit
  ExplicitWidth = 576
  ExplicitHeight = 24
  DesignSize = (
    576
    24)
  object lbRSocial: TLabel [0]
    Left = 86
    Top = 4
    Width = 38
    Height = 13
    Caption = 'R.Social'
    FocusControl = cmbRSocial
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbContrato: TLabel [1]
    Left = 472
    Top = 4
    Width = 43
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Contrato'
    FocusControl = edContrato
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mskCUIT: TMaskEdit [2]
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    Hint = 'CUIT de la Empresa'
    EditMask = '99-99999999-9;0;'
    MaxLength = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = mskCUITChange
    OnKeyDown = mskCUITKeyDown
    OnKeyPress = mskCUITKeyPress
  end
  object edContrato: TIntEdit [3]
    Left = 519
    Top = 0
    Width = 57
    Height = 21
    Hint = 'N'#250'mero de Contrato'
    Anchors = [akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnKeyDown = mskCUITKeyDown
    OnKeyPress = edContratoKeyPress
    MaxLength = 8
  end
  object cmbRSocial: TArtComboBox [4]
    Left = 131
    Top = 0
    Width = 337
    Height = 21
    Hint = 'Raz'#243'n Social de la Empresa'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 70
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
        Title.Caption = 'Raz'#243'n Social'
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
  object TimerConfidencial: TTimer
    Enabled = False
    Interval = 0
    OnTimer = TimerConfidencialTimer
    Left = 56
    Top = 24
  end
end
