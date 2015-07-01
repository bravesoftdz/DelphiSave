inherited frmManEmpresasVIP: TfrmManEmpresasVIP
  Left = 212
  Top = 164
  Width = 780
  Height = 480
  Caption = 'Mantenimiento de Grandes Cuentas'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 113
    Visible = True
    object Label2: TLabel
      Left = 14
      Top = 64
      Width = 39
      Height = 13
      Caption = 'Motivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline fraEV_IDMOTIVOEMPRESAVIP: TfraCodDesc
      Left = 8
      Top = 82
      Width = 305
      Height = 23
      TabOrder = 1
      DesignSize = (
        305
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 240
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'MV_FECHABAJA'
        FieldCodigo = 'MV_ID'
        FieldDesc = 'MV_DESCRIPCION'
        FieldID = 'MV_ID'
        OrderBy = 'MV_DESCRIPCION'
        TableName = 'COMUNES.CMV_MOTIVOEMPRESAVIP'
      end
    end
    inline fraEV_IDEMPRESA: TfraEmpresaAGENDA
      Left = 0
      Top = 4
      Width = 489
      Height = 57
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        489
        57)
      inherited lbContrato: TLabel
        Left = 356
      end
      inherited lbInfoEmpresa: TLabel
        Left = 379
      end
      inherited btnClear: TJvSpeedButton
        Left = 461
      end
      inherited edContrato: TIntEdit
        Left = 403
      end
      inherited cmbRSocial: TArtComboBox
        Width = 121
      end
    end
    object Panel1: TPanel
      Left = 492
      Top = 0
      Width = 280
      Height = 113
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 2
        Width = 276
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Estados'
        TabOrder = 0
      end
      object clbCO_ESTADO: TARTCheckListBox
        Left = 2
        Top = 22
        Width = 276
        Height = 89
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 11
        ParentFont = False
        TabOrder = 1
        AutoAjustarColumnas = False
        Locked = False
        SQL = 
          'SELECT tb_descripcion AS descripcion, tb_codigo AS codigo FROM a' +
          'rt.ctb_tablas WHERE tb_clave = '#39'AFEST'#39' AND tb_codigo <> '#39'0'#39' ORDE' +
          'R BY tb_descripcion'
      end
    end
    object rgVigencia: TAdvOfficeRadioGroup
      Left = 320
      Top = 58
      Width = 165
      Height = 51
      Version = '1.2.1.0'
      Caption = ' Vigencia '
      ParentBackground = False
      ParentCtl3D = True
      TabOrder = 3
      Ellipsis = False
      ItemIndex = 0
      Items.Strings = (
        'Ver empresas VIP actuales'
        'Ver todo el historial')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 113
    Width = 772
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 768
      end>
    inherited ToolBar: TToolBar
      Width = 755
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 142
    Width = 772
    Height = 311
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    TitleHeight = 34
    AutoTitleHeight = True
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
        Title.Caption = 'Empresa'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_VIGENCIADESDE'
        Title.Caption = 'Desde'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_VIGENCIAHASTA'
        Title.Caption = 'Hasta'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_DESCRIPCION'
        Title.Caption = 'Motivo'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUALTA'
        Title.Caption = 'Usuario de alta'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAALTA'
        Title.Caption = 'Fecha de alta'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUMODIF'
        Title.Caption = 'Usuario de '#250'ltima modificaci'#243'n'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAMODIF'
        Title.Caption = #218'ltima modificaci'#243'n'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_DEVENGADOCUOTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_PERIODONOMINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RC_EMPLEADOS'
        Title.Caption = 'Empleados'
        Width = 56
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 156
    Top = 208
    Width = 601
    Height = 208
    OnShow = fpAbmShow
    DesignSize = (
      601
      208)
    inherited BevelAbm: TBevel
      Left = 16
      Top = 164
      Width = 575
    end
    object lbVigencia: TLabel [1]
      Left = 16
      Top = 64
      Width = 47
      Height = 13
      Caption = 'Vigencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbHasta: TLabel [2]
      Left = 111
      Top = 88
      Width = 27
      Height = 13
      Caption = 'hasta'
    end
    object Label1: TLabel [3]
      Left = 16
      Top = 112
      Width = 39
      Height = 13
      Caption = 'Motivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnAceptar: TButton
      Left = 442
      Top = 173
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 517
      Top = 173
      TabOrder = 5
    end
    inline fraEmpresaVIP: TfraEmpresaAGENDA
      Left = 8
      Top = 8
      Width = 585
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DesignSize = (
        585
        57)
      inherited lbContrato: TLabel
        Left = 452
      end
      inherited lbInfoEmpresa: TLabel
        Left = 475
      end
      inherited btnClear: TJvSpeedButton
        Left = 557
      end
      inherited edContrato: TIntEdit
        Left = 499
      end
      inherited cmbRSocial: TArtComboBox
        Width = 217
      end
    end
    object edVigenciaDesde: TDateComboBox
      Left = 16
      Top = 84
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edVigenciaHasta: TDateComboBox
      Left = 144
      Top = 84
      Width = 88
      Height = 21
      TabOrder = 2
    end
    inline fraMotivoEmpresaVIP: TfraCodDesc
      Left = 15
      Top = 128
      Width = 330
      Height = 23
      TabOrder = 3
      DesignSize = (
        330
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 265
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'MV_FECHABAJA'
        FieldCodigo = 'MV_ID'
        FieldDesc = 'MV_DESCRIPCION'
        FieldID = 'MV_ID'
        OrderBy = 'MV_DESCRIPCION'
        TableName = 'COMUNES.CMV_MOTIVOEMPRESAVIP'
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT em_cuit,'
      '       em_nombre,'
      '       ev_id,'
      '       ev_idempresa,'
      '       ev_usualta,'
      '       ev_fechaalta,'
      '       ev_usumodif,'
      '       ev_fechamodif,'
      '       ev_vigenciadesde,'
      '       ev_vigenciahasta,'
      '       ev_idmotivoempresavip,'
      '       mv_descripcion,'
      
        '       art.afiliacion.check_cobertura (em_cuit, SYSDATE) AS cobe' +
        'rtura,'
      '       usuario_alta.se_nombre AS usualta,'
      '       usuario_modif.se_nombre AS usumodif,'
      '       co_estado,'
      '       tb_descripcion,'
      '       rc_periodonomina,'
      '       rc_devengadocuota,'
      '       rc_empleados'
      '  FROM art.use_usuarios usuario_alta,'
      '       art.use_usuarios usuario_modif,'
      '       art.ctb_tablas,'
      '       afi.aem_empresa,'
      '       afi.aco_contrato,'
      '       cob.zrc_resumencobranza zrc,'
      '       comunes.cev_empresavip,'
      '       comunes.cmv_motivoempresavip'
      ' WHERE ev_idmotivoempresavip = mv_id(+)'
      '   AND em_id = ev_idempresa'
      '   AND ev_usualta = usuario_alta.se_usuario(+)'
      '   AND ev_usumodif = usuario_modif.se_usuario(+)'
      '   AND tb_clave = '#39'AFEST'#39
      '   AND tb_codigo = co_estado'
      '   AND co_contrato = art.afiliacion.get_ultcontrato (em_cuit)'
      '   AND rc_contrato = co_contrato'
      '   AND rc_periodo = (SELECT MAX (zrcsub.rc_periodo)'
      '                       FROM cob.zrc_resumencobranza zrcsub'
      '                      WHERE zrcsub.rc_contrato = zrc.rc_contrato'
      
        '                        AND zrcsub.rc_fechadevengado IS NOT NULL' +
        ')')
    object sdqConsultaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaEV_ID: TFloatField
      FieldName = 'EV_ID'
      Required = True
    end
    object sdqConsultaEV_IDEMPRESA: TFloatField
      FieldName = 'EV_IDEMPRESA'
    end
    object sdqConsultaEV_USUALTA: TStringField
      FieldName = 'EV_USUALTA'
      Required = True
    end
    object sdqConsultaEV_FECHAALTA: TDateTimeField
      FieldName = 'EV_FECHAALTA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaEV_USUMODIF: TStringField
      FieldName = 'EV_USUMODIF'
    end
    object sdqConsultaEV_FECHAMODIF: TDateTimeField
      FieldName = 'EV_FECHAMODIF'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaEV_VIGENCIADESDE: TDateTimeField
      FieldName = 'EV_VIGENCIADESDE'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaEV_VIGENCIAHASTA: TDateTimeField
      FieldName = 'EV_VIGENCIAHASTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sdqConsultaEV_IDMOTIVOEMPRESAVIP: TFloatField
      FieldName = 'EV_IDMOTIVOEMPRESAVIP'
    end
    object sdqConsultaMV_DESCRIPCION: TStringField
      FieldName = 'MV_DESCRIPCION'
      Size = 255
    end
    object sdqConsultaCOBERTURA: TFloatField
      FieldName = 'COBERTURA'
    end
    object sdqConsultaUSUALTA: TStringField
      FieldName = 'USUALTA'
      Size = 50
    end
    object sdqConsultaUSUMODIF: TStringField
      FieldName = 'USUMODIF'
      Size = 50
    end
    object sdqConsultaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaCO_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'CO_ESTADO'
      Required = True
      Size = 2
    end
    object sdqConsultaTB_DESCRIPCION: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqConsultaRC_PERIODONOMINA: TStringField
      DisplayLabel = 'Per'#237'odo '#250'ltima n'#243'mina'
      FieldName = 'RC_PERIODONOMINA'
      Size = 6
    end
    object sdqConsultaRC_DEVENGADOCUOTA: TFloatField
      DisplayLabel = 'Devengado cuota'
      FieldName = 'RC_DEVENGADOCUOTA'
      Required = True
    end
    object sdqConsultaRC_EMPLEADOS: TFloatField
      FieldName = 'RC_EMPLEADOS'
      Required = True
    end
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
    Left = 108
    Top = 200
  end
end
