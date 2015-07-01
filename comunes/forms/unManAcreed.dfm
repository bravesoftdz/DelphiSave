object frmManAcreed: TfrmManAcreed
  Left = 56
  Top = 99
  Width = 700
  Height = 450
  Caption = 'Mantenimiento de Afiliaci'#243'n del Acreedor'
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object fpEditor: TFormPanel
    Left = 16
    Top = 40
    Width = 599
    Height = 360
    Caption = 'Mantenimiento de acreedores'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poScreenCenter
    Constraints.MaxHeight = 360
    Constraints.MinHeight = 360
    Constraints.MinWidth = 520
    DesignSize = (
      599
      360)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Tipo acreedor'
    end
    object lbRSocial: TLabel
      Left = 8
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Acreedor'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 103
      Width = 591
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 6
      Top = 115
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Bevel2: TBevel
      Left = 4
      Top = 284
      Width = 591
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 57
      Height = 13
      Caption = 'CUIT / CUIL'
    end
    object Bevel3: TBevel
      Left = 4
      Top = 226
      Width = 591
      Height = 3
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label6: TLabel
      Left = 8
      Top = 237
      Width = 72
      Height = 13
      Caption = 'Ret. ganancias'
    end
    object Label7: TLabel
      Left = 8
      Top = 261
      Width = 69
      Height = 13
      Caption = 'Retenci'#243'n I.B.'
    end
    object Label4: TLabel
      Left = 10
      Top = 291
      Width = 66
      Height = 26
      Caption = 'F. impr. form.'#13#10'   inscripci'#243'n'
    end
    object Bevel4: TBevel
      Left = 4
      Top = 321
      Width = 591
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 8
      Top = 84
      Width = 60
      Height = 13
      Caption = 'Forma cobro'
    end
    object Label8: TLabel
      Left = 8
      Top = 140
      Width = 40
      Height = 13
      Caption = 'Domicilio'
    end
    object edAcreedor: TEdit
      Left = 80
      Top = 54
      Width = 331
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 40
      TabOrder = 3
    end
    object edTelefono: TEdit
      Left = 117
      Top = 111
      Width = 85
      Height = 21
      MaxLength = 8
      TabOrder = 6
    end
    object btnAceptar: TButton
      Left = 440
      Top = 328
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
      TabOrder = 14
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 519
      Top = 328
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 15
    end
    inline fraTipoAcreedor: TfraCtbTablas
      Left = 80
      Top = 4
      Width = 253
      Height = 23
      TabOrder = 0
      DesignSize = (
        253
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 200
      end
    end
    object edCuit: TMaskEdit
      Left = 80
      Top = 29
      Width = 83
      Height = 21
      Color = clWhite
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object chkConcertado: TCheckBox
      Left = 348
      Top = 8
      Width = 77
      Height = 17
      Caption = 'Concertado'
      TabOrder = 1
    end
    object edCodArea: TEdit
      Left = 81
      Top = 111
      Width = 33
      Height = 21
      MaxLength = 5
      TabOrder = 5
    end
    inline fraRetIB: TfraCtbTablas
      Left = 84
      Top = 257
      Width = 279
      Height = 23
      TabOrder = 10
      DesignSize = (
        279
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 226
      end
    end
    object chkRetCajaMed: TCheckBox
      Left = 372
      Top = 261
      Width = 109
      Height = 17
      Caption = 'Ret. caja m'#233'dicos'
      TabOrder = 11
    end
    object dcFechaForm: TDateComboBox
      Left = 84
      Top = 293
      Width = 88
      Height = 21
      TabOrder = 12
    end
    inline fraFormaCobro: TfraCtbTablas
      Left = 80
      Top = 78
      Width = 295
      Height = 23
      TabOrder = 4
    end
    object edDomicilio: TEdit
      Left = 80
      Top = 136
      Width = 325
      Height = 21
      Color = clBtnFace
      MaxLength = 35
      ReadOnly = True
      TabOrder = 7
    end
    inline fraDomicilio: TfraDomicilio
      Left = 4
      Top = 164
      Width = 589
      Height = 51
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    inline fraRetGanancias: TfraCtbTablas
      Left = 84
      Top = 232
      Width = 279
      Height = 23
      TabOrder = 9
      DesignSize = (
        279
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 226
      end
    end
    object btnCuentasBancarias: TButton
      Left = 4
      Top = 328
      Width = 109
      Height = 25
      Caption = 'Cuentas &Bancarias'
      TabOrder = 13
      OnClick = btnCuentasBancariasClick
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT pa_cuitcuil, pa_acreedor, pa_denomina, pa_concertado, '
      
        '               pa_formacobro, pa_fechaalta, pa_domicilio, pa_tel' +
        'cod, pa_telnum, '
      
        '               pa_localidad, pa_codpostal, pa_provincia, pa_pais' +
        ', pa_origen, '
      
        '               pa_retganancias, pa_retingresosbrutos, pa_codpost' +
        'ala, pa_telprefijo, '
      
        '               pa_retencajamed, TRUNC(pa_fechabaja) pa_fechabaja' +
        ', pa_fechaimpresionforminscr,'
      
        '               tacre.tb_descripcion tipoacre, fcobro.tb_descripc' +
        'ion formacobro,'
      
        '               retga.tb_descripcion retganancias, retib.tb_descr' +
        'ipcion retib,'
      
        '               pv_descripcion provincia, pa_calle, pa_numero, pa' +
        '_piso,'
      '               pa_departamento, pa_cpostal,'
      
        '               utiles.armar_domicilio(pa_calle, pa_numero, pa_pi' +
        'so, '
      
        '                                      pa_departamento, pa_locali' +
        'dad) domicilio'
      '   FROM spa_pagoacre, ctb_tablas tacre, ctb_tablas fcobro,'
      
        '               ctb_tablas retga, ctb_tablas retib, cpv_provincia' +
        's'
      'WHERE pa_acreedor = tacre.tb_codigo'
      '      AND tacre.tb_clave = '#39'TACRE'#39
      '      AND pa_formacobro = fcobro.tb_codigo'
      '      AND fcobro.tb_clave = '#39'COBRO'#39
      '      AND pa_retganancias = retga.tb_codigo(+)'
      '      AND retga.tb_clave(+) = '#39'RETGA'#39
      '      AND pa_retingresosbrutos = retib.tb_codigo(+)'
      '      AND retib.tb_clave(+) = '#39'RETIB'#39
      '      AND pa_provincia = pv_codigo(+)'
      '      AND pa_acreedor IN ('#39'OA'#39', '#39'PA'#39')'
      '')
    Left = 4
    Top = 4
    object sdqDatosPA_CUITCUIL: TStringField
      FieldName = 'PA_CUITCUIL'
      Required = True
      Size = 11
    end
    object sdqDatosPA_ACREEDOR: TStringField
      FieldName = 'PA_ACREEDOR'
      Required = True
      Size = 10
    end
    object sdqDatosPA_DENOMINA: TStringField
      FieldName = 'PA_DENOMINA'
      Size = 40
    end
    object sdqDatosPA_CONCERTADO: TStringField
      FieldName = 'PA_CONCERTADO'
      Size = 1
    end
    object sdqDatosPA_FORMACOBRO: TStringField
      FieldName = 'PA_FORMACOBRO'
      Size = 2
    end
    object sdqDatosPA_FECHAALTA: TDateTimeField
      FieldName = 'PA_FECHAALTA'
    end
    object sdqDatosPA_DOMICILIO: TStringField
      FieldName = 'PA_DOMICILIO'
      Size = 35
    end
    object sdqDatosPA_TELCOD: TStringField
      FieldName = 'PA_TELCOD'
      Size = 5
    end
    object sdqDatosPA_TELNUM: TStringField
      FieldName = 'PA_TELNUM'
      Size = 8
    end
    object sdqDatosPA_LOCALIDAD: TStringField
      FieldName = 'PA_LOCALIDAD'
      Size = 85
    end
    object sdqDatosPA_CODPOSTAL: TFloatField
      FieldName = 'PA_CODPOSTAL'
    end
    object sdqDatosPA_PROVINCIA: TStringField
      FieldName = 'PA_PROVINCIA'
      Size = 2
    end
    object sdqDatosPA_PAIS: TStringField
      FieldName = 'PA_PAIS'
      Size = 4
    end
    object sdqDatosPA_ORIGEN: TStringField
      FieldName = 'PA_ORIGEN'
      Size = 1
    end
    object sdqDatosPA_RETGANANCIAS: TStringField
      FieldName = 'PA_RETGANANCIAS'
      Size = 6
    end
    object sdqDatosPA_RETINGRESOSBRUTOS: TStringField
      FieldName = 'PA_RETINGRESOSBRUTOS'
      Size = 6
    end
    object sdqDatosPA_CODPOSTALA: TStringField
      FieldName = 'PA_CODPOSTALA'
      Size = 8
    end
    object sdqDatosPA_TELPREFIJO: TStringField
      FieldName = 'PA_TELPREFIJO'
      Size = 3
    end
    object sdqDatosPA_RETENCAJAMED: TStringField
      FieldName = 'PA_RETENCAJAMED'
      Required = True
      Size = 1
    end
    object sdqDatosPA_FECHABAJA: TDateTimeField
      FieldName = 'PA_FECHABAJA'
    end
    object sdqDatosPA_FECHAIMPRESIONFORMINSCR: TDateTimeField
      FieldName = 'PA_FECHAIMPRESIONFORMINSCR'
    end
    object sdqDatosTIPOACRE: TStringField
      FieldName = 'TIPOACRE'
      Size = 150
    end
    object sdqDatosFORMACOBRO: TStringField
      FieldName = 'FORMACOBRO'
      Size = 150
    end
    object sdqDatosRETGANANCIAS: TStringField
      FieldName = 'RETGANANCIAS'
      Size = 150
    end
    object sdqDatosRETIB: TStringField
      FieldName = 'RETIB'
      Size = 150
    end
    object sdqDatosPROVINCIA: TStringField
      FieldName = 'PROVINCIA'
      Size = 50
    end
    object sdqDatosPA_CALLE: TStringField
      FieldName = 'PA_CALLE'
      Size = 60
    end
    object sdqDatosPA_NUMERO: TStringField
      FieldName = 'PA_NUMERO'
    end
    object sdqDatosPA_PISO: TStringField
      FieldName = 'PA_PISO'
    end
    object sdqDatosPA_DEPARTAMENTO: TStringField
      FieldName = 'PA_DEPARTAMENTO'
    end
    object sdqDatosDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqDatosPA_CPOSTAL: TStringField
      FieldName = 'PA_CPOSTAL'
      Size = 5
    end
  end
  object ABMDialog: TABMDialog
    Fields = <
      item
        Caption = 'CUIT/CUIL'
        FieldName = 'pa_cuitcuil'
        PrimaryKey = True
        MaxLength = 10
        ColWidth = 85
      end
      item
        Caption = 'Acreedor'
        FieldName = 'pa_denomina'
        MaxLength = 60
        ColWidth = 200
      end
      item
        Caption = 'Tipo acreedor'
        FieldName = 'tipoacre'
        MaxLength = 60
        ColWidth = 120
      end
      item
        Caption = 'Forma cobro'
        FieldName = 'formacobro'
        MaxLength = 60
        ColWidth = 120
      end
      item
        Caption = 'Ret. ganancias'
        FieldName = 'retganancias'
        ColWidth = 120
      end
      item
        Caption = 'Ret. I.B.'
        FieldName = 'retib'
        ColWidth = 120
      end
      item
        Caption = 'Domicilio'
        FieldName = 'domicilio'
        MaxLength = 20
        ColWidth = 250
      end
      item
        Caption = 'Provincia'
        FieldName = 'provincia'
        MaxLength = 50
        ColWidth = 100
      end
      item
        Caption = 'F. Baja'
        FieldName = 'pa_fechabaja'
        MaxLength = 20
        ColWidth = 70
      end>
    Caption = 'Mantenimiento de Afiliaci'#243'n del Acreedor'
    DataSource = dsDatos
    ABMButtons = [abNew, abModify, abDelete, abPrint, abSave, abOrder]
    SortOnExecute = True
    AllowEditPK = False
    Login = frmPrincipal.DBLogin
    SecurityKey = 'unManAcreed'
    BeforeExport = ABMDialogBeforeExport
    BeforePrint = ABMDialogBeforePrint
    BeforeABM = ABMDialogBeforeABM
    OnGetCellParams = ABMDialogGetCellParams
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
        Title = 'CUIT/CUIL'
        TitleAlignment = taCenter
        DataField = 'PA_CUITCUIL'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'Acreedor'
        DataField = 'PA_DENOMINA'
        MaxLength = 33
      end
      item
        Title = 'Tipo Acreedor'
        DataField = 'TIPOACRE'
        MaxLength = 20
      end
      item
        Title = 'Concertado'
        TitleAlignment = taCenter
        DataField = 'PA_CONCERTADO'
        Alignment = taCenter
        MaxLength = 12
      end
      item
        Title = 'F. Cobro'
        TitleAlignment = taCenter
        DataField = 'FORMACOBRO'
        MaxLength = 15
      end
      item
        Title = 'Ret. Ganancias'
        TitleAlignment = taCenter
        DataField = 'RETGANANCIAS'
        MaxLength = 25
      end
      item
        Title = 'Ret. I.B.'
        TitleAlignment = taCenter
        DataField = 'RETIB'
        MaxLength = 12
      end
      item
        Title = 'C'#243'd. tel.'
        TitleAlignment = taCenter
        DataField = 'PA_TELCOD'
        MaxLength = 12
      end
      item
        Title = 'Tel'#233'fono'
        TitleAlignment = taCenter
        DataField = 'PA_TELNUM'
        MaxLength = 12
      end
      item
        Title = 'Domicilio'
        DataField = 'DOMICILIO'
        MaxLength = 45
      end
      item
        Title = 'Provincia'
        DataField = 'PROVINCIA'
        MaxLength = 15
      end
      item
        Title = 'F.Impr.Form'
        TitleAlignment = taCenter
        DataField = 'PA_FECHAIMPRESIONFORMINSCR'
        Alignment = taCenter
        MaxLength = 13
      end
      item
        Title = 'F. Baja'
        TitleAlignment = taCenter
        DataField = 'PA_FECHABAJA'
        Alignment = taCenter
        MaxLength = 9
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Afiliaci'#243'n del Acreedor'
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
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 90
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Left = 88
    Top = 4
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 117
    Top = 4
  end
  object ExportDialog: TExportDialog
    Fields = <>
    Caption = 'Exportaci'#243'n de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Rows = 0
    Left = 147
    Top = 4
  end
end
