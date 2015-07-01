inherited frmControlAccidente: TfrmControlAccidente
  Left = 292
  Top = 300
  Width = 800
  Caption = 'Tablero de Accidente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 792
    DesignSize = (
      792
      13)
    inherited lbColor2: TLabel
      Left = 120
    end
    inherited lbColor3: TLabel
      Left = 235
    end
    inherited lbColor1: TLabel
      Left = 55
    end
    inherited Label24: TLabel
      Left = 8
    end
    inherited Label25: TLabel
      Left = 357
    end
    inherited Label22: TLabel
      Left = 410
    end
    inherited Label3: TLabel
      Left = 503
    end
    inherited Label5: TLabel
      Left = 650
    end
    inherited Label7: TLabel
      Left = 736
    end
    inherited pnlColor3: TPanel
      Left = 222
    end
    inherited pnlColor2: TPanel
      Left = 106
    end
    inherited pnlColor1: TPanel
      Left = 43
    end
    inherited pnlColor4: TPanel
      Left = 398
    end
    inherited pnlColor5: TPanel
      Left = 490
    end
    inherited pnlColor6: TPanel
      Left = 637
    end
    inherited pnlColor7: TPanel
      Left = 720
    end
  end
  inherited pnlFiltros: TPanel
    Width = 792
    inherited pcFiltros: TPageControl
      Width = 792
      inherited tbGeneral: TTabSheet
        DesignSize = (
          784
          123)
        inherited lbFechaAccidenteFiltro: TLabel
          Left = 584
        end
        object lbFecha: TLabel [4]
          Left = 233
          Top = 31
          Width = 79
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fecha Denuncia'
        end
        object Label6: TLabel [5]
          Left = 316
          Top = 31
          Width = 31
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Desde'
        end
        object Label11: TLabel [6]
          Left = 451
          Top = 31
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta'
        end
        inherited fraEmpresaFiltro: TfraEmpresa
          Width = 615
          DesignSize = (
            615
            21)
          inherited lbContrato: TLabel
            Left = 511
          end
          inherited edContrato: TIntEdit
            Left = 558
          end
          inherited cmbRSocial: TArtComboBox
            Width = 376
          end
        end
        inherited edFechaAccidenteFiltro: TDateEdit
          Left = 685
        end
        inherited fraPreventorFiltro: TfraCodigoDescripcion
          Width = 413
          DesignSize = (
            413
            23)
          inherited cmbDescripcion: TArtComboBox
            Width = 348
          end
        end
        inherited cmbEstado: TCheckCombo
          Width = 176
        end
        inherited cbVencidos: TCheckBox
          Left = 478
        end
        object cbSinExportacion: TCheckBox
          Left = 554
          Top = 102
          Width = 94
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Sin Exportaci'#243'n'
          TabOrder = 5
        end
        object cbPRAM: TCheckBox
          Left = 662
          Top = 102
          Width = 45
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Pram'
          TabOrder = 6
        end
        object cbGrave: TCheckBox
          Left = 718
          Top = 102
          Width = 57
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Grave'
          TabOrder = 7
        end
        object edFechaDenunciaFiltroDesde: TDateEdit
          Left = 350
          Top = 28
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 8
        end
        object edFechaDenunciaFiltroHasta: TDateEdit
          Left = 481
          Top = 28
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 9
        end
        inline fraTrabajadorSinGraveFiltro: TfraTrabajadorSinGrave
          Left = 3
          Top = 53
          Width = 722
          Height = 45
          TabOrder = 10
          DesignSize = (
            722
            45)
          inherited lbSiniestro: TLabel
            Left = 430
          end
          inherited lbNroDenSRT: TLabel
            Left = 140
          end
          inherited lbCUIL: TLabel
            Left = 0
          end
          inherited Label1: TLabel
            Left = 0
          end
          inherited mskCUIL: TMaskEdit
            Left = 52
          end
          inherited cmbNombre: TArtComboBox
            Left = 52
            Width = 668
          end
          inherited edSiniestro: TSinEdit
            Left = 478
          end
          inherited edDG_NRODENUNCIASRT: TPatternEdit
            Left = 232
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 788
      end>
    inherited ToolBar: TToolBar
      Width = 775
    end
  end
  inherited Grid: TArtDBGrid
    Width = 792
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
        FieldName = 'DG_NRODENUNCIASRT'
        Title.Caption = 'Nro. Denuncia SRT'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAACCIDENTE'
        Title.Caption = 'Fecha Accidente'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_FECHAALTA'
        Title.Caption = 'Fecha Denuncia SRT'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Tipo Accidente'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG_DESCRIPCION'
        Title.Caption = 'Gravedad'
        Width = 130
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
        FieldName = 'AE_FECHA'
        Title.Caption = 'Fecha Investigaci'#243'n'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 93
    Top = 220
    inherited PageControl: TPageControl
      inherited tbSiniestro: TTabSheet
        inherited ScrollBox: TScrollBox
          VertScrollBar.Position = 71
          inherited gbDatosEmpresa: TGroupBox
            Top = -71
          end
          inherited gbDatosTrabajador: TGroupBox
            Top = 90
            inherited Label1: TLabel
              Left = 7
            end
            object Label12: TLabel [2]
              Left = 8
              Top = 42
              Width = 50
              Height = 13
              Caption = 'Gravedad:'
            end
            inherited lbCalle: TLabel
              Left = 10
            end
            inline fraGravedad: TfraCodigoDescripcion [6]
              Left = 57
              Top = 38
              Width = 436
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              DesignSize = (
                436
                23)
              inherited cmbDescripcion: TArtComboBox
                Width = 371
                CharCase = ecUpperCase
              end
              inherited edCodigo: TPatternEdit
                CharCase = ecNormal
              end
            end
            inherited fraTrabajadorABM: TfraTrabajadorSiniestro
              TabOrder = 3
            end
          end
          inherited GroupBox1: TGroupBox
            Top = 254
            object lbFechaDenuncia: TLabel [1]
              Left = 4
              Top = 18
              Width = 79
              Height = 13
              Caption = 'Fecha Denuncia'
            end
            object lbFechaDeVencimiento: TLabel [2]
              Left = 392
              Top = 18
              Width = 106
              Height = 13
              Caption = 'Fecha de Vencimiento'
            end
            object lbPrestador: TLabel [3]
              Left = 6
              Top = 42
              Width = 45
              Height = 13
              Caption = 'Prestador'
            end
            object edFechaDenuncia: TDateEdit
              Left = 86
              Top = 14
              Width = 99
              Height = 21
              NumGlyphs = 2
              TabOrder = 1
            end
            object edFechadeVencimiento: TDateEdit
              Left = 503
              Top = 14
              Width = 99
              Height = 21
              NumGlyphs = 2
              TabOrder = 2
            end
            object edPrestador: TEdit
              Left = 59
              Top = 39
              Width = 584
              Height = 21
              TabStop = False
              TabOrder = 3
            end
          end
          inherited gbDescripciones: TGroupBox
            Top = 324
            object lbDescripcionDenunciagrave: TLabel [6]
              Left = 4
              Top = 198
              Width = 71
              Height = 39
              Caption = 'Descripci'#243'n de'#13#10'  la Denuncia '#13#10'     Grave:'
            end
            object lbObservacionDenunciaGrave: TLabel [7]
              Left = 4
              Top = 259
              Width = 74
              Height = 39
              Caption = 'Observaciones '#13#10'de la Denuncia'#13#10'      Grave :'
            end
            object edDescripcionDenunciaGrave: TMemo
              Left = 80
              Top = 196
              Width = 594
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
            end
            object edObservacionDenunciaGrave: TMemo
              Left = 80
              Top = 257
              Width = 594
              Height = 52
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
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
                Width = 360
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
          inherited gbPreventor: TGroupBox
            inherited cbPreventorSugerido: TCheckBox
              Left = 556
              Top = 24
            end
            object cbInvAccidenteRecibida: TCheckBox
              Left = 479
              Top = 56
              Width = 187
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'Investigaci'#243'n de accidente recibida'
              TabOrder = 4
            end
          end
          inherited GroupBox3: TGroupBox
            Height = 62
            object Label13: TLabel [3]
              Left = 6
              Top = 43
              Width = 163
              Height = 13
              Caption = 'Distancia del Accidente (mortales):'
            end
            inherited edFechaVencimientoInvestigacion: TDateEdit
              Enabled = False
            end
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
            object cbDistMas100km: TCheckBox
              Left = 339
              Top = 41
              Width = 101
              Height = 16
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'Mas de 100 KM'
              TabOrder = 4
              OnClick = cbDistMas100kmClick
            end
            object cbDistMenos100km: TCheckBox
              Left = 187
              Top = 41
              Width = 109
              Height = 16
              Alignment = taLeftJustify
              Anchors = [akTop, akRight]
              Caption = 'Menos de 100 KM'
              TabOrder = 5
              OnClick = cbDistMenos100kmClick
            end
          end
          inherited GroupBox4: TGroupBox
            Top = 287
          end
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_rec' +
        'aida) siniestro, ex_id, ex_recaida, ex_siniestro, ex_orden,'
      
        '       co_contrato, em_cuit, em_nombre, tj_cuil, tj_nombre, dg_n' +
        'rodenunciasrt, ga_id, ga_idexpediente,'
      
        '       NVL(ex_fecharecaida, ex_fechaaccidente) fechaaccidente, d' +
        'g_fechaalta, dg_fecharecepcion, ta_descripcion, tg_descripcion,'
      
        '       it_nombre, eg_descripcion, ud_calle, ud_numero, ga_fechav' +
        'encinv, ae_fecha, ae_cpostal, ae_calle, ae_localidad,'
      
        '       ae_provincia, ae_numero, ae_piso, ae_departamento, ae_cpo' +
        'stala, ud_piso, ud_departamento, ud_cpostal, ud_cpostala,'
      
        '       ud_localidad, ud_provincia, provaccid.pv_descripcion AS p' +
        'rovinciaaccidente,'
      
        '       DECODE(dg_idgravedad, 5, dg_fecharecepcion + 3, dg_fechar' +
        'ecepcion + 7) fechavencimiento,'
      
        '       art.utiles.armar_telefono(ud_codareatelefonos, NULL, ud_t' +
        'elefonos) AS telaccidente, dc_calle, dc_numero, dc_piso,'
      
        '       dc_departamento, dc_cpostal, dc_cpostala, dc_localidad, d' +
        'c_provincia, provdomic.pv_descripcion AS provinciaemp,'
      
        '       art.utiles.armar_telefono(dc_codareatelefonos, NULL, dc_t' +
        'elefonos) AS teldomicilio, ac_relacion, ac_descripcion,'
      
        '       ca_descripcion || '#39'-'#39' || ca_clave AS prestador, ex_breved' +
        'escripcion, ex_observaciones, de_descripcion, de_observaciones,'
      
        '       dg_observaciones, dg_descripcion, sa_descripcion, sa_obse' +
        'rvaciones, ga_calle, ga_numero, ga_piso, ga_departamento,'
      
        '       ga_pram, ga_cpostal, ga_cpostala, ga_localidad, ga_provin' +
        'cia, provinvest.pv_descripcion AS provinciainvestigacion,'
      
        '       ga_idestado, ga_idaccidenteestab, ga_observaciones, tg_id' +
        ', ga_idpreventor, dg_idgravedad, ae_fechaexport,'
      
        '       ga_fechaasigprev, ga_fechacierre, ga_idestablecimiento, g' +
        'a_investigacionrecibida,'
      '       (SELECT TRUNC(hp_fechaalta)'
      '          FROM hys.hhp_historicopreventorasignado'
      '         WHERE ga_id = hp_idgestionaccidente'
      '           AND hp_fechaalta = (SELECT MAX(hp_fechaalta)'
      
        '                                 FROM hys.hhp_historicopreventor' +
        'asignado'
      
        '                                WHERE ga_id = hp_idgestionaccide' +
        'nte)) fecha_asignacion, GA_SUPERA100KM'
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
      '       art.pit_firmantes,'
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
      '   AND ex_cuil = tj_cuil'
      '   AND sex.ex_tipo = ta_id'
      '   AND dg_idgravedad = tg_id'
      '   AND co_idactividad = ac_id'
      '   AND ga_idestado = eg_id'
      '   AND dg_nrodenunciasrt IS NOT NULL'
      '   AND dg_fechabaja IS NULL'
      '   AND ga_idaccidenteestab = ae_id(+)'
      '   AND ga_idpreventor = it_id(+)'
      '   AND ex_id = sa_idexpediente(+)'
      '   AND ex_id = de_idexpediente(+)'
      '   AND ex_id = ud_idexpediente(+)'
      '   AND ud_provincia = provaccid.pv_codigo(+)'
      '   AND dc_provincia = provdomic.pv_codigo(+)'
      '   AND ga_provincia = provinvest.pv_codigo(+)'
      '   AND ca_identificador(+) = dg_idprestador'
      '   AND 1 = 2'
      '')
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
    object sdqConsultaDG_NRODENUNCIASRT: TStringField
      FieldName = 'DG_NRODENUNCIASRT'
      Size = 13
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
    object sdqConsultaDG_FECHAALTA: TDateTimeField
      FieldName = 'DG_FECHAALTA'
      Required = True
    end
    object sdqConsultaDG_FECHARECEPCION: TDateTimeField
      FieldName = 'DG_FECHARECEPCION'
    end
    object sdqConsultaTA_DESCRIPCION: TStringField
      FieldName = 'TA_DESCRIPCION'
      Required = True
      Size = 25
    end
    object sdqConsultaTG_DESCRIPCION: TStringField
      FieldName = 'TG_DESCRIPCION'
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
    object sdqConsultaAE_FECHA: TDateTimeField
      FieldName = 'AE_FECHA'
    end
    object sdqConsultaAE_CPOSTAL: TStringField
      FieldName = 'AE_CPOSTAL'
      Size = 5
    end
    object sdqConsultaAE_CALLE: TStringField
      FieldName = 'AE_CALLE'
      Size = 60
    end
    object sdqConsultaAE_LOCALIDAD: TStringField
      FieldName = 'AE_LOCALIDAD'
      Size = 85
    end
    object sdqConsultaAE_PROVINCIA: TStringField
      FieldName = 'AE_PROVINCIA'
      Size = 2
    end
    object sdqConsultaAE_NUMERO: TStringField
      FieldName = 'AE_NUMERO'
      Size = 6
    end
    object sdqConsultaAE_PISO: TStringField
      FieldName = 'AE_PISO'
      Size = 6
    end
    object sdqConsultaAE_DEPARTAMENTO: TStringField
      FieldName = 'AE_DEPARTAMENTO'
      Size = 6
    end
    object sdqConsultaAE_CPOSTALA: TStringField
      FieldName = 'AE_CPOSTALA'
      Size = 8
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
    object sdqConsultaGA_PRAM: TStringField
      FieldName = 'GA_PRAM'
      Size = 1
    end
    object sdqConsultaPROVINCIAACCIDENTE: TStringField
      FieldName = 'PROVINCIAACCIDENTE'
      Size = 50
    end
    object sdqConsultaFECHAVENCIMIENTO: TDateTimeField
      FieldName = 'FECHAVENCIMIENTO'
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
    object sdqConsultaPRESTADOR: TStringField
      FieldName = 'PRESTADOR'
      Size = 162
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
    object sdqConsultaDG_OBSERVACIONES: TStringField
      FieldName = 'DG_OBSERVACIONES'
      Size = 250
    end
    object sdqConsultaDG_DESCRIPCION: TStringField
      FieldName = 'DG_DESCRIPCION'
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
    object sdqConsultaTG_ID: TFloatField
      FieldName = 'TG_ID'
      Required = True
    end
    object sdqConsultaGA_IDPREVENTOR: TFloatField
      FieldName = 'GA_IDPREVENTOR'
    end
    object sdqConsultaDG_IDGRAVEDAD: TFloatField
      FieldName = 'DG_IDGRAVEDAD'
    end
    object sdqConsultaAE_FECHAEXPORT: TDateTimeField
      FieldName = 'AE_FECHAEXPORT'
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
    object sdqConsultaSELECTED: TStringField
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object sdqConsultaGA_INVESTIGACIONRECIBIDA: TStringField
      FieldName = 'GA_INVESTIGACIONRECIBIDA'
      Size = 1
    end
    object sdqConsultaGA_SUPERA100KM: TStringField
      FieldName = 'GA_SUPERA100KM'
      Size = 1
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
    Left = 108
    Top = 200
  end
end
