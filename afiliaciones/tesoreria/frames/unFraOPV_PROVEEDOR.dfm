inherited fraOPV_PROVEEDOR: TfraOPV_PROVEEDOR
  Width = 584
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
  object lbNumero: TLabel [1]
    Left = 482
    Top = 4
    Width = 37
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Número'
    FocusControl = edNumero
  end
  object mskCUIT: TMaskEdit [2]
    Left = 0
    Top = 0
    Width = 81
    Height = 21
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 0
    OnKeyDown = mskCUITNumeroKeyDown
    OnKeyPress = mskCUITKeyPress
  end
  object cmbRSocial: TArtComboBox [3]
    Left = 130
    Top = 0
    Width = 347
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
        Width = 72
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'Número'
        Width = 46
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
    ClearOnCancel = True
  end
  object edNumero: TIntEdit [4]
    Left = 527
    Top = 0
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    OnKeyDown = mskCUITNumeroKeyDown
    OnKeyPress = edNumeroKeyPress
    MaxLength = 8
  end
end
