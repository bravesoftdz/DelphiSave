inherited frmDefRanking: TfrmDefRanking
  Left = 62
  Top = 85
  Width = 715
  Height = 469
  Caption = 'Definici'#243'n de Ranking de Empresas'
  OnDestroy = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 402
    Width = 707
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clBlue
    ParentColor = False
  end
  inherited pnlFiltros: TPanel
    Width = 707
    Height = 74
    Visible = True
    object Label4: TLabel
      Left = 9
      Top = 6
      Width = 76
      Height = 13
      Caption = 'Vigencia desde:'
    end
    object Label6: TLabel
      Left = 183
      Top = 6
      Width = 29
      Height = 13
      Caption = 'hasta:'
    end
    object Label5: TLabel
      Left = 9
      Top = 53
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label8: TLabel
      Left = 513
      Top = 56
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'EAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 543
      Top = 56
      Width = 57
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Monitoreo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 606
      Top = 56
      Width = 26
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Baja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 639
      Top = 56
      Width = 58
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Caducado'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblRanking: TLabel
      Left = 313
      Top = 7
      Width = 43
      Height = 13
      Caption = 'Ranking:'
      FocusControl = fraEmpresaFiltro.edContrato
    end
    object Label12: TLabel
      Left = 183
      Top = 29
      Width = 29
      Height = 13
      Caption = 'hasta:'
    end
    object Label13: TLabel
      Left = 9
      Top = 29
      Width = 65
      Height = 13
      Caption = 'F. Alta desde:'
    end
    object Label14: TLabel
      Left = 313
      Top = 31
      Width = 70
      Height = 13
      Caption = 'Usuario Carga:'
      FocusControl = fraEmpresaFiltro.edContrato
    end
    object chkBajas: TCheckBox
      Left = 602
      Top = 5
      Width = 94
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Ver Bajas'
      TabOrder = 3
    end
    object dcbFiltroDesde: TDateComboBox
      Left = 90
      Top = 3
      Width = 88
      Height = 21
      TabOrder = 0
    end
    object dcbFiltroHasta: TDateComboBox
      Left = 216
      Top = 3
      Width = 88
      Height = 21
      TabOrder = 1
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 39
      Top = 50
      Width = 467
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
      TabOrder = 5
      inherited lbContrato: TLabel
        Left = 365
      end
      inherited edContrato: TIntEdit
        Left = 410
      end
      inherited cmbRSocial: TArtComboBox
        Width = 228
      end
    end
    inline fraRankingFiltro: TfraCodigoDescripcion
      Left = 386
      Top = 2
      Width = 216
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 163
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 51
      end
    end
    object chkCaducadas: TCheckBox
      Left = 602
      Top = 23
      Width = 94
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Ver Caducadas'
      TabOrder = 4
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 216
      Top = 26
      Width = 88
      Height = 21
      TabOrder = 6
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 90
      Top = 26
      Width = 88
      Height = 21
      TabOrder = 7
    end
    inline fraUsuariosCargados: TfraCodigoDescripcion
      Left = 387
      Top = 26
      Width = 217
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 163
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 51
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 74
    Width = 707
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 703
      end>
    inherited ToolBar: TToolBar
      Width = 690
      inherited tbEliminar: TToolButton
        Hint = 'Registrar Egreso (Ctrl+Del)'
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 103
    Width = 707
    Height = 299
    Align = alTop
    Constraints.MinHeight = 200
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrato'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Alignment = taCenter
        Title.Caption = 'Empresa'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cp_ciiuviejo'
        Title.Alignment = taCenter
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cp_capitas'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incid_media'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Media'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ultperiodo'
        Title.Alignment = taCenter
        Title.Caption = #218'lt.Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incidencia'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incid_1'
        Title.Alignment = taCenter
        Title.Caption = 'Inc.Per.-1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'incid_2'
        Title.Caption = 'Inc.Per.-2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RK_DESCRIPCION'
        Title.Alignment = taCenter
        Title.Caption = 'Ranking'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 're_vigenciadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Desde'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 're_vigenciahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Hasta'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 're_motivoalta'
        Title.Caption = 'Motivo alta'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'motivoingreso'
        Title.Caption = 'Obs. motivo alta'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 're_motivobaja'
        Title.Caption = 'Motivo baja'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'motivoegreso'
        Title.Caption = 'Obs. motivo baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 're_usuautorizacion'
        Title.Caption = 'Usuario autoriz.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 're_fechaautorizacion'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha autoriz.'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 24
    Top = 138
    Width = 538
    Height = 223
    BorderStyle = bsDialog
    inherited BevelAbm: TBevel
      Left = 8
      Top = 184
      Width = 522
      Height = 6
    end
    object Label2: TLabel [1]
      Left = 12
      Top = 57
      Width = 40
      Height = 13
      Caption = 'Ranking'
    end
    object Label1: TLabel [2]
      Left = 12
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label3: TLabel [3]
      Left = 12
      Top = 105
      Width = 76
      Height = 13
      Caption = 'Vigencia desde:'
    end
    object lblMotivo: TLabel [4]
      Left = 12
      Top = 135
      Width = 87
      Height = 13
      Caption = 'Motivo de ingreso:'
    end
    object Label7: TLabel [5]
      Left = 267
      Top = 105
      Width = 73
      Height = 13
      Caption = 'Vigencia hasta:'
    end
    object lblObservacion: TLabel [6]
      Left = 12
      Top = 159
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 375
      Top = 193
      Width = 74
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 456
      Top = 193
      Width = 74
      TabOrder = 6
    end
    inline fraRanking: TfraCodigoDescripcion
      Left = 12
      Top = 72
      Width = 514
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 78
        Width = 436
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 72
      end
    end
    inline fraEmpresa: TfraEmpresa
      Left = 13
      Top = 27
      Width = 514
      Height = 22
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
      inherited lbContrato: TLabel
        Left = 409
      end
      inherited edContrato: TIntEdit
        Left = 454
      end
      inherited cmbRSocial: TArtComboBox
        Width = 269
      end
    end
    object dcbDesde: TDateComboBox
      Left = 90
      Top = 103
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object edObsMotivo: TEdit
      Left = 111
      Top = 157
      Width = 413
      Height = 21
      TabOrder = 4
    end
    object dcbHasta: TDateComboBox
      Left = 342
      Top = 103
      Width = 88
      Height = 21
      TabOrder = 3
    end
    inline fraMotivo: TfraCodigoDescripcion
      Left = 110
      Top = 132
      Width = 416
      Height = 23
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 351
      end
    end
  end
  object RxDBGrid1: TRxDBGrid [5]
    Left = 0
    Top = 405
    Width = 707
    Height = 200
    Align = alClient
    Constraints.MinHeight = 200
    DataSource = dsEstablecimientos
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'em_cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'co_contrato'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Raz'#243'n Social'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_nroestableci'
        Title.Alignment = taCenter
        Title.Caption = 'Estab.'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ep_tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo'
        Width = 35
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ciiu'
        Title.Alignment = taCenter
        Title.Caption = 'CIIU'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'es_cpostal'
        Title.Alignment = taCenter
        Title.Caption = 'CP'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'es_localidad'
        Title.Caption = 'Localidad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'provincia'
        Title.Alignment = taCenter
        Title.Caption = 'Provincia'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'it_nombre'
        Title.Alignment = taCenter
        Title.Caption = 'Preventor'
        Width = 150
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT re_id, em_id, em_cuit,'
      
        '       art.afiliacion.get_contratovigente (em_cuit, art.actualda' +
        'te) contrato,'
      '       em_nombre,'
      '       (SELECT cp.cp_tipo'
      '          FROM hys.hcp_carteraprevencion cp'
      '         WHERE TO_CHAR (cp.cp_fecha, '#39'YYYYMM'#39') = :periodo'
      '           AND cp.cp_idempresa = em_id) cp_tipo,'
      '       (SELECT cp.cp_ciiuviejo'
      '          FROM hys.hcp_carteraprevencion cp'
      '         WHERE TO_CHAR (cp.cp_fecha, '#39'YYYYMM'#39') = :periodo'
      '           AND cp.cp_idempresa = em_id) cp_ciiuviejo,'
      '       (SELECT cp.cp_capitas'
      '          FROM hys.hcp_carteraprevencion cp'
      '         WHERE TO_CHAR (cp.cp_fecha, '#39'YYYYMM'#39') = :periodo'
      '           AND cp.cp_idempresa = em_id) cp_capitas,'
      '       (SELECT ci_siniestralidadmedia'
      '          FROM hys.hci_ciiusiniestralidad'
      '         WHERE ci_ciiu='
      '                 (SUBSTR ((SELECT cp.cp_ciiuviejo'
      '                             FROM hys.hcp_carteraprevencion cp'
      
        '                            WHERE TO_CHAR (cp.cp_fecha, '#39'YYYYMM'#39 +
        ') = :periodo'
      '                              AND cp.cp_idempresa = em_id),'
      '                          1,'
      '                          1'
      '                         )'
      '                 )) incid_media,'
      '       TO_CHAR ((SELECT MAX (cp_fecha)'
      
        '                   FROM hys.hcp_carteraprevencion), '#39'YYYYMM'#39') ul' +
        'tperiodo,'
      '       (SELECT cp.cp_incidencia'
      '          FROM hys.hcp_carteraprevencion cp'
      '         WHERE TO_CHAR (cp.cp_fecha, '#39'YYYYMM'#39') = :periodo'
      '           AND cp.cp_idempresa = em_id) incidencia,'
      '       (SELECT cp.cp_incidencia'
      '          FROM hys.hcp_carteraprevencion cp'
      '         WHERE TO_CHAR (ADD_MONTHS (cp.cp_fecha, 1), '#39'YYYYMM'#39') ='
      
        '                                                             :pe' +
        'riodo'
      '           AND cp.cp_idempresa = em_id) incid_1,'
      '       (SELECT cp.cp_incidencia'
      '          FROM hys.hcp_carteraprevencion cp'
      '         WHERE TO_CHAR (ADD_MONTHS (cp.cp_fecha, 2), '#39'YYYYMM'#39') ='
      
        '                                                             :pe' +
        'riodo'
      '           AND cp.cp_idempresa = em_id) incid_2,'
      
        '       re_idranking, rk_descripcion, re_vigenciadesde, re_vigenc' +
        'iahasta,'
      '       re_motivobaja, re_motivoalta, re_fechabaja, re_fechaalta,'
      '       re_usualta, re_fechamodif, re_usumodif,'
      
        '       me.mv_descripcion motivoingreso, me.mv_descripcion motivo' +
        'egreso'
      '  FROM afi.aem_empresa,'
      '       hys.hre_rankingempresa,'
      '       hys.hrk_ranking,'
      '       hys.hmv_motivomoveas mi,'
      '       hys.hmv_motivomoveas me'
      ' WHERE em_id = re_idempresa'
      '   AND rk_id = re_idranking'
      '   AND mi.mv_id(+) = re_idmotivomoveasingreso'
      '   AND me.mv_id(+) = re_idmotivomoveasegreso'
      '   AND re_vigenciahasta IS NULL'
      '   AND re_fechabaja IS NULL'
      '   AND 1=2'
      '')
    Left = 466
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'periodo'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 494
    Top = 88
  end
  inherited SortDialog: TSortDialog
    Left = 466
    Top = 116
  end
  inherited ExportDialog: TExportDialog
    Left = 494
    Top = 116
  end
  inherited QueryPrint: TQueryPrint
    Left = 494
    Top = 144
  end
  inherited Seguridad: TSeguridad
    Left = 465
    Top = 60
  end
  inherited FormStorage: TFormStorage
    Left = 494
    Top = 60
  end
  inherited PrintDialog: TPrintDialog
    Left = 466
    Top = 144
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
        LinkControl = tbSalir
      end>
    Left = 522
    Top = 60
  end
  inherited FieldHider: TFieldHider
    Left = 522
    Top = 88
  end
  object dsEstablecimientos: TDataSource
    DataSet = sdqEstablecimientos
    Left = 116
    Top = 412
  end
  object sdqEstablecimientos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    DataSource = dsConsulta
    SQL.Strings = (
      
        'SELECT   em_cuit, co_contrato, aes.es_nombre, es_nroestableci, e' +
        'p_tipo,'
      '         es_cpostal, es_localidad, cac.ac_relacion ciiu,'
      
        '         art.getdescripcionprovincia (es_provincia) AS provincia' +
        ','
      '         pit.it_nombre'
      '    FROM comunes.cac_actividad cac,'
      '         art.pit_firmantes pit,'
      '         afi.aem_empresa aem,'
      '         afi.aes_establecimiento aes,'
      '         afi.aco_contrato aco,'
      '         hys.hep_estabporpreventor hep'
      '   WHERE hep.ep_cuit = aem.em_cuit'
      '     AND hep.ep_itcodigo = pit.it_codigo(+)'
      '     AND cac.ac_id = aes.es_idactividad'
      '     AND aem.em_id = aco.co_idempresa'
      '     AND aes.es_nroestableci = hep.ep_estableci'
      '     AND aco.co_contrato = aes.es_contrato'
      '     AND aco.co_estado = 1'
      
        '     AND aco.co_contrato = art.afiliacion.get_ultcontrato (em_cu' +
        'it)'
      '     AND aem.em_id = :em_id'
      '     AND aes.es_fechabaja IS NULL'
      '     AND ep_fechabaja IS NULL'
      'ORDER BY es_nroestableci'
      ''
      '')
    Left = 85
    Top = 412
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'em_id'
        ParamType = ptInput
      end>
  end
end
