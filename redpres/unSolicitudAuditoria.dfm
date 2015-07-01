inherited frmSolicitudAuditoria: TfrmSolicitudAuditoria
  Left = 320
  Top = 196
  Width = 889
  Height = 497
  Caption = 'Seguimiento de Solicitudes de Auditor'#237'a'
  Constraints.MinHeight = 352
  Constraints.MinWidth = 700
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 881
    Height = 176
    object grpSiniestro: TGroupBox
      Left = 0
      Top = 0
      Width = 881
      Height = 44
      Align = alTop
      Caption = ' Siniestro '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        881
        44)
      object blSinFecha: TLabel
        Left = 119
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object edSinDiagnostico: TEdit
        Left = 370
        Top = 16
        Width = 505
        Height = 21
        Hint = 'Diagn'#243'stico del Siniestro'
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object edCausaFin: TEdit
        Left = 231
        Top = 16
        Width = 136
        Height = 21
        Hint = 'Causa Fin'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object pnlSiniestro: TPanel
        Left = 4
        Top = 14
        Width = 109
        Height = 25
        BevelOuter = bvNone
        TabOrder = 3
        object SinEdit: TSinEdit
          Left = 4
          Top = 2
          Width = 100
          Height = 21
          TabOrder = 0
          OnSelect = SinEditSelect
        end
      end
      object edSinFecha: TDateEditor
        Left = 156
        Top = 16
        Width = 72
        Height = 21
        Hint = 'Fecha del Siniestro'
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
        Date = 36812.000000000000000000
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 44
      Width = 256
      Height = 44
      Caption = ' Estado del Seguimiento '
      TabOrder = 1
      DesignSize = (
        256
        44)
      inline fraEstado: TfraStaticCTB_TABLAS
        Left = 8
        Top = 16
        Width = 240
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 176
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
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 88
      Width = 200
      Height = 44
      Caption = ' Fecha Solicitud'
      TabOrder = 3
      object lblFSolicitud: TLabel
        Left = 93
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcbFechaSolicitudDesde: TDateComboBox
        Left = 4
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcbFechaSolicitudHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcbFechaSolicitudHasta: TDateComboBox
        Left = 108
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcbFechaSolicitudDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 260
      Top = 44
      Width = 621
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Auditor '
      TabOrder = 2
      DesignSize = (
        621
        44)
      inline fraAuditor: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 605
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 542
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 202
      Top = 88
      Width = 200
      Height = 44
      Caption = ' Fecha Env'#237'o'
      TabOrder = 4
      object Label1: TLabel
        Left = 93
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcbFechaEnvioDesde: TDateComboBox
        Left = 4
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcbFechaEnvioHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcbFechaEnvioHasta: TDateComboBox
        Left = 108
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcbFechaEnvioDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GroupBox5: TGroupBox
      Left = 404
      Top = 88
      Width = 199
      Height = 44
      Caption = ' Fecha Auditor'#237'a'
      TabOrder = 5
      object Label3: TLabel
        Left = 94
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcbFechaAuditoriaDesde: TDateComboBox
        Left = 4
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Desde Fecha'
        MaxDateCombo = dcbFechaAuditoriaHasta
        DialogTitle = 'La fecha desde debe ser menor a la fecha actual'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object dcbFechaAuditoriaHasta: TDateComboBox
        Left = 108
        Top = 16
        Width = 88
        Height = 21
        Hint = 'Hasta Fecha'
        MinDateCombo = dcbFechaAuditoriaDesde
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object GroupBox6: TGroupBox
      Left = 340
      Top = 132
      Width = 541
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Delegaci'#243'n '
      TabOrder = 9
      DesignSize = (
        541
        44)
      inline fraDelegacion: TfraStaticCodigoDescripcion
        Left = 8
        Top = 14
        Width = 525
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 462
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 0
      Top = 132
      Width = 336
      Height = 44
      Caption = ' Destinatario '
      TabOrder = 8
      DesignSize = (
        336
        44)
      inline fraDestinatario: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 320
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Left = 76
          Width = 243
        end
        inherited edCodigo: TPatternEdit
          Width = 72
          MaxLength = 15
        end
      end
    end
    object chkInfectologia: TCheckBox
      Left = 611
      Top = 94
      Width = 77
      Height = 17
      Caption = 'Infectolog'#237'a'
      TabOrder = 6
    end
    object chkListado: TCheckBox
      Left = 612
      Top = 114
      Width = 57
      Height = 17
      Caption = 'Listado'
      TabOrder = 7
    end
  end
  inherited CoolBar: TCoolBar
    Top = 176
    Width = 881
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 877
      end>
    inherited ToolBar: TToolBar
      Width = 864
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbEliminar: TToolButton
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited tbEnviarMail: TToolButton
        Hint = 'Enviar E-Mail (Reclamos) a Delegaci'#243'n'
        ImageIndex = 39
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbEnviarSolicitud: TToolButton
        Left = 370
        Top = 0
        Hint = 'Enviar solicitud de auditor'#237'a m'#233'dica'
        Caption = 'tbEnviarSolicitud'
        Enabled = False
        ImageIndex = 22
        OnClick = tbEnviarSolicitudClick
      end
      object tbModificarAudit: TToolButton
        Left = 393
        Top = 0
        Hint = 'Modificar auditoria ya enviada'
        Enabled = False
        ImageIndex = 41
        OnClick = tbModificarAuditClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbFinalizarSeguimiento: TToolButton
        Left = 424
        Top = 0
        Hint = 'Finalizar Auditor'#237'a'
        Enabled = False
        ImageIndex = 35
        OnClick = tbFinalizarSeguimientoClick
      end
      object tbVerDemora: TToolButton
        Left = 447
        Top = 0
        Hint = 'Ver demora'
        Caption = 'tbVerDemora'
        ImageIndex = 38
        Style = tbsCheck
        OnClick = tbVerDemoraClick
      end
      object tbHistoricoReclamos: TToolButton
        Left = 470
        Top = 0
        Hint = 'Historico de reclamos a delegaci'#243'n'
        Caption = 'tbHistoricoReclamos'
        ImageIndex = 37
        OnClick = tbHistoricoReclamosClick
      end
      object ToolButton2: TToolButton
        Left = 493
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir3: TToolButton
        Left = 501
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir3'
        ImageIndex = 8
        OnClick = tbSalir3Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 205
    Width = 881
    Height = 265
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    OnGetCellParams = GridGetCellParams
    OnContextPopup = GridContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKBOX'
        Title.Caption = '.'
        Width = 22
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PV_SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 54
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PV_ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 36
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PV_RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Recaida'
        Width = 47
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PV_NROPARTE'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Parte'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PACIENTE'
        Title.Caption = 'Paciente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAVEDAD'
        Title.Caption = 'Gravedad'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHASOLICITUD'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Solicitud'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAENVIO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Env'#237'o'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAUDITORIA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_TURNO'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Turno'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUDITOR'
        Title.Caption = 'Auditor'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Agregado por'
        Width = 114
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'Alta M'#233'dica'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_INFECTOLOGIA'
        Title.Alignment = taCenter
        Title.Caption = 'Infectolog'#237'a'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PV_DESDELISTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Listado'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PV_CANTAUDIT'
        Title.Caption = 'Cant. Auditor'#237'as pv'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SU_CANTAUDIT'
        Title.Caption = 'Auditor'#237'as Pendientes'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_CANTAUDITCUMPLIDAS'
        Title.Caption = 'Auditor'#237'as Cumplidas'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTANULACION'
        Title.Caption = 'Mot. Anulaci'#243'n'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SU_OBSERVAC_ANUL'
        Title.Caption = 'Observac. Anul.'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DEMORAENVIO'
        Title.Alignment = taCenter
        Title.Caption = 'D. Env'#237'o'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DEMORARECEPCION'
        Title.Alignment = taCenter
        Title.Caption = 'D. Recepci'#243'n'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DEMORATURNO'
        Title.Alignment = taCenter
        Title.Caption = 'D. Turno'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SU_FECENVIORECLAMO'
        Title.Caption = 'Fec. Env'#237'o Reclamo'
        Width = 110
        Visible = True
      end>
  end
  object fpAnular: TFormPanel [3]
    Left = 468
    Top = 24
    Width = 425
    Height = 141
    Caption = 'Anulaci'#243'n'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    Constraints.MinHeight = 70
    Constraints.MinWidth = 310
    DesignSize = (
      425
      141)
    object Bevel3: TBevel
      Left = 6
      Top = 99
      Width = 417
      Height = 8
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label12: TLabel
      Left = 7
      Top = 34
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object Label16: TLabel
      Left = 7
      Top = 11
      Width = 82
      Height = 13
      Caption = 'Motivo Anulaci'#243'n'
    end
    object btnAnuAceptar: TButton
      Left = 265
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAnuAceptarClick
    end
    object btnAnuCancelar: TButton
      Left = 345
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object edObservacionesAnu: TMemo
      Left = 93
      Top = 37
      Width = 327
      Height = 63
      MaxLength = 250
      TabOrder = 1
    end
    inline fraMotivoAnulacion: TfraCodigoDescripcion
      Left = 93
      Top = 9
      Width = 345
      Height = 23
      TabOrder = 0
      DesignSize = (
        345
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 48
        Width = 280
      end
      inherited edCodigo: TPatternEdit
        Width = 44
      end
    end
  end
  object fpHistoricoReclamos: TFormPanel [4]
    Left = 81
    Top = 200
    Width = 769
    Height = 333
    Caption = 'Hist'#243'rico de Reclamos'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poDesktopCenter
    OnBeforeShow = fpHistoricoReclamosBeforeShow
    DesignSize = (
      769
      333)
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 769
      Height = 27
      ButtonWidth = 24
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      TabOrder = 0
      object tbVerFiltros: TToolButton
        Left = 0
        Top = 0
        Hint = 'Ver Filtros ...'
        Caption = 'Ver Filtros...'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = tbVerFiltrosClick
      end
      object tbExportar_reclamos: TToolButton
        Left = 24
        Top = 0
        Hint = 'Exportar grilla'
        Caption = 'tbExportar_reclamos'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = tbExportar_reclamosClick
      end
      object tbOrdenar_reclamos: TToolButton
        Left = 48
        Top = 0
        Caption = 'tbOrdenar_reclamos'
        ImageIndex = 5
        OnClick = tbOrdenar_reclamosClick
      end
      object ToolButton12: TToolButton
        Left = 72
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btnSalir: TToolButton
        Left = 80
        Top = 0
        Hint = 'Salir'
        Caption = 'btnSalir'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSalirClick
      end
    end
    object MemoFiltros: TMemo
      Left = 5
      Top = 31
      Width = 477
      Height = 74
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Lucida Sans'
      Font.Style = []
      Lines.Strings = (
        'Filtros:')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbgHistoricoReclamos: TDBGrid
      Left = 1
      Top = 27
      Width = 766
      Height = 303
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsHistoricoReclamos
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SU_SINIESTRO'
          Title.Caption = 'Siniestro'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_ORDEN'
          Title.Caption = 'Orden'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_RECAIDA'
          Title.Caption = 'Recaida'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_NROPARTE'
          Title.Caption = 'Nro.Parte'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHAYHORARECL'
          Title.Caption = 'Fecha y Hora Reclamo'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Title.Caption = 'Estado'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DELEGACION'
          Title.Caption = 'Delegaci'#243'n'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AU_NOMBRE'
          Title.Caption = 'Auditor'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SU_FECHABAJA'
          Title.Caption = 'Fecha Baja'
          Width = 65
          Visible = True
        end>
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterScroll = sdqConsultaAfterScroll
    SQL.Strings = (
      
        'SELECT pv_siniestro, pv_orden, pv_recaida, pv_nroparte, TRUNC(su' +
        '_fechaalta) fechasolicitud, TRUNC(su_fechaenvio) fechaenvio,'
      
        '       TRUNC(su_fechaauditoria) fechaauditoria, TRUNC(su_fechaba' +
        'ja) fechabaja, est.es_descripcion estado, se_nombre usuario,'
      
        '       au_nombre auditor, tc_descripcion gravedad, ee_direccione' +
        'sdestino, DECODE(su_altamedica, '#39'T'#39', '#39'SI'#39', '#39' '#39') altamedica,'
      '       tj_nombre paciente, pv_infectologia, pv_desdelistado,'
      
        '       DECODE(ca_identificador, NULL, NULL, '#39'('#39' || ca_identifica' +
        'dor || '#39') - '#39' ||ca_descripcion) prestador, pv_cantaudit,'
      
        '       su_cantaudit, su_cantauditcumplidas, su_idexpediente, su_' +
        'estado, ca_identificador IdPrestador, su_fecEnvioReclamo,'
      '       su_id'
      
        '  FROM usc_sectores, use_usuarios, sue_auditoriasenviadas sue, m' +
        'au_auditores, SIN.stc_tipogravedad_cie10, cee_emailaenviar,'
      
        '       ctj_trabajador, sex_expedientes, art.spv_parteevolutivo, ' +
        'ssu_seguimientoauditoria, SIN.ses_estadoseguimiento est,'
      '       cpr_prestador'
      ' WHERE su_usualta = se_usuario'
      '   AND su_id = sue.ue_seguimientoid(+)'
      '   AND sue.ue_auditorid = au_auditor(+)'
      '   AND (SELECT NVL(MAX(sue2.ue_id), -1)'
      '          FROM sue_auditoriasenviadas sue2, mau_auditores au2'
      '         WHERE sue.ue_seguimientoid = sue2.ue_seguimientoid'
      
        '           AND sue2.ue_auditorid = au2.au_auditor) IN(sue.ue_id,' +
        ' -1)'
      '   AND tc_codigo(+) = pv_gravedadcie10'
      '   AND su_emailaenviarid = ee_id(+)'
      '   AND ex_cuil = tj_cuil'
      '   AND pv_siniestro = ex_siniestro'
      '   AND pv_orden = ex_orden'
      '   AND pv_recaida = ex_recaida'
      '   AND ex_sector = sc_codigo(+)'
      '   AND su_siniestro = pv_siniestro'
      '   AND su_orden = pv_orden'
      '   AND su_recaida = pv_recaida'
      '   AND su_nroparte = pv_nroparte'
      '   AND est.es_codigo = su_estado'
      '   AND pv_identifprestador = ca_identificador(+)'
      'order by 1 desc')
    Left = 64
    Top = 256
  end
  inherited dsConsulta: TDataSource
    Left = 92
    Top = 256
  end
  inherited SortDialog: TSortDialog
    Left = 64
    Top = 284
  end
  inherited ExportDialog: TExportDialog
    Left = 92
    Top = 284
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Solicitudes de auditor'#237'a'
    PageOrientation = pxLandscape
    Left = 92
    Top = 312
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'EnviarSolicitudFinalizada'
      end>
    Left = 64
    Top = 228
  end
  inherited FormStorage: TFormStorage
    Left = 92
    Top = 228
  end
  inherited PrintDialog: TPrintDialog
    Left = 64
    Top = 312
  end
  inherited ShortCutControl: TShortCutControl
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
        LinkControl = tbSalir3
      end>
    Left = 120
    Top = 228
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 120
    Top = 256
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT EX_FECHAACCIDENTE, EX_CAUSAFIN, EX_DIAGNOSTICO'
      
        'FROM MGP_GTRABAJO, SEX_EXPEDIENTES, USC_SECTORES, DLG_DELEGACION' +
        'ES'
      'WHERE EX_GTRABAJO = GP_CODIGO (+)'
      '  AND LG_CODIGO = SC_DELEGACION'
      '  AND EX_SECTOR = SC_CODIGO(+)'
      '  AND EX_SINIESTRO = :pSiniestro'
      '  AND EX_ORDEN = :pOrden'
      '  AND EX_RECAIDA = :pRecaida')
    Left = 284
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
  end
  object sdqAux: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 636
    Top = 296
  end
  object sdqHistoricoReclamos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 632
    Top = 332
  end
  object dsHistoricoReclamos: TDataSource
    DataSet = sdqHistoricoReclamos
    Left = 660
    Top = 332
  end
  object ExportDialogHistRecl: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqHistoricoReclamos
    Fields = <>
    IniStorage = FormStorage
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
    Left = 604
    Top = 332
  end
  object SortDialog_reclamos: TSortDialog
    Caption = 'Orden'
    DataSet = sdqHistoricoReclamos
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'SU_SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'SU_ORDEN'
        FieldIndex = 0
      end
      item
        Title = 'Recaida'
        DataField = 'SU_RECAIDA'
        FieldIndex = 0
      end
      item
        Title = 'Fecha y Hora Reclamo'
        DataField = 'FECHAYHORARECL'
        FieldIndex = 0
      end
      item
        Title = 'Estado'
        DataField = 'ESTADO'
        FieldIndex = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'DELEGACION'
        FieldIndex = 0
      end
      item
        Title = 'Auditor'
        DataField = 'AU_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Fecha Baja'
        DataField = 'SU_FECHABAJA'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 576
    Top = 332
  end
end
