inherited fraDomicilio: TfraDomicilio
  Width = 589
  Height = 51
  ParentFont = False
  OnExit = FrameExit
  ExplicitWidth = 589
  ExplicitHeight = 51
  DesignSize = (
    589
    51)
  object lbCalle: TLabel
    Left = 16
    Top = 4
    Width = 23
    Height = 13
    Caption = 'Calle'
  end
  object lbNro: TLabel
    Left = 374
    Top = 4
    Width = 17
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Nro'
  end
  object lbPiso: TLabel
    Left = 446
    Top = 4
    Width = 19
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Piso'
  end
  object lbDto: TLabel
    Left = 522
    Top = 4
    Width = 21
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Dto.'
  end
  object lbCPostal: TLabel
    Left = 0
    Top = 32
    Width = 40
    Height = 13
    Caption = 'C.Postal'
  end
  object lbCPA: TLabel
    Left = 104
    Top = 32
    Width = 20
    Height = 13
    Caption = 'CPA'
  end
  object lbLocalidad: TLabel
    Left = 212
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Localidad'
  end
  object lbProvincia: TLabel
    Left = 427
    Top = 32
    Width = 43
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Provincia'
  end
  object cmbCalle: TArtComboBox
    Left = 48
    Top = 0
    Width = 289
    Height = 21
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 60
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnEnter = cmbCalleEnter
    OnExit = cmbCalleExit
    Columns = <
      item
        Expanded = False
        FieldName = 'UB_CPOSTAL'
        Title.Caption = 'C.P.'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UB_CALLE'
        Title.Caption = 'Calle'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UB_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_PARTIDO'
        Title.Caption = 'Partido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 120
        Visible = True
      end>
    DataSource = dsLocalidad
    FieldList = 'UB_CALLE'
    FieldKey = 'UB_CALLE'
    OnCloseUp = cmbCalleCloseUp
    OnDropDown = cmbCalleDropDown
    ClearOnCancel = True
  end
  object edNumero: TEdit
    Left = 396
    Top = 0
    Width = 44
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    OnExit = edNumeroExit
  end
  object edPiso: TEdit
    Left = 472
    Top = 0
    Width = 45
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
  end
  object edDto: TEdit
    Left = 544
    Top = 0
    Width = 45
    Height = 21
    Anchors = [akTop, akRight]
    AutoSize = False
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
  end
  object edCPostal: TIntEdit
    Left = 48
    Top = 28
    Width = 50
    Height = 21
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnExit = edCPostalExit
    AutoExit = True
    MaxLength = 5
  end
  object cmbLocalidad: TArtComboBox
    Left = 264
    Top = 28
    Width = 157
    Height = 21
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 60
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 7
    OnChange = cmbLocalidadChange
    OnExit = cmbLocalidadExit
    Columns = <
      item
        Expanded = False
        FieldName = 'UB_CPOSTAL'
        Title.Caption = 'C'#243'd.Postal'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UB_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_PARTIDO'
        Title.Caption = 'Partido'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 200
        Visible = True
      end>
    DataSource = dsLocalidad
    FieldList = 'UB_LOCALIDAD'
    FieldKey = 'UB_LOCALIDAD'
    OnCloseUp = cmbLocalidadCloseUp
    OnDropDown = cmbLocalidadDropDown
    ClearOnCancel = True
  end
  object edProvincia: TEdit
    Left = 476
    Top = 28
    Width = 113
    Height = 21
    TabStop = False
    Anchors = [akTop, akRight]
    AutoSize = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 60
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object edCPA: TPatternEdit
    Left = 130
    Top = 28
    Width = 75
    Height = 21
    AutoSize = False
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
    Pattern = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  end
  object btnBuscar: TButton
    Left = 339
    Top = 0
    Width = 26
    Height = 21
    Hint = 'B'#250'squeda de domicilio'
    Anchors = [akTop, akRight]
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object sdqLocalidad: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      '--SELECT UB_ID, UB_CALLE, UB_LOCALIDAD, UB_CPOSTAL, UB_PROVINCIA'
      '--FROM CUB_UBICACION, CPV_PROVINCIAS'
      '--WHERE PV_CODIGO = UB_PROVINCIA'
      '--AND 1=2')
    Left = 4
    Top = 60
  end
  object dsLocalidad: TDataSource
    DataSet = sdqLocalidad
    Left = 32
    Top = 60
  end
end
