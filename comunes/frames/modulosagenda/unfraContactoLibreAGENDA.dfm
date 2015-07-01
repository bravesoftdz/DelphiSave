inherited fraContactoLibreAGENDA: TfraContactoLibreAGENDA
  Width = 486
  Height = 75
  Font.Name = 'Tahoma'
  ParentFont = False
  DesignSize = (
    486
    75)
  object lbContacto: TLabel [0]
    Left = 8
    Top = 4
    Width = 51
    Height = 13
    Caption = 'Contacto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbDescripcion: TLabel [1]
    Left = 39
    Top = 28
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object lbTelefono: TLabel [2]
    Left = 34
    Top = 52
    Width = 42
    Height = 13
    Caption = 'Tel'#233'fono'
  end
  object lbCorreoElectronico: TLabel [3]
    Left = 248
    Top = 52
    Width = 88
    Height = 13
    Caption = 'Correo electr'#243'nico'
  end
  object ToolBarContacto: TToolBar [4]
    Left = 79
    Top = -1
    Width = 27
    Height = 26
    Align = alNone
    AutoSize = True
    BorderWidth = 1
    EdgeBorders = []
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Transparent = True
    object tbContacto: TToolButton
      Left = 0
      Top = 0
      Hint = 
        'Comparar los datos de este contacto con los contactos del contra' +
        'to seleccionado'
      ImageIndex = 19
      Visible = False
      OnClick = tbContactoClick
    end
  end
  object edNombreContacto: TEdit [5]
    Left = 80
    Top = 24
    Width = 395
    Height = 21
    Hint = 'Apellido y nombre del contacto'
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    MaxLength = 250
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edCorreoElectronico: TEdit [6]
    Left = 340
    Top = 48
    Width = 135
    Height = 21
    Hint = 'Direcci'#243'n de correo electr'#243'nico del contacto'
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecLowerCase
    MaxLength = 60
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnChange = edCorreoElectronicoChange
    OnExit = edCorreoElectronicoExit
  end
  object edTelefonoContacto: TPatternEdit [7]
    Left = 80
    Top = 48
    Width = 161
    Height = 21
    Hint = 'Tel'#233'fono del contacto'
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Pattern = '0123456789- ()'
  end
  inherited sdqDatos: TSDQuery
    Top = 76
  end
  inherited dsDatos: TDataSource
    Top = 76
  end
end
