object fraOrigenDemandaTrabajador: TfraOrigenDemandaTrabajador
  Left = 0
  Top = 0
  Width = 623
  Height = 298
  TabOrder = 0
  object pnTrabajador: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 253
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object chkOrigenDemanda: TCheckPanel
      Left = 0
      Top = 43
      Width = 623
      Height = 206
      Align = alTop
      Caption = ' Dentro del R'#233'gimen '
      TabOrder = 1
      DesignSize = (
        623
        206)
      object lblPorcentajeIncapacidad: TLabel
        Left = 411
        Top = 181
        Width = 116
        Height = 13
        Caption = 'Porcentaje Incapacidad:'
      end
      object CoolBar1: TCoolBar
        Left = 6
        Top = 19
        Width = 608
        Height = 29
        Align = alNone
        Anchors = [akLeft, akRight, akBottom]
        Bands = <
          item
            Control = tbOrigenDemandaSiniestro
            ImageIndex = -1
            MinHeight = 27
            Width = 604
          end>
        object tbOrigenDemandaSiniestro: TToolBar
          Left = 9
          Top = 0
          Width = 591
          Height = 27
          Align = alBottom
          BorderWidth = 1
          Caption = 'ToolBar'
          EdgeBorders = []
          Flat = True
          HotImages = dmLegales.ilByN
          Images = dmLegales.ilColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object tbBusquedaSiniestros: TToolButton
            Left = 0
            Top = 0
            Hint = 'Asociar Siniestros'
            ImageIndex = 13
          end
          object tbEliminarSiniestroSeleccionado: TToolButton
            Left = 23
            Top = 0
            Hint = 'Eliminar Siniestro'
            ImageIndex = 8
          end
          object ToolButton8: TToolButton
            Left = 46
            Top = 0
            Width = 8
            Caption = 'ToolButton8'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object tbRevisarGastosSiniestro: TToolButton
            Left = 54
            Top = 0
            Caption = 'revisar Pagos'
            ImageIndex = 19
          end
          object tbSeparador4: TToolButton
            Left = 77
            Top = 0
            Width = 8
            Caption = 'tbSeparador4'
            ImageIndex = 2
            Style = tbsSeparator
          end
          object tbLimpiarTodo: TToolButton
            Left = 85
            Top = 0
            Hint = 'Limpiar'
            Caption = 'tbLimpiarTodo'
            ImageIndex = 1
          end
          object chkBoxCumpleHS: TCheckBox
            Left = 108
            Top = 0
            Width = 136
            Height = 22
            Alignment = taLeftJustify
            Caption = '       Cumple Normas H&S'
            TabOrder = 0
          end
        end
      end
      object dbgSiniestros: TDBGrid
        Left = 6
        Top = 53
        Width = 606
        Height = 120
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsSiniestrosOrigenDemanda
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'EX_SINIESTRO'
            Title.Caption = 'Siniestro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_ORDEN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_RECAIDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MP_CONTRATO'
            Title.Caption = 'Contrato'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MP_CUIT'
            Title.Caption = 'CUIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MP_NOMBRE'
            Title.Caption = 'Nombre'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TJ_CUIL'
            Title.Caption = 'CUIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TJ_NOMBRE'
            Title.Caption = 'Trabajador'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_DIAGNOSTICO'
            Title.Caption = 'Diagnostico'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_FECHAACCIDENTE'
            Title.Caption = 'Fecha Accidente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_BAJAMEDICA'
            Title.Caption = 'B.Medica'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_FECHARECAIDA'
            Title.Caption = 'F.Recaida'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EX_ALTAMEDICA'
            Title.Caption = 'Alta M'#233'dica'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TB_DESCRIPCION'
            Visible = True
          end>
      end
      object edPorcentajeIncapacidad: TCurrencyEdit
        Left = 530
        Top = 178
        Width = 46
        Height = 21
        AutoSize = False
        Color = clGradientInactiveCaption
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 2
      end
    end
    object grpTrabajador: TGroupBox
      Left = 0
      Top = 0
      Width = 623
      Height = 43
      Align = alTop
      Caption = 'Trabajador'
      TabOrder = 0
      inline fraTrabajadorOrigenDemanda: TfraTrabajador
        Left = 16
        Top = 16
        Width = 577
        Height = 25
        TabOrder = 0
        inherited cmbNombre: TArtComboBox
          Width = 409
          DataSource = nil
        end
      end
    end
  end
  object FormPanel1: TFormPanel
    Left = 88
    Top = 24
    Width = 453
    Height = 244
    FormWidth = 0
    FormHeigth = 0
    object Label8: TLabel
      Left = 8
      Top = 17
      Width = 19
      Height = 13
      Caption = 'ILT:'
    end
    object Label9: TLabel
      Left = 130
      Top = 17
      Width = 19
      Height = 13
      Caption = 'ILP:'
    end
    object Label10: TLabel
      Left = 253
      Top = 17
      Width = 24
      Height = 13
      Caption = 'Mor.:'
    end
    object Label11: TLabel
      Left = 7
      Top = 41
      Width = 28
      Height = 13
      Caption = 'Otros:'
    end
    object Label12: TLabel
      Left = 128
      Top = 42
      Width = 37
      Height = 13
      Caption = 'P.M'#233'd.:'
    end
    object Label14: TLabel
      Left = 254
      Top = 42
      Width = 27
      Height = 13
      Caption = 'Total:'
    end
    object edILT: TCurrencyEdit
      Left = 36
      Top = 13
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 0
    end
    object edILP: TCurrencyEdit
      Left = 171
      Top = 13
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 1
    end
    object edMORTALES: TCurrencyEdit
      Left = 308
      Top = 13
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 2
    end
    object edOTROS: TCurrencyEdit
      Left = 36
      Top = 37
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 3
    end
    object edPRESTMED: TCurrencyEdit
      Left = 171
      Top = 37
      Width = 70
      Height = 21
      AutoSize = False
      TabOrder = 4
    end
    object edTOTAL: TCurrencyEdit
      Left = 307
      Top = 37
      Width = 70
      Height = 21
      AutoSize = False
      Color = clInactiveCaption
      TabOrder = 5
    end
    object ArtDBGrid1: TArtDBGrid
      Left = 6
      Top = 73
      Width = 438
      Height = 164
      DataSource = dsGastos
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'PR_RECAIDA'
          Title.Caption = 'Recaida'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_NUMPAGO'
          Title.Caption = 'Nro.Pago'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CP_DENPAGO'
          Title.Caption = 'Descripci'#243'n'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_FEMISION'
          Title.Alignment = taCenter
          Title.Caption = 'F.Emisi'#243'n'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PR_FAPROBADO'
          Title.Alignment = taCenter
          Title.Caption = 'F.Aprobado'
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PR_IMPORPAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Width = 71
          Visible = True
        end>
    end
  end
  object sdqDatosContrato: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT ahm.hm_nombre, ahm.hm_cuit, ahc.hc_contrato, ahc.hc_estad' +
        'o, estado.tb_descripcion AS estado, ahc.hc_vigenciadesde,'
      
        '       ahc.hc_vigenciahasta, ahc.hc_fechaimpresion, ahc.hc_recep' +
        'contrato, afo.fo_formulario, ahc.hc_origen,'
      
        '       origen.tb_descripcion AS origen, ahc.hc_fecharecepcion, a' +
        'hm.hm_feinicactiv, ahc.hc_fechaafiliacion, ahm.hm_formaj,'
      
        '       formaj.tb_descripcion AS formaj, ahm.hm_sector, sector.tb' +
        '_descripcion AS sector, ahm.hm_holding,'
      
        '       age.ge_descripcion AS holding, ahm.hm_suss, ahc.hc_idejec' +
        'utivo, ecuenta.ec_nombre AS ejcuenta, ahc.hc_idgestor,'
      
        '       gestor.gc_nombre AS gestor, ahc.hc_motivoalta, ahc.hc_add' +
        'enda, hc_idestudiocontable,'
      
        '       mot_alta.tb_descripcion AS motivo_alta, ahc.hc_idartanter' +
        'ior, ahc.hc_fechabaja, ahc.hc_motivobaja,'
      
        '       mot_baj.tb_descripcion AS motivo_baja, ahc.hc_idartfutura' +
        ', ahc.hc_nivel, ahc.hc_totempleados, ahc.hc_masatotal,'
      
        '       ahc.hc_observaciones, ahc.hc_diasfranquicia, ahc.hc_vigen' +
        'ciafranquicia, ahc.hc_clausulaespecial, ahc.hc_idactividad,'
      
        '       ahc.hc_idactividad2, ahc.hc_idactividad3, clau.tb_descrip' +
        'cion AS clausula, ahc.hc_vigenciaclausula, ahc.hc_idempresa,'
      '       afo.fo_id, ahc.hc_direlectronica, ahc.hc_paginaweb'
      
        '  FROM ahc_historicocontrato ahc, ahm_historicoempresa ahm, ctb_' +
        'tablas estado, afo_formulario afo, ctb_tablas origen,'
      
        '       ctb_tablas formaj, ctb_tablas sector, age_grupoeconomico ' +
        'age, ctb_tablas clau, ctb_tablas mot_alta,'
      
        '       afi.aec_ejecutivocuenta ecuenta, afi.agc_gestorcuenta ges' +
        'tor, ctb_tablas mot_baj, aen_endoso aen'
      ' WHERE estado.tb_codigo = ahc.hc_estado'
      '   AND estado.tb_clave = '#39'AFEST'#39
      '   AND afo.fo_id = ahc.hc_idformulario'
      '   AND origen.tb_codigo = ahc.hc_origen'
      '   AND origen.tb_clave = '#39'ORSOL'#39
      '   AND formaj.tb_codigo(+) = ahm.hm_formaj'
      '   AND formaj.tb_clave(+) = '#39'FJURI'#39
      '   AND sector.tb_codigo = ahm.hm_sector'
      '   AND sector.tb_clave = '#39'SECT'#39
      '   AND age.ge_id(+) = ahm.hm_idgrupoeconomico'
      '   AND ecuenta.ec_id(+) = ahc.hc_idejecutivo'
      '   AND gestor.gc_id(+) = ahc.hc_idgestor'
      '   AND mot_baj.tb_codigo(+) = ahc.hc_motivobaja'
      '   AND mot_baj.tb_clave(+) = '#39'MOTIB'#39
      '   AND mot_alta.tb_codigo(+) = ahc.hc_motivoalta'
      '   AND mot_alta.tb_clave(+) = '#39'MOTIA'#39
      '   AND clau.tb_codigo(+) = ahc.hc_clausulaespecial'
      '   AND aen.en_idhistoricocontrato = ahc.hc_id'
      '   AND aen.en_idhistoricoempresa = ahm.hm_id'
      '   AND clau.tb_clave(+) = '#39'CLAUS'#39
      '   AND aen.en_endoso = afiliacion.get_ultnroendoso(:contrato)'
      '   AND aen.en_contrato = :contrato'
      '')
    Left = 308
    Top = 255
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CONTRATO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'contrato'
        ParamType = ptInput
      end>
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA,'
      
        '       EX_SINIESTRO || '#39'/'#39' || EX_ORDEN || '#39'/'#39' || EX_RECAIDA CODS' +
        'INI,'
      '       EX_SINIESTRORED,'
      '       MP_CONTRATO, MP_CUIT, MP_NOMBRE, TJ_CUIL, TJ_NOMBRE,'
      
        '       EX_DIAGNOSTICO, EX_FECHAACCIDENTE, EX_BAJAMEDICA, EX_FECH' +
        'ARECAIDA, EX_ALTAMEDICA, TB_DESCRIPCION'
      'FROM CTB_TABLAS, CTJ_TRABAJADORES, CMP_EMPRESAS, SEX_EXPEDIENTES'
      'WHERE NVL(EX_TIPO, '#39'1'#39') = TB_CODIGO(+)'
      'AND TB_CLAVE = '#39'STIPO'#39
      'AND MP_CUIT = EX_CUIT'
      'AND TJ_CUIL = EX_CUIL'
      'AND EX_SINIESTRO =  :Siniestro '
      'AND EX_ORDEN = :Orden '
      'AND EX_RECAIDA = :Recaida')
    Left = 309
    Top = 300
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Orden'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Recaida'
        ParamType = ptInput
      end>
    object sdqBusquedaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqBusquedaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqBusquedaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqBusquedaCODSINI: TStringField
      FieldName = 'CODSINI'
      Required = True
      Size = 122
    end
    object sdqBusquedaEX_SINIESTRORED: TFloatField
      FieldName = 'EX_SINIESTRORED'
    end
    object sdqBusquedaMP_CONTRATO: TFloatField
      FieldName = 'MP_CONTRATO'
    end
    object sdqBusquedaMP_CUIT: TStringField
      FieldName = 'MP_CUIT'
      Required = True
      Size = 11
    end
    object sdqBusquedaMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Size = 60
    end
    object sdqBusquedaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqBusquedaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqBusquedaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqBusquedaEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object sdqBusquedaEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object sdqBusquedaEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqBusquedaTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
  end
  object rxmSiniestrosOrigenDemanda: TJvMemoryData
    FieldDefs = <>
    DataSet = rxmSiniestrosOrigenDemanda
    Left = 309
    Top = 351
    object rxmSiniestrosOrigenDemandaEX_SINIESTRO: TFloatField
      DisplayLabel = 'Nro. Siniestro'
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object rxmSiniestrosOrigenDemandaEX_ORDEN: TFloatField
      DisplayLabel = 'Orden'
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object rxmSiniestrosOrigenDemandaEX_RECAIDA: TFloatField
      DisplayLabel = 'Recaida'
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object rxmSiniestrosOrigenDemandaCODSINI: TStringField
      FieldName = 'CODSINI'
      Visible = False
      Size = 122
    end
    object rxmSiniestrosOrigenDemandaEX_SINIESTRORED: TFloatField
      FieldName = 'EX_SINIESTRORED'
    end
    object rxmSiniestrosOrigenDemandaMP_CONTRATO: TFloatField
      FieldName = 'MP_CONTRATO'
      Required = True
    end
    object rxmSiniestrosOrigenDemandaMP_CUIT: TStringField
      FieldName = 'MP_CUIT'
      Required = True
      Size = 11
    end
    object rxmSiniestrosOrigenDemandaMP_NOMBRE: TStringField
      FieldName = 'MP_NOMBRE'
      Required = True
      Size = 60
    end
    object rxmSiniestrosOrigenDemandaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object rxmSiniestrosOrigenDemandaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Required = True
      Size = 60
    end
    object rxmSiniestrosOrigenDemandaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object rxmSiniestrosOrigenDemandaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object rxmSiniestrosOrigenDemandaEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object rxmSiniestrosOrigenDemandaEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object rxmSiniestrosOrigenDemandaEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object rxmSiniestrosOrigenDemandaTB_DESCRIPCION: TStringField
      DisplayLabel = 'Tipo Siniestro'
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
  end
  object dsSiniestrosOrigenDemanda: TDataSource
    DataSet = rxmSiniestrosOrigenDemanda
    Left = 176
    Top = 296
  end
  object sdqUpdSiniestrosEnTramite: TSDUpdateSQL
    ModifySQL.Strings = (
      'update LEGALES.LSJ_SINIESTROSJUICIOENTRAMITE'
      'set'
      '  SJ_ID = :SJ_ID,'
      '  SJ_IDORIGENDEMANDA = :SJ_IDORIGENDEMANDA,'
      '  SJ_SINIESTRO = :SJ_SINIESTRO,'
      '  SJ_ORDEN = :SJ_ORDEN,'
      '  SJ_RECAIDA = :SJ_RECAIDA'
      'where'
      '  SJ_ID = :OLD_SJ_ID')
    InsertSQL.Strings = (
      'insert into LEGALES.LSJ_SINIESTROSJUICIOENTRAMITE'
      
        '  (SJ_ID, SJ_IDORIGENDEMANDA, SJ_SINIESTRO, SJ_ORDEN, SJ_RECAIDA' +
        ')'
      'values'
      
        '  (:SJ_ID, :SJ_IDORIGENDEMANDA, :SJ_SINIESTRO, :SJ_ORDEN, :SJ_RE' +
        'CAIDA)')
    DeleteSQL.Strings = (
      'delete from LEGALES.LSJ_SINIESTROSJUICIOENTRAMITE'
      'where'
      '  SJ_ID = :OLD_SJ_ID')
    Left = 180
    Top = 255
  end
  object sdqSiniestroJuicioEnTramite: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA,'
      
        '       EX_SINIESTRO || '#39'/'#39' || EX_ORDEN || '#39'/'#39' || EX_RECAIDA CODS' +
        'INI,'
      '       EX_SINIESTRORED,'
      '       MP_CONTRATO, MP_CUIT, MP_NOMBRE, TJ_CUIL, TJ_NOMBRE,'
      
        '       EX_DIAGNOSTICO, EX_FECHAACCIDENTE, EX_BAJAMEDICA, EX_FECH' +
        'ARECAIDA, EX_ALTAMEDICA, TB_DESCRIPCION, SINJT.*'
      
        'FROM CTB_TABLAS, CTJ_TRABAJADORES, CMP_EMPRESAS, SEX_EXPEDIENTES' +
        ' EXPE, LEGALES.LSJ_SINIESTROSJUICIOENTRAMITE SINJT'
      'WHERE NVL(EX_TIPO, '#39'1'#39') = TB_CODIGO(+)'
      'AND TB_CLAVE = '#39'STIPO'#39
      'AND MP_CUIT = EX_CUIT'
      'AND TJ_CUIL = EX_CUIL'
      'AND EX_SINIESTRO = SINJT.sj_siniestro '
      'AND EXPE.ex_orden = SINJT.sj_orden '
      'AND EXPE.ex_recaida = SINJT.sj_recaida'
      'AND SINJT.SJ_IDORIGENDEMANDA = :ID')
    UpdateObject = sdqUpdSiniestrosEnTramite
    Left = 308
    Top = 60
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object sdqConsultaSiniestro: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'Select ex_siniestro siniestro, ex_orden orden, ex_cuit cuit, mp_' +
        'nombre empresa, ex_cuil cuil, tj_nombre trabajador, ex_fechaacci' +
        'dente, ex_tipo, ex_accidentetransito, ex_posiblerecupero, DECODE' +
        '( ex_causafin, '#39'02'#39', '#39'Rechazo'#39', '#39'03'#39', '#39'Solo Prestaciones En Espe' +
        'cie'#39', '#39'05'#39', '#39'Prestaciones Otorgadas'#39', '#39'10'#39' ,'#39'Mortal Sin Derechoh' +
        'abientes'#39' , '#39'95'#39', '#39'Informaci'#243'n Suministrada Erroneamente'#39', '#39'99'#39',' +
        ' '#39'Error de Carga'#39', NULL) causafin,'
      
        'NVL( art.liq.Get_ImporteLiquidadoILT(ex_siniestro,ex_orden,null)' +
        ', 0) ilt,'
      
        'NVL( art.liq.Get_ImporteLiquidadoILP(ex_siniestro,ex_orden,ex_re' +
        'caida), 0) ilp,'
      
        'NVL( art.liq.Get_ImporteLiquidadoMortales(ex_siniestro,ex_orden,' +
        'ex_recaida), 0) mortales,'
      
        'NVL( art.liq.Get_ImporteConceptos(ex_siniestro,ex_orden,null), 0' +
        ') otros,'
      
        'NVL( art.amebpba.Get_ImportePrestMedicas(ex_Siniestro, ex_Orden,' +
        'null), 0) prestmed,'
      'ca_descripcion'
      
        'from sex_expedientes, cmp_empresas, ctj_trabajadores, cpr_presta' +
        'dor'
      'where ex_cuit=mp_cuit'
      'and ex_cuil=tj_cuil'
      'and ex_Recaida=0'
      'and ex_prestador=ca_identificador(+)'
      'and ex_Siniestro = :nNroSiniestro'
      'and ex_Orden = :nNroOrden')
    Left = 66
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nNroSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nNroOrden'
        ParamType = ptInput
      end>
  end
  object sdqGastos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      
        'Select pr_recaida, pr_numpago, cp_denpago, pr_femision, pr_fapro' +
        'bado, pr_imporpago'
      'from spr_pagoexpesin,scp_Conpago'
      'where pr_conpago = cp_conpago'
      'and cp_legales = '#39'S'#39
      'and pr_estado = '#39'E'#39
      'and pr_imporpago > 0'
      'and pr_Siniestro = :nNroSiniestro'
      'and pr_Orden = :nNroOrden')
    Left = 153
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nNroSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nNroOrden'
        ParamType = ptInput
      end>
  end
  object dsGastos: TDataSource
    DataSet = sdqGastos
    Left = 154
    Top = 139
  end
end
