object frmManAFJP: TfrmManAFJP
  Left = 320
  Top = 188
  Width = 605
  Height = 372
  Caption = 'frmManAFJP'
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
    Width = 589
    Height = 277
    Caption = 'Mantenimiento de AFJP'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poScreenCenter
    DesignSize = (
      589
      277)
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
      Width = 581
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 8
      Top = 124
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
    end
    object Label4: TLabel
      Left = 8
      Top = 148
      Width = 19
      Height = 13
      Caption = 'FAX'
    end
    object Label5: TLabel
      Left = 8
      Top = 172
      Width = 28
      Height = 13
      Caption = 'E-Mail'
    end
    object Bevel2: TBevel
      Left = 4
      Top = 242
      Width = 581
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 7
      Top = 196
      Width = 49
      Height = 13
      Caption = 'Contactos'
    end
    object Label6: TLabel
      Left = 32
      Top = 218
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object edRSocial: TEdit
      Left = 64
      Top = 36
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
    end
    object edTelefono: TEdit
      Left = 64
      Top = 120
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 3
    end
    object edFAX: TEdit
      Left = 64
      Top = 144
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 4
    end
    object edDirElectronica: TEdit
      Left = 64
      Top = 168
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 120
      TabOrder = 5
    end
    object btnAceptar: TButton
      Left = 434
      Top = 248
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
      TabOrder = 9
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 509
      Top = 248
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
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 4
      TabOrder = 0
      Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    end
    object edContactos: TEdit
      Left = 64
      Top = 192
      Width = 521
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 6
    end
    inline fraDireccion: TfraDomicilio
      Left = 16
      Top = 67
      Width = 567
      Height = 51
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      inherited lbNro: TLabel
        Left = 352
      end
      inherited lbPiso: TLabel
        Left = 424
      end
      inherited lbDto: TLabel
        Left = 500
      end
      inherited lbProvincia: TLabel
        Left = 405
      end
      inherited cmbCalle: TArtComboBox
        Width = 267
      end
      inherited edNumero: TEdit
        Left = 374
      end
      inherited edPiso: TEdit
        Left = 450
      end
      inherited edDto: TEdit
        Left = 522
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 135
      end
      inherited edProvincia: TEdit
        Left = 454
      end
      inherited btnBuscar: TButton
        Left = 317
      end
    end
    object pnlTipo: TPanel
      Left = 63
      Top = 214
      Width = 128
      Height = 23
      BevelOuter = bvNone
      TabOrder = 7
      object rbSussABM: TRadioButton
        Left = 0
        Top = 4
        Width = 53
        Height = 17
        Caption = 'SUSS'
        TabOrder = 0
      end
      object rbNoSussABM: TRadioButton
        Left = 56
        Top = 4
        Width = 69
        Height = 17
        Caption = 'No SUSS'
        TabOrder = 1
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ju_codigo, ju_nombre, ju_calle, ju_numero, ju_piso, ju_de' +
        'partamento, '
      
        '       ju_localidad, ju_cpostal, ju_cpostala, ju_provincia, pv_d' +
        'escripcion, '
      
        '       ju_telefonos, ju_fax, ju_direlectronica, ju_fechaalta, ju' +
        '_usualta, '
      
        '       ju_fechamodif, ju_usumodif, ju_fechabaja, ju_usubaja, ju_' +
        'contactos,'
      
        '       ju_tipo, DECODE(ju_tipo, '#39'S'#39', '#39'SUSS'#39', '#39'N'#39', '#39'No SUSS'#39', Nul' +
        'l) tipo'
      '  FROM sju_jubilacion, cpv_provincias'
      ' WHERE pv_codigo(+) = ju_provincia')
    Left = 4
    Top = 4
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'C'#243'digo'
        FieldName = 'JU_CODIGO'
        PrimaryKey = True
        MaxLength = 10
        ColWidth = 46
      end
      item
        Caption = 'Raz'#243'n Social'
        FieldName = 'JU_NOMBRE'
        MaxLength = 60
        ColWidth = 260
      end
      item
        Caption = 'Calle'
        FieldName = 'JU_CALLE'
        MaxLength = 60
        ColWidth = 173
      end
      item
        Caption = 'N'#250'mero'
        FieldName = 'JU_NUMERO'
        MaxLength = 20
        ColWidth = 50
      end
      item
        Caption = 'Piso'
        FieldName = 'JU_PISO'
        MaxLength = 20
        ColWidth = 50
      end
      item
        Caption = 'Dto.'
        FieldName = 'JU_DEPARTAMENTO'
        MaxLength = 20
        ColWidth = 50
      end
      item
        Caption = 'Localidad'
        FieldName = 'JU_LOCALIDAD'
        MaxLength = 60
        ColWidth = 120
      end
      item
        Caption = 'C.P.'
        FieldName = 'JU_CPOSTAL'
        MaxLength = 5
        ColWidth = 35
      end
      item
        Caption = 'C.P.A.'
        FieldName = 'JU_CPOSTALA'
        MaxLength = 8
        ColWidth = 48
      end
      item
        Caption = 'JU_PROVINCIA'
        FieldName = 'JU_PROVINCIA'
        Visible = False
        MaxLength = 2
        ColWidth = 120
      end
      item
        Caption = 'Provincia'
        FieldName = 'PV_DESCRIPCION'
        MaxLength = 50
        ColWidth = 120
      end
      item
        Caption = 'Tel'#233'fonos'
        FieldName = 'JU_TELEFONOS'
        MaxLength = 60
        ColWidth = 170
      end
      item
        Caption = 'FAX'
        FieldName = 'JU_FAX'
        MaxLength = 60
        ColWidth = 170
      end
      item
        Caption = 'E-Mail'
        FieldName = 'JU_DIRELECTRONICA'
        MaxLength = 120
        ColWidth = 200
      end
      item
        Caption = 'JU_FECHABAJA'
        FieldName = 'JU_FECHABAJA'
        Visible = False
        FieldType = ftDateDelete
        MaxLength = 18
        Options = [foShowInEditor, foShowInGrid]
        ColWidth = 148
      end
      item
        Caption = 'Contactos'
        FieldName = 'JU_CONTACTOS'
        MaxLength = 50
        ColWidth = 170
      end
      item
        Caption = 'Tipo'
        FieldName = 'TIPO'
        MaxLength = 18
        ColWidth = 80
      end>
    Caption = 'Mantenimiento de AFJP'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'frmManPrestaAMP_ABMDialog'
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
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'JU_CODIGO'
        Alignment = taCenter
        MaxLength = 7
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'JU_NOMBRE'
        MaxLength = 27
      end
      item
        Title = 'Calle'
        DataField = 'JU_CALLE'
        MaxLength = 18
      end
      item
        Title = 'N'#250'mero'
        TitleAlignment = taCenter
        DataField = 'JU_NUMERO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Piso'
        TitleAlignment = taCenter
        DataField = 'JU_PISO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Dto.'
        TitleAlignment = taCenter
        DataField = 'JU_DEPARTAMENTO'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Localidad'
        DataField = 'JU_LOCALIDAD'
        MaxLength = 22
      end
      item
        Title = 'C.Postal'
        TitleAlignment = taCenter
        DataField = 'JU_CPOSTAL'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'C.P.A.'
        TitleAlignment = taCenter
        DataField = 'JU_CPOSTALA'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Provincia'
        DataField = 'PV_DESCRIPCION'
        MaxLength = 15
      end
      item
        Title = 'Tel'#233'fonos'
        DataField = 'JU_TELEFONOS'
        MaxLength = 20
      end
      item
        Title = 'FAX'
        DataField = 'JU_FAX'
        MaxLength = 20
      end
      item
        Title = 'E-Mail'
        DataField = 'JU_DIRELECTRONICA'
        MaxLength = 20
      end
      item
        Title = 'Contactos'
        DataField = 'JU_CONTACTOS'
        MaxLength = 27
      end
      item
        Title = 'F.Baja'
        DataField = 'JU_FECHABAJA'
        MaxLength = 9
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
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
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
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 95
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 88
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 117
    Top = 4
  end
end
