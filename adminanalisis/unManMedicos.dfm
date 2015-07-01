object frmManMedicos: TfrmManMedicos
  Left = 203
  Top = 193
  Width = 601
  Height = 325
  Caption = 'Mantenimiento de Médicos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object fpEditor: TFormPanel
    Left = 4
    Top = 36
    Width = 581
    Height = 225
    Caption = 'Mantenimiento de Médicos'
    FormWidth = 0
    FormHeigth = 0
    Position = poScreenCenter
    Constraints.MaxHeight = 225
    Constraints.MinHeight = 225
    Constraints.MinWidth = 520
    object lbMatricula: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Matrícula'
    end
    object blNombre: TLabel
      Left = 8
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object lbCUIL: TLabel
      Left = 208
      Top = 12
      Width = 60
      Height = 13
      Caption = 'CUIT / CUIL'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 62
      Width = 573
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 124
      Width = 47
      Height = 13
      Caption = 'Telefonos'
    end
    object Label4: TLabel
      Left = 8
      Top = 148
      Width = 20
      Height = 13
      Caption = 'FAX'
    end
    object Label5: TLabel
      Left = 8
      Top = 172
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object Bevel2: TBevel
      Left = 4
      Top = 194
      Width = 573
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object edRSocial: TEdit
      Left = 64
      Top = 36
      Width = 513
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 2
    end
    object mskCUIT: TMaskEdit
      Left = 276
      Top = 8
      Width = 85
      Height = 21
      EditMask = '##-########-#;0;_'
      MaxLength = 13
      TabOrder = 1
    end
    inline fraDireccion: TfraDireccion
      Left = 8
      Top = 68
      Width = 569
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited lbNro: TLabel
        Left = 354
      end
      inherited lbPiso: TLabel
        Left = 426
      end
      inherited lbDto: TLabel
        Left = 502
      end
      inherited lbCPA: TLabel
        Left = 112
      end
      inherited lbLocalidad: TLabel
        Left = 204
      end
      inherited lbProvincia: TLabel
        Left = 407
      end
      inherited cmbCalle: TArtComboBox
        Left = 56
        Width = 295
      end
      inherited edNumero: TEdit
        Left = 376
      end
      inherited edPiso: TEdit
        Left = 452
      end
      inherited edDto: TEdit
        Left = 524
      end
      inherited edCPostal: TIntEdit
        Left = 56
      end
      inherited cmbLocalidad: TArtComboBox
        Left = 256
        Width = 145
      end
      inherited edProvincia: TEdit
        Left = 456
      end
      inherited edCPA: TPatternEdit
        Left = 138
      end
    end
    object edTelefono: TEdit
      Left = 64
      Top = 120
      Width = 513
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 4
    end
    object edFAX: TEdit
      Left = 64
      Top = 144
      Width = 513
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 5
    end
    object edDirElectronica: TEdit
      Left = 64
      Top = 168
      Width = 513
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 6
    end
    object btnAceptar: TButton
      Left = 421
      Top = 198
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 501
      Top = 198
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
    end
    object edCodigo: TPatternEdit
      Left = 64
      Top = 8
      Width = 121
      Height = 21
      MaxLength = 8
      TabOrder = 0
      Pattern = '0123456789.'
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      ' SELECT'
      '    ME_MATRICULA,'
      '    ME_NOMBRE,'
      '    ME_CUIT,'
      '    ME_CALLE,'
      '    ME_NUMERO,'
      '    ME_PISO,'
      '    ME_DEPARTAMENTO,'
      '    ME_LOCALIDAD,'
      '    ME_CPOSTAL,'
      '    ME_CPOSTALA,'
      '    ME_PROVINCIA,'
      '    PV_DESCRIPCION,'
      '    ME_TELEFONOS,'
      '    ME_FAX,'
      '    ME_DIRELECTRONICA,'
      '    ME_USUALTA,'
      '    ME_FECHALTA,'
      '    ME_USUMODIF,'
      '    ME_FECHAMODIF,'
      '    ME_USUBAJA,'
      '    ME_FECHABAJA'
      ' FROM CPV_PROVINCIAS, AME_MEDICO'
      ' WHERE ME_PROVINCIA = PV_CODIGO (+)')
    Left = 4
    Top = 4
    object sdqDatosME_MATRICULA: TStringField
      FieldName = 'ME_MATRICULA'
      Required = True
      Size = 8
    end
    object sdqDatosME_NOMBRE: TStringField
      FieldName = 'ME_NOMBRE'
      Size = 100
    end
    object sdqDatosME_CUIT: TStringField
      FieldName = 'ME_CUIT'
      Size = 11
    end
    object sdqDatosME_CALLE: TStringField
      FieldName = 'ME_CALLE'
      Size = 60
    end
    object sdqDatosME_NUMERO: TStringField
      FieldName = 'ME_NUMERO'
    end
    object sdqDatosME_PISO: TStringField
      FieldName = 'ME_PISO'
    end
    object sdqDatosME_DEPARTAMENTO: TStringField
      FieldName = 'ME_DEPARTAMENTO'
    end
    object sdqDatosME_LOCALIDAD: TStringField
      FieldName = 'ME_LOCALIDAD'
      Size = 60
    end
    object sdqDatosME_CPOSTAL: TStringField
      FieldName = 'ME_CPOSTAL'
      Size = 5
    end
    object sdqDatosME_CPOSTALA: TStringField
      FieldName = 'ME_CPOSTALA'
      Size = 8
    end
    object sdqDatosME_PROVINCIA: TStringField
      FieldName = 'ME_PROVINCIA'
      Size = 2
    end
    object sdqDatosPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqDatosME_TELEFONOS: TStringField
      FieldName = 'ME_TELEFONOS'
      Size = 60
    end
    object sdqDatosME_FAX: TStringField
      FieldName = 'ME_FAX'
      Size = 60
    end
    object sdqDatosME_DIRELECTRONICA: TStringField
      FieldName = 'ME_DIRELECTRONICA'
      Size = 120
    end
    object sdqDatosME_USUALTA: TStringField
      FieldName = 'ME_USUALTA'
    end
    object sdqDatosME_FECHALTA: TDateTimeField
      FieldName = 'ME_FECHALTA'
    end
    object sdqDatosME_USUMODIF: TStringField
      FieldName = 'ME_USUMODIF'
    end
    object sdqDatosME_FECHAMODIF: TDateTimeField
      FieldName = 'ME_FECHAMODIF'
    end
    object sdqDatosME_USUBAJA: TStringField
      FieldName = 'ME_USUBAJA'
    end
    object sdqDatosME_FECHABAJA: TDateTimeField
      FieldName = 'ME_FECHABAJA'
    end
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'Matrícula'
        FieldName = 'ME_MATRICULA'
        PrimaryKey = True
        MaxLength = 10
        ColWidth = 50
      end
      item
        Caption = 'Apellido y Nombre'
        FieldName = 'ME_NOMBRE'
        MaxLength = 60
        ColWidth = 200
      end
      item
        Caption = 'CUIT'
        FieldName = 'ME_CUIT'
        MaxLength = 11
        ColWidth = 70
      end
      item
        Caption = 'Calle'
        FieldName = 'ME_CALLE'
        MaxLength = 60
        ColWidth = 150
      end
      item
        Caption = 'Número'
        FieldName = 'ME_NUMERO'
        MaxLength = 20
        ColWidth = 45
      end
      item
        Caption = 'Piso'
        FieldName = 'ME_PISO'
        MaxLength = 20
        ColWidth = 45
      end
      item
        Caption = 'Dto.'
        FieldName = 'ME_DEPARTAMENTO'
        MaxLength = 20
        ColWidth = 45
      end
      item
        Caption = 'Localidad'
        FieldName = 'ME_LOCALIDAD'
        MaxLength = 60
        ColWidth = 160
      end
      item
        Caption = 'C.P.'
        FieldName = 'ME_CPOSTAL'
        MaxLength = 5
        ColWidth = 28
      end
      item
        Caption = 'C.P.A.'
        FieldName = 'ME_CPOSTALA'
        MaxLength = 8
        ColWidth = 33
      end
      item
        Caption = 'ME_PROVINCIA'
        FieldName = 'ME_PROVINCIA'
        Visible = False
        MaxLength = 2
        ColWidth = 20
      end
      item
        Caption = 'Provincia'
        FieldName = 'PV_DESCRIPCION'
        MaxLength = 50
        ColWidth = 125
      end
      item
        Caption = 'Teléfonos'
        FieldName = 'ME_TELEFONOS'
        MaxLength = 60
        ColWidth = 165
      end
      item
        Caption = 'FAX'
        FieldName = 'ME_FAX'
        MaxLength = 60
        ColWidth = 165
      end
      item
        Caption = 'E-Mail'
        FieldName = 'ME_DIRELECTRONICA'
        MaxLength = 120
        ColWidth = 200
      end
      item
        Caption = 'ME_FECHABAJA'
        FieldName = 'ME_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 148
      end>
    Caption = 'Mantenimiento de Médicos'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = False
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManMedicos_ABMDialog'
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
        Title = 'Matrícula'
        TitleAlignment = taCenter
        DataField = 'ME_MATRICULA'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Razón Social'
        DataField = 'ME_NOMBRE'
        MaxLength = 27
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'ME_CUIT'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Calle'
        DataField = 'ME_CALLE'
        MaxLength = 24
      end
      item
        Title = 'Número'
        TitleAlignment = taCenter
        DataField = 'ME_NUMERO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Piso'
        TitleAlignment = taCenter
        DataField = 'ME_PISO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Dto.'
        TitleAlignment = taCenter
        DataField = 'ME_DEPARTAMENTO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Localidad'
        DataField = 'ME_LOCALIDAD'
        MaxLength = 22
      end
      item
        Title = 'C.Postal'
        TitleAlignment = taCenter
        DataField = 'ME_CPOSTAL'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'C.P.A.'
        TitleAlignment = taCenter
        DataField = 'ME_CPOSTALA'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        MaxLength = 15
      end
      item
        Title = 'Teléfonos'
        DataField = 'ME_TELEFONOS'
        MaxLength = 22
      end
      item
        Title = 'FAX'
        DataField = 'ME_FAX'
        MaxLength = 22
      end
      item
        Title = 'E-Mail'
        DataField = 'ME_DIRELECTRONICA'
        MaxLength = 22
      end
      item
        Title = 'F.Baja'
        DataField = 'ME_FECHABAJA'
        MaxLength = 7
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Médicos'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
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
    Left = 88
    Top = 4
  end
end
