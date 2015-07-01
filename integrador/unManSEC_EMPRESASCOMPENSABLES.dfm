inherited frmManSEC_EMPRESASCOMPENSABLES: TfrmManSEC_EMPRESASCOMPENSABLES
  Left = 212
  Top = 164
  Width = 780
  Height = 480
  Caption = 'Mantenimiento de empresas compensables'
  Constraints.MinHeight = 480
  Constraints.MinWidth = 780
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 772
    Height = 69
    Visible = True
    inline fraEC_CONTRATO: TfraEmpresaAGENDA
      Left = 0
      Top = 4
      Width = 529
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
      inherited lbContrato: TLabel
        Left = 396
      end
      inherited lbInfoEmpresa: TLabel
        Left = 419
      end
      inherited btnClear: TJvSpeedButton
        Left = 501
      end
      inherited edContrato: TIntEdit
        Left = 443
      end
      inherited cmbRSocial: TArtComboBox
        Width = 161
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 69
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
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 98
    Width = 772
    Height = 355
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
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CONTRATO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_FECHAALTA'
        Width = 66
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
        FieldName = 'EC_FECHAMODIF'
        Title.Caption = #218'ltima modificaci'#243'n'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'USUMODIF'
        Title.Caption = 'Usuario de '#250'ltima modificaci'#243'n'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EC_FECHABAJA'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUBAJA'
        Width = 71
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 156
    Top = 288
    Width = 601
    Height = 121
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Left = 16
      Top = 77
      Width = 575
    end
    object lbVigencia: TLabel [1]
      Left = 16
      Top = 84
      Width = 47
      Height = 13
      Caption = 'Vigencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbHasta: TLabel [2]
      Left = 111
      Top = 108
      Width = 27
      Height = 13
      Caption = 'hasta'
      Visible = False
    end
    inherited btnAceptar: TButton
      Left = 442
      Top = 86
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 517
      Top = 86
      TabOrder = 4
    end
    inline fraEmpresaCompensable: TfraEmpresaAGENDA
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
    object edVigenciaDesdeNO: TDateComboBox
      Left = 16
      Top = 104
      Width = 88
      Height = 21
      TabOrder = 1
      Visible = False
    end
    object edVigenciaHastaNO: TDateComboBox
      Left = 144
      Top = 104
      Width = 88
      Height = 21
      TabOrder = 2
      Visible = False
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT em_cuit,'
      '       em_nombre,'
      '       ec_id,'
      '       ec_contrato,'
      '       ec_usualta,'
      '       ec_fechaalta,'
      '       ec_usumodif,'
      '       ec_fechamodif,'
      '       --       ec_vigenciadesde,'
      '       --       ec_vigenciahasta,'
      '       ec_usubaja,'
      '       ec_fechabaja,'
      
        '       art.afiliacion.check_cobertura (em_cuit, SYSDATE) AS cobe' +
        'rtura,'
      '       usuario_alta.se_nombre AS usualta,'
      '       usuario_modif.se_nombre AS usumodif,'
      '       usuario_baja.se_nombre AS usubaja       '
      '  FROM art.use_usuarios usuario_alta,'
      '       art.use_usuarios usuario_modif,'
      '       art.use_usuarios usuario_baja,       '
      '       afi.aco_contrato,'
      '       afi.aem_empresa,'
      '       SIN.sec_empresascompensables'
      ' WHERE co_contrato = ec_contrato'
      '   AND em_id = co_idempresa'
      '   AND ec_usualta = usuario_alta.se_usuario(+)'
      '   AND ec_usumodif = usuario_modif.se_usuario(+)'
      '   AND ec_usubaja = usuario_baja.se_usuario(+)   ')
    object sdqConsultaEM_NOMBRE: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EM_NOMBRE'
      Required = True
      Size = 60
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
    object sdqConsultaEC_ID: TFloatField
      DisplayLabel = 'ID'
      FieldName = 'EC_ID'
      Required = True
    end
    object sdqConsultaEC_CONTRATO: TFloatField
      DisplayLabel = 'Contrato'
      FieldName = 'EC_CONTRATO'
    end
    object sdqConsultaEC_USUALTA: TStringField
      DisplayLabel = 'Usuario de alta'
      FieldName = 'EC_USUALTA'
    end
    object sdqConsultaEC_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha de alta'
      FieldName = 'EC_FECHAALTA'
    end
    object sdqConsultaEC_USUMODIF: TStringField
      DisplayLabel = 'Usuario de modificaci'#243'n'
      FieldName = 'EC_USUMODIF'
    end
    object sdqConsultaEC_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha de modificaci'#243'n'
      FieldName = 'EC_FECHAMODIF'
    end
    object sdqConsultaEC_USUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'EC_USUBAJA'
    end
    object sdqConsultaEC_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha de baja'
      FieldName = 'EC_FECHABAJA'
    end
    object sdqConsultaUSUBAJA: TStringField
      DisplayLabel = 'Usuario de baja'
      FieldName = 'USUBAJA'
      Size = 50
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
