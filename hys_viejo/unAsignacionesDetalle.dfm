inherited frmAsignacionesDetalle: TfrmAsignacionesDetalle
  Left = 480
  Top = 365
  Width = 550
  Height = 404
  Caption = 'Detalle CUIT/Preventores'
  KeyPreview = True
  OldCreateOrder = True
  OnKeyPress = FSFormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 542
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 542
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 538
      end>
    inherited ToolBar: TToolBar
      Width = 525
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 542
    Height = 311
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ESTABLECI'
        Title.Caption = 'Estab. Nro.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Estab. Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOSRT'
        Title.Caption = 'Tipo SRT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOPREVENCION'
        Title.Caption = 'Tipo Prev.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EP_ITCODIGO'
        Title.Caption = 'Firmante C'#243'd.'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_EMPLEADOS'
        Title.Caption = 'Empleados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOMICILIO'
        Title.Caption = 'Domicilio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_LOCALIDAD'
        Title.Caption = 'Localidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTAL'
        Title.Caption = 'CP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_CPOSTALA'
        Title.Caption = 'CPA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Riesgo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROV'
        Title.Caption = 'Provincia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_PROVINCIA'
        Title.Caption = 'Provincia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EE_DESCRIPCION'
        Title.Caption = 'Estado '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_CODIGO'
        Title.Caption = 'Actividad C'#243'digo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Actividad'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '                                   /*+ first_rows */ '
      '      aem.em_cuit, '
      '      aem.em_nombre, '
      '        ep_estableci, '
      '        aes.es_nombre, '
      '        ep_tipo tiposrt, '
      '        te_codigo tipoprevencion, '
      '        ep_itcodigo, '
      '        pit.it_nombre, '
      
        '        NVL (co_totempleadosactual, co_totempleados) AS rc_emple' +
        'ados, '
      '        art.afi.armar_domicilio ( '
      '                                 es_calle, '
      '                                 es_numero, '
      '                                 es_piso, '
      '                                 es_departamento, '
      '                                 es_localidad '
      '                                ) || '
      '        NVL2 ( '
      '              es_telefonos, '
      
        '              '#39' Tel.'#39' || (NVL (es_codareatelefonos, '#39#39') || es_te' +
        'lefonos), '
      '              '#39#39' '
      '             ) '
      '           AS domicilio, '
      '        es_localidad, '
      '        es_cpostal, '
      '        es_cpostala, '
      '        co_contrato, '
      '        ca_descripcion, '
      '        art.getdescripcionprovincia (es_provincia) AS prov, '
      '        es_provincia, '
      '        ee_descripcion, '
      '        cac.ac_codigo, '
      '        cac.ac_descripcion '
      '  FROM  afi.adc_domiciliocontrato ahdl, '
      '        hys.hep_estabporpreventor hep, '
      '        afi.aem_empresa aem, '
      '        afi.aco_contrato aco, '
      '        afi.aes_establecimiento aes, '
      '        comunes.cac_actividad cac, '
      '        afi.age_grupoeconomico age, '
      '        hys.hte_tipoempresaprev, '
      '        hys.hco_cuitoperativo hco, '
      '        hys.hee_estadoestab, '
      '        hys.hca_categoriariesgo hca, '
      '        art.pit_firmantes pit, '
      '        hys.hma_motivoasigprev hma, '
      '        hpd_preventores_data hpd '
      ' WHERE  co_contrato = art.get_vultcontrato (em_cuit) '
      '    AND ahdl.dc_contrato(+) = aco.co_contrato '
      '    AND ahdl.dc_tipo(+) = '#39'L'#39' '
      '    AND cac.ac_idcategoriariesgo = hca.ca_id(+) '
      '    AND aem.em_idgrupoeconomico = ge_id(+) '
      '    AND hep.ep_idempresa = aem.em_id '
      '    AND aem.em_id = aco.co_idempresa '
      '    AND aes.es_nroestableci = hep.ep_estableci '
      '    AND aco.co_contrato = aes.es_contrato '
      '    AND cac.ac_id = aes.es_idactividad '
      '    AND co_idtipoempresaprev = te_id(+) '
      '    AND hco.co_id(+) = ep_idcooperativo '
      '    AND hep.ep_idestado = ee_id '
      '    AND hma.ma_id(+) = hep.ep_motivoasignacion '
      '    AND hpd.pd_idhep = ep_id '
      '    AND pd_tipo_asignacion = '#39'A'#39' '
      '    AND pd_idfirmante = pit.it_id(+) '
      '    AND aes.es_fechabaja IS NULL '
      '    AND co_estado = '#39'1'#39' ')
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
    object sdqConsultaEP_ESTABLECI: TFloatField
      FieldName = 'EP_ESTABLECI'
      Required = True
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Required = True
      Size = 100
    end
    object sdqConsultaTIPOSRT: TStringField
      FieldName = 'TIPOSRT'
      Required = True
      Size = 2
    end
    object sdqConsultaTIPOPREVENCION: TStringField
      FieldName = 'TIPOPREVENCION'
      Size = 10
    end
    object sdqConsultaEP_ITCODIGO: TStringField
      FieldName = 'EP_ITCODIGO'
      Size = 12
    end
    object sdqConsultaIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Size = 255
    end
    object sdqConsultaRC_EMPLEADOS: TFloatField
      FieldName = 'RC_EMPLEADOS'
    end
    object sdqConsultaDOMICILIO: TStringField
      FieldName = 'DOMICILIO'
      Size = 4000
    end
    object sdqConsultaES_LOCALIDAD: TStringField
      FieldName = 'ES_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaES_CPOSTAL: TStringField
      FieldName = 'ES_CPOSTAL'
      Size = 5
    end
    object sdqConsultaES_CPOSTALA: TStringField
      FieldName = 'ES_CPOSTALA'
      Size = 8
    end
    object sdqConsultaCO_CONTRATO: TFloatField
      FieldName = 'CO_CONTRATO'
      Required = True
    end
    object sdqConsultaCA_DESCRIPCION: TStringField
      FieldName = 'CA_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaPROV: TStringField
      FieldName = 'PROV'
      Size = 4000
    end
    object sdqConsultaES_PROVINCIA: TStringField
      FieldName = 'ES_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqConsultaEE_DESCRIPCION: TStringField
      FieldName = 'EE_DESCRIPCION'
      Required = True
      Size = 255
    end
    object sdqConsultaAC_CODIGO: TStringField
      FieldName = 'AC_CODIGO'
      Required = True
      Size = 6
    end
    object sdqConsultaAC_DESCRIPCION: TStringField
      FieldName = 'AC_DESCRIPCION'
      Size = 200
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
  object cdsEstabPreventor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 188
    object cdsEstabPreventorEP_CUIT: TStringField
      FieldName = 'EP_CUIT'
    end
    object cdsEstabPreventorEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
    end
    object cdsEstabPreventorEP_ESTABLECI: TIntegerField
      FieldName = 'EP_ESTABLECI'
    end
    object cdsEstabPreventorES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
    end
  end
end
