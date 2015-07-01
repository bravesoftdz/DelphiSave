inherited frmSeguimientoAccidente: TfrmSeguimientoAccidente
  Left = 128
  Top = 41
  Width = 740
  Height = 617
  Caption = 'Seguimiento Accidente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 732
    Height = 177
    Visible = True
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 732
      Height = 177
      ActivePage = tbGeneral
      Align = alClient
      TabOrder = 0
      object tbGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          724
          149)
        object lbCUITFiltro: TLabel
          Left = 36
          Top = 6
          Width = 25
          Height = 13
          Caption = 'CUIT'
        end
        object Label11: TLabel
          Left = 13
          Top = 102
          Width = 60
          Height = 13
          Caption = 'Coordinador:'
        end
        object Label12: TLabel
          Left = 15
          Top = 80
          Width = 49
          Height = 13
          Caption = 'Preventor:'
        end
        object lbEstadoFiltro: TLabel
          Left = 35
          Top = 127
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object lbFecha: TLabel
          Left = 277
          Top = 127
          Width = 79
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fecha Denuncia'
        end
        object Label14: TLabel
          Left = 358
          Top = 127
          Width = 31
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Desde'
        end
        object Label15: TLabel
          Left = 492
          Top = 127
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Hasta'
        end
        inline fraEmpresaFiltro: TfraEmpresa
          Left = 79
          Top = 3
          Width = 555
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
            Left = 451
          end
          inherited edContrato: TIntEdit
            Left = 498
          end
          inherited cmbRSocial: TArtComboBox
            Left = 128
            Width = 316
          end
        end
        inline fraTrabajadorSinGraveFiltro: TfraTrabajadorSinGrave
          Left = 31
          Top = 29
          Width = 622
          Height = 45
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          inherited lbSiniestro: TLabel
            Left = 330
          end
          inherited cmbNombre: TArtComboBox
            Width = 574
          end
          inherited edSiniestro: TSinEdit
            Left = 378
          end
        end
        inline fraPreventorFiltro: TfraCodigoDescripcion
          Left = 78
          Top = 76
          Width = 372
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          inherited cmbDescripcion: TArtComboBox
            Width = 307
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            CharCase = ecNormal
          end
        end
        inline fraCoordinadorFiltro: TfraCodigoDescripcion
          Left = 78
          Top = 99
          Width = 372
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          inherited cmbDescripcion: TArtComboBox
            Width = 307
            CharCase = ecUpperCase
          end
          inherited edCodigo: TPatternEdit
            Width = 59
            CharCase = ecNormal
          end
        end
        object cmbEstado: TCheckCombo
          Left = 79
          Top = 123
          Width = 195
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object edFechaDenunciaFiltroDesde: TDateEdit
          Left = 391
          Top = 124
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 5
        end
        object edFechaDenunciaFiltroHasta: TDateEdit
          Left = 522
          Top = 124
          Width = 99
          Height = 21
          Anchors = [akTop, akRight]
          NumGlyphs = 2
          TabOrder = 6
        end
        object cbPRAM: TCheckBox
          Left = 621
          Top = 126
          Width = 45
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Pram'
          TabOrder = 7
        end
        object cbGrave: TCheckBox
          Left = 667
          Top = 126
          Width = 57
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akTop, akRight]
          Caption = 'Grave'
          TabOrder = 8
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 177
    Width = 732
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 728
      end>
    inherited ToolBar: TToolBar
      Width = 715
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 206
    Width = 732
    Height = 384
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_NRODENUNCIASRT'
        Title.Caption = 'Denuncia SRT'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_CUIL'
        Title.Caption = 'Cuil'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'Cuit'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_EVALRIESGO'
        Title.Caption = 'Eval. Riesgo'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FIRMATRAB'
        Title.Caption = 'Firma Trab.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_DDJJ'
        Title.Caption = 'DDJJ'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FIRMAEMPLEADOR'
        Title.Caption = 'Firma Empleador'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FIRMAHYS'
        Title.Caption = 'Firma HYS'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_VERIF6M'
        Title.Caption = 'Verif.6m'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FECHAFIRMAPREVENTOR'
        Title.Caption = 'Fecha/Firma Preventor'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_COINCIDECVSISTEMA'
        Title.Caption = 'Coincide CV-Sistema'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_VERIF12M'
        Title.Caption = 'Verif.12m'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_FECHAVERIF6M'
        Title.Caption = 'Verif.6m'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GA_ARBOLDECAUSAS'
        Title.Caption = #193'rbol de Causas'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PREV'
        Title.Caption = 'Preventor'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Title.Caption = 'Coordinador'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TG_DESCRIPCION'
        Title.Caption = 'Gravedad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TA_DESCRIPCION'
        Title.Caption = 'Tipo Accidente'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 96
    Top = 232
    Width = 621
    Height = 340
    Constraints.MinHeight = 246
    Constraints.MinWidth = 621
    inherited BevelAbm: TBevel
      Top = 304
      Width = 613
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 8
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lbEvalRiesgo: TLabel [2]
      Left = 8
      Top = 83
      Width = 60
      Height = 13
      Caption = 'Eval. Riesgo'
    end
    object Label2: TLabel [3]
      Left = 228
      Top = 83
      Width = 53
      Height = 13
      Caption = 'Firma Trab.'
    end
    object Label3: TLabel [4]
      Left = 443
      Top = 83
      Width = 26
      Height = 13
      Caption = 'DDJJ'
    end
    object Label4: TLabel [5]
      Left = 8
      Top = 109
      Width = 78
      Height = 13
      Caption = 'Firma Empleador'
    end
    object Label5: TLabel [6]
      Left = 228
      Top = 109
      Width = 50
      Height = 13
      Caption = 'Firma HYS'
    end
    object Label6: TLabel [7]
      Left = 441
      Top = 110
      Width = 41
      Height = 13
      Caption = 'Verif.6m.'
    end
    object Label7: TLabel [8]
      Left = 8
      Top = 135
      Width = 109
      Height = 13
      Caption = 'Fecha/Firma Preventor'
    end
    object Label8: TLabel [9]
      Left = 228
      Top = 135
      Width = 98
      Height = 13
      Caption = 'Coincide CV-Sistema'
    end
    object Label9: TLabel [10]
      Left = 8
      Top = 163
      Width = 49
      Height = 13
      Caption = 'Preventor:'
    end
    object Label10: TLabel [11]
      Left = 8
      Top = 187
      Width = 60
      Height = 13
      Caption = 'Coordinador:'
    end
    object Label13: TLabel [12]
      Left = 468
      Top = 162
      Width = 47
      Height = 13
      Caption = 'Verif.12m.'
    end
    object Label16: TLabel [13]
      Left = 8
      Top = 211
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object Label17: TLabel [14]
      Left = 468
      Top = 185
      Width = 41
      Height = 13
      Caption = 'Verif.6m.'
    end
    object Label18: TLabel [15]
      Left = 442
      Top = 127
      Width = 42
      Height = 26
      Caption = 'Arbol de '#13#10'Causas'
    end
    inherited btnAceptar: TButton
      Left = 463
      Top = 310
      TabOrder = 16
    end
    inherited btnCancelar: TButton
      Left = 541
      Top = 310
      TabOrder = 17
    end
    inline fraEmpresa: TfraEmpresa
      Left = 97
      Top = 5
      Width = 515
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
        Left = 411
      end
      inherited edContrato: TIntEdit
        Left = 458
      end
      inherited cmbRSocial: TArtComboBox
        Left = 128
        Width = 276
      end
    end
    inline fraTrabajadorSinGrave: TfraTrabajadorSinGrave
      Left = 4
      Top = 30
      Width = 611
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited lbSiniestro: TLabel
        Left = 364
      end
      inherited lbNroDenSRT: TLabel
        Left = 181
      end
      inherited mskCUIL: TMaskEdit
        Left = 93
      end
      inherited cmbNombre: TArtComboBox
        Left = 93
        Width = 517
      end
      inherited edSiniestro: TSinEdit
        Left = 412
      end
      inherited edDG_NRODENUNCIASRT: TPatternEdit
        Left = 273
      end
    end
    object cmbEvalRiesgo: TExComboBox
      Left = 120
      Top = 80
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbFirmaTrab: TExComboBox
      Left = 332
      Top = 80
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbDDJJ: TExComboBox
      Left = 509
      Top = 80
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbFirmaEmpleador: TExComboBox
      Left = 120
      Top = 106
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 5
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbFirmaHYS: TExComboBox
      Left = 332
      Top = 106
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 6
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbVerif6m: TExComboBox
      Left = 509
      Top = 106
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 7
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbFechaFirmaPreventor: TExComboBox
      Left = 120
      Top = 132
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 8
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object cmbCVSistema: TExComboBox
      Left = 332
      Top = 132
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 9
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    inline fraPreventor: TfraCodigoDescripcion
      Left = 93
      Top = 158
      Width = 375
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      inherited cmbDescripcion: TArtComboBox
        Width = 310
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    inline fraCoordinador: TfraCodigoDescripcion
      Left = 93
      Top = 182
      Width = 375
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      inherited cmbDescripcion: TArtComboBox
        Width = 310
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 59
        CharCase = ecNormal
      end
    end
    object edFechaVerif12M: TDateEdit
      Left = 517
      Top = 155
      Width = 97
      Height = 22
      NumGlyphs = 2
      TabOrder = 12
    end
    object edObservaciones: TMemo
      Left = 94
      Top = 208
      Width = 515
      Height = 72
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 15
    end
    object edFechaVerif6m: TDateEdit
      Left = 517
      Top = 180
      Width = 97
      Height = 22
      NumGlyphs = 2
      TabOrder = 14
    end
    object cmbArbolDeCausas: TExComboBox
      Left = 509
      Top = 132
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 10
      Items.Strings = (
        'S=Si'
        'N=No'
        'NC=No Corresponde')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT art.utiles.armar_siniestro (ex_siniestro,'
      '                                   ex_orden,'
      '                                   ex_recaida'
      '                                  ) siniestro,ex_fecharecepcion,'
      
        '       ex_id, ex_recaida, co_contrato, em_cuit, em_nombre, tj_cu' +
        'il, tj_nombre,'
      '       dg_nrodenunciasrt, ga_id,'
      
        '       NVL (ex_fecharecaida, ex_fechaaccidente) fechaaccidente, ' +
        'dg_fechaalta,'
      
        '       dg_fecharecepcion, ta_descripcion, tg_descripcion, prev.i' +
        't_id id_prev,'
      '       prev.it_nombre prev, eg_descripcion, ud_calle, ud_numero,'
      
        '       ga_fechavencinv, ae_fecha, ud_piso, ud_departamento, ud_c' +
        'postal,'
      '       ud_cpostala, ud_localidad, ud_provincia,'
      '       provaccid.pv_descripcion AS provinciaaccidente,'
      '       DECODE (dg_idgravedad,'
      '               5, dg_fecharecepcion + 3,'
      '               dg_fecharecepcion + 20'
      '              ) fechavencimiento,'
      '       art.utiles.armar_telefono (ud_codareatelefonos,'
      '                                  NULL,'
      '                                  ud_telefonos'
      '                                 ) AS telaccidente,'
      
        '       dc_calle, dc_numero, dc_piso, dc_departamento, dc_cpostal' +
        ', dc_cpostala,'
      
        '       dc_localidad, dc_provincia, provdomic.pv_descripcion AS p' +
        'rovinciaemp,'
      '       art.utiles.armar_telefono (dc_codareatelefonos,'
      '                                  NULL,'
      '                                  dc_telefonos'
      '                                 ) AS teldomicilio,'
      '       ac_relacion, ac_descripcion,'
      
        '       ca_descripcion || '#39'-'#39' || ca_clave AS prestador, ex_breved' +
        'escripcion,'
      
        '       ex_observaciones, de_descripcion, de_observaciones, dg_ob' +
        'servaciones,'
      
        '       dg_descripcion, sa_descripcion, sa_observaciones, ga_call' +
        'e, ga_numero,'
      
        '       ga_piso, ga_departamento, ga_cpostal, ga_cpostala, ga_loc' +
        'alidad,'
      
        '       ga_provincia, provinvest.pv_descripcion AS provinciainves' +
        'tigacion,'
      '       ga_idestado, ga_idaccidenteestab, ga_observaciones,'
      
        '       ga_idpreventor, dg_idgravedad, ae_fechaexport, ga_fechaas' +
        'igprev,'
      '       ga_fechacierre, ga_idestablecimiento, cor.it_id id_cor,'
      '       cor.it_nombre cor, ga_evalriesgo, ga_firmatrab, ga_ddjj,'
      
        '       ga_firmaempleador, ga_firmahys, ga_verif6m, ga_fechafirma' +
        'preventor,'
      
        '       ga_coincidecvsistema, ga_verif12m, ga_fechaverif6m, GA_AR' +
        'BOLDECAUSAS'
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
      '   AND ca_identificador(+) = dg_idprestador'
      '   AND 1 = 2'
      '')
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
  end
end
