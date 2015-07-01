inherited fraPrestadorAMPCuit: TfraPrestadorAMPCuit
  Width = 526
  Height = 26
  ExplicitWidth = 526
  ExplicitHeight = 26
  DesignSize = (
    526
    26)
  object lbCuit: TLabel [0]
    Left = 415
    Top = 6
    Width = 25
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'CUIT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  inherited cmbDescripcion: TArtComboBox
    Width = 345
    CharCase = ecUpperCase
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Raz'#243'n Social'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Costo'
        Title.Caption = 'Costo Est.'
        Visible = True
      end>
    ExplicitWidth = 345
  end
  inherited edCodigo: TPatternEdit
    Pattern = '[0123456789]'
  end
  object mskCUIT: TMaskEdit [3]
    Left = 443
    Top = 1
    Width = 81
    Height = 21
    Anchors = [akTop, akRight]
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 2
    OnKeyDown = edCodigoKeyDown
    OnKeyPress = mskCUITKeyPress
  end
  inherited sdqDatos: TSDQuery
    SQL.Strings = ()
  end
end
