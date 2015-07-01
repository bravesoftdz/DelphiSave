inherited frmControlEnfermedades: TfrmControlEnfermedades
  Left = 306
  Top = 139
  Width = 906
  Height = 612
  Caption = 'Tablero de Control Enfermedades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 136
    Width = 898
    DesignSize = (
      898
      13)
    inherited lbColor2: TLabel
      Left = 226
    end
    inherited lbColor3: TLabel
      Left = 341
      Visible = False
    end
    inherited lbColor1: TLabel
      Left = 161
    end
    inherited Label24: TLabel
      Left = 114
    end
    inherited Label25: TLabel
      Left = 463
    end
    inherited Label22: TLabel
      Left = 516
    end
    inherited Label3: TLabel
      Left = 609
    end
    inherited Label5: TLabel
      Left = 756
    end
    inherited Label7: TLabel
      Left = 842
    end
    inherited pnlColor3: TPanel
      Left = 328
      Visible = False
    end
    inherited pnlColor2: TPanel
      Left = 212
    end
    inherited pnlColor1: TPanel
      Left = 149
    end
    inherited pnlColor4: TPanel
      Left = 504
    end
    inherited pnlColor5: TPanel
      Left = 596
    end
    inherited pnlColor6: TPanel
      Left = 743
    end
    inherited pnlColor7: TPanel
      Left = 826
    end
  end
  inherited pnlFiltros: TPanel
    Width = 898
    Height = 107
    inherited pcFiltros: TPageControl
      Width = 898
      Height = 107
      inherited tbGeneral: TTabSheet
        DesignSize = (
          890
          79)
        inherited lbCUITFiltro: TLabel
          Left = 4
          Top = 8
        end
        inherited lbEstadoFiltro: TLabel
          Left = 4
          Top = 32
        end
        inherited lbFechaAccidenteFiltro: TLabel
          Left = 415
          Top = 32
          Width = 57
          Caption = 'F.Accidente'
        end
        inherited Label4: TLabel
          Left = 4
          Top = 56
        end
        object lbFechaVencimiento: TLabel [4]
          Left = 583
          Top = 32
          Width = 67
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'F.Vencimiento'
        end
        object Label6: TLabel [5]
          Left = 755
          Top = 32
          Width = 26
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'hasta'
        end
        object Label11: TLabel [6]
          Left = 750
          Top = 59
          Width = 40
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Siniestro'
        end
        inherited fraEmpresaFiltro: TfraEmpresa
          Left = 56
          Top = 4
          Width = 830
          DesignSize = (
            830
            21)
          inherited lbContrato: TLabel
            Left = 726
          end
          inherited edContrato: TIntEdit
            Left = 773
          end
          inherited cmbRSocial: TArtComboBox
            Width = 591
          end
        end
        inherited edFechaAccidenteFiltro: TDateEdit
          Left = 478
          TabOrder = 2
        end
        inherited fraPreventorFiltro: TfraCodigoDescripcion
          Left = 56
          Top = 52
          Width = 519
          TabOrder = 5
          DesignSize = (
            519
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 454
          end
        end
        inherited cmbEstado: TCheckCombo
          Left = 56
          Top = 28
          Width = 354
          TabOrder = 1
        end
        inherited cbVencidos: TCheckBox
          Left = 585
          Top = 56
          TabOrder = 6
        end
        object cbGPBA: TCheckBox
          Left = 661
          Top = 56
          Width = 73
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'S'#243'lo GPBA'
          TabOrder = 7
        end
        object edFechaVencimientoFiltro: TDateEdit
          Left = 653
          Top = 28
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 3
        end
        object edFechaVencimientoFiltroHasta: TDateEdit
          Left = 789
          Top = 28
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 4
        end
        object edSiniestroFiltro: TSinEdit
          Left = 804
          Top = 55
          Width = 82
          Height = 21
          Hint = 'C'#243'digo de Siniestro '
          Anchors = [akTop, akRight]
          TabOrder = 8
          ViewStyle = [etSiniestro, etOrden]
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 107
    Width = 898
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 894
      end>
    inherited ToolBar: TToolBar
      Width = 881
    end
  end
  inherited Grid: TArtDBGrid
    Top = 149
    Width = 898
    Height = 436
    TabOrder = 1
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
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 241
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'CUIL'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EG_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FECHAASIGPREV'
        Title.Caption = 'Fecha Asignaci'#243'n Preventor'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FECHAVENCINV'
        Title.Caption = 'Fecha Vencimiento Investigaci'#243'n'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FECHACIERRE'
        Title.Caption = 'Fecha de Cierre'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_rechazo'
        Title.Caption = 'F.Rev.Rechazo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_aceptacion'
        Title.Caption = 'F.Aceptaci'#243'n'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_siniestro'
        Title.Caption = 'Tipo Siniestro'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAINVESTIGACION'
        Title.Caption = 'Fecha de Investigaci'#243'n'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        Title.Caption = 'C'#243'd. CIE10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCIE10'
        Title.Caption = 'Desc. CIE10'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'Nro. Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Nombre Estab.'
        Width = 120
        Visible = True
      end>
  end
  inherited fpCambioNoInvestigar: TFormPanel
    Left = 302
    Top = 625
  end
  inherited fpAbm: TFormPanel
    Left = 205
    Top = 208
    inherited PageControl: TPageControl
      inherited tbSiniestro: TTabSheet
        inherited ScrollBox: TScrollBox
          VertScrollBar.Position = 247
          inherited gbDatosEmpresa: TGroupBox
            Top = -247
          end
          inherited gbDatosTrabajador: TGroupBox
            Top = -86
            inherited Label1: TLabel
              Left = 6
              Top = 68
            end
            inherited lbTelefono: TLabel
              Left = 6
              Top = 88
            end
            inherited lbCalle: TLabel
              Left = 6
            end
            object Label12: TLabel [3]
              Left = 7
              Top = 47
              Width = 60
              Height = 13
              AutoSize = False
              Caption = 'CIE-10'
            end
            inherited fraDomicilioAccidente: TfraDomicilio
              Left = 6
              Top = 110
              inherited cmbLocalidad: TArtComboBox
                Height = 22
              end
            end
            inherited edTelefonoAccidente: TPatternEdit
              Left = 59
              Top = 84
            end
            inline fraCIE10: TfraCDG_DIAGNOSTICO
              Left = 58
              Top = 40
              Width = 615
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              inherited cmbDescripcion: TComboGrid
                Width = 552
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
          inherited GroupBox1: TGroupBox
            Top = 78
            Height = 42
            inherited lbFechaAccidente: TLabel
              Left = 7
            end
            inherited edFechaAccidente: TDateEdit
              Left = 107
            end
          end
          inherited gbDescripciones: TGroupBox
            Top = 120
            Height = 314
            DesignSize = (
              678
              314)
            inherited lbDescripcionOtros: TLabel
              Top = 196
            end
            inherited lbObservacionOtros: TLabel
              Top = 258
            end
            inherited edDescripcionOtros: TMemo
              Top = 194
            end
            inherited edObservacionOtros: TMemo
              Top = 256
            end
          end
        end
      end
      inherited tbInvestigacion: TTabSheet
        inherited ScrollBox1: TScrollBox
          inherited gbLugarAccidenteInvestigado: TGroupBox
            inherited fraDomicilioAccidenteInvestigado: TfraDomicilio
              inherited lbNro: TLabel
                Left = 454
              end
              inherited lbPiso: TLabel
                Left = 526
              end
              inherited lbDto: TLabel
                Left = 602
              end
              inherited cmbCalle: TArtComboBox
                Width = 362
              end
              inherited edNumero: TEdit
                Left = 476
              end
              inherited edPiso: TEdit
                Left = 552
              end
              inherited edDto: TEdit
                Left = 624
              end
              inherited btnBuscar: TButton
                Left = 419
              end
            end
          end
          inherited GroupBox2: TGroupBox
            inherited fraDomicilioEstablecimiento: TfraDomicilio
              inherited lbNro: TLabel
                Left = 454
              end
              inherited lbPiso: TLabel
                Left = 526
              end
              inherited lbDto: TLabel
                Left = 602
              end
              inherited cmbCalle: TArtComboBox
                Width = 361
              end
              inherited edNumero: TEdit
                Left = 476
              end
              inherited edPiso: TEdit
                Left = 552
              end
              inherited edDto: TEdit
                Left = 624
              end
              inherited btnBuscar: TButton
                Left = 419
              end
            end
          end
          inherited GroupBox3: TGroupBox
            object cbPRAMinv: TCheckBox
              Left = 619
              Top = 16
              Width = 51
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'PRAM'
              TabOrder = 3
            end
          end
        end
      end
    end
    inherited ToolBar1: TToolBar
      Visible = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, ex_id, ex_recaida, ex_siniestro, ex_orden,'
      
        '       co_contrato, em_cuit, em_nombre, tj_cuil, tj_nombre, ga_i' +
        'd, ga_idexpediente,'
      
        '       NVL(ex_fecharecaida, ex_fechaaccidente) fechaaccidente, t' +
        'a_descripcion, it_nombre, eg_descripcion, ud_calle, ud_numero,'
      
        '       ex_diagnosticooms, ga_fechavencinv, ud_piso, ud_departame' +
        'nto, ud_cpostal, ud_cpostala, ud_localidad, ud_provincia,'
      '       ex_fecharecaida, ex_fechaaccidente, (SELECT ee_fecha'
      
        '                                              FROM hys.pee_enfer' +
        'medadestablecimiento'
      
        '                                             WHERE ee_idexpedien' +
        'te = ex_id'
      
        '                                               AND ee_fechabaja ' +
        'IS NULL) AS fechainvestigacion,'
      '       provaccid.pv_descripcion AS provinciaaccidente,'
      
        '       art.utiles.armar_telefono(ud_codareatelefonos, NULL, ud_t' +
        'elefonos) AS telaccidente, dc_calle, dc_numero, dc_piso,'
      
        '       dc_departamento, dc_cpostal, dc_cpostala, dc_localidad, d' +
        'c_provincia, provdomic.pv_descripcion AS provinciaemp,'
      
        '       art.utiles.armar_telefono(dc_codareatelefonos, NULL, dc_t' +
        'elefonos) AS teldomicilio, ac_relacion, ac_descripcion,'
      
        '       ex_brevedescripcion, ex_observaciones, de_descripcion, de' +
        '_observaciones, sa_descripcion, sa_observaciones, ga_calle,'
      
        '       ga_numero, ga_piso, ga_departamento, ga_pram, ga_cpostal,' +
        ' ga_cpostala, ga_localidad, ga_provincia,'
      
        '       provinvest.pv_descripcion AS provinciainvestigacion, ga_i' +
        'destado, ga_idaccidenteestab, ga_observaciones, ga_idpreventor,'
      '       ga_fechaasigprev, ga_fechacierre, ga_idestablecimiento,'
      '       (SELECT MIN(es_fechaalta)'
      '          FROM art.ses_estadossiniestros ses1'
      '         WHERE es_idexpediente = ex_id'
      '           AND es_fechaalta > (SELECT MAX(ses2.es_fechaalta)'
      
        '                                 FROM art.ses_estadossiniestros ' +
        'ses2'
      
        '                                WHERE ses2.es_idexpediente = ses' +
        '1.es_idexpediente'
      
        '                                  AND ses2.es_estado = '#39'03'#39')) fe' +
        'cha_rechazo,'
      
        '       DECODE(ex_rechazomed, '#39'R'#39', TO_DATE(NULL), NVL(ex_frechazo' +
        'med, ex_frechazosin)) fecha_aceptacion,'
      '       tb_descripcion tipo_siniestro,'
      '       (SELECT TRUNC(hpp1.hp_fechaalta)'
      '          FROM hys.hhp_historicopreventorasignado hpp1'
      '         WHERE hpp1.hp_idgestionaccidente = ga_id'
      
        '           AND hpp1.hp_fechaalta = (SELECT MAX(hpp2.hp_fechaalta' +
        ')'
      
        '                                      FROM hys.hhp_historicoprev' +
        'entorasignado hpp2'
      
        '                                     WHERE hpp2.hp_idgestionacci' +
        'dente = ga_id)) fecha_asignacion,'
      '       dg_descripcion descie10, es_nroestableci, es_nombre'
      
        '  FROM afi.age_grupoeconomico age, afi.aes_establecimiento, art.' +
        'cdg_diagnostico, art.ctb_tablas, art.cpv_provincias provdomic,'
      
        '       art.cpv_provincias provaccid, art.cpv_provincias provinve' +
        'st, aco_contrato aco, afi.adc_domiciliocontrato,'
      
        '       aem_empresa aem, comunes.cac_actividad, comunes.ctj_traba' +
        'jador, art.sex_expedientes sex, SIN.sta_tipoaccidente,'
      
        '       SIN.ssa_solicitudasistencia, SIN.sde_denuncia, SIN.sud_ub' +
        'icaciondenuncia, art.pit_firmantes,'
      '       hys.heg_estadogestionaccidente, hys.hga_gestionaccidente'
      ' WHERE age.ge_id(+) = em_idgrupoeconomico'
      '   AND tb_clave(+) = '#39'STIPO'#39
      '   AND tb_codigo(+) = ex_tipo'
      '   AND ga_idexpediente = ex_id'
      '   AND dc_contrato = co_contrato'
      '   AND dc_tipo = '#39'P'#39
      '   AND ex_cuit = em_cuit'
      '   AND em_cuit <> '#39'30584620389'#39
      '   AND aco.co_estado = 1'
      '   AND aco.co_idempresa = em_id'
      '   AND ex_cuil = tj_cuil'
      '   AND sex.ex_tipo = TO_CHAR(ta_id)'
      '   AND co_idactividad = ac_id'
      '   AND ga_idestado = eg_id'
      '   AND ga_idpreventor = it_id(+)'
      '   AND ex_id = sa_idexpediente(+)'
      '   AND ex_id = de_idexpediente(+)'
      '   AND ex_id = ud_idexpediente(+)'
      '   AND ud_provincia = provaccid.pv_codigo(+)'
      '   AND dc_provincia = provdomic.pv_codigo(+)'
      '   AND ga_tipogestion LIKE '#39'%E%'#39
      '   AND ga_idestablecimiento = es_id(+)'
      '   AND dg_codigo = ex_diagnosticooms'
      '   AND ga_provincia = provinvest.pv_codigo(+)'
      '   AND ga_idestado + 0 IN(1, 2, 3, 4, 6)'
      '   AND NVL(ge_codigo, '#39' '#39') <> '#39'GBA'#39
      'AND 1=2')
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
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
    object sdqConsultaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqConsultaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
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
    object sdqConsultaGA_ID: TFloatField
      FieldName = 'GA_ID'
      Required = True
    end
    object sdqConsultaGA_IDEXPEDIENTE: TFloatField
      FieldName = 'GA_IDEXPEDIENTE'
    end
    object sdqConsultaFECHAACCIDENTE: TDateTimeField
      FieldName = 'FECHAACCIDENTE'
    end
    object sdqConsultaTA_DESCRIPCION: TStringField
      FieldName = 'TA_DESCRIPCION'
      Required = True
      Size = 25
    end
    object sdqConsultaIT_NOMBRE: TStringField
      FieldName = 'IT_NOMBRE'
      Size = 255
    end
    object sdqConsultaEG_DESCRIPCION: TStringField
      FieldName = 'EG_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqConsultaUD_CALLE: TStringField
      FieldName = 'UD_CALLE'
      Size = 60
    end
    object sdqConsultaUD_NUMERO: TStringField
      FieldName = 'UD_NUMERO'
    end
    object sdqConsultaGA_FECHAVENCINV: TDateTimeField
      FieldName = 'GA_FECHAVENCINV'
    end
    object sdqConsultaUD_PISO: TStringField
      FieldName = 'UD_PISO'
    end
    object sdqConsultaUD_DEPARTAMENTO: TStringField
      FieldName = 'UD_DEPARTAMENTO'
    end
    object sdqConsultaUD_CPOSTAL: TStringField
      FieldName = 'UD_CPOSTAL'
      Size = 5
    end
    object sdqConsultaUD_CPOSTALA: TStringField
      FieldName = 'UD_CPOSTALA'
      Size = 8
    end
    object sdqConsultaUD_LOCALIDAD: TStringField
      FieldName = 'UD_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaUD_PROVINCIA: TStringField
      FieldName = 'UD_PROVINCIA'
      Size = 2
    end
    object sdqConsultaFECHAINVESTIGACION: TDateTimeField
      FieldName = 'FECHAINVESTIGACION'
    end
    object sdqConsultaPROVINCIAACCIDENTE: TStringField
      FieldName = 'PROVINCIAACCIDENTE'
      Size = 50
    end
    object sdqConsultaTELACCIDENTE: TStringField
      FieldName = 'TELACCIDENTE'
      Size = 4000
    end
    object sdqConsultaDC_CALLE: TStringField
      FieldName = 'DC_CALLE'
      Required = True
      Size = 60
    end
    object sdqConsultaDC_NUMERO: TStringField
      FieldName = 'DC_NUMERO'
      Required = True
    end
    object sdqConsultaDC_PISO: TStringField
      FieldName = 'DC_PISO'
    end
    object sdqConsultaDC_DEPARTAMENTO: TStringField
      FieldName = 'DC_DEPARTAMENTO'
    end
    object sdqConsultaDC_CPOSTAL: TStringField
      FieldName = 'DC_CPOSTAL'
      Required = True
      Size = 5
    end
    object sdqConsultaDC_CPOSTALA: TStringField
      FieldName = 'DC_CPOSTALA'
      Size = 8
    end
    object sdqConsultaDC_LOCALIDAD: TStringField
      FieldName = 'DC_LOCALIDAD'
      Required = True
      Size = 60
    end
    object sdqConsultaDC_PROVINCIA: TStringField
      FieldName = 'DC_PROVINCIA'
      Required = True
      Size = 2
    end
    object sdqConsultaPROVINCIAEMP: TStringField
      FieldName = 'PROVINCIAEMP'
      Size = 50
    end
    object sdqConsultaTELDOMICILIO: TStringField
      FieldName = 'TELDOMICILIO'
      Size = 4000
    end
    object sdqConsultaAC_RELACION: TStringField
      FieldName = 'AC_RELACION'
      Size = 6
    end
    object sdqConsultaAC_DESCRIPCION: TStringField
      FieldName = 'AC_DESCRIPCION'
      Size = 200
    end
    object sdqConsultaEX_BREVEDESCRIPCION: TStringField
      FieldName = 'EX_BREVEDESCRIPCION'
      Size = 250
    end
    object sdqConsultaEX_OBSERVACIONES: TStringField
      FieldName = 'EX_OBSERVACIONES'
      Size = 250
    end
    object sdqConsultaDE_DESCRIPCION: TStringField
      FieldName = 'DE_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaDE_OBSERVACIONES: TStringField
      FieldName = 'DE_OBSERVACIONES'
      Size = 250
    end
    object sdqConsultaSA_DESCRIPCION: TStringField
      FieldName = 'SA_DESCRIPCION'
      Size = 250
    end
    object sdqConsultaSA_OBSERVACIONES: TStringField
      FieldName = 'SA_OBSERVACIONES'
      Size = 250
    end
    object sdqConsultaGA_CALLE: TStringField
      FieldName = 'GA_CALLE'
      Size = 60
    end
    object sdqConsultaGA_NUMERO: TStringField
      FieldName = 'GA_NUMERO'
    end
    object sdqConsultaGA_PISO: TStringField
      FieldName = 'GA_PISO'
    end
    object sdqConsultaGA_DEPARTAMENTO: TStringField
      FieldName = 'GA_DEPARTAMENTO'
    end
    object sdqConsultaGA_PRAM: TStringField
      FieldName = 'GA_PRAM'
      Size = 1
    end
    object sdqConsultaGA_CPOSTAL: TStringField
      FieldName = 'GA_CPOSTAL'
      Size = 5
    end
    object sdqConsultaGA_CPOSTALA: TStringField
      FieldName = 'GA_CPOSTALA'
      Size = 8
    end
    object sdqConsultaGA_LOCALIDAD: TStringField
      FieldName = 'GA_LOCALIDAD'
      Size = 60
    end
    object sdqConsultaGA_PROVINCIA: TStringField
      FieldName = 'GA_PROVINCIA'
      Size = 2
    end
    object sdqConsultaPROVINCIAINVESTIGACION: TStringField
      FieldName = 'PROVINCIAINVESTIGACION'
      Size = 50
    end
    object sdqConsultaGA_IDESTADO: TFloatField
      FieldName = 'GA_IDESTADO'
    end
    object sdqConsultaGA_IDACCIDENTEESTAB: TFloatField
      FieldName = 'GA_IDACCIDENTEESTAB'
    end
    object sdqConsultaGA_OBSERVACIONES: TStringField
      FieldName = 'GA_OBSERVACIONES'
      Size = 4000
    end
    object sdqConsultaGA_IDPREVENTOR: TFloatField
      FieldName = 'GA_IDPREVENTOR'
    end
    object sdqConsultaGA_FECHAASIGPREV: TDateTimeField
      FieldName = 'GA_FECHAASIGPREV'
    end
    object sdqConsultaGA_FECHACIERRE: TDateTimeField
      FieldName = 'GA_FECHACIERRE'
    end
    object sdqConsultaGA_IDESTABLECIMIENTO: TFloatField
      FieldName = 'GA_IDESTABLECIMIENTO'
    end
    object sdqConsultaFECHA_ASIGNACION: TDateTimeField
      FieldName = 'FECHA_ASIGNACION'
    end
    object sdqConsultaEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object sdqConsultaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqConsultafecha_rechazo: TDateTimeField
      FieldName = 'fecha_rechazo'
    end
    object sdqConsultafecha_aceptacion: TDateTimeField
      FieldName = 'fecha_aceptacion'
    end
    object sdqConsultatipo_siniestro: TStringField
      FieldName = 'tipo_siniestro'
      Size = 150
    end
    object sdqConsultaEX_DIAGNOSTICOOMS: TStringField
      FieldName = 'EX_DIAGNOSTICOOMS'
      Size = 10
    end
    object sdqConsultaDESCIE10: TStringField
      FieldName = 'DESCIE10'
      Size = 100
    end
    object sdqConsultaES_NROESTABLECI: TFloatField
      FieldName = 'ES_NROESTABLECI'
    end
    object sdqConsultaES_NOMBRE: TStringField
      FieldName = 'ES_NOMBRE'
      Size = 100
    end
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
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
    Top = 252
  end
end
