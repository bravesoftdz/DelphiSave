inherited frmSeguimientoInvestigacion: TfrmSeguimientoInvestigacion
  Left = 218
  Top = 206
  Width = 670
  Height = 444
  Caption = 'Seguimiento Investigaci'#243'n'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 662
    Height = 148
    object lbCUITFiltro: TLabel
      Left = 28
      Top = 6
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    object Label11: TLabel
      Left = 9
      Top = 102
      Width = 63
      Height = 13
      Caption = 'Coordinador:'
    end
    object Label12: TLabel
      Left = 10
      Top = 80
      Width = 52
      Height = 13
      Caption = 'Preventor:'
    end
    object lbEstadoFiltro: TLabel
      Left = 28
      Top = 127
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label1: TLabel
      Left = 507
      Top = 127
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object Label2: TLabel
      Left = 372
      Top = 127
      Width = 30
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Desde'
    end
    object lbFecha: TLabel
      Left = 289
      Top = 127
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Denuncia'
    end
    inline fraTrabajadorSinGraveFiltro: TfraTrabajadorSinGrave
      Left = 27
      Top = 29
      Width = 623
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited lbSiniestro: TLabel
        Left = 331
        Width = 41
      end
      inherited lbNroDenSRT: TLabel
        Width = 81
      end
      inherited lbCUIL: TLabel
        Left = 0
        Width = 23
      end
      inherited Label1: TLabel
        Left = 0
      end
      inherited cmbNombre: TArtComboBox
        Width = 575
      end
      inherited edSiniestro: TSinEdit
        Left = 379
      end
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 75
      Top = 3
      Width = 573
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
      inherited lbContrato: TLabel
        Left = 469
      end
      inherited edContrato: TIntEdit
        Left = 516
      end
      inherited cmbRSocial: TArtComboBox
        Left = 128
        Width = 334
      end
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 74
      Top = 76
      Width = 390
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 325
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    inline fraCoordinadorFiltro: TfraCodigoDescripcion
      Left = 74
      Top = 99
      Width = 390
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Width = 325
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object cmbEstado: TCheckCombo
      Left = 75
      Top = 123
      Width = 210
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object edFechaDenunciaFiltroHasta: TDateEdit
      Left = 537
      Top = 124
      Width = 99
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 5
    end
    object edFechaDenunciaFiltroDesde: TDateEdit
      Left = 406
      Top = 124
      Width = 99
      Height = 21
      Anchors = [akTop, akRight]
      NumGlyphs = 2
      TabOrder = 6
    end
    object cbVerifFaltantes: TCheckBox
      Left = 467
      Top = 78
      Width = 153
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Con Verificaciones Faltantes'
      TabOrder = 7
    end
    object cbGrave: TCheckBox
      Left = 556
      Top = 102
      Width = 64
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Grave'
      TabOrder = 8
    end
    object cbPRAM: TCheckBox
      Left = 468
      Top = 102
      Width = 79
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Pram'
      TabOrder = 9
    end
  end
  inherited CoolBar: TCoolBar
    Top = 148
    Width = 662
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 658
      end>
    inherited ToolBar: TToolBar
      Width = 645
      object Panel1: TPanel
        Left = 370
        Top = 0
        Width = 234
        Height = 22
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 0
        object Label40: TLabel
          Left = 29
          Top = 4
          Width = 113
          Height = 13
          AutoSize = False
          Caption = 'Con Medidas Vencidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object pnlVencidas: TPanel
          Left = 11
          Top = 5
          Width = 12
          Height = 12
          Color = 16772801
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 177
    Width = 662
    Height = 233
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnGetCellParams = GridGetCellParams
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_NRODENUNCIASRT'
        Title.Caption = 'Denuncia SRT'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'Cuil'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREV'
        Title.Caption = 'Preventor'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Title.Caption = 'Coordinador'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERIFICACION1'
        Title.Caption = '1ra. Verificaci'#243'n'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERIFICACION2'
        Title.Caption = '2da. Verificaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERIFICACION3'
        Title.Caption = '3ra.Verificaci'#243'n'
        Width = 70
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    OnCalcFields = sdqConsultaCalcFields
    SQL.Strings = (
      'SELECT art.utiles.armar_siniestro (ex_siniestro,'
      '                                   ex_orden,'
      '                                   ex_recaida'
      '                                  ) siniestro,'
      
        '       ex_id, ex_recaida, co_contrato, em_cuit, em_nombre, tj_cu' +
        'il, tj_nombre,'
      
        '       dg_nrodenunciasrt, ga_id, prev.it_id id_prev, prev.it_nom' +
        'bre prev,'
      '       ga_idpreventor, cor.it_id id_cor, cor.it_nombre cor,'
      '       (SELECT COUNT(*)'
      '       FROM hys.pmc_medidacorrectiva'
      '       WHERE NOT EXISTS(SELECT 1'
      
        '                                    FROM hys.psv_seguimientovisi' +
        'ta'
      
        '                                   WHERE mc_id = sv_idmedidacorr' +
        'ectiva'
      '                                    AND sv_fechabaja IS NULL)'
      '         AND mc_fechabaja IS NULL'
      '         AND mc_idaccidenteestablecimiento = ae_id'
      '         AND mc_fechaverificacion < art.actualdate) vencida,'
      '       (SELECT   NVL (MAX (COUNT (sv_idmedidacorrectiva)), 0)'
      
        '            FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovi' +
        'sita'
      '           WHERE mc_idaccidenteestablecimiento = ae_id'
      '             AND mc_id = sv_idmedidacorrectiva(+)'
      '             AND sv_fechabaja IS NULL'
      '             AND mc_fechabaja IS NULL'
      '        GROUP BY sv_idmedidacorrectiva) maximo,'
      '       (SELECT   NVL (MIN (COUNT (sv_idmedidacorrectiva)), 0)'
      
        '            FROM hys.pmc_medidacorrectiva, hys.psv_seguimientovi' +
        'sita'
      '           WHERE mc_idaccidenteestablecimiento = ae_id'
      '             AND mc_id = sv_idmedidacorrectiva(+)'
      '             AND sv_fechabaja IS NULL'
      '             AND mc_fechabaja IS NULL'
      '        GROUP BY sv_idmedidacorrectiva) minimo'
      '  FROM art.cpv_provincias provdomic,'
      '       art.cpv_provincias provaccid,'
      '       art.cpv_provincias provinvest,'
      '       aco_contrato aco,'
      '       afi.adc_domiciliocontrato,'
      '       aem_empresa,'
      '       comunes.cac_actividad,'
      '       comunes.ctj_trabajador,'
      '       art.sex_expedientes sex,'
      '       SIN.sta_tipoaccidente,'
      '       SIN.ssa_solicitudasistencia,'
      '       SIN.stg_tipogravedad,'
      '       SIN.sde_denuncia,'
      '       art.cpr_prestador,'
      '       SIN.sdg_denunciagrave,'
      '       SIN.sud_ubicaciondenuncia,'
      '       art.pit_firmantes prev,'
      '       art.pit_firmantes cor,'
      '       pae_accidenteestablecimiento,'
      '       hys.heg_estadogestionaccidente,'
      '       hys.hga_gestionaccidente'
      ' WHERE ga_idexpediente = dg_idexpediente'
      '   AND dg_nroparte = 1'
      '   AND dc_contrato = co_contrato'
      '   AND dc_tipo = '#39'P'#39
      '   AND dg_idexpediente = ex_id'
      '   AND ex_cuit = em_cuit'
      '   AND aco.co_idempresa = em_id'
      '   AND aco.co_contrato ='
      
        '               art.afiliacion.get_contratovigente (ex_cuit, ex_f' +
        'echaaccidente)'
      '   AND prev.it_idsupervisor = cor.it_id(+)'
      '   AND ex_cuil = tj_cuil'
      '   AND sex.ex_tipo = ta_id'
      '   AND sex.ex_gravedad = tg_id'
      '   AND co_idactividad = ac_id'
      '   AND ga_idestado = eg_id'
      '   AND dg_nrodenunciasrt IS NOT NULL'
      '   AND ga_idaccidenteestab = ae_id(+)'
      '   AND ga_idpreventor = prev.it_id(+)'
      '   AND ex_id = sa_idexpediente(+)'
      '   AND ex_id = de_idexpediente(+)'
      '   AND ex_id = ud_idexpediente(+)'
      '   AND ud_provincia = provaccid.pv_codigo(+)'
      '   AND dc_provincia = provdomic.pv_codigo(+)'
      '   AND ga_provincia = provinvest.pv_codigo(+)'
      '   AND ca_identificador(+) = dg_idprestador')
    object sdqConsultaSINIESTRO: TStringField
      FieldName = 'SINIESTRO'
      Size = 4000
    end
    object sdqConsultaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
    object sdqConsultaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqConsultaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaDG_NRODENUNCIASRT: TStringField
      FieldName = 'DG_NRODENUNCIASRT'
      Size = 13
    end
    object sdqConsultaGA_ID: TFloatField
      FieldName = 'GA_ID'
      Required = True
    end
    object sdqConsultaID_PREV: TFloatField
      FieldName = 'ID_PREV'
    end
    object sdqConsultaPREV: TStringField
      FieldName = 'PREV'
      Size = 255
    end
    object sdqConsultaGA_IDPREVENTOR: TFloatField
      FieldName = 'GA_IDPREVENTOR'
    end
    object sdqConsultaID_COR: TFloatField
      FieldName = 'ID_COR'
    end
    object sdqConsultaCOR: TStringField
      FieldName = 'COR'
      Size = 255
    end
    object sdqConsultaVERIFICACION1: TStringField
      FieldKind = fkCalculated
      FieldName = 'VERIFICACION1'
      Calculated = True
    end
    object sdqConsultaVERIFICACION2: TStringField
      FieldKind = fkCalculated
      FieldName = 'VERIFICACION2'
      Calculated = True
    end
    object sdqConsultaMAXIMO: TFloatField
      FieldName = 'MAXIMO'
    end
    object sdqConsultaMINIMO: TFloatField
      FieldName = 'MINIMO'
    end
    object sdqConsultaVERIFICACION3: TStringField
      FieldKind = fkCalculated
      FieldName = 'VERIFICACION3'
      Size = 2
      Calculated = True
    end
    object sdqConsultaVENCIDA: TFloatField
      FieldName = 'VENCIDA'
    end
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
    Top = 256
  end
end
