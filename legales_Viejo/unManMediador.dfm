inherited frmManMediador: TfrmManMediador
  Left = 216
  Top = 273
  Caption = 'Mantenimiento Mediador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Height = 336
    Columns = <
      item
        Expanded = False
        FieldName = 'MD_NOMBRE'
        Title.Caption = 'Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DIRECCION'
        Title.Caption = 'Direcci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_CODAREATELEFONO'
        Title.Caption = 'C'#243'digo de Area'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_TELEFONO'
        Title.Caption = 'Tel'#233'fono'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DIRELECTRONICA'
        Title.Caption = 'Direcci'#243'n Electr'#243'nica'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_CUITCUIL'
        Title.Caption = 'Cuit/Cuil'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_CALLE'
        Title.Caption = 'Calle'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_PISO'
        Title.Caption = 'Piso'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal '
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_CPOSTALA'
        Title.Caption = 'CPA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MD_FAX'
        Title.Caption = 'Fax'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 111
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 56
    Top = 96
    Width = 557
    Height = 266
    inherited BevelAbm: TBevel
      Top = 230
      Width = 549
    end
    object lblDescripcion: TLabel [1]
      Left = 5
      Top = 9
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lblDireccion: TLabel [2]
      Left = 4
      Top = 33
      Width = 45
      Height = 13
      Caption = 'Direcci'#243'n'
    end
    object lblEmail: TLabel [3]
      Left = 4
      Top = 134
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object lblParte: TLabel [4]
      Left = 4
      Top = 158
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label1: TLabel [5]
      Left = 4
      Top = 59
      Width = 47
      Height = 13
      Caption = 'Cod Area:'
    end
    object Label2: TLabel [6]
      Left = 113
      Top = 58
      Width = 41
      Height = 13
      Caption = 'Nro. Tel:'
    end
    object lbFAX: TLabel [7]
      Left = 6
      Top = 83
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object lblCuil: TLabel [8]
      Left = 5
      Top = 100
      Width = 31
      Height = 26
      Caption = 'CUIL/'#13#10' CUIT:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 399
      Top = 236
    end
    inherited btnCancelar: TButton
      Left = 477
      Top = 236
    end
    object edNombre: TEdit
      Left = 51
      Top = 6
      Width = 499
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object edDireccion: TEdit
      Left = 51
      Top = 31
      Width = 499
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 3
    end
    object edTelefono: TEdit
      Left = 157
      Top = 55
      Width = 393
      Height = 21
      MaxLength = 20
      TabOrder = 4
    end
    object edEmail: TEdit
      Left = 51
      Top = 128
      Width = 498
      Height = 21
      MaxLength = 120
      TabOrder = 5
    end
    object edCodArea: TEdit
      Left = 51
      Top = 55
      Width = 57
      Height = 21
      MaxLength = 20
      TabOrder = 6
    end
    object edFax: TPatternEdit
      Left = 51
      Top = 78
      Width = 499
      Height = 21
      MaxLength = 60
      TabOrder = 7
      Pattern = '0123456789()-/'
    end
    object edCuilCuit: TMaskEdit
      Left = 51
      Top = 103
      Width = 84
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 8
    end
    inline fraDomicilio: TfraDomicilio
      Left = 3
      Top = 178
      Width = 547
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      inherited lbCalle: TLabel
        Left = 1
      end
      inherited lbNro: TLabel
        Left = 332
      end
      inherited lbPiso: TLabel
        Left = 404
      end
      inherited lbDto: TLabel
        Left = 480
      end
      inherited lbCPostal: TLabel
        Left = 1
        Top = 28
      end
      inherited lbCPA: TLabel
        Top = 28
      end
      inherited lbLocalidad: TLabel
        Top = 28
      end
      inherited lbProvincia: TLabel
        Left = 385
        Top = 28
      end
      inherited cmbCalle: TArtComboBox
        Width = 247
        DataSource = nil
      end
      inherited edNumero: TEdit
        Left = 354
      end
      inherited edPiso: TEdit
        Left = 430
      end
      inherited edDto: TEdit
        Left = 502
      end
      inherited edCPostal: TIntEdit
        Top = 24
      end
      inherited cmbLocalidad: TArtComboBox
        Top = 24
        Width = 115
        DataSource = nil
      end
      inherited edProvincia: TEdit
        Left = 434
        Top = 24
      end
      inherited edCPA: TPatternEdit
        Top = 24
      end
      inherited btnBuscar: TButton
        Left = 297
      end
    end
    object cmbTipo: TExComboBox
      Left = 51
      Top = 152
      Width = 276
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 10
      Text = 'C=Conciliador Laboral'
      Items.Strings = (
        'M=Mediador'
        'C=Conciliador Laboral')
      ItemIndex = 1
      Options = [coShowValues, coGridLines]
      ValueWidth = 64
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 410
    Width = 621
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      621
      29)
    object Button1: TButton
      Left = 468
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 544
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 464
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT md_id, md_nombre, md_direccion, md_telefono,'
      '       md_codareatelefono, md_direlectronica, md_fechabaja,'
      '       md_usubaja, md_fechabaja,md_usubaja,'
      '       md_cuitcuil, md_tipo, md_calle, md_numero,'
      '       md_piso, md_departamento, md_cpostal, md_cpostala,'
      '       md_localidad, md_provincia, md_fax, pv_descripcion'
      '  FROM legales.lmd_mediador, art.cpv_provincias'
      ' WHERE MD_provincia = pv_codigo(+)')
  end
end
