inherited fraPrestadorFueraDeContrato: TfraPrestadorFueraDeContrato
  Height = 56
  ParentFont = False
  DesignSize = (
    691
    56)
  inherited lbIdentif: TLabel
    Width = 32
    Caption = 'Identif.'
  end
  inherited lbDomicilio: TLabel
    Top = 36
  end
  inherited lbLocalidad: TLabel
    Top = 36
  end
  inherited lbCPostal: TLabel
    Top = 36
    Caption = 'C.P.'
  end
  inherited mskCA_CLAVE: TMaskEdit
    Top = 4
  end
  inherited cmbCA_DESCRIPCION: TArtComboBox
    Top = 4
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_CLAVE'
        Title.Caption = 'CUIT'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_SECUENCIA'
        Title.Caption = 'Secuencia'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_IDENTIFICADOR'
        Title.Caption = 'Id.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Raz'#243'n Social'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_ASISTENCIAL'
        Title.Caption = 'Asistencial'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DOMICILIO'
        Title.Caption = 'Domicilio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 120
        Visible = True
      end>
  end
  inherited edCA_DOMICILIO: TEdit
    Top = 32
  end
  inherited edCA_LOCALIDAD: TEdit
    Top = 32
  end
  inherited edCA_CODPOSTAL: TEdit
    Top = 32
  end
  inherited edCA_IDENTIFICADOR: TIntEdit
    Top = 4
  end
  inherited edCA_SECUENCIA: TIntEdit
    Top = 4
  end
  object gbPrestadorFueraDeContrato: TJvgGroupBox [14]
    Left = 0
    Top = 56
    Width = 691
    Height = 72
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Prestador fuera de contrato '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvNone
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCanCollapse, fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    DesignSize = (
      691
      72)
    FullHeight = 72
    object Label1: TLabel
      Left = 6
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel
      Left = 6
      Top = 51
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    inline fraDomicilioExtra: TfraDomicilio
      Left = 188
      Top = 20
      Width = 497
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        497
        49)
      inherited lbNro: TLabel
        Left = 282
      end
      inherited lbPiso: TLabel
        Left = 354
        Width = 19
      end
      inherited lbDto: TLabel
        Left = 430
        Width = 21
      end
      inherited lbCPostal: TLabel
        Width = 40
      end
      inherited lbCPA: TLabel
        Width = 20
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbProvincia: TLabel
        Left = 335
        Width = 43
      end
      inherited cmbCalle: TArtComboBox
        Width = 201
      end
      inherited edNumero: TEdit
        Left = 304
      end
      inherited edPiso: TEdit
        Left = 380
      end
      inherited edDto: TEdit
        Left = 452
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 65
      end
      inherited edProvincia: TEdit
        Left = 384
      end
      inherited btnBuscar: TButton
        Left = 253
        Width = 21
      end
    end
    object edNombre: TPatternEdit
      Left = 52
      Top = 20
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edTelefono: TPatternEdit
      Left = 52
      Top = 47
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Pattern = '0123456789-()'
    end
  end
  inherited sdqDatos: TSDQuery
    Left = 20
    Top = 140
  end
  inherited dsDatos: TDataSource
    Left = 48
    Top = 140
  end
end
