object frmHistoricoEstablecimiento: TfrmHistoricoEstablecimiento
  Left = 213
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Hist'#243'rico Establecimiento'
  ClientHeight = 477
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    776
    477)
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 776
    Height = 30
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tlbImprimir: TToolButton
      Left = 0
      Top = 0
      Hint = 'Imprimir (Ctrl-I)'
      Caption = 'tlbImprimir'
      ImageIndex = 4
      OnClick = tlbImprimirClick
    end
    object tbExportar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Exportar...'
      Caption = 'tbExportar'
      ImageIndex = 21
      OnClick = tbExportarClick
    end
    object ToolButton5: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 54
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 1
    Top = 33
    Width = 772
    Height = 188
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = sdDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = ArtDBGridDrawColumnCell
    FooterBand = False
    TitleHeight = 17
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'HE_NOMBRE'
        Title.Caption = 'Denominaci'#243'n'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_EMPLEADOS'
        Title.Caption = 'Empleados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_MASA'
        Title.Caption = 'Masa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_CPOSTAL'
        Title.Caption = 'C'#243'digo Postal'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_SUPERFICIE'
        Title.Caption = 'Superficie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_DESCRIPCIONACTIVIDAD'
        Title.Caption = 'Descripci'#243'n de la Actividad'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_FECHARECEPCIONBAJA'
        Title.Caption = 'F. Recep. Baja'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HE_FECHABAJAREAL'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja Estab.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_FECHABAJA'
        Title.Caption = 'F.Baja'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HE_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_fechamodif'
        Title.Caption = 'F.Modificaci'#243'n'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'he_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 108
        Visible = True
      end>
  end
  object grbIdentifica: TGroupBox
    Left = 0
    Top = 222
    Width = 776
    Height = 142
    Align = alBottom
    Caption = 'Identificaci'#243'n del Establecimiento'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      776
      142)
    object lbNombre: TLabel
      Left = 4
      Top = 20
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nombre'
    end
    object lbAlta: TLabel
      Left = 4
      Top = 68
      Width = 64
      Height = 13
      Caption = 'F.Inicio Activ.'
    end
    object Label1: TLabel
      Left = 174
      Top = 68
      Width = 67
      Height = 13
      Caption = 'F.Inicio Estab.'
    end
    object lbActividad: TLabel
      Left = 4
      Top = 44
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Actividad'
    end
    object lbCantEmpleados: TLabel
      Left = 344
      Top = 68
      Width = 80
      Height = 13
      Caption = 'Cant. Empleados'
    end
    object lbMasaSalarial: TLabel
      Left = 4
      Top = 92
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Masa Salarial'
    end
    object lbNivel: TLabel
      Left = 598
      Top = 44
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Nivel'
    end
    object Label2: TLabel
      Left = 516
      Top = 68
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label5: TLabel
      Left = 174
      Top = 92
      Width = 71
      Height = 13
      Caption = 'F. Recep. Baja'
    end
    object Label6: TLabel
      Left = 342
      Top = 92
      Width = 66
      Height = 13
      Caption = 'F. Baja Estab.'
    end
    object Label7: TLabel
      Left = 4
      Top = 116
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Superficie'
    end
    object Label8: TLabel
      Left = 140
      Top = 116
      Width = 17
      Height = 13
      Caption = 'mt2'
    end
    object Label9: TLabel
      Left = 176
      Top = 116
      Width = 103
      Height = 13
      Caption = 'Descripci'#243'n Actividad'
    end
    object edES_NOMBRE: TEdit
      Left = 72
      Top = 16
      Width = 584
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 0
    end
    object edES_FEINICACTIV: TDateComboBox
      Left = 72
      Top = 64
      Width = 88
      Height = 20
      TabOrder = 3
    end
    object edES_FECHAINICEST: TDateComboBox
      Left = 244
      Top = 64
      Width = 88
      Height = 20
      TabOrder = 4
    end
    inline fraES_ACTIVIDAD: TfraActividad
      Left = 71
      Top = 40
      Width = 507
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 458
      end
    end
    object edES_EMPLEADOS: TIntEdit
      Left = 432
      Top = 64
      Width = 72
      Height = 20
      AutoSize = False
      TabOrder = 5
    end
    object edES_MASA: TCurrencyEdit
      Left = 72
      Top = 88
      Width = 76
      Height = 20
      AutoSize = False
      MaxLength = 12
      TabOrder = 6
    end
    object edES_NIVEL: TPatternEdit
      Left = 626
      Top = 40
      Width = 30
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 1
      TabOrder = 2
      Pattern = '1234'
    end
    object edES_OBSERVACIONES: TMemo
      Left = 592
      Top = 64
      Width = 176
      Height = 72
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 150
      ScrollBars = ssVertical
      TabOrder = 13
    end
    object grbSolicitud: TGroupBox
      Left = 663
      Top = 7
      Width = 107
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Contrato'
      TabOrder = 12
      DesignSize = (
        107
        42)
      object edES_FORMULARIO: TIntEdit
        Left = 7
        Top = 13
        Width = 94
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Alignment = taRightJustify
        MaxLength = 0
      end
    end
    object cbES_EVENTUAL: TCheckBox
      Left = 515
      Top = 90
      Width = 64
      Height = 17
      Caption = 'Eventual'
      TabOrder = 9
    end
    object edES_FECHARECEPCIONBAJA: TDateComboBox
      Left = 248
      Top = 88
      Width = 88
      Height = 20
      TabOrder = 7
    end
    object dcbFechaBajaReal: TDateComboBox
      Left = 412
      Top = 88
      Width = 88
      Height = 20
      TabOrder = 8
    end
    object edDescripcionActividad: TEdit
      Left = 284
      Top = 112
      Width = 293
      Height = 21
      MaxLength = 256
      TabOrder = 11
    end
    object edSuperficie: TCurrencyEdit
      Left = 72
      Top = 112
      Width = 64
      Height = 21
      Alignment = taLeftJustify
      AutoSize = False
      DisplayFormat = ',0.00'
      MaxLength = 11
      TabOrder = 10
    end
  end
  object grbDomicilio: TGroupBox
    Left = 0
    Top = 364
    Width = 776
    Height = 113
    Align = alBottom
    Caption = 'Domicilio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      776
      113)
    object lbCAFaxPostal: TLabel
      Left = 368
      Top = 66
      Width = 17
      Height = 13
      Caption = 'C.A'
    end
    object lbFaxPostal: TLabel
      Left = 438
      Top = 66
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label3: TLabel
      Left = 7
      Top = 92
      Width = 42
      Height = 13
      Caption = 'Domicilio'
    end
    object Label4: TLabel
      Left = 4
      Top = 66
      Width = 47
      Height = 13
      Caption = 'Tel'#233'fonos'
    end
    object edES_CODAREAFAX: TPatternEdit
      Left = 389
      Top = 63
      Width = 42
      Height = 21
      MaxLength = 4
      ReadOnly = True
      TabOrder = 2
      Pattern = '0123456789'
    end
    object edES_FAX: TPatternEdit
      Left = 459
      Top = 63
      Width = 311
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      ReadOnly = True
      TabOrder = 3
      Pattern = '0123456789()-/'
    end
    object edES_DOMICILIO: TEdit
      Left = 52
      Top = 88
      Width = 718
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      Enabled = False
      TabOrder = 4
    end
    inline fraDomicilio: TfraDomicilio
      Left = 4
      Top = 11
      Width = 765
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited lbCalle: TLabel
        Left = 20
        Caption = 'C&alle'
        FocusControl = fraDomicilio.cmbCalle
      end
      inherited lbNro: TLabel
        Left = 550
      end
      inherited lbPiso: TLabel
        Left = 622
      end
      inherited lbDto: TLabel
        Left = 698
      end
      inherited lbCPostal: TLabel
        Left = 2
        Caption = '&C.Postal'
        FocusControl = fraDomicilio.edCPostal
      end
      inherited lbLocalidad: TLabel
        Caption = '&Localidad'
        FocusControl = fraDomicilio.cmbLocalidad
      end
      inherited lbProvincia: TLabel
        Left = 603
      end
      inherited cmbCalle: TArtComboBox
        Width = 465
      end
      inherited edNumero: TEdit
        Left = 572
      end
      inherited edPiso: TEdit
        Left = 648
      end
      inherited edDto: TEdit
        Left = 720
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 333
      end
      inherited edProvincia: TEdit
        Left = 652
      end
      inherited btnBuscar: TButton
        Left = 515
        Visible = False
      end
    end
    object edTelefonos: TEdit
      Left = 52
      Top = 63
      Width = 312
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT DISTINCT he_nombre, he_calle, he_cpostal, he_localidad, h' +
        'e_provincia,'
      
        '                art.utiles.armar_domicilio(he_calle, he_numero, ' +
        'he_piso, he_departamento, NULL)'
      
        '                || art.utiles.armar_localidad(he_cpostal, NULL, ' +
        'he_localidad, he_provincia) domicilio,'
      
        '                he_calle, he_numero, he_piso, he_departamento, h' +
        'e_cpostala, he_codareafax, he_fax, he_empleados, he_masa,'
      
        '                he_idactividad, he_nivel, he_feinicactiv, he_fec' +
        'hainicest, he_empleados, he_masa, he_observaciones, he_eventual,'
      
        '                he_fechabaja, he_usubaja, pv_descripcion, he_fec' +
        'harecepcionbaja, he_domicilio, he_telefonos, he_fechabajareal,'
      
        '                he_superficie, he_descripcionactividad, he_fecha' +
        'modif, he_usumodif'
      '           FROM ahe_historicoestablecimiento, cpv_provincias'
      '          WHERE he_provincia = pv_codigo(+)'
      '            AND he_contrato = :contrato'
      '            AND he_nroestableci = :nroestablecimiento')
    Left = 687
    Top = 1
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contrato'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NroEstablecimiento'
        ParamType = ptInput
      end>
  end
  object sdDatos: TDataSource
    DataSet = sdqDatos
    Left = 715
    Top = 1
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
      end
      item
        Key = 16455
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end
      item
        Key = 16457
        LinkControl = tlbImprimir
      end
      item
        Key = 16450
      end
      item
        Key = 114
      end
      item
        Key = 16466
      end>
    Left = 743
    Top = 1
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = sdDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 101
    Top = 91
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Left = 129
    Top = 91
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 659
    Top = 1
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    ExportFileType = etExcelFile
    Fields = <>
    IniStorage = frmPrincipal.FormPlacement
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Title = 'Establecimientos por Contrato'
    Left = 631
    Top = 1
  end
end
