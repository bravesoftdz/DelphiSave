inherited frmFFEPPagos: TfrmFFEPPagos
  Left = 251
  Top = 406
  Width = 883
  Height = 591
  Caption = 'Pagos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 875
    Height = 137
    object gbSiniestro: TGroupBox
      Left = 596
      Top = 0
      Width = 137
      Height = 45
      Caption = 'Siniestro'
      TabOrder = 0
      object edSiniestro: TSinEdit
        Left = 10
        Top = 17
        Width = 115
        Height = 21
        TabOrder = 0
      end
    end
    object gbEmpresa: TGroupBox
      Left = 0
      Top = 0
      Width = 593
      Height = 45
      Caption = 'Empresa'
      TabOrder = 1
      inline fraEmpresa1: TfraEmpresa
        Left = 12
        Top = 17
        Width = 566
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
      end
    end
    object gbFechaMarca: TGroupBox
      Left = 0
      Top = 45
      Width = 273
      Height = 45
      Caption = 'Fecha Marca'
      TabOrder = 2
      object Label1: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cbFechaMarcaDesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cbFechaMarcaHasta: TDateComboBox
        Left = 173
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbFechaDesmarca: TGroupBox
      Left = 276
      Top = 45
      Width = 273
      Height = 45
      Caption = 'Fecha Desmarca'
      TabOrder = 3
      object Label3: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cbFechaDesmarcaDesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cbFechaDesmarcaHasta: TDateComboBox
        Left = 173
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbConceptoPago: TGroupBox
      Left = 0
      Top = 90
      Width = 405
      Height = 45
      Caption = 'Concepto Pago'
      TabOrder = 4
      inline fraConceptoPago: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 357
        Height = 23
        TabOrder = 0
      end
    end
    object gbPeriodoImp: TGroupBox
      Left = 408
      Top = 90
      Width = 81
      Height = 45
      Caption = 'Periodo Imp'
      TabOrder = 5
      object mskPeriodo: TMaskEdit
        Left = 8
        Top = 16
        Width = 63
        Height = 21
        EditMask = '!9999/99;0;_'
        MaxLength = 7
        TabOrder = 0
      end
    end
    object gbFechaEnvio: TGroupBox
      Left = 552
      Top = 45
      Width = 273
      Height = 45
      Caption = 'Fecha Env'#237'o'
      TabOrder = 6
      object Label5: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label6: TLabel
        Left = 138
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object cbFechaEnvioDesde: TDateComboBox
        Left = 41
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object cbFechaEnvioHasta: TDateComboBox
        Left = 173
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 1
      end
    end
    object gbCodigoOperacion: TGroupBox
      Left = 492
      Top = 90
      Width = 141
      Height = 45
      Caption = 'C'#243'digo Operaci'#243'n'
      TabOrder = 7
      object edCodigoOp: TEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object rgTipoOperacion: TRadioGroup
      Left = 636
      Top = 90
      Width = 189
      Height = 45
      Caption = 'Tipo Operaci'#243'n'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Alta'
        'Baja')
      TabOrder = 8
    end
  end
  inherited CoolBar: TCoolBar
    Top = 137
    Width = 875
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 871
      end>
    inherited ToolBar: TToolBar
      Width = 858
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 166
    Width = 875
    Height = 395
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECAIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASEGURADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONPAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DENPAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE_LIQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE_FFEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEC_ENVIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUI_LEGAL'
        Title.Caption = 'LIQ. LEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIO'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   rl_siniestro siniestro, rl_orden orden, rl_recaida reca' +
        'ida,'
      
        '         rl_numliqui liquidacion, NULL volante, le_faprobado fec' +
        'ha_pago,'
      '         lf_periodo periodo, ex_contrato contrato, ex_cuit cuit,'
      
        '         em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador' +
        ','
      
        '         le_conpago conpago, cp_denpago denpago, le_imporperi im' +
        'porte_liq,'
      '         lf_factor_hipo * le_imporperi importe_ffep,'
      '         lf_codigo_aprobacion codigo_srt, lf_fenvio fec_envio,'
      
        '         lf_tipo_operacion operacion, NULL liqui_legal, NULL jui' +
        'cio'
      '    FROM art.sle_liquiempsin,'
      '         aem_empresa,'
      '         ctj_trabajador,'
      '         art.sex_expedientes,'
      '         srt.srl_relacion_pago_fondo,'
      '         srt.slf_log_envio_ffep,'
      '         art.scp_conpago'
      '   WHERE ex_recaida = 0'
      '     AND ex_orden = 1'
      '     AND ex_siniestro = 485171'
      '     AND lf_cod_error IS NULL'
      '     AND lf_id = rl_idfondo'
      '     AND rl_numliqui IS NOT NULL'
      '     AND tj_cuil = ex_cuil'
      '     AND em_cuit = ex_cuit'
      '     AND rl_siniestro = le_siniestro'
      '     AND rl_orden = le_orden'
      '     AND rl_recaida = le_recaida'
      '     AND rl_numliqui = le_numliqui'
      '     AND le_siniestro = ex_siniestro'
      '     AND le_orden = ex_orden'
      '     AND le_recaida = ex_recaida'
      '     AND cp_conpago = le_conpago'
      'UNION ALL'
      
        'SELECT   rl_siniestro siniestro, rl_orden orden, rl_recaida reca' +
        'ida,'
      
        '         NULL liquidacion, iv_volante volante, vo_fechapago fech' +
        'a_pago,'
      '         lf_periodo periodo, ex_contrato contrato, ex_cuit cuit,'
      
        '         em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador' +
        ','
      
        '         iv_conpago conpago, cp_denpago denpago, iv_impfacturado' +
        ' importe_liq,'
      
        '         iv_impfacturado importe_ffep, lf_codigo_aprobacion codi' +
        'go_srt,'
      
        '         lf_fenvio fec_envio, lf_tipo_operacion operacion, NULL ' +
        'liqui_legal,'
      '         NULL juicio'
      '    FROM art.siv_itemvolante,'
      '         art.svo_volantes,'
      '         aem_empresa,'
      '         ctj_trabajador,'
      '         art.sex_expedientes,'
      '         srt.srl_relacion_pago_fondo,'
      '         srt.slf_log_envio_ffep,'
      '         art.scp_conpago'
      '   WHERE ex_recaida = 0'
      '     AND ex_orden = 1'
      '     AND ex_siniestro = 485171'
      '     AND lf_cod_error IS NULL'
      '     AND lf_id = rl_idfondo'
      '     AND rl_numpago IS NOT NULL'
      '     AND tj_cuil = ex_cuil'
      '     AND em_cuit = ex_cuit'
      '     AND rl_siniestro = iv_siniestro'
      '     AND rl_orden = iv_orden'
      '     AND rl_recaida = iv_recaida'
      '     AND rl_numpago = iv_numpago'
      '     AND iv_siniestro = ex_siniestro'
      '     AND iv_orden = ex_orden'
      '     AND iv_recaida = ex_recaida'
      '     AND cp_conpago = iv_conpago'
      '     AND iv_volante = vo_volante'
      'UNION ALL'
      
        'SELECT   rl_siniestro siniestro, rl_orden orden, rl_recaida reca' +
        'ida,'
      
        '         rl_numotro liquidacion, NULL volante, pr_faprobado fech' +
        'a_pago,'
      '         lf_periodo periodo, ex_contrato contrato, ex_cuit cuit,'
      
        '         em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador' +
        ','
      
        '         pr_conpago conpago, cp_denpago denpago, pr_imporpago im' +
        'porte_liq,'
      
        '         pr_imporpago importe_ffep, lf_codigo_aprobacion codigo_' +
        'srt,'
      
        '         lf_fenvio fec_envio, lf_tipo_operacion operacion, NULL ' +
        'liqui_legal,'
      '         NULL juicio'
      '    FROM art.spr_pagoexpesin,'
      '         aem_empresa,'
      '         ctj_trabajador,'
      '         art.sex_expedientes,'
      '         srt.srl_relacion_pago_fondo,'
      '         srt.slf_log_envio_ffep,'
      '         art.scp_conpago'
      '   WHERE ex_recaida = 0'
      '     AND ex_orden = 1'
      '     AND ex_siniestro = 485171'
      '     AND lf_cod_error IS NULL'
      '     AND lf_id = rl_idfondo'
      '     AND rl_numotro IS NOT NULL'
      '     AND tj_cuil = ex_cuil'
      '     AND em_cuit = ex_cuit'
      '     AND rl_siniestro = pr_siniestro'
      '     AND rl_orden = pr_orden'
      '     AND rl_recaida = pr_recaida'
      '     AND rl_numotro = pr_numpago'
      '     AND pr_siniestro = ex_siniestro'
      '     AND pr_orden = ex_orden'
      '     AND pr_recaida = ex_recaida'
      '     AND cp_conpago = pr_conpago'
      'UNION ALL'
      
        'SELECT   rl_siniestro siniestro, rl_orden orden, rl_recaida reca' +
        'ida,'
      
        '         NULL liquidacion, NULL volante, pl_fechaaprobado fecha_' +
        'pago,'
      '         lf_periodo periodo, ex_contrato contrato, ex_cuit cuit,'
      
        '         em_nombre asegurado, ex_cuil cuil, tj_nombre trabajador' +
        ','
      
        '         pl_conpago conpago, cp_denpago denpago, pl_importepago ' +
        'importe_liq,'
      
        '         pl_importepago importe_ffep, lf_codigo_aprobacion codig' +
        'o_srt,'
      '         lf_fenvio fec_envio, lf_tipo_operacion operacion,'
      '         pl_numpago liqui_legal, jt_numerocarpeta juicio'
      '    FROM legales.lpl_pagolegal,'
      '         aem_empresa,'
      '         ctj_trabajador,'
      '         art.sex_expedientes,'
      '         srt.srl_relacion_pago_fondo,'
      '         srt.slf_log_envio_ffep,'
      '         art.scp_conpago,'
      '         legales.ljt_juicioentramite jt,'
      '         legales.lod_origendemanda od,'
      '         legales.lsj_siniestrosjuicioentramite sj'
      '   WHERE ex_recaida = 0'
      '     AND ex_orden = 1'
      '     AND ex_siniestro = 485171'
      '     AND lf_cod_error IS NULL'
      '     AND lf_id = rl_idfondo'
      '     AND rl_idlegal IS NOT NULL'
      '     AND tj_cuil = ex_cuil'
      '     AND em_cuit = ex_cuit'
      '     AND rl_idlegal = pl_id'
      '     AND rl_siniestro = ex_siniestro'
      '     AND rl_orden = ex_orden'
      '     AND rl_recaida = ex_recaida'
      '     AND cp_conpago = pl_conpago'
      '     AND jt.jt_id = od.od_idjuicioentramite'
      '     AND od.od_id = sj.sj_idorigendemanda'
      '     AND pl_idjuicioentramite = od.od_idjuicioentramite'
      'ORDER BY fec_envio')
    object sdqConsultaSINIESTRO: TFloatField
      FieldName = 'SINIESTRO'
    end
    object sdqConsultaORDEN: TFloatField
      FieldName = 'ORDEN'
    end
    object sdqConsultaRECAIDA: TFloatField
      FieldName = 'RECAIDA'
    end
    object sdqConsultaLIQUIDACION: TFloatField
      FieldName = 'LIQUIDACION'
    end
    object sdqConsultaVOLANTE: TFloatField
      FieldName = 'VOLANTE'
    end
    object sdqConsultaFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
    end
    object sdqConsultaPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 6
    end
    object sdqConsultaCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
    object sdqConsultaASEGURADO: TStringField
      FieldName = 'ASEGURADO'
      Size = 200
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 11
    end
    object sdqConsultaTRABAJADOR: TStringField
      FieldName = 'TRABAJADOR'
      Size = 60
    end
    object sdqConsultaCONPAGO: TFloatField
      FieldName = 'CONPAGO'
    end
    object sdqConsultaDENPAGO: TStringField
      FieldName = 'DENPAGO'
      Size = 40
    end
    object sdqConsultaIMPORTE_LIQ: TFloatField
      FieldName = 'IMPORTE_LIQ'
    end
    object sdqConsultaIMPORTE_FFEP: TFloatField
      FieldName = 'IMPORTE_FFEP'
    end
    object sdqConsultaCODIGO_SRT: TStringField
      FieldName = 'CODIGO_SRT'
      Size = 10
    end
    object sdqConsultaFEC_ENVIO: TDateTimeField
      FieldName = 'FEC_ENVIO'
    end
    object sdqConsultaOPERACION: TStringField
      FieldName = 'OPERACION'
      Size = 1
    end
    object sdqConsultaLIQUI_LEGAL: TFloatField
      FieldName = 'LIQUI_LEGAL'
    end
    object sdqConsultaJUICIO: TFloatField
      FieldName = 'JUICIO'
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
end
