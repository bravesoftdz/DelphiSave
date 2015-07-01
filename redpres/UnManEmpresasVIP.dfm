object frmManEmpresasVIP: TfrmManEmpresasVIP
  Left = 360
  Top = 185
  Width = 637
  Height = 272
  Caption = 'Mantenimiento de Empresas VIP'
  Color = clBtnFace
  Constraints.MinHeight = 258
  Constraints.MinWidth = 637
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 629
    Height = 26
    ButtonWidth = 24
    Caption = 'ToolBar1'
    Flat = True
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    TabOrder = 0
    object btnNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl+N)'
      Caption = 'Nuevo'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = btnNuevoClick
    end
    object btnModificar: TToolButton
      Left = 24
      Top = 0
      Hint = 'Modificar (Ctrl + M)'
      Caption = 'btnModificar'
      ImageIndex = 24
      ParentShowHint = False
      ShowHint = True
      OnClick = btnModificarClick
    end
    object btnEliminar: TToolButton
      Left = 48
      Top = 0
      Hint = 'Eliminar (Ctrl+Del)'
      Caption = 'btnEliminar'
      ImageIndex = 25
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEliminarClick
    end
    object ToolButton11: TToolButton
      Left = 72
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnRefrescar: TToolButton
      Left = 80
      Top = 0
      Hint = 'Refrescar (F5)'
      Caption = 'btnRefrescar'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRefrescarClick
    end
    object ToolButton12: TToolButton
      Left = 104
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnOrdenar: TToolButton
      Left = 112
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      Caption = 'btnOrdenar'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOrdenarClick
    end
    object ToolButton10: TToolButton
      Left = 136
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnExportar: TToolButton
      Left = 144
      Top = 0
      Hint = 'Exportar (Ctrl+E)'
      Caption = 'btnExportar'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExportarClick
    end
    object btnImprimir: TToolButton
      Left = 168
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'btnImprimir'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = btnImprimirClick
    end
    object ToolButton9: TToolButton
      Left = 192
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnSalir: TToolButton
      Left = 200
      Top = 0
      Hint = 'Salir (Ctrl+S)'
      Caption = 'btnSalir'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalirClick
    end
  end
  object dbgDatos: TArtDBGrid
    Left = 0
    Top = 26
    Width = 629
    Height = 219
    Align = alClient
    DataSource = dsDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnGetCellParams = dbgDatosGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EP_TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_CUIT'
        Title.Caption = 'Nro.CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Title.Caption = 'Usuario'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHALTA'
        Title.Caption = 'Fecha Alta'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 80
        Visible = True
      end>
  end
  object fpABM: TFormPanel
    Left = 24
    Top = 56
    Width = 555
    Height = 150
    Caption = '   '
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = [biSystemMenu]
    Position = poDesktopCenter
    object Label1: TLabel
      Left = 6
      Top = 51
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel
      Left = 4
      Top = 2
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label3: TLabel
      Left = 8
      Top = 22
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Bevel2: TBevel
      Left = 3
      Top = 116
      Width = 548
      Height = 2
    end
    inline fraEmpresa: TfraEmpresa
      Left = 44
      Top = 19
      Width = 507
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 400
      end
      inherited mskCUIT: TMaskEdit
        Left = 3
      end
      inherited edContrato: TIntEdit
        Left = 447
      end
      inherited cmbRSocial: TArtComboBox
        Left = 132
        Width = 259
      end
    end
    object btnGuardar: TBitBtn
      Left = 394
      Top = 121
      Width = 75
      Height = 25
      Caption = '&Guardar'
      ModalResult = 1
      TabOrder = 2
      Glyph.Data = {
        B6010000424DB601000000000000760000002800000022000000100000000100
        0400000000004001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00AA0000000000
        0000AAA88888888888888A000000A8888800000088880A777778888887777800
        0000A8F7778888807F780A7FFFF7777787FF78000400A8F7778078807F780A7F
        FFF7877787FF78006F01A8F7778078807F780A7FFFF7877787FF78028181A8F7
        7778888887780A7FFFFF777777FF78011D01A8F77777777777780A7FFFFFFFFF
        FFFF78001D01A8F77888888887780A7FFF77777777FF78001C02A8F78FFFFFFF
        FF780A7FF7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801
        9E01A8F78FFFFFFFFF780A7FF7FFFFFFFFFF78000600A8F78FFFFFFFFF780A7F
        F7FFFFFFFFFF78000400A8F78FFFFFFFFF780A7FF7FFFFFFFFFF7801A601A8F7
        8FFFFFFFFF080A7FF7FFFFFFFFF078005E02A8F78FFFFFFFFF780A7FF7FFFFFF
        FFF778016E02AA88888888888888AAA77777777777777A006701}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 474
      Top = 121
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
      Glyph.Data = {
        5E080000424D5E08000000000000360000002800000026000000120000000100
        18000000000028080000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000C0C0C00
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF00000000FF0000FF003333CC0000FF00009900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF000000FF00FF0000FF008686868686860C0C0C00FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF004D4D4D
        000000FF0000FF003333CC0066FF0000FF00009900FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        00868686CCCCCC8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF003333CC33
        99FF0066FF0000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF000000FF00FF0000FF0000FF00868686FFFFFFCCCCCC8686
        8633333300FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF004D4D4D00FF00000000FF0000FF0000FF003333CC3399FF0000FF00009900
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000FF00FF00
        00FF0000FF0000FF0000FF00868686FFFFFFCCCCCC33333300FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0086868600FF0000FF00000000FF
        0000FF0000FF0000FF000000CC3399FF0000CC00009900FF0000FF0000FF0000
        FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000FF00
        00FF00868686FFFFFF86868633333300FF0000FF0000FF0000FF0000FF0000FF
        0000FF008686860C0C0C00FF0000FF00000000FF0000FF0000FF0000FF0000FF
        000000CC0066FF00009900FF0000FF0000FF0000FF0000FF0000FF000000FF00
        009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00868686CCCCCC
        33333300FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
        0000FF00000000FF0000FF0000FF0000FF0000FF0000FF000000CC0000FF0000
        9900FF0000FF0000FF0000FF000000FF00009900FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C0C00FF0000FF00
        00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF000000CC0000FF00009900FF0000FF000000
        FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF008686868686860C0C0C00FF0000FF008686860C0C0C00FF00
        00FF0000FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF000000CC0000FF0000990000FF00009900FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086
        86868686860C0C0C8686860C0C0C00FF0000FF0000FF0000FF0000FF0000FF00
        000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF000000CC
        0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0086868686868633333300
        FF0000FF0000FF0000FF0000FF0000FF0000FF00000000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF000000CC0000FF0000990000CC00009900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF008686868686860C0C0C8686860C0C0C00FF0000FF0000FF0000
        FF0000FF0000FF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        00CC0000FF00009900FF0000FF000000CC00009900FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF008686868686860C0C
        0C00FF0000FF008686860C0C0C00FF0000FF0000FF0000FF0000FF00000000FF
        0000FF0000FF0000FF0000FF000000CC0000CC0000FF00009900FF0000FF0000
        FF0000FF000000CC00009900FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF008686868686868686860C0C0C00FF0000FF0000FF0000FF008686
        860C0C0C00FF0000FF0000FF0000FF00000000FF0000FF0000FF000000CC0000
        CC3399FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF000000CC00
        009900FF0000FF0000FF0000FF0000FF0000FF00868686868686CCCCCC868686
        0C0C0C00FF0000FF0000FF0000FF0000FF0000FF008686860C0C0C00FF0000FF
        0000FF00000000FF0000FF000000CC3399FF0066FF0000FF00009900FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF000000CC00009900FF0000FF0000
        FF0000FF00868686FFFFFFCCCCCC8686860C0C0C00FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF008686860C0C0C00FF0000FF00000000FF000000CC
        3399FF0066FF0000FF00009900FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF000000CC00FF0000FF00868686FFFFFFCCCCCC86
        86860C0C0C00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF004D4D4D00FF00000000FF006666990000CC0000CC66669900FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0086868686868686868686868600FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        0000}
      NumGlyphs = 2
    end
    object gbTipoEmpresa: TGroupBox
      Left = 7
      Top = 73
      Width = 162
      Height = 41
      Caption = ' Tipo de empresa '
      TabOrder = 1
      object rbGrandes: TRadioButton
        Left = 55
        Top = 17
        Width = 101
        Height = 17
        Caption = 'Grandes cuentas'
        TabOrder = 0
      end
      object rbVIP: TRadioButton
        Left = 8
        Top = 17
        Width = 41
        Height = 17
        Caption = 'VIP'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
    end
    inline fraUsuario: TfraUsuario
      Left = 47
      Top = 46
      Width = 503
      Height = 21
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 419
      end
    end
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT ep_cuit, ep_usuario, ep_fechalta, ep_fechabaja, mp_nombre' +
        ', '
      '       mp_contrato, se_nombre, ep_tipo'
      '  FROM cmp_empresas, use_usuarios, mep_empresavip'
      ' WHERE mp_cuit = ep_cuit'
      '   AND se_usuario = ep_usuario'
      '')
    Left = 236
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 264
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Contrato'
        DataField = 'MP_CONTRATO'
        MaxLength = 10
      end
      item
        Title = 'Tipo'
        TitleAlignment = taCenter
        DataField = 'EP_TIPO'
        Alignment = taCenter
        MaxLength = 6
      end
      item
        Title = 'Nro.CUIT'
        DataField = 'EP_CUIT'
        MaxLength = 15
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        MaxLength = 35
      end
      item
        Title = 'Usuario'
        DataField = 'SE_NOMBRE'
        MaxLength = 15
      end
      item
        Title = 'Fecha Alta'
        DataField = 'EP_FECHALTA'
        MaxLength = 12
      end
      item
        Title = 'Fecha Baja'
        DataField = 'EP_FECHABAJA'
        MaxLength = 12
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -13
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Mantenimiento de Empresas VIP'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 11184815
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -9
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
    Left = 292
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Contrato'
        DataField = 'MP_CONTRATO'
        FieldIndex = 0
      end
      item
        Title = 'Nro.CUIT'
        DataField = 'EP_CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Usuario'
        DataField = 'SE_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Alta'
        DataField = 'EP_FECHALTA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Baja'
        DataField = 'EP_FECHABAJA'
        FieldIndex = 0
      end>
    FixedRows = 0
    Left = 320
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <
      item
        DataField = 'MP_CONTRATO'
        Title = 'Contrato'
      end
      item
        DataField = 'EP_TIPO'
        Title = 'Tipo'
      end
      item
        DataField = 'EP_CUIT'
        Title = 'Nro.CUIT'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Raz'#243'n Social'
      end
      item
        DataField = 'SE_NOMBRE'
        Title = 'Usuario'
      end
      item
        DataField = 'EP_FECHALTA'
        Title = 'Fecha Alta'
      end
      item
        DataField = 'EP_FECHABAJA'
        Title = 'Fecha Baja'
      end>
    OutputFile = 'EmpresasVIP.txt'
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
    Left = 348
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        OnShortCutPress = btnNuevoClick
        LinkControl = btnNuevo
      end
      item
        Key = 16430
        OnShortCutPress = btnEliminarClick
        LinkControl = btnEliminar
      end
      item
        Key = 116
        OnShortCutPress = btnRefrescarClick
        LinkControl = btnRefrescar
      end
      item
        Key = 16463
        OnShortCutPress = btnOrdenarClick
        LinkControl = btnOrdenar
      end
      item
        Key = 16453
        OnShortCutPress = btnExportarClick
        LinkControl = btnExportar
      end
      item
        Key = 16457
        OnShortCutPress = btnImprimirClick
        LinkControl = btnImprimir
      end
      item
        Key = 16467
        OnShortCutPress = btnSalirClick
        LinkControl = btnSalir
      end
      item
        Enabled = False
        Key = 16461
        OnShortCutPress = btnModificarClick
        LinkControl = btnModificar
      end>
    Left = 376
  end
  object sdqUsuario: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'Select SE_USUARIO, Upper(SE_NOMBRE) Nombre'
      'From USE_USUARIOS')
    Left = 460
    Top = 16
  end
  object dsUsuario: TDataSource
    DataSet = sdqUsuario
    Left = 488
    Top = 16
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 404
  end
end
