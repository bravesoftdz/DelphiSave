inherited fraVendedoresCUIT: TfraVendedoresCUIT
  Width = 528
  Height = 24
  ExplicitWidth = 528
  ExplicitHeight = 24
  DesignSize = (
    528
    24)
  object lbRSocial: TLabel [0]
    Left = 6
    Top = 5
    Width = 19
    Height = 13
    Caption = 'Cuit'
  end
  object Label1: TLabel [1]
    Left = 119
    Top = 5
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [2]
    Left = 223
    Top = 5
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  inherited cmbDescripcion: TArtComboBox
    Left = 272
    Width = 255
    TabOrder = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'Cuit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Vendedor'
        Width = 300
        Visible = True
      end>
    ExplicitLeft = 272
    ExplicitWidth = 255
  end
  inherited edCodigo: TPatternEdit
    Left = 155
    TabOrder = 1
    ExplicitLeft = 155
  end
  object mskCuit: TMaskEdit [5]
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
end
