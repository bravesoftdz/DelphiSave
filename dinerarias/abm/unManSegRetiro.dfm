object frmManSegRetiro: TfrmManSegRetiro
  Left = 332
  Top = 218
  Width = 617
  Height = 378
  Caption = 'Mantenimiento Compa'#241#237'as de Seguros de Retiro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object fpEditor: TFormPanel
    Left = 4
    Top = 36
    Width = 601
    Height = 281
    Caption = 'Mantenimiento de Seguros de Retiro'
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    OnBeforeShow = fpEditorBeforeShow
    Constraints.MaxHeight = 281
    Constraints.MinHeight = 281
    Constraints.MinWidth = 520
    DesignSize = (
      601
      281)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbRSocial: TLabel
      Left = 8
      Top = 40
      Width = 38
      Height = 13
      Caption = 'R.Social'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 62
      Width = 593
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 8
      Top = 76
      Width = 28
      Height = 13
      Caption = 'E-Mail'
    end
    object Bevel2: TBevel
      Left = 4
      Top = 98
      Width = 593
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 148
      Top = 12
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object edRSocial: TEdit
      Left = 64
      Top = 36
      Width = 533
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 2
    end
    object edDirElectronica: TEdit
      Left = 64
      Top = 72
      Width = 533
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 3
    end
    object btnAceptar: TButton
      Left = 446
      Top = 252
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
      TabOrder = 5
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 521
      Top = 252
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 6
    end
    object edCodigo: TPatternEdit
      Left = 64
      Top = 8
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 0
      Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    end
    object pcDomicilios: TPageControl
      Left = 4
      Top = 104
      Width = 593
      Height = 145
      ActivePage = tsDomParticular
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      object tsDomParticular: TTabSheet
        Caption = 'Domicilio Particular'
        DesignSize = (
          585
          117)
        object Label2: TLabel
          Left = 4
          Top = 64
          Width = 47
          Height = 13
          Caption = 'Telefonos'
        end
        object Label6: TLabel
          Left = 4
          Top = 92
          Width = 19
          Height = 13
          Caption = 'FAX'
        end
        object edPartFAX: TEdit
          Left = 60
          Top = 88
          Width = 525
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 60
          TabOrder = 2
        end
        object edPartTelefonos: TEdit
          Left = 60
          Top = 60
          Width = 525
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 60
          TabOrder = 1
        end
        inline fraPartDireccion: TfraDomicilio
          Left = 11
          Top = 6
          Width = 572
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited lbNro: TLabel
            Left = 357
          end
          inherited lbPiso: TLabel
            Left = 429
          end
          inherited lbDto: TLabel
            Left = 505
          end
          inherited lbProvincia: TLabel
            Left = 410
          end
          inherited cmbCalle: TArtComboBox
            Width = 272
          end
          inherited edNumero: TEdit
            Left = 379
          end
          inherited edPiso: TEdit
            Left = 455
          end
          inherited edDto: TEdit
            Left = 527
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 140
          end
          inherited edProvincia: TEdit
            Left = 459
          end
          inherited btnBuscar: TButton
            Left = 322
          end
        end
      end
      object tsDomCapital: TTabSheet
        Caption = 'Domicilio en Capital'
        ImageIndex = 1
        DesignSize = (
          585
          117)
        object Label3: TLabel
          Left = 4
          Top = 64
          Width = 47
          Height = 13
          Caption = 'Telefonos'
        end
        object Label4: TLabel
          Left = 4
          Top = 92
          Width = 19
          Height = 13
          Caption = 'FAX'
        end
        object edCapFAX: TEdit
          Left = 60
          Top = 88
          Width = 525
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 60
          TabOrder = 2
        end
        object edCapTelefonos: TEdit
          Left = 60
          Top = 60
          Width = 525
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 60
          TabOrder = 1
        end
        inline fraCapDireccion: TfraDomicilio
          Left = 11
          Top = 6
          Width = 572
          Height = 51
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          inherited lbNro: TLabel
            Left = 357
          end
          inherited lbPiso: TLabel
            Left = 429
          end
          inherited lbDto: TLabel
            Left = 505
          end
          inherited lbProvincia: TLabel
            Left = 410
          end
          inherited cmbCalle: TArtComboBox
            Width = 272
          end
          inherited edNumero: TEdit
            Left = 379
          end
          inherited edPiso: TEdit
            Left = 455
          end
          inherited edDto: TEdit
            Left = 527
          end
          inherited cmbLocalidad: TArtComboBox
            Width = 140
          end
          inherited edProvincia: TEdit
            Left = 459
          end
          inherited btnBuscar: TButton
            Left = 322
          end
        end
      end
    end
    object edCUIT: TMaskEdit
      Left = 184
      Top = 8
      Width = 81
      Height = 21
      EditMask = '99-########-c;0; '
      MaxLength = 13
      TabOrder = 1
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'SELECT ur_codigo, ur_nombre, ur_calle, ur_numero, ur_piso, ur_de' +
        'partamento, '
      '       ur_localidad, ur_cpostal, ur_cpostala, ur_provincia, '
      
        '       part.pv_descripcion provincia_part, ur_telefonos, ur_fax,' +
        ' ur_dircap_calle, '
      
        '       ur_dircap_numero, ur_dircap_piso, ur_dircap_departamento,' +
        ' ur_dircap_localidad, '
      
        '       ur_dircap_cpostal, ur_dircap_cpostala, ur_dircap_provinci' +
        'a,'
      
        '       cap.pv_descripcion provincia_cap, ur_dircap_telefonos, ur' +
        '_dircap_fax, '
      
        '       ur_direlectronica, ur_fechaalta, ur_usualta, ur_fechamodi' +
        'f, ur_usumodif, '
      '       ur_fechabaja, ur_usubaja, ur_cuit'
      '  FROM sur_seguroretiro, cpv_provincias part, cpv_provincias cap'
      ' WHERE part.pv_codigo(+) = ur_provincia'
      '   AND cap.pv_codigo(+) = ur_dircap_provincia'
      '')
    Left = 4
    Top = 4
    object sdqDatosUR_CODIGO: TStringField
      FieldName = 'UR_CODIGO'
      Required = True
      Size = 4
    end
    object sdqDatosUR_NOMBRE: TStringField
      FieldName = 'UR_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqDatosUR_CALLE: TStringField
      FieldName = 'UR_CALLE'
      Size = 60
    end
    object sdqDatosUR_NUMERO: TStringField
      FieldName = 'UR_NUMERO'
    end
    object sdqDatosUR_PISO: TStringField
      FieldName = 'UR_PISO'
    end
    object sdqDatosUR_DEPARTAMENTO: TStringField
      FieldName = 'UR_DEPARTAMENTO'
    end
    object sdqDatosUR_LOCALIDAD: TStringField
      FieldName = 'UR_LOCALIDAD'
      Size = 60
    end
    object sdqDatosUR_CPOSTAL: TStringField
      FieldName = 'UR_CPOSTAL'
      Size = 5
    end
    object sdqDatosUR_CPOSTALA: TStringField
      FieldName = 'UR_CPOSTALA'
      Size = 8
    end
    object sdqDatosUR_PROVINCIA: TStringField
      FieldName = 'UR_PROVINCIA'
      Size = 2
    end
    object sdqDatosPROVINCIA_PART: TStringField
      FieldName = 'PROVINCIA_PART'
      Size = 50
    end
    object sdqDatosUR_TELEFONOS: TStringField
      FieldName = 'UR_TELEFONOS'
      Size = 60
    end
    object sdqDatosUR_FAX: TStringField
      FieldName = 'UR_FAX'
      Size = 60
    end
    object sdqDatosUR_DIRCAP_CALLE: TStringField
      FieldName = 'UR_DIRCAP_CALLE'
      Size = 60
    end
    object sdqDatosUR_DIRCAP_NUMERO: TStringField
      FieldName = 'UR_DIRCAP_NUMERO'
    end
    object sdqDatosUR_DIRCAP_PISO: TStringField
      FieldName = 'UR_DIRCAP_PISO'
    end
    object sdqDatosUR_DIRCAP_DEPARTAMENTO: TStringField
      FieldName = 'UR_DIRCAP_DEPARTAMENTO'
    end
    object sdqDatosUR_DIRCAP_LOCALIDAD: TStringField
      FieldName = 'UR_DIRCAP_LOCALIDAD'
      Size = 60
    end
    object sdqDatosUR_DIRCAP_CPOSTAL: TStringField
      FieldName = 'UR_DIRCAP_CPOSTAL'
      Size = 5
    end
    object sdqDatosUR_DIRCAP_CPOSTALA: TStringField
      FieldName = 'UR_DIRCAP_CPOSTALA'
      Size = 8
    end
    object sdqDatosUR_DIRCAP_PROVINCIA: TStringField
      FieldName = 'UR_DIRCAP_PROVINCIA'
      Size = 2
    end
    object sdqDatosPROVINCIA_CAP: TStringField
      FieldName = 'PROVINCIA_CAP'
      Size = 50
    end
    object sdqDatosUR_DIRCAP_TELEFONOS: TStringField
      FieldName = 'UR_DIRCAP_TELEFONOS'
      Size = 60
    end
    object sdqDatosUR_DIRCAP_FAX: TStringField
      FieldName = 'UR_DIRCAP_FAX'
      Size = 60
    end
    object sdqDatosUR_DIRELECTRONICA: TStringField
      FieldName = 'UR_DIRELECTRONICA'
      Size = 120
    end
    object sdqDatosUR_FECHAALTA: TDateTimeField
      FieldName = 'UR_FECHAALTA'
    end
    object sdqDatosUR_USUALTA: TStringField
      FieldName = 'UR_USUALTA'
      Size = 25
    end
    object sdqDatosUR_FECHAMODIF: TDateTimeField
      FieldName = 'UR_FECHAMODIF'
    end
    object sdqDatosUR_USUMODIF: TStringField
      FieldName = 'UR_USUMODIF'
      Size = 25
    end
    object sdqDatosUR_FECHABAJA: TDateTimeField
      FieldName = 'UR_FECHABAJA'
    end
    object sdqDatosUR_USUBAJA: TStringField
      FieldName = 'UR_USUBAJA'
      Size = 25
    end
    object sdqDatosUR_CUIT: TStringField
      FieldName = 'UR_CUIT'
      Size = 11
    end
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'UR_CODIGO'
        ColWidth = 40
      end
      item
        Caption = 'CUIT'
        FieldName = 'UR_CUIT'
        ColWidth = 80
      end
      item
        Caption = 'Nombre / Raz'#243'n Social'
        FieldName = 'UR_NOMBRE'
        ColWidth = 230
      end
      item
        Caption = 'Calle'
        FieldName = 'UR_CALLE'
        ColWidth = 150
      end
      item
        Caption = 'Nro'
        FieldName = 'UR_NUMERO'
        ColWidth = 48
      end
      item
        Caption = 'Piso'
        FieldName = 'UR_PISO'
        ColWidth = 49
      end
      item
        Caption = 'Dto.'
        FieldName = 'UR_DEPARTAMENTO'
        ColWidth = 47
      end
      item
        Caption = 'Localidad'
        FieldName = 'UR_LOCALIDAD'
        ColWidth = 140
      end
      item
        Caption = 'C.P.'
        FieldName = 'UR_CPOSTAL'
        ColWidth = 46
      end
      item
        Caption = 'C.P.A.'
        FieldName = 'UR_CPOSTALA'
        ColWidth = 55
      end
      item
        Caption = 'Provincia'
        FieldName = 'UR_PROVINCIA'
        Visible = False
        ColWidth = 30
      end
      item
        Caption = 'Provincia'
        FieldName = 'PROVINCIA_PART'
        ColWidth = 115
      end
      item
        Caption = 'Tel'#233'fonos'
        FieldName = 'UR_TELEFONOS'
        ColWidth = 115
      end
      item
        Caption = 'Fax'
        FieldName = 'UR_FAX'
        ColWidth = 115
      end
      item
        Caption = 'Cap.Calle'
        FieldName = 'UR_DIRCAP_CALLE'
        ColWidth = 150
      end
      item
        Caption = 'Cap.Nro.'
        FieldName = 'UR_DIRCAP_NUMERO'
        ColWidth = 48
      end
      item
        Caption = 'Cap.Piso'
        FieldName = 'UR_DIRCAP_PISO'
        ColWidth = 49
      end
      item
        Caption = 'Cap.Dto'
        FieldName = 'UR_DIRCAP_DEPARTAMENTO'
        ColWidth = 47
      end
      item
        Caption = 'Cap.Localidad'
        FieldName = 'UR_DIRCAP_LOCALIDAD'
        ColWidth = 140
      end
      item
        Caption = 'Cap.C.P.'
        FieldName = 'UR_DIRCAP_CPOSTAL'
        ColWidth = 46
      end
      item
        Caption = 'Cap.C.P.A.'
        FieldName = 'UR_DIRCAP_CPOSTALA'
        ColWidth = 55
      end
      item
        Caption = 'Cap.Provincia'
        FieldName = 'UR_DIRCAP_PROVINCIA'
        Visible = False
        ColWidth = 30
      end
      item
        Caption = 'Cap.Provincia'
        FieldName = 'PROVINCIA_CAP'
        ColWidth = 115
      end
      item
        Caption = 'Cap.Tel'#233'fonos'
        FieldName = 'UR_DIRCAP_TELEFONOS'
        ColWidth = 115
      end
      item
        Caption = 'Cap.FAX'
        FieldName = 'UR_DIRCAP_FAX'
        ColWidth = 115
      end
      item
        Caption = 'E-Mail'
        FieldName = 'UR_DIRELECTRONICA'
        ColWidth = 230
      end
      item
        Caption = 'UR_FECHAALTA'
        FieldName = 'UR_FECHAALTA'
        Visible = False
        FieldType = ftDateNew
        ColWidth = 30
      end
      item
        Caption = 'UR_USUALTA'
        FieldName = 'UR_USUALTA'
        Visible = False
        FieldType = ftUserNew
        ColWidth = 30
      end
      item
        Caption = 'UR_FECHAMODIF'
        FieldName = 'UR_FECHAMODIF'
        Visible = False
        FieldType = ftDateModify
        ColWidth = 30
      end
      item
        Caption = 'UR_USUMODIF'
        FieldName = 'UR_USUMODIF'
        Visible = False
        FieldType = ftUserModify
        ColWidth = 30
      end
      item
        Caption = 'UR_FECHABAJA'
        FieldName = 'UR_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        ColWidth = 30
      end
      item
        Caption = 'UR_USUBAJA'
        FieldName = 'UR_USUBAJA'
        Visible = False
        FieldType = ftUserDelete
        ColWidth = 30
      end>
    Caption = 'Mantenimiento de Seguros de Retiro'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    Left = 60
    Top = 4
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 32
    Top = 4
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'C'#243'd.'
        DataField = 'UR_CODIGO'
        Alignment = taRightJustify
        MaxLength = 5
      end
      item
        Title = 'CUIT'
        DataField = 'UR_CUIT'
        MaxLength = 10
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'UR_NOMBRE'
        MaxLength = 30
      end
      item
        Title = 'Calle'
        DataField = 'UR_CALLE'
        MaxLength = 22
      end
      item
        Title = 'Nro.'
        TitleAlignment = taCenter
        DataField = 'UR_NUMERO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Piso'
        TitleAlignment = taCenter
        DataField = 'UR_PISO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Dto.'
        TitleAlignment = taCenter
        DataField = 'UR_DEPARTAMENTO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Localidad'
        DataField = 'UR_LOCALIDAD'
        MaxLength = 17
      end
      item
        Title = 'C.P.'
        TitleAlignment = taCenter
        DataField = 'UR_CPOSTAL'
        Alignment = taCenter
        MaxLength = 3
      end
      item
        Title = 'C.P.A.'
        TitleAlignment = taCenter
        DataField = 'UR_CPOSTALA'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Provincia'
        DataField = 'PROVINCIA_PART'
        MaxLength = 16
      end
      item
        Title = 'Tel'#233'fonos'
        DataField = 'UR_TELEFONOS'
        MaxLength = 12
      end
      item
        Title = 'Fax'
        DataField = 'UR_FAX'
        MaxLength = 12
      end
      item
        Title = 'Calle'
        DataField = 'UR_DIRCAP_CALLE'
        MaxLength = 22
      end
      item
        Title = 'Nro.'
        TitleAlignment = taCenter
        DataField = 'UR_DIRCAP_NUMERO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Piso'
        TitleAlignment = taCenter
        DataField = 'UR_DIRCAP_PISO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Dto.'
        TitleAlignment = taCenter
        DataField = 'UR_DIRCAP_DEPARTAMENTO'
        Alignment = taCenter
        MaxLength = 4
      end
      item
        Title = 'Localidad'
        DataField = 'UR_DIRCAP_LOCALIDAD'
        MaxLength = 17
      end
      item
        Title = 'C.P.'
        TitleAlignment = taCenter
        DataField = 'UR_DIRCAP_CPOSTAL'
        Alignment = taCenter
        MaxLength = 3
      end
      item
        Title = 'C.P.A.'
        TitleAlignment = taCenter
        DataField = 'UR_DIRCAP_CPOSTALA'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Provincia'
        DataField = 'PROVINCIA_CAP'
        MaxLength = 16
      end
      item
        Title = 'Tel'#233'fonos'
        DataField = 'UR_DIRCAP_TELEFONOS'
        MaxLength = 12
      end
      item
        Title = 'Fax'
        DataField = 'UR_DIRCAP_FAX'
        MaxLength = 12
      end
      item
        Title = 'E-Mail'
        DataField = 'UR_DIRELECTRONICA'
        MaxLength = 120
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Aseguradoras de Fondos de Jubilaciones y Pensiones'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Lines.Strings = (
      
        'Entidades que operan en la modalidad seguro de renta vitalicia p' +
        'ara derechohabientes por muerte del trabajador no afiliado al re' +
        'gimen de capitalizaci'#243'n')
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -7
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlCustom
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    CellBorder = 2
    Left = 116
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Left = 88
    Top = 4
  end
end
