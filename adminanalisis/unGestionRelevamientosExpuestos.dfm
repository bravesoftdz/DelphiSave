inherited frmGestionRelevamientosExpuestos: TfrmGestionRelevamientosExpuestos
  Left = 97
  Top = 109
  Width = 815
  Height = 617
  Caption = 'Gesti'#243'n de Relevamientos de Expuestos'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter [0]
    Left = 0
    Top = 503
    Width = 807
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Color = clSilver
    ParentColor = False
  end
  object Label10: TLabel [1]
    Left = 21
    Top = 79
    Width = 3
    Height = 13
  end
  inherited pnlFiltros: TPanel
    Width = 807
    Height = 129
    Visible = True
    DesignSize = (
      807
      129)
    object lbCUIT: TLabel
      Left = 13
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbEstablecimiento: TLabel
      Left = 13
      Top = 31
      Width = 30
      Height = 13
      Caption = 'Estab.'
    end
    object Label1: TLabel
      Left = 526
      Top = 55
      Width = 95
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Periodo a presentar:'
    end
    object Label2: TLabel
      Left = 622
      Top = 55
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Desde'
    end
    object Label3: TLabel
      Left = 716
      Top = 55
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object lbFechaAccidenteFiltro: TLabel
      Left = 435
      Top = 79
      Width = 75
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Reclamo'
    end
    object Label4: TLabel
      Left = 518
      Top = 79
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Desde'
    end
    object Label5: TLabel
      Left = 662
      Top = 79
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object Label6: TLabel
      Left = 13
      Top = 55
      Width = 66
      Height = 13
      Caption = 'Tipo Reclamo'
    end
    object Label12: TLabel
      Left = 13
      Top = 79
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label13: TLabel
      Left = 13
      Top = 103
      Width = 88
      Height = 13
      Caption = '% de Presentaci'#243'n'
    end
    object Label14: TLabel
      Left = 228
      Top = 103
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label15: TLabel
      Left = 114
      Top = 103
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 54
      Top = 3
      Width = 744
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
      DesignSize = (
        744
        21)
      inherited lbContrato: TLabel
        Left = 640
      end
      inherited edContrato: TIntEdit
        Left = 687
      end
      inherited cmbRSocial: TArtComboBox
        Width = 505
      end
    end
    inline fraEstablecimientoFiltro: TfraEstablecimiento
      Left = 53
      Top = 27
      Width = 747
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        747
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 682
      end
    end
    object edPeriodoDesde: TPeriodoPicker
      Left = 658
      Top = 52
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '206002'
      Periodo.MinPeriodo = '196003'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edPeriodoHasta: TPeriodoPicker
      Left = 750
      Top = 51
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '206002'
      Periodo.MinPeriodo = '196003'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edFechaReclamoDesde: TDateEdit
      Left = 556
      Top = 76
      Width = 99
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 5
    end
    object edFechaReclamoHasta: TDateEdit
      Left = 700
      Top = 76
      Width = 99
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 6
    end
    object cmbReclamo: TCheckCombo
      Left = 87
      Top = 51
      Width = 435
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object cmbEstado: TCheckCombo
      Left = 55
      Top = 75
      Width = 374
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object edPorcentajePresentacionMin: TIntEdit
      Left = 156
      Top = 100
      Width = 59
      Height = 21
      TabOrder = 8
      MaxLength = 8
    end
    object edPorcentajePresentacionMax: TIntEdit
      Left = 260
      Top = 100
      Width = 59
      Height = 21
      TabOrder = 9
      MaxLength = 8
    end
    object cbEmpConCorreo: TCheckBox
      Left = 336
      Top = 103
      Width = 183
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Empresas con correo electr'#243'nico'
      TabOrder = 10
    end
  end
  inherited CoolBar: TCoolBar
    Top = 129
    Width = 807
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 803
      end>
    inherited ToolBar: TToolBar
      Width = 790
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      object tbReclamo: TToolButton
        Left = 370
        Top = 0
        Hint = 'Reclamar No Presentaci'#243'n'
        Caption = 'Reclamo'
        DropdownMenu = pmnuReclamo
        ImageIndex = 39
        Style = tbsDropDown
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 406
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 37
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 429
        Top = 0
        Hint = 'Seleccionar todo'
        Caption = 'Seleccionar todo'
        ImageIndex = 38
        OnClick = tbSeleccionarTodoClick
      end
      object tbReclamoPresentacion: TToolButton
        Left = 452
        Top = 0
        Hint = 'Reclamar Presentaci'#243'n con problemas'
        Caption = 'tbReclamoPresentacion'
        ImageIndex = 31
        OnClick = tbReclamoPresentacionClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 158
    Width = 807
    Height = 318
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
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HC_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HC_VIGENCIADESDE'
        Title.Caption = 'Vigencia Desde'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HC_VIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_FECHADENUNCIASRT'
        Title.Caption = 'Fecha denuncia SRT'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_FECHASEGDENUNCIA'
        Title.Caption = 'Fecha Segunda Denuncia'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TR_DESCRIPCION'
        Title.Caption = 'Reclamo'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GR_FECHARECLAMO'
        Title.Caption = 'Fecha Reclamo'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HC_TOTEMPLEADOSACTUAL'
        Title.Caption = 'Empleados del per'#237'odo'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORPRESENT'
        Title.Caption = '% de Presentaci'#243'n'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 148
    Top = 160
  end
  object dbgEstablecimiento: TArtDBGrid [6]
    Left = 0
    Top = 508
    Width = 807
    Height = 82
    Align = alBottom
    DataSource = dsDatosEstablecimiento
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgEstablecimientoCellClick
    OnDrawColumnCell = dbgEstablecimientoDrawColumnCell
    OnDblClick = dbgEstablecimientoDblClick
    OnKeyDown = dbgEstablecimientoKeyDown
    IniStorage = FormStorage
    OnGetCellParams = dbgEstablecimientoGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro. Establecimiento'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CALLE'
        Title.Caption = 'Calle'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NUMERO'
        Title.Caption = 'Nro. calle'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_PISO'
        Title.Caption = 'Piso'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_DEPARTAMENTO'
        Title.Caption = 'Departamento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'Cod. Postal'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTALA'
        Title.Caption = 'CPA'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_DESCRIPCION'
        Title.Caption = 'Provincia'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor Notif.'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_FECHANOTIFPREVENTOR'
        Title.Caption = 'Fecha Notif. Prev.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_DESCRIPCION'
        Title.Caption = 'Estado Presentaci'#243'n'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Causa'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_NOTIFICARALPREV'
        Title.Caption = 'Notificar al preventor'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOEMPRESA'
        Title.Caption = 'Tipo Empresa'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAULTIMORELEV'
        Title.Caption = 'F. Ult. Relev'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_PRESENTORELEV'
        Title.Caption = 'Present'#243' Relev.'
        Visible = True
      end>
  end
  object tbEstablecimientos: TToolBar [7]
    Left = 0
    Top = 476
    Width = 807
    Height = 27
    Align = alBottom
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = []
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object tbRefrescarEstablecimiento: TToolButton
      Left = 8
      Top = 0
      Hint = 'Refrescar (Ctrl + F5)'
      ImageIndex = 0
      Visible = False
      OnClick = tbRefrescarEstablecimientoClick
    end
    object ToolButton7: TToolButton
      Left = 31
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
      Visible = False
    end
    object tbOcultarGridEstablecimiento: TToolButton
      Left = 39
      Top = 0
      Hint = 'Ocultar'
      Caption = 'Ocultar'
      ImageIndex = 10
      Style = tbsCheck
      OnClick = tbOcultarGridEstablecimientoClick
    end
    object tbPresentacion: TToolButton
      Left = 62
      Top = 0
      Hint = 'Definir Presentaci'#243'n'
      Caption = 'tbPresentacion'
      ImageIndex = 9
      OnClick = tbPresentacionClick
    end
    object Label16: TLabel
      Left = 85
      Top = 0
      Width = 118
      Height = 22
      Caption = '          Con Estado           '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 203
      Top = 0
      Width = 162
      Height = 22
      Caption = '             Con Relevamiento            '
      Color = 16776176
      ParentColor = False
    end
  end
  object fpDefinirPresentacion: TFormPanel [8]
    Left = 148
    Top = 164
    Width = 461
    Height = 310
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      461
      310)
    object Bevel1: TBevel
      Left = 4
      Top = 274
      Width = 453
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label7: TLabel
      Left = 8
      Top = 60
      Width = 30
      Height = 13
      Caption = 'Causa'
    end
    object Label11: TLabel
      Left = 14
      Top = 244
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object btnAceptarPresentacion: TButton
      Left = 303
      Top = 280
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 4
      OnClick = btnAceptarPresentacionClick
    end
    object btnCancelarPresentacion: TButton
      Left = 381
      Top = 280
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 5
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 40
      Width = 451
      Height = 173
      TabOrder = 1
      object Label8: TLabel
        Left = 8
        Top = 12
        Width = 98
        Height = 13
        Caption = 'Estado Presentaci'#243'n'
      end
      object Label9: TLabel
        Left = 8
        Top = 60
        Width = 30
        Height = 13
        Caption = 'Causa'
      end
      inline fraEstadoPresentacion: TfraCodigoDescripcion
        Left = 8
        Top = 32
        Width = 438
        Height = 23
        TabOrder = 0
        DesignSize = (
          438
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 373
        end
      end
      inline fraCausa: TfraCodigoDescripcion
        Left = 6
        Top = 80
        Width = 440
        Height = 23
        TabOrder = 1
        DesignSize = (
          440
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 375
        end
      end
      object rgModoNotif: TRadioGroup
        Left = 12
        Top = 109
        Width = 429
        Height = 57
        Caption = 'Modo Notificaci'#243'n'
        Columns = 3
        Items.Strings = (
          'Ventanilla'
          'Fax'
          'Mail'
          'Carta'
          'Ninguno')
        TabOrder = 2
        TabStop = True
      end
    end
    object cbNotifPreventor: TCheckBox
      Left = 12
      Top = 217
      Width = 133
      Height = 21
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Notificar al Preventor'
      ParentBiDiMode = False
      TabOrder = 2
      OnClick = cbNotifPreventorClick
    end
    object cbPresentoRelev: TCheckBox
      Left = 8
      Top = 16
      Width = 142
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Present'#243' Relevamiento'
      TabOrder = 0
      OnClick = cbPresentoRelevClick
    end
    inline fraPreventorNotif: TfraCodigoDescripcion
      Left = 67
      Top = 240
      Width = 387
      Height = 23
      TabOrder = 3
      DesignSize = (
        387
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 322
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   ahc.hc_id, NVL(ahc.hc_totempleadosactual, ahc.hc_totemp' +
        'leados) hc_totempleadosactual, em_cuit, em_nombre,'
      
        '         ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciah' +
        'asta,'
      '         (((SELECT COUNT(*)'
      '              FROM hys.hge_gestionrelevestab'
      '             WHERE ge_presentorelev = '#39'S'#39
      
        '               AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT' +
        ' COUNT(*)'
      
        '                                                            FROM' +
        ' afi.aes_establecimiento'
      
        '                                                           WHERE' +
        ' es_contrato = ahc.hc_contrato'
      
        '                                                             AND' +
        ' es_fechabaja IS NULL))'
      '          * 100) porpresent,'
      
        '         gr_fechadenunciasrt, gr_fechasegdenuncia, gr_tiporeclam' +
        'o, tr_descripcion, gr_fechareclamo, gr_id,'
      
        '         DECODE(gr_estadoreclamo, '#39'P'#39', '#39'Pendiente'#39', '#39'R'#39', '#39'Reclam' +
        'ado'#39', '#39'V'#39', '#39'Vencido'#39') AS estado, hc_vigenciadesde vigencia'
      
        '    FROM hys.htr_tiporeclamo, hys.hgr_gestionrelevamiento, afi.a' +
        'em_empresa, afi.aen_endoso aen, ahc_historicocontrato ahc'
      '   WHERE aen.en_idhistoricocontrato = ahc.hc_id'
      '     AND hc_idempresa = em_id'
      '     AND gr_idhistoricocontrato(+) = hc_id'
      '     AND gr_tiporeclamo = tr_id(+)'
      '     AND aen.en_motivo = '#39'0.01'#39
      '     AND hc_vigenciadesde >= TO_DATE('#39'20100401'#39', '#39'YYYYMMDD'#39')'
      '     AND hc_vigenciadesde <= TO_DATE('#39'20100430'#39', '#39'YYYYMMDD'#39')'
      '     AND 1 = 2'
      'UNION ALL'
      
        'SELECT   ahc.hc_id, NVL(ahc.hc_totempleadosactual, ahc.hc_totemp' +
        'leados) hc_totempleadosactual, em_cuit, em_nombre,'
      
        '         ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciah' +
        'asta,'
      '         (((SELECT COUNT(*)'
      '              FROM hys.hge_gestionrelevestab'
      '             WHERE ge_presentorelev = '#39'S'#39
      
        '               AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT' +
        ' COUNT(*)'
      
        '                                                            FROM' +
        ' afi.aes_establecimiento'
      
        '                                                           WHERE' +
        ' es_contrato = ahc.hc_contrato'
      
        '                                                             AND' +
        ' es_fechabaja IS NULL))'
      '          * 100) porpresent,'
      
        '         gr_fechadenunciasrt, gr_fechasegdenuncia, gr_tiporeclam' +
        'o, tr_descripcion, gr_fechareclamo, gr_id,'
      
        '         DECODE(gr_estadoreclamo, '#39'P'#39', '#39'Pendiente'#39', '#39'R'#39', '#39'Reclam' +
        'ado'#39', '#39'V'#39', '#39'Vencido'#39') AS estado, hc_vigenciahasta vigencia'
      
        '    FROM hys.htr_tiporeclamo, hys.hgr_gestionrelevamiento, afi.a' +
        'em_empresa, afi.aen_endoso aen, ahc_historicocontrato ahc'
      '   WHERE aen.en_idhistoricocontrato = ahc.hc_id'
      '     AND hc_idempresa = em_id'
      '     AND gr_idhistoricocontrato(+) = hc_id'
      '     AND gr_tiporeclamo = tr_id(+)'
      '     AND aen.en_motivo = '#39'0.01'#39
      '     AND hc_vigenciahasta >= TO_DATE('#39'20100401'#39', '#39'YYYYMMDD'#39')'
      '     AND hc_vigenciahasta <= TO_DATE('#39'20100430'#39', '#39'YYYYMMDD'#39')'
      '     AND 1 = 2'
      'UNION ALL'
      
        'SELECT   ahc.hc_id, NVL(ahc.hc_totempleadosactual, ahc.hc_totemp' +
        'leados) hc_totempleadosactual, em_cuit, em_nombre,'
      
        '         ahc.hc_contrato, ahc.hc_vigenciadesde, ahc.hc_vigenciah' +
        'asta,'
      '         (((SELECT COUNT(*)'
      '              FROM hys.hge_gestionrelevestab'
      '             WHERE ge_presentorelev = '#39'S'#39
      
        '               AND ge_idhistoricocontrato = ahc.hc_id) / (SELECT' +
        ' COUNT(*)'
      
        '                                                            FROM' +
        ' afi.aes_establecimiento'
      
        '                                                           WHERE' +
        ' es_contrato = ahc.hc_contrato'
      
        '                                                             AND' +
        ' es_fechabaja IS NULL))'
      '          * 100) porpresent,'
      
        '         gr_fechadenunciasrt, gr_fechasegdenuncia, gr_tiporeclam' +
        'o, tr_descripcion, gr_fechareclamo, gr_id,'
      
        '         DECODE(gr_estadoreclamo, '#39'P'#39', '#39'Pendiente'#39', '#39'R'#39', '#39'Reclam' +
        'ado'#39', '#39'V'#39', '#39'Vencido'#39') AS estado, hc_vigenciahasta vigencia'
      
        '    FROM hys.htr_tiporeclamo, hys.hgr_gestionrelevamiento, afi.a' +
        'em_empresa, afi.aen_endoso aen, ahc_historicocontrato ahc'
      '   WHERE aen.en_idhistoricocontrato = ahc.hc_id'
      '     AND hc_idempresa = em_id'
      '     AND gr_idhistoricocontrato(+) = hc_id'
      '     AND gr_tiporeclamo = tr_id(+)'
      '     AND aen.en_motivo = '#39'11'#39
      '     AND hc_vigenciahasta >= TO_DATE('#39'20100401'#39', '#39'YYYYMMDD'#39')'
      '     AND hc_vigenciahasta <= TO_DATE('#39'20100430'#39', '#39'YYYYMMDD'#39')'
      '     AND 1 = 2'
      'ORDER BY hc_contrato')
  end
  inherited FieldHider: TFieldHider
    QueryPrint = nil
    ExportDialog = nil
  end
  object pmnuReclamo: TPopupMenu
    OwnerDraw = True
    Left = 81
    Top = 256
    object mnuVentanilla: TMenuItem
      Caption = 'Ventanilla'
      OnClick = mnuVentanillaClick
    end
    object mnuFax: TMenuItem
      Caption = 'Fax'
      OnClick = mnuFaxClick
    end
    object mnuMail: TMenuItem
      Caption = 'Mail'
      OnClick = mnuMailClick
    end
    object mnuCarta: TMenuItem
      Caption = 'Carta'
      OnClick = mnuCartaClick
    end
    object mnuNinguno: TMenuItem
      Caption = 'Ninguno'
      OnClick = mnuNingunoClick
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
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 284
  end
  object dsDatosEstablecimiento: TDataSource
    DataSet = sdqDatosEstablecimiento
    Left = 52
    Top = 340
  end
  object sdqDatosEstablecimiento: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    SQL.Strings = (
      
        'SELECT   es_id, es_nroestableci, es_nombre, es_numero, es_piso, ' +
        'es_departamento, es_cpostal, es_cpostala, es_calle,'
      
        '         es_localidad, es_provincia, pv_descripcion, hge.*, hca.' +
        '*, hep.*, it_nombre,'
      '         (SELECT ep_fechaultrelev'
      
        '            FROM hys.hep_estabporpreventor, afi.aem_empresa, afi' +
        '.aco_contrato'
      '           WHERE co_idempresa = em_id'
      '             AND co_contrato = es_contrato'
      '             AND ep_cuit = em_cuit'
      
        '             AND ep_estableci = es_nroestableci) fechaultimorele' +
        'v,'
      
        '         (SELECT art.hys.get_tipo_estab_srt(em_cuit, es_nroestab' +
        'leci, SYSDATE)'
      '            FROM afi.aem_empresa, afi.aco_contrato'
      '           WHERE co_idempresa = em_id'
      '             AND co_contrato = es_contrato) AS tipoempresa,'
      '         (SELECT DISTINCT 1'
      
        '                     FROM art.prt_riestrab, afi.aem_empresa, afi' +
        '.aco_contrato'
      '                    WHERE co_contrato = es_contrato'
      '                      AND em_id = co_idempresa'
      '                      AND rt_cuit = em_cuit'
      '                      AND rt_estableci = es_nroestableci'
      
        '                      AND rt_fecha >= TO_DATE('#39'01/01/'#39' || TO_CHA' +
        'R(:fecha, '#39'YYYY'#39'), '#39'DD/MM/YYYY'#39')'
      '          UNION'
      '          SELECT DISTINCT 1'
      
        '                     FROM art.psr_sinriesgo, afi.aem_empresa, af' +
        'i.aco_contrato'
      '                    WHERE co_contrato = es_contrato'
      '                      AND em_id = co_idempresa'
      '                      AND sr_cuit = em_cuit'
      '                      AND sr_estableci = es_nroestableci'
      
        '                      AND sr_fecha >= TO_DATE('#39'01/01/'#39' || TO_CHA' +
        'R(:fecha, '#39'YYYY'#39'), '#39'DD/MM/YYYY'#39')) existerelev'
      
        '    FROM afi.aes_establecimiento, art.cpv_provincias, hys.hge_ge' +
        'stionrelevestab hge, hys.hca_causa hca,'
      '         hys.hep_estadopresentacion hep, art.pit_firmantes'
      '   WHERE ge_idcausa = ca_id(+)'
      '     AND ge_idprevnotificacion = it_id(+)'
      '     AND ge_idestado = ep_id(+)'
      '     AND es_id = ge_idestab(+)'
      '     AND pv_codigo = es_provincia'
      '     AND es_fechabaja IS NULL'
      '     AND (   es_nroestableci = :estableci'
      '          OR :estableci IS NULL)'
      '     AND es_contrato = :contrato'
      'ORDER BY es_nroestableci')
    Left = 24
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'estableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
    object sdqDatosEstablecimientoES_ID: TFloatField
      FieldName = 'ES_ID'
      Required = True
    end
    object sdqDatosEstablecimientoES_NROESTABLECI: TFloatField
      FieldName = 'ES_NROESTABLECI'
      Required = True
    end
    object sdqDatosEstablecimientoES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqDatosEstablecimientoES_NUMERO: TStringField
      FieldName = 'ES_NUMERO'
      Required = True
    end
    object sdqDatosEstablecimientoES_PISO: TStringField
      FieldName = 'ES_PISO'
    end
    object sdqDatosEstablecimientoES_DEPARTAMENTO: TStringField
      FieldName = 'ES_DEPARTAMENTO'
    end
    object sdqDatosEstablecimientoES_CPOSTAL: TStringField
      FieldName = 'ES_CPOSTAL'
      Size = 5
    end
    object sdqDatosEstablecimientoES_CPOSTALA: TStringField
      FieldName = 'ES_CPOSTALA'
      Size = 8
    end
    object sdqDatosEstablecimientoES_CALLE: TStringField
      FieldName = 'ES_CALLE'
      Size = 60
    end
    object sdqDatosEstablecimientoES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqDatosEstablecimientoES_PROVINCIA: TStringField
      FieldName = 'ES_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqDatosEstablecimientoPV_DESCRIPCION: TStringField
      FieldName = 'PV_DESCRIPCION'
      Size = 50
    end
    object sdqDatosEstablecimientoGE_ID: TFloatField
      FieldName = 'GE_ID'
    end
    object sdqDatosEstablecimientoGE_IDPREVNOTIFICACION: TFloatField
      FieldName = 'GE_IDPREVNOTIFICACION'
    end
    object sdqDatosEstablecimientoGE_FECHANOTIFPREVENTOR: TDateTimeField
      FieldName = 'GE_FECHANOTIFPREVENTOR'
    end
    object sdqDatosEstablecimientoGE_IDESTADO: TFloatField
      FieldName = 'GE_IDESTADO'
    end
    object sdqDatosEstablecimientoGE_IDCAUSA: TFloatField
      FieldName = 'GE_IDCAUSA'
    end
    object sdqDatosEstablecimientoGE_NOTIFICARALPREV: TStringField
      FieldName = 'GE_NOTIFICARALPREV'
      Size = 1
    end
    object sdqDatosEstablecimientoGE_PRESENTORELEV: TStringField
      FieldName = 'GE_PRESENTORELEV'
      Size = 1
    end
    object sdqDatosEstablecimientoGE_FECHAALTA: TDateTimeField
      FieldName = 'GE_FECHAALTA'
    end
    object sdqDatosEstablecimientoGE_USUALTA: TStringField
      FieldName = 'GE_USUALTA'
    end
    object sdqDatosEstablecimientoGE_FECHAMODIF: TDateTimeField
      FieldName = 'GE_FECHAMODIF'
    end
    object sdqDatosEstablecimientoGE_USUMODIF: TStringField
      FieldName = 'GE_USUMODIF'
    end
    object sdqDatosEstablecimientoGE_FECHABAJA: TDateTimeField
      FieldName = 'GE_FECHABAJA'
    end
    object sdqDatosEstablecimientoGE_USUBAJA: TStringField
      FieldName = 'GE_USUBAJA'
    end
    object sdqDatosEstablecimientoGE_IDESTAB: TFloatField
      FieldName = 'GE_IDESTAB'
    end
    object sdqDatosEstablecimientoCA_ID: TFloatField
      FieldName = 'CA_ID'
    end
    object sdqDatosEstablecimientoCA_IDESTADO: TFloatField
      FieldName = 'CA_IDESTADO'
    end
    object sdqDatosEstablecimientoCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 200
    end
    object sdqDatosEstablecimientoCA_FECHAALTA: TDateTimeField
      FieldName = 'CA_FECHAALTA'
    end
    object sdqDatosEstablecimientoCA_USUALTA: TStringField
      FieldName = 'CA_USUALTA'
    end
    object sdqDatosEstablecimientoCA_FECHAMODIF: TDateTimeField
      FieldName = 'CA_FECHAMODIF'
    end
    object sdqDatosEstablecimientoCA_USUMODIF: TStringField
      FieldName = 'CA_USUMODIF'
    end
    object sdqDatosEstablecimientoCA_FECHABAJA: TDateTimeField
      FieldName = 'CA_FECHABAJA'
    end
    object sdqDatosEstablecimientoCA_USUBAJA: TStringField
      FieldName = 'CA_USUBAJA'
    end
    object sdqDatosEstablecimientoEP_ID: TFloatField
      FieldName = 'EP_ID'
    end
    object sdqDatosEstablecimientoEP_DESCRIPCION: TStringField
      FieldName = 'EP_DESCRIPCION'
      Size = 200
    end
    object sdqDatosEstablecimientoEP_FECHAALTA: TDateTimeField
      FieldName = 'EP_FECHAALTA'
    end
    object sdqDatosEstablecimientoEP_USUALTA: TStringField
      FieldName = 'EP_USUALTA'
    end
    object sdqDatosEstablecimientoEP_FECHAMODIF: TDateTimeField
      FieldName = 'EP_FECHAMODIF'
    end
    object sdqDatosEstablecimientoEP_USUMODIF: TStringField
      FieldName = 'EP_USUMODIF'
    end
    object sdqDatosEstablecimientoEP_FECHABAJA: TDateTimeField
      FieldName = 'EP_FECHABAJA'
    end
    object sdqDatosEstablecimientoEP_USUBAJA: TStringField
      FieldName = 'EP_USUBAJA'
    end
    object sdqDatosEstablecimientoIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Size = 255
    end
    object sdqDatosEstablecimientoTIPOEMPRESA: TStringField
      FieldName = 'TIPOEMPRESA'
      Size = 4000
    end
    object sdqDatosEstablecimientoFECHAULTIMORELEV: TDateTimeField
      FieldName = 'FECHAULTIMORELEV'
    end
    object sdqDatosEstablecimientoGE_IDHISTORICOCONTRATO: TFloatField
      FieldName = 'GE_IDHISTORICOCONTRATO'
    end
    object sdqDatosEstablecimientoCA_NOTIFPREV: TStringField
      FieldName = 'CA_NOTIFPREV'
      Size = 1
    end
    object sdqDatosEstablecimientoCA_NOTIFEMPRESA: TStringField
      FieldName = 'CA_NOTIFEMPRESA'
      Size = 1
    end
    object sdqDatosEstablecimientoEXISTERELEV: TFloatField
      FieldName = 'EXISTERELEV'
    end
  end
end
