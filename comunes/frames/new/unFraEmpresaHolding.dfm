inherited fraEmpresaHolding: TfraEmpresaHolding
  inherited lbRSocial: TLabel
    Left = 85
    ExplicitLeft = 85
  end
  inherited lbContrato: TLabel
    Left = 295
    ExplicitLeft = 295
  end
  object Label1: TLabel [2]
    Left = 402
    Top = 4
    Width = 35
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Holding'
    FocusControl = cmbHolding
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited edContrato: TIntEdit
    Left = 341
    ExplicitLeft = 341
  end
  inherited cmbRSocial: TArtComboBox
    Left = 126
    Width = 167
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
        Title.Caption = 'Raz'#243'n Social'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLDING'
        Title.Caption = 'Holding'
        Visible = True
      end>
    ExplicitLeft = 126
    ExplicitWidth = 167
  end
  object cmbHolding: TArtComboBox [6]
    Left = 440
    Top = 0
    Width = 124
    Height = 21
    Hint = 'Holding'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akTop, akRight]
    NumGlyphs = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
        Title.Caption = 'Raz'#243'n Social'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLDING'
        Title.Caption = 'Holding'
        Visible = True
      end>
    DataSource = dsDatos
    FieldList = 'HOLDING'
    FieldKey = 'CUIT'
    OnCloseUp = cmbHoldingCloseUp
    OnDropDown = cmbHoldingDropDown
    OnGetCellParams = cmbRSocialGetCellParams
    ClearOnCancel = True
  end
end
