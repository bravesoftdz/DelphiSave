inherited fraPrestador: TfraPrestador
  Width = 691
  Height = 50
  VertScrollBar.Range = 49
  AutoScroll = False
  OnExit = FrameExit
  DesignSize = (
    691
    50)
  object lbCUIT: TLabel [0]
    Left = 4
    Top = 8
    Width = 25
    Height = 13
    Caption = 'CUIT'
  end
  object lbSec: TLabel [1]
    Left = 124
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Sec.'
  end
  object lbIdentif: TLabel [2]
    Left = 196
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Identif.:'
  end
  object lbRSocial: TLabel [3]
    Left = 284
    Top = 8
    Width = 40
    Height = 13
    Caption = 'R.Social'
  end
  object lbDomicilio: TLabel [4]
    Left = 3
    Top = 32
    Width = 42
    Height = 13
    Caption = 'Domicilio'
  end
  object lbLocalidad: TLabel [5]
    Left = 302
    Top = 32
    Width = 46
    Height = 13
    Caption = 'Localidad'
  end
  object lbCPostal: TLabel [6]
    Left = 619
    Top = 32
    Width = 14
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'CP'
  end
  object lbTelefono: TLabel [7]
    Left = 531
    Top = 32
    Width = 18
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Tel.'
    Visible = False
  end
  object cmbPrestFantasia: TArtComboBox [8]
    Left = 64
    Top = 28
    Width = 236
    Height = 21
    Hint = 'Nombre de Fantas'#237'a del Prestador'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 8
    Visible = False
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
        FieldName = 'CA_NOMBREFANTA'
        Title.Caption = 'Nombre Fantas'#237'a'
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
    DataSource = dsPrestador
    FieldList = 'CA_NOMBREFANTA'
    FieldKey = 'CA_CLAVE'
    OnCloseUp = cmbPrestFantasiaCloseUp
    OnDropDown = cmbPrestFantasiaDropDown
    OnGetCellParams = cmbPrestFantasiaGetCellParams
  end
  object mskPrestCUIT: TMaskEdit [9]
    Left = 36
    Top = 2
    Width = 81
    Height = 21
    Hint = 'CUIT o Clave del Prestador'
    EditMask = '99-99999999-c;0;'
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = mskPrestCUITKeyPress
  end
  object cmbPrestador: TArtComboBox [10]
    Left = 328
    Top = 2
    Width = 361
    Height = 21
    Hint = 'Raz'#243'n Social del Prestador'
    CharCase = ecUpperCase
    GlyphKind = gkDropDown
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 3
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
    DataSource = dsPrestador
    FieldList = 'CA_DESCRIPCION'
    FieldKey = 'CA_CLAVE'
    OnCloseUp = cmbPrestadorCloseUp
    OnDropDown = cmbPrestadorDropDown
    OnGetCellParams = cmbPrestadorGetCellParams
  end
  object edPresDomicilio: TEdit [11]
    Left = 48
    Top = 28
    Width = 252
    Height = 21
    Hint = 'Domicilio del Prestador'
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object edPresLocalidad: TEdit [12]
    Left = 352
    Top = 28
    Width = 265
    Height = 21
    Hint = 'Localidad del Prestador'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object edPresCPostal: TEdit [13]
    Left = 636
    Top = 28
    Width = 53
    Height = 21
    Hint = 'Localidad del Prestador'
    TabStop = False
    Anchors = [akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object edPrestIdentif: TIntEdit [14]
    Left = 232
    Top = 2
    Width = 45
    Height = 21
    TabOrder = 2
    OnKeyPress = edPrestIdentifKeyPress
  end
  object edPrestSecuencia: TIntEdit [15]
    Left = 148
    Top = 2
    Width = 45
    Height = 21
    TabOrder = 1
    OnKeyPress = edPrestSecuenciaKeyPress
  end
  object edPresTelefono: TEdit [16]
    Left = 551
    Top = 28
    Width = 65
    Height = 21
    Hint = 'Tel'#233'fono del Prestador'
    TabStop = False
    Anchors = [akTop, akRight]
    AutoSelect = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object sdqPrestador: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ca_clave, ca_secuencia, ca_identificador, ca_descripcion,' +
        ' ca_domicilio, '
      
        #9#9#9' ca_localidad, ca_codpostal, pv_descripcion provincia, ca_tel' +
        'efono, '
      
        #9#9#9' ca_fechabaja, ca_asistencial, ca_concertado, ca_iva, ca_tipo' +
        'comprobante,'
      
        '       ca_direlectronica, ca_nombrefanta, ca_fechaconexia, ca_ha' +
        'bilitaciones'
      '  FROM cpr_prestador, cpv_provincias'
      ' WHERE ca_provincia = pv_codigo(+)'
      '')
    Left = 4
    Top = 56
    object sdqPrestadorCA_CLAVE: TStringField
      FieldName = 'CA_CLAVE'
      Required = True
      Size = 11
    end
    object sdqPrestadorCA_SECUENCIA: TFloatField
      FieldName = 'CA_SECUENCIA'
      Required = True
    end
    object sdqPrestadorCA_IDENTIFICADOR: TFloatField
      FieldName = 'CA_IDENTIFICADOR'
      Required = True
    end
    object sdqPrestadorCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 150
    end
    object sdqPrestadorCA_DOMICILIO: TStringField
      FieldName = 'CA_DOMICILIO'
      Size = 50
    end
    object sdqPrestadorCA_LOCALIDAD: TStringField
      FieldName = 'CA_LOCALIDAD'
      Size = 85
    end
    object sdqPrestadorCA_CODPOSTAL: TStringField
      FieldName = 'CA_CODPOSTAL'
      Size = 5
    end
    object sdqPrestadorPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object sdqPrestadorCA_TELEFONO: TStringField
      FieldName = 'CA_TELEFONO'
      Size = 50
    end
    object sdqPrestadorCA_FECHABAJA: TDateTimeField
      FieldName = 'CA_FECHABAJA'
    end
    object sdqPrestadorCA_ASISTENCIAL: TFloatField
      FieldName = 'CA_ASISTENCIAL'
    end
    object sdqPrestadorCA_CONCERTADO: TStringField
      FieldName = 'CA_CONCERTADO'
      Size = 1
    end
    object sdqPrestadorCA_IVA: TStringField
      FieldName = 'CA_IVA'
      Size = 1
    end
    object sdqPrestadorCA_TIPOCOMPROBANTE: TStringField
      FieldName = 'CA_TIPOCOMPROBANTE'
      Size = 3
    end
    object sdqPrestadorCA_DIRELECTRONICA: TStringField
      FieldName = 'CA_DIRELECTRONICA'
      Size = 150
    end
    object sdqPrestadorCA_NOMBREFANTA: TStringField
      FieldName = 'CA_NOMBREFANTA'
      Size = 150
    end
    object sdqPrestadorCA_FECHACONEXIA: TDateTimeField
      FieldName = 'CA_FECHACONEXIA'
    end
    object sdqPrestadorCA_HABILITACIONES: TStringField
      FieldName = 'CA_HABILITACIONES'
      Size = 250
    end
  end
  object dsPrestador: TDataSource
    DataSet = sdqPrestador
    Left = 32
    Top = 56
  end
end
