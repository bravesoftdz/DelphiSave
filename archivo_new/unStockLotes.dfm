inherited frmStockLotes: TfrmStockLotes
  Left = 57
  Top = 98
  Caption = 'Control de Stock de Lotes'
  ClientHeight = 551
  ClientWidth = 792
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ExplicitLeft = 57
  ExplicitTop = 98
  ExplicitWidth = 800
  ExplicitHeight = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 175
    ExplicitWidth = 792
    ExplicitHeight = 175
    DesignSize = (
      792
      175)
    object gbSectores: TGroupBox
      Left = 7
      Top = 1
      Width = 356
      Height = 43
      Caption = 'Sectores de Alta del Lote'
      TabOrder = 0
      DesignSize = (
        356
        43)
      object cmbSectores: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 339
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsSectores
        KeyField = 'SC_CODIGO'
        ListField = 'SC_DESCRIPCION'
      end
    end
    object gbUsuarios: TGroupBox
      Left = 366
      Top = 1
      Width = 424
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuarios de Alta del Lote'
      TabOrder = 1
      DesignSize = (
        424
        43)
      object cmbUsuarios: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 407
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsUsuario
        KeyField = 'SE_USUARIO'
        ListField = 'SE_NOMBRE'
      end
    end
    object gbFecha: TGroupBox
      Left = 571
      Top = 44
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Alta Lote'
      TabOrder = 3
      object Label9: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaLoteDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaLoteHasta
        TabOrder = 0
      end
      object edFechaLoteHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaLoteDesde
        TabOrder = 1
      end
    end
    object gbArchivo: TGroupBox
      Left = 7
      Top = 44
      Width = 561
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Archivo del Lote'
      TabOrder = 2
      DesignSize = (
        561
        43)
      inline fraTipoArchivo: TfraCodigoDescripcion
        Left = 9
        Top = 15
        Width = 545
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 15
        ExplicitWidth = 545
        DesignSize = (
          545
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 96
          Width = 448
          ExplicitLeft = 96
          ExplicitWidth = 448
        end
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 90
          ExplicitLeft = 2
          ExplicitWidth = 90
        end
      end
    end
    object gbLote: TGroupBox
      Left = 8
      Top = 130
      Width = 133
      Height = 43
      Caption = 'Nro. de Lote'
      TabOrder = 6
      object edLote: TIntEdit
        Left = 9
        Top = 15
        Width = 114
        Height = 21
        TabOrder = 0
        Options = [ioAllowEmpty, ioAllowNegative]
      end
    end
    object gbEstado: TGroupBox
      Left = 7
      Top = 87
      Width = 561
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado del Lote'
      TabOrder = 4
      DesignSize = (
        561
        43)
      object cmbEstados: TDBCheckCombo
        Left = 9
        Top = 15
        Width = 544
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DataSource = dsEstados
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object gbFechaEstado: TGroupBox
      Left = 571
      Top = 87
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha de Ult. Estado Lote'
      TabOrder = 5
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaEstadoDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaEstadoHasta
        TabOrder = 0
      end
      object edFechaEstadoHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaEstadoDesde
        TabOrder = 1
      end
    end
    object gbRemitoEnvio: TGroupBox
      Left = 144
      Top = 130
      Width = 181
      Height = 43
      Caption = 'Nro. de Remito de Env'#237'o de Lotes'
      TabOrder = 7
      object edRemitoEnvio: TIntEdit
        Left = 9
        Top = 15
        Width = 161
        Height = 21
        TabOrder = 0
        Options = [ioAllowEmpty, ioAllowNegative]
      end
    end
    object gbExtraviados: TGroupBox
      Left = 328
      Top = 130
      Width = 100
      Height = 43
      Caption = 'Lotes Extraviados'
      TabOrder = 8
      object chkMostrarExtraviados: TCheckBox
        Left = 11
        Top = 17
        Width = 71
        Height = 17
        Caption = 'Mostrar'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object rgLoteDigitaliz: TRadioGroup
      Left = 430
      Top = 130
      Width = 172
      Height = 43
      Caption = 'Lotes Digitalizados'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 9
    end
    object chgDestino: TCheckGroup
      Left = 605
      Top = 130
      Width = 186
      Height = 43
      Caption = 'Destino'
      TabOrder = 10
      Columns = 2
      Items.Strings = (
        'Digitalizaci'#243'n'
        'Guarda')
      Value = '00'
    end
  end
  inherited CoolBar: TCoolBar
    Top = 175
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 175
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      DesignSize = (
        773
        23)
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited tbEliminar: TToolButton
        Hint = 'Anular Remito de Env'#237'o de Lotes (Ctrl+Del)'
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Hist'#243'rico de Estados'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImpresion
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        Hint = 'Enviar Mail a Usuarios (Ctrl+U)'
        Enabled = True
        Visible = True
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        Visible = False
        ExplicitLeft = 362
      end
      object tbModifEstado: TToolButton
        Left = 385
        Top = 0
        Hint = 'Modificar Estado (Ctrl+D)'
        ImageIndex = 32
        OnClick = tbModifEstadoClick
      end
      object tbExtraviado: TToolButton
        Left = 408
        Top = 0
        Hint = 'Extraviado (Ctrl+X)'
        DropdownMenu = pmnuExtraviado
        ImageIndex = 56
        Style = tbsDropDown
        OnClick = tbExtraviadoClick
      end
      object tbObservacion: TToolButton
        Left = 446
        Top = 0
        Hint = 'Observaci'#243'n GyD'
        ImageIndex = 55
        OnClick = tbObservacionClick
      end
      object tbAgregarLotesARemito: TToolButton
        Left = 469
        Top = 0
        Hint = 'Agregar Lote al Remito y Caja'
        ImageIndex = 22
        OnClick = tbAgregarLotesARemitoClick
      end
      object tbDevolucLoteUsuario: TToolButton
        Left = 492
        Top = 0
        Hint = 'Devoluci'#243'n de Lote al Usuario'
        ImageIndex = 26
        OnClick = tbDevolucLoteUsuarioClick
      end
      object tbBuscarCodigoBarras: TToolButton
        Left = 515
        Top = 0
        Hint = 'Buscar C'#243'digo de Barras (F4)'
        ImageIndex = 14
        OnClick = tbBuscarCodigoBarrasClick
      end
      object ToolButton7: TToolButton
        Left = 538
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 546
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 569
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 577
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object ToolButton1: TToolButton
        Left = 600
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object pnlSeleccionados: TPanel
        Left = 608
        Top = 0
        Width = 160
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Selecc.: '
        TabOrder = 0
        object edCantSelecc: TCardinalEdit
          Left = 74
          Top = 0
          Width = 82
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 204
    Width = 792
    Height = 347
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmnuSeleccionar
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnKeyUp = GridKeyUp
    OnGetCellProps = GridGetCellProps
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE'
        Title.Alignment = taCenter
        Title.Caption = 'Lote'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOARCHIVO'
        Title.Caption = 'Tipo Archivo'
        Width = 125
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA_LOTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta Lote'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA_LOTE'
        Title.Caption = 'Usuario Alta Lote'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTORUSU'
        Title.Caption = 'Sector'
        Width = 216
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTADO1'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTADO2'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTADO3'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTADO4'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTADO5'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Width = 142
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ESTADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Ult. Estado'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMITOENVIO'
        Title.Alignment = taCenter
        Title.Caption = 'Remito Env'#237'o Lotes'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMITO'
        Title.Alignment = taCenter
        Title.Caption = 'Remito'
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA_REMITO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta Remito'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAJA'
        Title.Caption = 'Nro. Caja Remito'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTAEXTRAVIADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Extraviado'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTHOJAS'
        Title.Alignment = taCenter
        Title.Caption = 'Cant. Hojas'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones GyD'
        Width = 289
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LOTEDIGITALIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'Lote Digitalizado'
        Width = 88
        Visible = True
      end>
  end
  object fpModifEstadoLote: TFormPanel [3]
    Left = 260
    Top = 296
    Width = 436
    Height = 80
    Caption = 'Nuevo Estado de Lotes'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 80
    Constraints.MinHeight = 80
    Constraints.MinWidth = 436
    OnEnter = fpModifEstadoLoteEnter
    DesignSize = (
      436
      80)
    object BevelAbm: TBevel
      Left = 4
      Top = 44
      Width = 428
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 11
      Top = 19
      Width = 42
      Height = 13
      AutoSize = False
      Caption = 'Estado'
      WordWrap = True
    end
    object btnAceptarEstadoLote: TButton
      Left = 278
      Top = 50
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 1
      OnClick = btnAceptarEstadoLoteClick
    end
    object btnCancelarEstadoLote: TButton
      Left = 356
      Top = 50
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 2
    end
    inline fraModifEstado: TfraCtbTablas
      Left = 50
      Top = 15
      Width = 379
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 50
      ExplicitTop = 15
      ExplicitWidth = 379
      DesignSize = (
        379
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 326
        ExplicitWidth = 326
      end
    end
  end
  object fpAgregarLotesARemito: TFormPanel [4]
    Left = 156
    Top = 332
    Width = 577
    Height = 103
    Caption = 'Agregar Lote al Remito y Caja'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 103
    Constraints.MinHeight = 103
    Constraints.MinWidth = 577
    OnEnter = fpAgregarLotesARemitoEnter
    DesignSize = (
      577
      103)
    object Bevel1: TBevel
      Left = 4
      Top = 67
      Width = 569
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 11
      Top = 16
      Width = 36
      Height = 13
      Caption = 'N'#186' Caja'
    end
    object Label4: TLabel
      Left = 11
      Top = 44
      Width = 48
      Height = 13
      Caption = 'N'#186' Remito'
    end
    object btnAceptarAgregarLoteRemito: TButton
      Left = 419
      Top = 73
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarAgregarLoteRemitoClick
    end
    object btnCancelarAgregarLoteRemito: TButton
      Left = 497
      Top = 73
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
    object edNumeroCaja: TPatternEdit
      Left = 62
      Top = 12
      Width = 167
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 0
      Pattern = '0123456789'
    end
    object edNumeroCajaAux: TEdit
      Left = 232
      Top = 12
      Width = 337
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
    end
    object edNroRemito: TIntEdit
      Left = 62
      Top = 39
      Width = 114
      Height = 21
      TabOrder = 2
      Options = [ioAllowEmpty, ioAllowNegative]
    end
  end
  inherited sdqConsulta: TSDQuery
    BeforeOpen = sdqConsultaBeforeOpen
    SQL.Strings = (
      
        'SELECT TA_DESCRIPCION TIPOARCHIVO, LO_USUALTA USUALTA_LOTE, TRUN' +
        'C(LO_FECHAALTA) FECHAALTA_LOTE,'
      
        '       LO_ID LOTE, TRUNC(RE_FECHAALTA) FECHAALTA_REMITO, RE_ID R' +
        'EMITO, SE_SECTOR SECTORUSU,'
      '       1 LOTEDIGITALIZADO,'
      '       DECODE(LO_ESTADO, '#39'10'#39', 1, 0) ESTADO1,'
      '       DECODE(LO_ESTADO, '#39'20'#39', 1, 0) ESTADO2,'
      '       DECODE(LO_ESTADO, '#39'30'#39', 1, 0) ESTADO3,'
      '       DECODE(LO_ESTADO, '#39'40'#39', 1, 0) ESTADO4,'
      '       DECODE(LO_ESTADO, '#39'50'#39', 1, 0) ESTADO5'
      
        '  FROM USC_SECTORES, RRE_REMITO, USE_USUARIOS, RTA_TIPOARCHIVO, ' +
        'RLO_LOTE'
      ' WHERE LO_TIPO = TA_ID'
      '   AND LO_USUALTA = SE_USUARIO'
      '   AND SE_SECTOR = SC_CODIGO'
      '   AND LO_IDREMITO = RE_ID(+)'
      '   AND 1 = 2')
    Top = 275
  end
  inherited dsConsulta: TDataSource
    Top = 275
  end
  inherited SortDialog: TSortDialog
    Top = 303
  end
  inherited ExportDialog: TExportDialog
    Top = 303
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 85
    Options = [qoZoomPrint, qoZoomCalcFontSize]
    Top = 331
  end
  inherited Seguridad: TSeguridad
    Top = 247
  end
  inherited FormStorage: TFormStorage
    Top = 247
  end
  inherited PrintDialog: TPrintDialog
    Top = 331
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
    Top = 247
  end
  inherited FieldHider: TFieldHider
    Top = 275
  end
  object sdqSectores: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT SC_CODIGO, SC_DESCRIPCION'
      'FROM USC_SECTORES'
      'WHERE SC_FECHABAJA IS NULL'
      'ORDER BY SC_DESCRIPCION'
      '')
    Left = 201
    Top = 13
  end
  object dsSectores: TDataSource
    DataSet = sdqSectores
    Left = 229
    Top = 13
  end
  object pmnuSeleccionar: TPopupMenu
    Left = 144
    Top = 247
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16452
        LinkControl = tbModifEstado
      end
      item
        Key = 115
        LinkControl = tbBuscarCodigoBarras
      end
      item
        Key = 16469
        LinkControl = tbEnviarMail
      end
      item
        Key = 16472
        LinkControl = tbExtraviado
      end>
    Left = 108
    Top = 247
  end
  object sdqUsuario: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT SE_USUARIO, SE_NOMBRE || DECODE(SE_FECHABAJA, NULL, '#39#39', '#39 +
        ' (Dado de baja)'#39') as SE_NOMBRE, SE_SECTOR, SE_PERFIL, SE_FECHABA' +
        'JA'
      '  FROM USE_USUARIOS, USC_SECTORES'
      ' WHERE SE_SECTOR=SC_CODIGO'
      '   AND SC_SISTEMAARCHIVO='#39'S'#39
      '   AND SE_USUARIOGENERICO = '#39'N'#39
      'ORDER BY SE_NOMBRE')
    Left = 459
    Top = 16
  end
  object dsUsuario: TDataSource
    DataSet = sdqUsuario
    Left = 487
    Top = 16
  end
  object pmnuCodBarras: TPopupMenu
    Left = 172
    Top = 247
    object pmnuCodBarrasLote: TMenuItem
      Caption = 'Por Nro. de Lote'
      OnClick = pmnuCodBarrasLoteClick
    end
    object pmnuCodBarrasRemito: TMenuItem
      Caption = 'Por Nro. de Remito de Env'#237'o'
      OnClick = pmnuCodBarrasLoteClick
    end
  end
  object pmnuImpresion: TPopupMenu
    Left = 200
    Top = 247
    object mnuImprimirRemitoEnvio: TMenuItem
      Caption = '&Imprimir Remito de Env'#237'o de Lotes'
      OnClick = mnuImprimirRemitoEnvioClick
    end
    object mnuImprimirListado: TMenuItem
      Caption = '&Imprimir Listado'
      OnClick = mnuImprimirListadoClick
    end
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_CODIGO, TB_DESCRIPCION'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'ESLOT'#39
      '   AND TB_CODIGO <> '#39'0'#39
      ' ORDER BY TB_DESCRIPCION')
    Left = 207
    Top = 99
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 235
    Top = 99
  end
  object pmnuExtraviado: TPopupMenu
    Left = 228
    Top = 247
    object mnuMarcarExtraviado: TMenuItem
      Caption = 'Marcar Extraviado'
      OnClick = mnuMarcarExtraviadoClick
    end
    object mnuDesmarcarExtraviado: TMenuItem
      Caption = 'Desmarcar Extraviado'
      OnClick = mnuMarcarExtraviadoClick
    end
  end
end
