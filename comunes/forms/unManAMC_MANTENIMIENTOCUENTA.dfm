inherited frmAMC_MANTENIMIENTOCUENTA: TfrmAMC_MANTENIMIENTOCUENTA
  Left = 235
  Top = 226
  Width = 809
  Height = 462
  Caption = 'Campa'#241'a de Mantenimiento de Cuentas'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 801
    Visible = True
    DesignSize = (
      801
      45)
    object lbl2: TLabel
      Left = 12
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Ejecutivo'
    end
    object chkVerBajas: TCheckBox
      Left = 352
      Top = 24
      Width = 137
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'No ver dados de baja'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    inline fraIDEJECUTIVO: TfraCodDesc
      Left = 8
      Top = 20
      Width = 341
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        341
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 276
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD_EMPRESAS'
            Title.Caption = 'Empresas'
            Visible = True
          end>
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = 
          ', ec_usuario, (SELECT COUNT (*) FROM aco_contrato, agenda.amc_ma' +
          'ntenimientocuenta WHERE co_idejecutivo = ec_id AND co_estado = 1' +
          ' AND co_fecharecepcion < TRUNC (SYSDATE) - 180 AND ec_id = mc_id' +
          'ejecutivo(+) AND NVL (co_totempleadosactual, co_totempleados) <=' +
          ' NVL (mc_tope_capitas, NVL (co_totempleadosactual, co_totemplead' +
          'os))) cantidad_empresas'
        FieldBaja = 'EC_FECHABAJA'
        FieldCodigo = 'EC_ID'
        FieldDesc = 'EC_NOMBRE'
        FieldID = 'EC_ID'
        FullLikeComparison = True
        IdType = ctInteger
        OrderBy = 'EC_NOMBRE'
        ShowBajas = True
        TableName = 'AEC_EJECUTIVOCUENTA'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Width = 801
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 797
      end>
    inherited ToolBar: TToolBar
      Width = 784
    end
  end
  inherited Grid: TArtDBGrid
    Width = 801
    Height = 361
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EJECUTIVO'
        Title.Caption = 'Ejecutivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Usuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDEJECUTIVO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC_TOPE_CAPITAS'
        Title.Caption = 'C'#225'pitas'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC_INFORMAR_MAIL'
        Title.Caption = 'Correo electr'#243'nico de control'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC_SUSPENDIDO'
        Title.Caption = 'Suspendido'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad_empresas_con_capitas'
        Title.Caption = 'Empresas c/ c'#225'pitas'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD_EMPRESAS'
        Title.Caption = 'Empresas'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACTOS_HOY'
        Title.Caption = 'Contactos para hoy'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACTOS'
        Title.Caption = 'Contactos en el '#250'ltimo a'#241'o'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE_CUMPLIDO'
        Title.Caption = '% Cumplido'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 136
    Top = 136
    Width = 457
    Height = 201
    Position = poScreenCenter
    DesignSize = (
      457
      201)
    inherited BevelAbm: TBevel
      Top = 165
      Width = 449
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Ejecutivo'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 64
      Width = 82
      Height = 39
      Caption = 'Cantidad m'#225'xima'#13#10'de tareas diarias'#13#10'en el SIC'
    end
    object lbl1: TLabel [3]
      Left = 184
      Top = 64
      Width = 113
      Height = 39
      Anchors = [akTop, akRight]
      Caption = 'L'#237'mite de c'#225'pitas '#13#10'a considerar para'#13#10'la generaci'#243'n de tareas'
    end
    object lblInformarA: TLabel [4]
      Left = 12
      Top = 116
      Width = 200
      Height = 13
      Caption = 'Informar a (buz'#243'n de correo destinatario)'
    end
    object dbtxtCUENTAS: TDBText [5]
      Left = 337
      Top = 12
      Width = 72
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'cantidad_empresas'
      DataSource = fraEjecutivo.dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEmpresas: TLabel [6]
      Left = 156
      Top = 12
      Width = 206
      Height = 13
      Caption = 'Total de Empresas Asignadas / Con c'#225'pitas'
    end
    object Label3: TLabel [7]
      Left = 412
      Top = 12
      Width = 4
      Height = 13
      Caption = '/'
    end
    object lbEmpresasConCapitas: TLabel [8]
      Left = 438
      Top = 12
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 171
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 377
      Top = 171
    end
    inline fraEjecutivo: TfraCodDesc
      Left = 12
      Top = 32
      Width = 433
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        433
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 368
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD_EMPRESAS'
            Title.Caption = 'Empresas'
            Visible = True
          end>
      end
      inherited edCodigo: TPatternEdit
        OnChange = fraEjecutivoedCodigoChange
      end
      inherited Propiedades: TPropiedadesFrame
        CodigoType = ctInteger
        ExtraFields = 
          ', ec_usuario, (SELECT COUNT (*) FROM aco_contrato, agenda.amc_ma' +
          'ntenimientocuenta WHERE co_idejecutivo = ec_id AND co_estado = 1' +
          ' AND co_fecharecepcion < TRUNC (SYSDATE) - 180 AND ec_id = mc_id' +
          'ejecutivo(+) AND NVL (co_totempleadosactual, co_totempleados) <=' +
          ' NVL (mc_tope_capitas, NVL (co_totempleadosactual, co_totemplead' +
          'os))) cantidad_empresas'
        FieldBaja = 'EC_FECHABAJA'
        FieldCodigo = 'EC_ID'
        FieldDesc = 'EC_NOMBRE'
        FieldID = 'EC_ID'
        FullLikeComparison = True
        IdType = ctInteger
        OrderBy = 'EC_NOMBRE'
        ShowBajas = True
        TableName = 'AEC_EJECUTIVOCUENTA'
        OnChange = fraEjecutivoPropiedadesChange
        OnDBAwareChange = fraEjecutivoPropiedadesDBAwareChange
      end
    end
    object edCantidad: TIntEdit
      Left = 104
      Top = 80
      Width = 65
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object rgLimiteCapitas: TAdvOfficeRadioGroup
      Left = 308
      Top = 55
      Width = 137
      Height = 58
      Version = '1.2.1.0'
      Anchors = [akTop, akRight]
      Caption = ' L'#237'mite '
      ParentBackground = False
      TabOrder = 4
      OnClick = rgLimiteCapitasClick
      Ellipsis = False
      ItemIndex = 0
      Items.Strings = (
        'Sin l'#237'mite'
        'Hasta            c'#225'pitas')
    end
    object edTOPE_CAPITAS: TIntEdit
      Left = 366
      Top = 90
      Width = 30
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
    end
    object edINFORMAR_MAIL: TEdit
      Left = 12
      Top = 136
      Width = 277
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 6
    end
    object chkSUSPENDIDO: TCheckBox
      Left = 308
      Top = 136
      Width = 97
      Height = 17
      Caption = 'Suspendido'
      TabOrder = 7
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT mc_id,'
      '       idejecutivo,'
      '       cantidad,'
      '       nombre,'
      '       ejecutivo,'
      '       delegacion,'
      '       mc_usualta,'
      '       mc_fechaalta,'
      '       mc_usumodif,'
      '       mc_fechamodif,'
      '       mc_usubaja,'
      '       mc_fechabaja,'
      '       mc_tope_capitas,'
      '       mc_suspendido,'
      '       mc_informar_mail,'
      '       cantidad_empresas,'
      '       cantidad_empresas_con_capitas,'
      '       contactos_hoy,'
      '       contactos,'
      
        '       (CASE WHEN cantidad_empresas > 0 THEN ROUND (contactos / ' +
        'cantidad_empresas_con_capitas, 2) * 100 ELSE 0 END)'
      '         porcentaje_cumplido'
      '  FROM (SELECT mc_id,'
      '               mc_idejecutivo AS idejecutivo,'
      '               mc_cantidad AS cantidad,'
      '               se_nombre AS nombre,'
      '               ec_nombre AS ejecutivo,'
      '               el_nombre AS delegacion,'
      '               mc_usualta,'
      '               mc_fechaalta,'
      '               mc_usumodif,'
      '               mc_fechamodif,'
      '               mc_usubaja,'
      '               mc_fechabaja,'
      '               mc_tope_capitas,'
      '               mc_suspendido,'
      '               mc_informar_mail,'
      '               (SELECT COUNT ( * )'
      
        '                  FROM aco_contrato, agenda.amc_mantenimientocue' +
        'nta'
      '                 WHERE co_idejecutivo = ec_id'
      '                   AND co_estado = 1'
      '                   AND co_fecharecepcion < TRUNC (SYSDATE) - 180'
      '                   AND ec_id = mc_idejecutivo(+)'
      '                   /*'
      '                   AND NVL ( (SELECT SUM (rc_empleados)'
      '                                FROM zrc_resumencobranza'
      '                               WHERE rc_contrato = co_contrato'
      
        '                                 AND rc_periodo >= TO_CHAR (ADD_' +
        'MONTHS (SYSDATE, -13), '#39'YYYYMM'#39')), NVL (co_totempleadosactual, c' +
        'o_totempleados)) > 0'
      '                   */'
      
        '                   AND NVL (co_totempleadosactual, co_totemplead' +
        'os) <= NVL (mc_tope_capitas, NVL (co_totempleadosactual, co_tote' +
        'mpleados)))'
      '                 AS cantidad_empresas,'
      '               (SELECT COUNT ( * )'
      
        '                  FROM aco_contrato, agenda.amc_mantenimientocue' +
        'nta'
      '                 WHERE co_idejecutivo = ec_id'
      '                   AND co_estado = 1'
      '                   AND co_fecharecepcion < TRUNC (SYSDATE) - 180'
      '                   AND ec_id = mc_idejecutivo(+)'
      
        '                   AND co_ultimoperiodomayorcero >= TO_CHAR (ADD' +
        '_MONTHS (SYSDATE, -13), '#39'YYYYMM'#39')'
      
        '                   AND NVL (co_totempleadosactual, co_totemplead' +
        'os) <= NVL (mc_tope_capitas, NVL (co_totempleadosactual, co_tote' +
        'mpleados)))'
      '                 AS cantidad_empresas_con_capitas,'
      '               (SELECT COUNT ( * )'
      
        '                  FROM agenda.aat_agendatarea, agenda.ast_seguim' +
        'ientotarea'
      '                 WHERE TRUNC (at_fechaalta) = TRUNC (SYSDATE)'
      '                   AND at_id = st_idtarea'
      '                   AND st_idusuario = se_id'
      '                   AND at_idtipoevento IN (330, 334, 136)'
      '                   AND st_estado IN ('#39'A'#39', '#39'T'#39'))'
      '                 AS contactos_hoy,'
      '               (SELECT COUNT (DISTINCT at_id)'
      
        '                  FROM agenda.aat_agendatarea, agenda.ast_seguim' +
        'ientotarea'
      '                 WHERE at_id = st_idtarea'
      '                   AND at_idtipoevento IN (330, 334, 136)'
      '                   AND at_fechabaja IS NULL'
      '                   AND at_fechaalta > TRUNC (SYSDATE) - 365'
      '                   AND se_id = st_idusuario'
      '                   AND st_estado IN ('#39'A'#39', '#39'T'#39'))'
      '                 AS contactos'
      '          FROM art.del_delegacion,'
      '               aec_ejecutivocuenta,'
      '               agenda.amc_mantenimientocuenta,'
      '               art.use_usuarios'
      '         WHERE mc_idejecutivo = ec_id'
      '           AND ec_usuario = se_usuario(+)'
      '           AND se_delegacion = el_id(+))'
      ' WHERE 1 = 1')
  end
  object ShortCutControlHijo: TShortCutControl
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
    Top = 200
  end
end
