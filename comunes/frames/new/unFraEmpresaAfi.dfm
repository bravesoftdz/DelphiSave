inherited fraEmpresaAfi: TfraEmpresaAfi
  Height = 23
  ExplicitHeight = 23
  DesignSize = (
    576
    23)
  inherited lbContrato: TLabel
    Left = 341
    ExplicitLeft = 341
  end
  object lbFormulario: TLabel [2]
    Left = 448
    Top = 4
    Width = 48
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Formulario'
    FocusControl = edFormulario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited edContrato: TIntEdit
    Left = 386
    ExplicitLeft = 386
  end
  inherited cmbRSocial: TArtComboBox
    Width = 207
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
        FieldName = 'FORMULARIO'
        Title.Caption = 'Formulario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 260
        Visible = True
      end>
    ExplicitWidth = 207
  end
  object edFormulario: TPatternEdit [6]
    Left = 500
    Top = 0
    Width = 76
    Height = 21
    Anchors = [akTop, akRight]
    MaxLength = 30
    TabOrder = 3
    OnKeyDown = mskCUITKeyDown
    OnKeyPress = edFormularioKeyPress
    Pattern = '0123456789ABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ/ '
  end
end
