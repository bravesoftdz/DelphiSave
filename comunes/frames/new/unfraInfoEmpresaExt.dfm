inherited fraInfoEmpresaExt: TfraInfoEmpresaExt
  Width = 334
  Height = 225
  ExplicitWidth = 334
  ExplicitHeight = 225
  DesignSize = (
    334
    225)
  inherited lbl_0: TLabel
    Top = 4
    Width = 118
    Caption = 'Entidad/Vendedor/Mant.'
    ExplicitTop = 4
    ExplicitWidth = 118
  end
  inherited lbl_2: TLabel
    Top = 36
    ExplicitTop = 36
  end
  inherited lbl_1: TLabel
    Top = 20
    ExplicitTop = 20
  end
  inherited lbl_4: TLabel
    Top = 100
    ExplicitTop = 100
  end
  inherited lbl_7: TLabel
    Top = 148
    ExplicitTop = 148
  end
  inherited lbl_5: TLabel
    Top = 116
    ExplicitTop = 116
  end
  inherited lblAdic_1: TLabel
    Left = 128
    Top = 20
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 20
    ExplicitWidth = 201
  end
  inherited lblAdic_2: TLabel
    Left = 128
    Top = 36
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 36
    ExplicitWidth = 201
  end
  inherited lblAdic_4: TLabel
    Left = 128
    Top = 100
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 100
    ExplicitWidth = 201
  end
  inherited lblAdic_5: TLabel
    Left = 128
    Top = 116
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 116
    ExplicitWidth = 201
  end
  inherited lblAdic_6: TLabel
    Left = 128
    Top = 132
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 132
    ExplicitWidth = 201
  end
  inherited lblAdic_8: TLabel
    Left = 128
    Top = 164
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 164
    ExplicitWidth = 201
  end
  inherited lbl_8: TLabel
    Top = 164
    ExplicitTop = 164
  end
  inherited lbl_6: TLabel
    Top = 132
    ExplicitTop = 132
  end
  inherited lblAdic_7: TLabel
    Left = 128
    Top = 148
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 148
    ExplicitWidth = 201
  end
  inherited lblAdic_3: TLabel
    Left = 128
    Top = 52
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 52
    ExplicitWidth = 201
  end
  inherited lbl_3: TLabel
    Top = 52
    ExplicitTop = 52
  end
  inherited lblAdic_0: TLabel
    Left = 128
    Top = 4
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 4
    ExplicitWidth = 201
  end
  inherited lbl_9: TLabel
    Top = 180
    Width = 116
    Caption = 'Siniestros Compensados'
    ExplicitTop = 180
    ExplicitWidth = 116
  end
  inherited lblAdic_9: TLabel
    Left = 128
    Top = 180
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 180
    ExplicitWidth = 201
  end
  inherited lbl_10: TLabel
    Top = 196
    ExplicitTop = 196
  end
  inherited lblAdic_10: TLabel
    Left = 128
    Top = 196
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 196
    ExplicitWidth = 201
  end
  inherited lbl_11: TLabel
    Left = 4
    Top = 84
    ExplicitLeft = 4
    ExplicitTop = 84
  end
  inherited lblAdic_11: TLabel
    Left = 128
    Top = 84
    Width = 201
    ExplicitLeft = 128
    ExplicitTop = 84
    ExplicitWidth = 201
  end
  object lbl_12: TLabel
    Left = 4
    Top = 68
    Width = 32
    Height = 13
    Caption = 'Litigios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAdic_12: TLabel
    Left = 128
    Top = 68
    Width = 201
    Height = 13
    Cursor = crHandPoint
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Ver...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblAdic_12Click
  end
  object Label98: TLabel
    Left = 4
    Top = 212
    Width = 64
    Height = 13
    Caption = 'Usuarios web'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAdic_13: TLabel
    Left = 128
    Top = 212
    Width = 201
    Height = 13
    Cursor = crHandPoint
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Ver...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblAdic_13Click
  end
  object sdqUsuariosWEB: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT DISTINCT nombre,'
      '                email,'
      '                cargo,'
      '                telefono,'
      '                estado,'
      '                principal,'
      '                adm_holding,'
      '                baja'
      '  FROM (SELECT uc_nombre AS nombre,'
      '               uc_email AS email,'
      '               uc_cargo AS cargo,'
      '               uc_telefonos AS telefono,'
      '               CASE ue_estado'
      '                 WHEN '#39'A'#39' THEN '#39'Activo'#39
      '                 WHEN '#39'P'#39' THEN '#39'Pendiente'#39
      '                 WHEN '#39'I'#39' THEN '#39'Inactivo'#39
      '                 WHEN '#39'S'#39' THEN '#39'Suspendido'#39
      '               END'
      '                 AS estado,'
      
        '               CASE WHEN uc_esadminempresa = '#39'S'#39' THEN '#39'Si'#39' ELSE ' +
        #39'No'#39' END AS principal,'
      '               CASE'
      '                 WHEN NVL ( (SELECT COUNT ( * )'
      '                               FROM web.wcu_contratosxusuarios w'
      
        '                              WHERE w.cu_idusuario = uc_id), 0) ' +
        '> 0'
      '                 THEN'
      '                   '#39'Si'#39
      '                 ELSE'
      '                   '#39'No'#39
      '               END'
      '                 AS adm_holding,'
      '               ue_fechabaja AS baja,'
      '               cu_contrato AS contrato'
      
        '          FROM web.wue_usuariosextranet, web.wuc_usuarioscliente' +
        's, web.wcu_contratosxusuarios'
      '         WHERE uc_idusuarioextranet = ue_id'
      '           AND cu_idusuario = uc_id)'
      ' WHERE contrato = :contrato')
    Left = 68
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqLitigios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT DISTINCT ljt_juicioentramite.jt_numerocarpeta "n'#250'mero car' +
        'peta",'
      
        '                ljt_juicioentramite.jt_fechanotificacionjuicio "' +
        'fecha notificaci'#243'n juicio",'
      '                lej_estadojuicio.ej_descripcion "estado juicio",'
      '                sex_expedientes.ex_siniestro siniestro,'
      '                sex_expedientes.ex_orden Orden,'
      '                sex_expedientes.ex_recaida recaida,'
      
        '                sex_expedientes.ex_fechaaccidente "fecha acciden' +
        'te",'
      
        '                /*TO_CHAR(ljt_juicioentramite.jt_importedemandad' +
        'o, '#39'$9,999,999,990.00'#39') "importe demandado",*/'
      
        '                ljt_juicioentramite.jt_importedemandado "Importe' +
        ' demandado",'
      '                ljt_juicioentramite.jt_demandante demandante,'
      '                ljt_juicioentramite.jt_demandado demandado,'
      '                lju_jurisdiccion.ju_descripcion "jurisdicci'#243'n",'
      
        '                art.legales.get_reclamo(lrt_reclamojuicioentrami' +
        'te.rt_idreclamo) reclamo,'
      '                /**aco_contrato.co_contrato contrato,*/'
      '                sex_expedientes.ex_cuit "c.u.i.t.",'
      '                aem_empresa.em_nombre nombre,'
      '                ctj_trabajador.tj_cuil "c.u.i.l.",'
      '                ctj_trabajador.tj_nombre "nombre accidentado",'
      
        '                ljt_juicioentramite.jt_fechafinjuicio "fecha fin' +
        ' juicio",'
      '                ljt_juicioentramite.jt_federal federal,'
      '                ljz_juzgado.jz_descripcion juzgado,'
      '                lfu_fuero.fu_descripcion fuero,'
      
        '                ljt_juicioentramite.jt_nroexpediente "nro. exped' +
        'iente",'
      
        '                ljt_juicioentramite.jt_anioexpediente "a'#241'o exped' +
        'iente",'
      '                lbo_abogado1.bo_nombre "abogado actor",'
      '                lbo_abogado.bo_nombre "estudio asignado",'
      
        '                ljt_juicioentramite.jt_importesentencia "importe' +
        ' sentencia"'
      '  FROM art.sex_expedientes sex_expedientes,'
      '       afi.aco_contrato aco_contrato,'
      '       afi.aem_empresa aem_empresa,'
      '       comunes.ctj_trabajador ctj_trabajador,'
      '       legales.lbo_abogado lbo_abogado,'
      '       legales.lej_estadojuicio lej_estadojuicio,'
      '       legales.lfu_fuero lfu_fuero,'
      '       legales.lju_jurisdiccion lju_jurisdiccion,'
      '       legales.ljz_juzgado ljz_juzgado,'
      '       legales.ljt_juicioentramite ljt_juicioentramite,'
      '       legales.lod_origendemanda lod_origendemanda,'
      
        '       legales.lrt_reclamojuicioentramite lrt_reclamojuicioentra' +
        'mite,'
      
        '       legales.lsj_siniestrosjuicioentramite lsj_siniestrosjuici' +
        'oentramite,'
      '       legales.lbo_abogado lbo_abogado1'
      ' WHERE ((aco_contrato.co_idempresa = aem_empresa.em_id)'
      '    AND (sex_expedientes.ex_cuit = aem_empresa.em_cuit)'
      
        '    AND (lej_estadojuicio.ej_id = ljt_juicioentramite.jt_idestad' +
        'o)'
      '    AND (lfu_fuero.fu_id = ljt_juicioentramite.jt_idfuero)'
      
        '    AND (ljt_juicioentramite.jt_id = lod_origendemanda.od_idjuic' +
        'ioentramite)'
      
        '    AND (lod_origendemanda.od_id = lsj_siniestrosjuicioentramite' +
        '.sj_idorigendemanda)'
      
        '    AND (lju_jurisdiccion.ju_id(+) = ljt_juicioentramite.jt_idju' +
        'risdiccion)'
      '    AND (ljz_juzgado.jz_id = ljt_juicioentramite.jt_idjuzgado)'
      
        '    AND (lbo_abogado.bo_id(+) = ljt_juicioentramite.jt_idabogado' +
        ')'
      
        '    AND (lsj_siniestrosjuicioentramite.sj_siniestro = sex_expedi' +
        'entes.ex_siniestro'
      
        '     AND lsj_siniestrosjuicioentramite.sj_orden = sex_expediente' +
        's.ex_orden'
      
        '     AND lsj_siniestrosjuicioentramite.sj_recaida = sex_expedien' +
        'tes.ex_recaida)'
      
        '    AND (lrt_reclamojuicioentramite.rt_idjuicioentramite(+) = lj' +
        't_juicioentramite.jt_id)'
      '    AND (lbo_abogado1.bo_id(+) = lod_origendemanda.od_idabogado)'
      '    AND (ctj_trabajador.tj_cuil = sex_expedientes.ex_cuil))'
      '   AND (ljt_juicioentramite.jt_estadomediacion = '#39'J'#39')'
      '   AND (lod_origendemanda.od_fechabaja IS NULL)'
      '   AND (lrt_reclamojuicioentramite.rt_fechabaja IS NULL)'
      '   AND (lsj_siniestrosjuicioentramite.sj_fechabaja IS NULL)'
      '   AND (sex_expedientes.ex_contrato = :contrato)')
    Left = 68
    Top = 104
    ParamData = <
      item
        DataType = ftWideString
        Name = 'contrato'
        ParamType = ptInput
        Value = '0'
      end>
  end
end
