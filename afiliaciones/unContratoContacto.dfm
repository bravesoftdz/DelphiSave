object frmContratoContacto: TfrmContratoContacto
  Left = 263
  Top = 190
  Width = 735
  Height = 403
  Caption = 'Contrato Contactos'
  Color = clBtnFace
  Constraints.MinHeight = 367
  Constraints.MinWidth = 664
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 725
    Height = 30
    BorderWidth = 1
    Caption = 'tlbControl'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl-N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tblSeparador1: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbGuardar: TToolButton
      Left = 28
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tlbGuardar'
      ImageIndex = 3
      OnClick = tlbGuardarClick
    end
    object tlbBaja: TToolButton
      Left = 51
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tblSeparador2: TToolButton
      Left = 74
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbImprimir: TToolButton
      Left = 79
      Top = 0
      Hint = 'Imprimir (Ctrl-I)'
      Caption = 'tlbImprimir'
      Enabled = False
      ImageIndex = 4
      OnClick = tlbImprimirClick
    end
    object ToolButton2: TToolButton
      Left = 102
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 110
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      Wrap = True
      OnClick = tlbSalirClick
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 0
    Top = 95
    Width = 725
    Height = 114
    Align = alClient
    DataSource = sdDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = ArtDBGridCellClick
    IniStorage = FormStorage
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CT_CONTACTO'
        Title.Caption = 'Contacto'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGO'
        Title.Caption = 'Cargo'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Title.Caption = 'Area'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONOS'
        Title.Caption = 'Tel'#233'fonos'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_CODAREAFAX'
        Title.Caption = 'C'#243'd.'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_FAX'
        Title.Caption = 'Fax'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_DIRELECTRONICA'
        Title.Caption = 'eMail'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_FECHAALTA'
        Title.Caption = 'F. Alta'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_AREACARGA'
        Title.Caption = #193'rea Usuario Alta'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_FIRMANTE'
        Title.Caption = 'Firmante Sol.'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REMITENTECARTA'
        Title.Alignment = taCenter
        Title.Caption = 'Remitente Carta'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDOC'
        Title.Caption = 'Tipo Documento'
        Width = 96
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CT_NUMERODOCUMENTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'N'#186' Documento'
        Width = 98
        Visible = True
      end>
  end
  object grbContacto: TGroupBox
    Left = 0
    Top = 209
    Width = 725
    Height = 136
    Align = alBottom
    Caption = ' Datos del Contacto '
    TabOrder = 2
    DesignSize = (
      725
      136)
    object Label5: TLabel
      Left = 8
      Top = 112
      Width = 77
      Height = 13
      Caption = 'Tipo Documento'
    end
    object Label6: TLabel
      Left = 448
      Top = 112
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Documento'
    end
    inline fraContacto: TfraContacto
      Left = 6
      Top = 16
      Width = 713
      Height = 91
      Anchors = [akLeft, akRight, akBottom]
      Constraints.MinHeight = 90
      Constraints.MinWidth = 480
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited edContacto: TEdit
        Width = 662
      end
      inherited edFax: TPatternEdit
        Width = 383
      end
      inherited edEmail: TEdit
        Width = 554
      end
      inherited fraArea: TfraStaticCTB_TABLAS
        Width = 432
        inherited cmbDescripcion: TComboGrid
          Width = 368
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
      inherited fraCargo: TfraStaticCTB_TABLAS
        inherited cmbDescripcion: TComboGrid
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
      inherited fraTelefonos: TfraTelefono
        inherited btnABMTelefonos: TButton
          OnClick = fraTelefonosbtnABMTelefonosClick
        end
        inherited cmbTelefonos: TComboGrid
          Cells = ()
          ColWidths = (
            64
            64)
        end
      end
      inherited chkRemitenteCarta: TCheckBox
        Left = 609
      end
      inherited sdqDatos: TSDQuery
        SQL.Strings = (
          
            'SELECT ct_id, ct_idempresa, ct_contacto, ct_cargo, cargo.tb_desc' +
            'ripcion cargo, ct_area,'
          
            '       DECODE(ct_codareatelefonos, NULL, NULL, '#39'('#39') || ct_codare' +
            'atelefonos'
          
            '       || DECODE(ct_codareatelefonos, NULL, NULL, '#39') '#39') || ct_te' +
            'lefonos telefonos2,'
          
            '       afi.get_telefonos('#39'ATN_TELEFONOCONTACTO'#39', ct_id) telefono' +
            's, carea.tb_descripcion area, ct_codareafax, ct_fax,'
          
            '       ct_direlectronica, ct_fechabaja, ct_areacarga, ct_fechaal' +
            'ta, ct_usualta, ct_areacarga, ct_firmante, ct_remitentecarta,'
          '       DECODE(ct_remitentecarta, '#39'S'#39', '#39'Si'#39', '#39' '#39') remitentecarta'
          
            '  FROM act_contacto, aco_contrato, ctb_tablas cargo, ctb_tablas ' +
            'carea'
          ' WHERE ct_idempresa = co_idempresa'
          '   AND ct_cargo = cargo.tb_codigo(+)'
          '   AND cargo.tb_clave(+) = '#39'CARGO'#39
          '   AND ct_area = carea.tb_codigo(+)'
          '   AND carea.tb_clave(+) = '#39'CAREA'#39
          '   AND co_contrato = :co_contrato'
          '')
      end
    end
    inline fraTipoDocumento: TfraStaticCTB_TABLAS
      Left = 88
      Top = 108
      Width = 344
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited edCodigo: TPatternEdit
        Top = 0
      end
      inherited cmbDescripcion: TComboGrid
        Top = 0
        Width = 280
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edNumeroDocumento: TEdit
      Left = 528
      Top = 108
      Width = 80
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 8
      TabOrder = 2
      Text = 'edNumeroDocumento'
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 725
    Height = 65
    Align = alTop
    Caption = ' Datos del Contrato '
    TabOrder = 3
    DesignSize = (
      725
      65)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 62
      Height = 13
      Caption = 'N'#186' Contrato:'
    end
    object Label2: TLabel
      Left = 172
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Raz'#243'n Social:'
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 51
      Height = 13
      Caption = 'Tel'#233'fonos:'
    end
    object Label4: TLabel
      Left = 380
      Top = 40
      Width = 28
      Height = 13
      Caption = 'eMail:'
    end
    object stNumeroContrato: TStaticText
      Left = 74
      Top = 16
      Width = 80
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'stNumeroContrato'
      TabOrder = 0
    end
    object stRazonSocial: TStaticText
      Left = 240
      Top = 16
      Width = 476
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'StaticText1'
      TabOrder = 1
    end
    object stTelefonos: TStaticText
      Left = 64
      Top = 40
      Width = 305
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'StaticText1'
      TabOrder = 2
    end
    object stEmail: TStaticText
      Left = 416
      Top = 40
      Width = 300
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'StaticText1'
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 345
    Width = 725
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      725
      29)
    object btnAceptar: TButton
      Left = 574
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
      OnClick = btnAceptarClick
    end
    object Button1: TButton
      Left = 650
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
      Left = 1
      Top = 4
      Width = 570
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT ct_id, ct_idempresa, ct_contacto, ct_cargo, cargo.tb_desc' +
        'ripcion cargo, ct_area,'
      
        '       DECODE(ct_codareatelefonos, NULL, NULL, '#39'('#39') || ct_codare' +
        'atelefonos'
      
        '       || DECODE(ct_codareatelefonos, NULL, NULL, '#39') '#39') || ct_te' +
        'lefonos telefonos2,'
      
        '       afi.get_telefonos('#39'ATN_TELEFONOCONTACTO'#39', ct_id) telefono' +
        's, carea.tb_descripcion area, ct_codareafax, ct_fax,'
      
        '       ct_direlectronica, ct_fechabaja, ct_areacarga, ct_fechaal' +
        'ta, ct_usualta, ct_areacarga, ct_firmante, ct_remitentecarta,'
      
        '       DECODE(ct_remitentecarta, '#39'S'#39', '#39'Si'#39', '#39' '#39') remitentecarta,' +
        ' tdoc.tb_descripcion tdoc, ct_tipodocumento, ct_numerodocumento'
      
        '  FROM act_contacto, aco_contrato, ctb_tablas cargo, ctb_tablas ' +
        'carea, ctb_tablas tdoc'
      ' WHERE ct_idempresa = co_idempresa'
      '   AND ct_cargo = cargo.tb_codigo(+)'
      '   AND cargo.tb_clave(+) = '#39'CARGO'#39
      '   AND ct_area = carea.tb_codigo(+)'
      '   AND carea.tb_clave(+) = '#39'CAREA'#39
      '   AND ct_tipodocumento = tdoc.tb_codigo(+)'
      '   AND tdoc.tb_clave(+) = '#39'TDOC'#39
      '   AND co_contrato = :co_contrato'
      '')
    Left = 44
    Top = 100
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CO_CONTRATO'
        ParamType = ptInput
      end>
  end
  object sdDatos: TDataSource
    DataSet = sdqDatos
    Left = 156
    Top = 100
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tlbNuevo
      end
      item
        Key = 16455
        LinkControl = tlbGuardar
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16457
        LinkControl = tlbImprimir
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end>
    Left = 128
    Top = 100
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Left = 100
    Top = 100
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
    Left = 72
    Top = 100
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <
      item
        Name = 'Modificar contactos de cualquier sector'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 184
    Top = 100
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 212
    Top = 100
  end
end
