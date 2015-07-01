object fraDireccion: TfraDireccion
  Left = 0
  Top = 0
  Width = 589
  Height = 50
  TabOrder = 0
  OnExit = FrameExit
  DesignSize = (
    589
    50)
  object lbCalle: TLabel
    Left = 0
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
    Left = 192
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
    Width = 323
    Height = 21
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 60
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnExit = cmbCalleExit
    Columns = <
      item
        Expanded = False
        FieldName = 'CP_CODIGO'
        Title.Caption = 'Cod.Postal'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_LOCALIDAD'
        Title.Caption = 'Calle'
        Width = 70
        Visible = True
      end>
    DataSource = dsLocalidad
    FieldList = 'CP_LOCALIDAD'
    FieldKey = 'CP_LOCALIDAD'
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
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
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
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
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
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 20
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
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
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnExit = edCPostalExit
    AutoExit = True
    MaxLength = 5
  end
  object cmbLocalidad: TArtComboBox
    Left = 246
    Top = 28
    Width = 175
    Height = 21
    CharCase = ecUpperCase
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 60
    NumGlyphs = 1
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'CP_CODIGO'
        Title.Caption = 'C'#243'd.Postal'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_CODIGO'
        Title.Caption = 'C'#243'd. Postal'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 200
        Visible = True
      end>
    DataSource = dsLocalidad
    FieldList = 'CP_LOCALIDAD'
    FieldKey = 'CP_LOCALIDAD'
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
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 60
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object edCPA: TPatternEdit
    Left = 130
    Top = 28
    Width = 56
    Height = 21
    TabStop = False
    AutoSize = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 8
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Pattern = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  end
  object sdqLocalidad: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT CP_CODIGO, CP_LOCALIDAD, PV_CODIGO, PV_DESCRIPCION'
      'FROM CCP_CODIGOPOSTAL, CPV_PROVINCIAS'
      'WHERE PV_CODIGO = CP_PROVINCIA'
      'AND 0 = 1'
      'ORDER BY CP_LOCALIDAD, PV_DESCRIPCION')
    Left = 4
    Top = 60
    object sdqLocalidadCP_CODIGO: TStringField
      FieldName = 'CP_CODIGO'
      Size = 5
    end
    object sdqLocalidadCP_LOCALIDAD: TStringField
      FieldName = 'CP_LOCALIDAD'
      Size = 85
    end
    object sdqLocalidadPV_CODIGO: TStringField
      FieldName = 'PV_CODIGO'
      Required = True
      Size = 2
    end
    object sdqLocalidadPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
  end
  object dsLocalidad: TDataSource
    DataSet = sdqLocalidad
    Left = 32
    Top = 60
  end
end
