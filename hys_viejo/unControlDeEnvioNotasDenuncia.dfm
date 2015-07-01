inherited frmControlDeEnvioNotasDenuncia: TfrmControlDeEnvioNotasDenuncia
  Left = 977
  Top = 193
  Caption = 'Control de Envio Notas Denuncia'
  ClientHeight = 479
  ClientWidth = 841
  ExplicitWidth = 849
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 841
    Height = 219
    Visible = True
    ExplicitWidth = 841
    ExplicitHeight = 219
    object Label1: TLabel
      Left = 520
      Top = 60
      Width = 54
      Height = 13
      Caption = 'Fecha Alta:'
    end
    object lblCUIT: TLabel
      Left = 8
      Top = 5
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel
      Left = 6
      Top = 60
      Width = 60
      Height = 13
      Caption = 'Usuario Alta:'
    end
    object Label3: TLabel
      Left = 520
      Top = 89
      Width = 62
      Height = 13
      Caption = 'Fecha Modif:'
    end
    object Label4: TLabel
      Left = 6
      Top = 89
      Width = 68
      Height = 13
      Caption = 'Usuario Modif:'
    end
    object Label5: TLabel
      Left = 588
      Top = 60
      Width = 29
      Height = 13
      Caption = 'desde'
    end
    object Label6: TLabel
      Left = 713
      Top = 60
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Label7: TLabel
      Left = 587
      Top = 89
      Width = 29
      Height = 13
      Caption = 'desde'
    end
    object Label8: TLabel
      Left = 713
      Top = 89
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Label9: TLabel
      Left = 520
      Top = 120
      Width = 63
      Height = 13
      Caption = 'Fecha Envio:'
    end
    object Label10: TLabel
      Left = 6
      Top = 120
      Width = 69
      Height = 13
      Caption = 'Usuario Envio:'
    end
    object Label11: TLabel
      Left = 587
      Top = 120
      Width = 29
      Height = 13
      Caption = 'desde'
    end
    object Label12: TLabel
      Left = 713
      Top = 120
      Width = 26
      Height = 13
      Caption = 'hasta'
    end
    object Label13: TLabel
      Left = 6
      Top = 148
      Width = 73
      Height = 13
      Caption = 'Tipo Denuncia:'
    end
    object Label14: TLabel
      Left = 518
      Top = 148
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object Label15: TLabel
      Left = 7
      Top = 33
      Width = 30
      Height = 13
      Caption = 'Estab.'
    end
    object Label16: TLabel
      Left = 4
      Top = 175
      Width = 76
      Height = 13
      Caption = 'Tipo Prev. Emp.'
    end
    object Label17: TLabel
      Left = 4
      Top = 199
      Width = 79
      Height = 13
      Caption = 'Tipo SRT Estab.'
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 621
      Top = 56
      Width = 90
      Height = 21
      TabOrder = 3
    end
    inline fraUsuarioAlta: TfraCodigoDescripcion
      Left = 89
      Top = 56
      Width = 427
      Height = 23
      TabOrder = 2
      ExplicitLeft = 89
      ExplicitTop = 56
      ExplicitWidth = 427
      inherited cmbDescripcion: TArtComboBox
        Width = 362
        ExplicitWidth = 362
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 90
      Top = 2
      Width = 741
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitLeft = 90
      ExplicitTop = 2
      ExplicitWidth = 741
      ExplicitHeight = 21
      DesignSize = (
        741
        21)
      inherited lbRSocial: TLabel
        Left = 89
        ExplicitLeft = 89
      end
      inherited lbContrato: TLabel
        Left = 637
        ExplicitLeft = 637
      end
      inherited edContrato: TIntEdit
        Left = 684
        ExplicitLeft = 684
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 493
        ExplicitLeft = 141
        ExplicitWidth = 493
      end
    end
    object edFechaModifHasta: TDateComboBox
      Left = 742
      Top = 86
      Width = 90
      Height = 21
      TabOrder = 7
    end
    inline fraUsuarioModif: TfraCodigoDescripcion
      Left = 89
      Top = 85
      Width = 426
      Height = 23
      TabOrder = 5
      ExplicitLeft = 89
      ExplicitTop = 85
      ExplicitWidth = 426
      inherited cmbDescripcion: TArtComboBox
        Width = 361
        ExplicitWidth = 361
      end
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 744
      Top = 56
      Width = 90
      Height = 21
      TabOrder = 4
    end
    object edFechaModifDesde: TDateComboBox
      Left = 621
      Top = 86
      Width = 90
      Height = 21
      TabOrder = 6
    end
    object edFechaEnvioHasta: TDateComboBox
      Left = 742
      Top = 117
      Width = 90
      Height = 21
      TabOrder = 10
    end
    inline fraUsuarioEnvio: TfraCodigoDescripcion
      Left = 89
      Top = 116
      Width = 426
      Height = 23
      TabOrder = 8
      ExplicitLeft = 89
      ExplicitTop = 116
      ExplicitWidth = 426
      inherited cmbDescripcion: TArtComboBox
        Width = 361
        ExplicitWidth = 361
      end
    end
    object edFechaEnvioDesde: TDateComboBox
      Left = 621
      Top = 117
      Width = 90
      Height = 21
      TabOrder = 9
    end
    object cmbTipoDenuncia: TCheckCombo
      Left = 90
      Top = 144
      Width = 423
      Height = 21
      TabOrder = 11
    end
    object cmbEstado: TCheckCombo
      Left = 570
      Top = 144
      Width = 260
      Height = 21
      TabOrder = 12
    end
    object edEstablecimiento: TPatternEdit
      Left = 90
      Top = 29
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Pattern = '1234567890-,'
    end
    object cbActivas: TCheckBox
      Left = 359
      Top = 171
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Activas'
      TabOrder = 13
    end
    object cbBajas: TCheckBox
      Left = 471
      Top = 171
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Dadas de Baja'
      TabOrder = 14
    end
    object cbEmpresaVip: TCheckBox
      Left = 584
      Top = 171
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Empresas VIP'
      TabOrder = 15
    end
    inline fraTipoFiltroSRT: TfraCtbTablas
      Left = 90
      Top = 194
      Width = 263
      Height = 23
      TabOrder = 16
      ExplicitLeft = 90
      ExplicitTop = 194
      ExplicitWidth = 263
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 199
        ExplicitLeft = 64
        ExplicitWidth = 199
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        ExplicitWidth = 59
      end
    end
    object cmbTipoEmpresaPrev: TCheckCombo
      Left = 91
      Top = 171
      Width = 262
      Height = 21
      TabOrder = 17
    end
  end
  inherited CoolBar: TCoolBar
    Top = 219
    Width = 841
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 835
      end>
    ExplicitTop = 219
    ExplicitWidth = 841
    inherited ToolBar: TToolBar
      Width = 828
      ExplicitWidth = 828
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbMarcarComoEnviado: TToolButton
        Left = 370
        Top = 0
        Cursor = crDrag
        Hint = 'Marcar como Enviado'
        Caption = 'tbMarcarComoEnviado'
        ImageIndex = 32
        OnClick = tbMarcarComoEnviadoClick
      end
      object tbCopiarArchivo: TToolButton
        Left = 393
        Top = 0
        Hint = 'Copiar Archivo'
        Caption = 'tbCopiarArchivo'
        ImageIndex = 22
        OnClick = tbCopiarArchivoClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 439
        Top = 0
        Hint = 'Seleccionar Todos'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
      object tbReprocesar: TToolButton
        Left = 462
        Top = 0
        Hint = 'Reprocesar'
        Caption = 'Reprocesar'
        ImageIndex = 47
        OnClick = tbReprocesarClick
      end
      object tbAprobarDenuncia: TToolButton
        Left = 485
        Top = 0
        Hint = 'Aprobar Denuncia'
        Caption = 'tbAprobarDenuncia'
        ImageIndex = 27
        OnClick = tbAprobarDenunciaClick
      end
      object tbRechazar: TToolButton
        Left = 508
        Top = 0
        Hint = 'Rechazar'
        Caption = 'tbRechazar'
        ImageIndex = 39
        OnClick = tbRechazarClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 248
    Width = 841
    Height = 211
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_ID'
        Title.Caption = 'ID'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_ESTABLECI'
        Title.Caption = 'Establecimiento'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_FECHAENVIO'
        Title.Caption = 'F.Envio'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_USUENVIO'
        Title.Caption = 'Usuario Envio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_USUALTA'
        Title.Caption = 'Usuario Alta'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_FECHAMODIF'
        Title.Caption = 'F.Modif.'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_USUMODIF'
        Title.Caption = 'Usuario Modif.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_FECHABAJA'
        Title.Caption = 'F. Baja'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_USUBAJA'
        Title.Caption = 'Usuario Baja'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NT_DESCRIPCION'
        Title.Caption = 'Tipo Denuncia'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_OPERATIVO'
        Title.Caption = 'Operativo'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NE_FECHADENUNCIA'
        Title.Caption = 'Fecha Denuncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPODATO'
        Title.Caption = 'Tipo Dato'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre Establecimiento'
        Width = 125
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 260
    Top = 256
    ExplicitLeft = 260
    ExplicitTop = 256
  end
  object fpCopiarArchivo: TFormPanel [4]
    Left = 260
    Top = 304
    Width = 461
    Height = 77
    Caption = 'Destino donde copiar el archivo'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = [biSystemMenu]
    BorderStyle = bsSingle
    Position = poMainFormCenter
    DesignSize = (
      461
      77)
    object lbDirectorio: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Directorio'
      FocusControl = edDirectorio
    end
    object edDirectorio: TDirectoryEdit
      Left = 61
      Top = 10
      Width = 394
      Height = 21
      DialogKind = dkWin32
      DialogText = 'Directorio'
      DialogOptions = [sdAllowCreate, sdPerformCreate]
      NumGlyphs = 1
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object Button1: TButton
      Left = 381
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnAceptarCopiarArchivo: TButton
      Left = 303
      Top = 45
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 2
      OnClick = btnAceptarCopiarArchivoClick
    end
  end
  object StatusBar: TStatusBar [5]
    Left = 0
    Top = 459
    Width = 841
    Height = 20
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = True
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT a.*, b.*, c.*, d.*, TRUNC(ne_fechaalta) fechaalta,'
      
        '       DECODE(ne_estado, '#39'P'#39', '#39'Pendiente'#39', '#39'A'#39', '#39'Aprobado'#39', '#39'R'#39',' +
        ' '#39'Rechazado'#39') estado,'
      
        '       DECODE(ne_tipodato, '#39'D'#39', '#39'Denuncia'#39', '#39'V'#39', '#39'Ventanilla'#39') t' +
        'ipodato, es_nombre'
      
        '  FROM hys.hne_notasdenunciaenvio a, afi.aco_contrato b, afi.aem' +
        '_empresa c, hys.hnt_notasdenunciastipo d,'
      '       afi.aes_establecimiento'
      ' WHERE ne_contrato = co_contrato'
      '   AND co_idempresa = em_id'
      '   AND ne_idtipodenuncia = nt_id'
      '   AND ne_contrato = es_contrato(+)'
      '   AND ne_estableci = es_nroestableci(+)')
    object sdqConsultaNE_ID: TFloatField
      FieldName = 'NE_ID'
      Required = True
    end
    object sdqConsultaNE_CONTRATO: TFloatField
      FieldName = 'NE_CONTRATO'
    end
    object sdqConsultaNE_FECHAENVIO: TDateTimeField
      FieldName = 'NE_FECHAENVIO'
    end
    object sdqConsultaNE_USUENVIO: TStringField
      FieldName = 'NE_USUENVIO'
    end
    object sdqConsultaNE_FECHAALTA: TDateTimeField
      FieldName = 'NE_FECHAALTA'
      Required = True
    end
    object sdqConsultaNE_USUALTA: TStringField
      FieldName = 'NE_USUALTA'
      Required = True
    end
    object sdqConsultaNE_FECHAMODIF: TDateTimeField
      FieldName = 'NE_FECHAMODIF'
    end
    object sdqConsultaNE_USUMODIF: TStringField
      FieldName = 'NE_USUMODIF'
    end
    object sdqConsultaNE_FECHABAJA: TDateTimeField
      FieldName = 'NE_FECHABAJA'
    end
    object sdqConsultaNE_USUBAJA: TStringField
      FieldName = 'NE_USUBAJA'
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 200
    end
    object sdqConsultaFECHAALTA: TDateTimeField
      FieldName = 'FECHAALTA'
    end
    object sdqConsultaNE_IDTIPODENUNCIA: TFloatField
      FieldName = 'NE_IDTIPODENUNCIA'
    end
    object sdqConsultaNE_ESTABLECI: TFloatField
      FieldName = 'NE_ESTABLECI'
    end
    object sdqConsultaNT_DESCRIPCION: TStringField
      FieldName = 'NT_DESCRIPCION'
      Required = True
      Size = 400
    end
    object sdqConsultaNE_FECHADENUNCIA: TDateTimeField
      FieldName = 'NE_FECHADENUNCIA'
    end
    object sdqConsultaNE_OPERATIVO: TStringField
      FieldName = 'NE_OPERATIVO'
      Size = 6
    end
    object sdqConsultaNE_ESTADO: TStringField
      FieldName = 'NE_ESTADO'
      Size = 1
    end
    object sdqConsultaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 9
    end
    object sdqConsultaNE_TIPODATO: TStringField
      FieldName = 'NE_TIPODATO'
      Size = 1
    end
    object sdqConsultaTIPODATO: TStringField
      FieldName = 'TIPODATO'
      Size = 10
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Size = 100
    end
  end
  object OpenDialogCopiarArchivo: TOpenDialog
    Left = 84
    Top = 264
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
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 296
  end
end
