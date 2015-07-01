inherited frmFFEPEnvios: TfrmFFEPEnvios
  Left = 220
  Top = 208
  Width = 880
  Height = 683
  Caption = 'Env'#237'os'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 870
    Height = 93
    object gbSiniestro: TGroupBox
      Left = 0
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
    object gbFechaEnvio: TGroupBox
      Left = 144
      Top = 0
      Width = 273
      Height = 45
      Caption = 'Fecha Env'#237'o'
      TabOrder = 1
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
    object gbCodigoAprobacion: TGroupBox
      Left = 424
      Top = 0
      Width = 117
      Height = 45
      Caption = 'C'#243'digo Aprobaci'#243'n'
      TabOrder = 2
      object edCodigoAp: TEdit
        Left = 8
        Top = 16
        Width = 101
        Height = 21
        TabOrder = 0
      end
    end
    object gbCodError: TGroupBox
      Left = 264
      Top = 44
      Width = 305
      Height = 45
      Caption = 'C'#243'digo Error'
      TabOrder = 3
      inline fraCodError: TfraCtbTablas
        Left = 6
        Top = 15
        Width = 295
        Height = 23
        TabOrder = 0
      end
    end
    object rgEstado: TRadioGroup
      Left = 1
      Top = 44
      Width = 261
      Height = 45
      Caption = 'Estado'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Aceptado'
        'Rechazado')
      TabOrder = 4
    end
  end
  inherited CoolBar: TCoolBar
    Top = 93
    Width = 870
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 866
      end>
    inherited ToolBar: TToolBar
      Width = 853
      inherited tbEliminar: TToolButton
        Enabled = True
        Visible = True
        OnClick = tbEliminarClick
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      object tbRespuesta: TToolButton
        Left = 370
        Top = 0
        Hint = 'Respuesta'
        Caption = 'Respuesta'
        ImageIndex = 22
        OnClick = tbRespuestaClick
      end
      object tbProcMens: TToolButton
        Left = 393
        Top = 0
        Hint = 'Proceso Mensual'
        Caption = 'Proceso Mensual'
        ImageIndex = 26
        OnClick = tbProcMensClick
      end
      object tbEnvJuicio: TToolButton
        Left = 416
        Top = 0
        Hint = 'Env'#237'o de Juicio'
        Caption = 'Env'#237'o de Juicio'
        ImageIndex = 25
        OnClick = tbEnvJuicioClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 122
    Width = 870
    Height = 532
    MultiSelect = True
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
        FieldName = 'COD_ART'
        Title.Caption = 'COD ART'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRO_SRT'
        Title.Caption = 'NRO SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRO_EXPTE'
        Title.Caption = 'NRO EXPTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PAGO'
        Title.Caption = 'COD PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_PRES'
        Title.Caption = 'TIPO PRES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Title.Caption = 'FECHA PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_FFEP'
        Title.Caption = 'MONTO FFEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_SRT'
        Title.Caption = 'CODIGO SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SENTENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPTE_JUD'
        Title.Caption = 'EXPTE JUD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_SEN'
        Title.Caption = 'TIPO SENTENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMP_FFEP'
        Title.Caption = 'IMPORTE FFEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10_1'
        Title.Caption = 'CIE10 1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10_2'
        Title.Caption = 'CIE10 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10_3'
        Title.Caption = 'CIE10 3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENFERMEDAD_HIPOACUSIA'
        Title.Caption = 'ENFERMEDAD HIPOACUSIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARACTER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VINCULO_LABORAL'
        Title.Caption = 'VINCULO LABORAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPINION_PREVIA'
        Title.Caption = 'OPINION PREVIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPINION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REVISION_M'#201'DICA'
        Title.Caption = 'REVISION M'#201'DICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTUDIOS_COMP'
        Title.Caption = 'ESTUDIOS COMP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INFORME_PERITO'
        Title.Caption = 'INFORME PERITO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA_BAREMO'
        Title.Caption = 'REFERENCIA BAREMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APLICACION_BAREMO'
        Title.Caption = 'APLICACION BAREMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FEC_ENVIO'
        Title.Caption = 'FECHA ENVIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_ERROR'
        Title.Caption = 'COD ERROR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ERROR'
        Title.Caption = 'DESCRIPCION'
        Visible = True
      end>
  end
  object fpBaja: TFormPanel [3]
    Left = 244
    Top = 148
    Width = 321
    Height = 185
    Caption = 'Dar de Baja'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      321
      185)
    object BevelAbm: TBevel
      Left = 4
      Top = 149
      Width = 313
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lblPeriodo: TLabel
      Left = 12
      Top = 17
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object lblObservacion: TLabel
      Left = 12
      Top = 63
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    object lblMotivo: TLabel
      Left = 92
      Top = 17
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptar: TButton
      Left = 163
      Top = 155
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 241
      Top = 155
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object mObservacion: TMemo
      Left = 12
      Top = 79
      Width = 293
      Height = 61
      Lines.Strings = (
        '')
      MaxLength = 100
      TabOrder = 2
    end
    object mskPeriodo: TMaskEdit
      Left = 12
      Top = 33
      Width = 63
      Height = 21
      EditMask = '!9999/99;0;_'
      MaxLength = 7
      TabOrder = 3
    end
    inline fraMotivo: TfraCtbTablas
      Left = 91
      Top = 32
      Width = 214
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 161
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT rl_siniestro Siniestro, rl_orden Orden, rl_recaida Recaid' +
        'a,'
      
        '       lf_codigo_art Cod_ART, lf_nrosiniestro Nro_SRT, lf_cuil C' +
        'uil, '
      
        '       lf_nro_expediente Nro_Expte, lf_cod_pago Cod_Pago, lf_tip' +
        'o_pres Tipo_pres,'
      
        '       lf_fecha_pago Fecha_Pago, lf_periodo Periodo, lf_monto Mo' +
        'nto, lf_monto_ffep Monto_Ffep,'
      
        '       lf_tipo_operacion Operacion, lf_codigo_aprobacion codigo_' +
        'srt, lf_motivo_operacion Motivo,'
      
        '       lf_observacion Observacion, lf_sentencia Sentencia, lf_ex' +
        'p_jud Expte_Jud, lf_tipo_sen Tipo_Sen,'
      
        '       lf_imp_feep Imp_Ffep, lf_cie10_1 Cie10_1,lf_cie10_2 Cie10' +
        '_2, lf_cie10_3 Cie10_3,'
      
        '       lf_enf_hipo Enfermedad_Hipoacusia, lf_caracter Caracter, ' +
        'lf_vinculo Vinculo_Laboral, '
      
        '       lf_opinion Opinion_Previa, lf_desc_opinion Opinion, lf_po' +
        'rcentaje Porcentaje,'
      
        '       lf_revision Revision_M'#233'dica, lf_estudios Estudios_Comp, l' +
        'f_perito Informe_Perito, '
      
        '       lf_ref_baremo Referencia_Baremo, lf_apl_baremo Aplicacion' +
        '_Baremo,'
      
        '       lf_fenvio Fec_Envio, lf_cod_error Codigo_Error, tb_descri' +
        'pcion Desc_Error'
      '  FROM srt.srl_relacion_pago_fondo,'
      '       srt.slf_log_envio_ffep,'
      '       art.ctb_tablas'
      ' WHERE lf_id = rl_idfondo'
      '   AND tb_clave (+) = '#39'ERSRT'#39
      '   AND tb_codigo (+) = ltrim(lf_cod_error)')
    object sdqConsultaSINIESTRO: TFloatField
      FieldName = 'SINIESTRO'
    end
    object sdqConsultaORDEN: TFloatField
      FieldName = 'ORDEN'
    end
    object sdqConsultaRECAIDA: TFloatField
      FieldName = 'RECAIDA'
    end
    object sdqConsultaCOD_ART: TStringField
      FieldName = 'COD_ART'
      FixedChar = True
      Size = 5
    end
    object sdqConsultaNRO_SRT: TStringField
      FieldName = 'NRO_SRT'
    end
    object sdqConsultaCUIL: TStringField
      FieldName = 'CUIL'
      Size = 11
    end
    object sdqConsultaNRO_EXPTE: TStringField
      FieldName = 'NRO_EXPTE'
      Size = 50
    end
    object sdqConsultaCOD_PAGO: TStringField
      FieldName = 'COD_PAGO'
      Size = 2
    end
    object sdqConsultaTIPO_PRES: TStringField
      FieldName = 'TIPO_PRES'
      FixedChar = True
      Size = 2
    end
    object sdqConsultaFECHA_PAGO: TStringField
      FieldName = 'FECHA_PAGO'
      Size = 8
    end
    object sdqConsultaPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 6
    end
    object sdqConsultaMONTO: TStringField
      FieldName = 'MONTO'
      Size = 40
    end
    object sdqConsultaMONTO_FFEP: TStringField
      FieldName = 'MONTO_FFEP'
      Size = 40
    end
    object sdqConsultaOPERACION: TStringField
      FieldName = 'OPERACION'
      Size = 1
    end
    object sdqConsultaCODIGO_SRT: TStringField
      FieldName = 'CODIGO_SRT'
      Size = 10
    end
    object sdqConsultaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 2
    end
    object sdqConsultaOBSERVACION: TStringField
      FieldName = 'OBSERVACION'
      Size = 100
    end
    object sdqConsultaSENTENCIA: TStringField
      FieldName = 'SENTENCIA'
      Size = 1
    end
    object sdqConsultaEXPTE_JUD: TStringField
      FieldName = 'EXPTE_JUD'
    end
    object sdqConsultaTIPO_SEN: TStringField
      FieldName = 'TIPO_SEN'
      Size = 2
    end
    object sdqConsultaIMP_FFEP: TStringField
      FieldName = 'IMP_FFEP'
      Size = 2
    end
    object sdqConsultaCIE10_1: TStringField
      FieldName = 'CIE10_1'
      Size = 4
    end
    object sdqConsultaCIE10_2: TStringField
      FieldName = 'CIE10_2'
      Size = 4
    end
    object sdqConsultaCIE10_3: TStringField
      FieldName = 'CIE10_3'
      Size = 4
    end
    object sdqConsultaENFERMEDAD_HIPOACUSIA: TStringField
      FieldName = 'ENFERMEDAD_HIPOACUSIA'
      Size = 1
    end
    object sdqConsultaCARACTER: TStringField
      FieldName = 'CARACTER'
      Size = 1
    end
    object sdqConsultaVINCULO_LABORAL: TStringField
      FieldName = 'VINCULO_LABORAL'
      Size = 1
    end
    object sdqConsultaOPINION_PREVIA: TStringField
      FieldName = 'OPINION_PREVIA'
      Size = 1
    end
    object sdqConsultaOPINION: TStringField
      FieldName = 'OPINION'
      Size = 2
    end
    object sdqConsultaPORCENTAJE: TStringField
      FieldName = 'PORCENTAJE'
      Size = 6
    end
    object sdqConsultaREVISION_MDICA: TStringField
      FieldName = 'REVISION_M'#201'DICA'
      Size = 1
    end
    object sdqConsultaESTUDIOS_COMP: TStringField
      FieldName = 'ESTUDIOS_COMP'
      Size = 1
    end
    object sdqConsultaINFORME_PERITO: TStringField
      FieldName = 'INFORME_PERITO'
      Size = 1
    end
    object sdqConsultaREFERENCIA_BAREMO: TStringField
      FieldName = 'REFERENCIA_BAREMO'
      Size = 1
    end
    object sdqConsultaAPLICACION_BAREMO: TStringField
      FieldName = 'APLICACION_BAREMO'
      Size = 1
    end
    object sdqConsultaFEC_ENVIO: TDateTimeField
      FieldName = 'FEC_ENVIO'
    end
    object sdqConsultaCODIGO_ERROR: TStringField
      FieldName = 'CODIGO_ERROR'
      Size = 12
    end
    object sdqConsultaDESC_ERROR: TStringField
      FieldName = 'DESC_ERROR'
      Size = 150
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
