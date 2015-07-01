inherited frmEnviosVentanillaElectronica: TfrmEnviosVentanillaElectronica
  Caption = 'Env'#237'os ventanilla electr'#243'nica'
  ClientHeight = 744
  ClientWidth = 1340
  Constraints.MinWidth = 900
  Font.Name = 'Tahoma'
  Position = poScreenCenter
  WindowState = wsMaximized
  ExplicitWidth = 1348
  ExplicitHeight = 774
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1340
    Height = 154
    Visible = True
    ExplicitWidth = 1340
    ExplicitHeight = 154
    object Panel1: TPanel
      Left = 403
      Top = 0
      Width = 715
      Height = 154
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        715
        154)
      object Label17: TLabel
        Left = 4
        Top = 6
        Width = 58
        Height = 13
        Caption = 'Usuario Alta'
      end
      object Label1: TLabel
        Left = 4
        Top = 51
        Width = 97
        Height = 13
        Caption = 'Usuario Modificaci'#243'n'
      end
      object Label2: TLabel
        Left = 4
        Top = 97
        Width = 65
        Height = 13
        Caption = 'Usuario Env'#237'o'
      end
      inline fraEV_USUARIOALTA: TfraCodDesc
        Left = 3
        Top = 24
        Width = 711
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 24
        ExplicitWidth = 711
        DesignSize = (
          711
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 112
          Width = 600
          ExplicitLeft = 112
          ExplicitWidth = 600
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 110
          ExplicitLeft = 0
          ExplicitWidth = 110
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          ShowBajas = True
          TableName = 'ART.USE_USUARIOS'
          Left = 68
          Top = 65530
        end
      end
      inline fraEV_USUARIOMODIF: TfraCodDesc
        Left = 3
        Top = 69
        Width = 711
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 69
        ExplicitWidth = 711
        DesignSize = (
          711
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 112
          Width = 599
          ExplicitLeft = 112
          ExplicitWidth = 599
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 110
          ExplicitLeft = 0
          ExplicitWidth = 110
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          ShowBajas = True
          TableName = 'ART.USE_USUARIOS'
          Left = 68
          Top = 65530
        end
      end
      inline fraEV_USUENVIO: TfraCodDesc
        Left = 3
        Top = 115
        Width = 711
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ExplicitLeft = 3
        ExplicitTop = 115
        ExplicitWidth = 711
        DesignSize = (
          711
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 112
          Width = 599
          ExplicitLeft = 112
          ExplicitWidth = 599
        end
        inherited edCodigo: TPatternEdit
          Left = 0
          Width = 110
          ExplicitLeft = 0
          ExplicitWidth = 110
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          ShowBajas = True
          TableName = 'ART.USE_USUARIOS'
          Left = 68
          Top = 65530
        end
      end
    end
    object Panel2: TPanel
      Left = 1118
      Top = 0
      Width = 212
      Height = 154
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Label9: TLabel
        Left = 100
        Top = 27
        Width = 16
        Height = 13
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 9
        Top = 6
        Width = 51
        Height = 13
        Caption = 'Fecha Alta'
      end
      object Label3: TLabel
        Left = 100
        Top = 74
        Width = 16
        Height = 13
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 51
        Width = 90
        Height = 13
        Caption = 'Fecha Modificaci'#243'n'
      end
      object Label5: TLabel
        Left = 99
        Top = 119
        Width = 16
        Height = 13
        Caption = '>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 97
        Width = 58
        Height = 13
        Caption = 'Fecha Env'#237'o'
      end
      object edVE_FECHAALTAHasta: TDateComboBox
        Left = 118
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 0
      end
      object edVE_FECHAALTADesde: TDateComboBox
        Left = 6
        Top = 24
        Width = 88
        Height = 21
        TabOrder = 1
      end
      object edVE_FECHAMODIFHasta: TDateComboBox
        Left = 118
        Top = 71
        Width = 88
        Height = 21
        TabOrder = 2
      end
      object edVE_FECHAMODIFDesde: TDateComboBox
        Left = 6
        Top = 71
        Width = 88
        Height = 21
        TabOrder = 3
      end
      object edVE_FECHAENVIOHasta: TDateComboBox
        Left = 117
        Top = 116
        Width = 88
        Height = 21
        TabOrder = 4
      end
      object edVE_FECHAENVIODesde: TDateComboBox
        Left = 5
        Top = 116
        Width = 88
        Height = 21
        TabOrder = 5
      end
    end
    object Panel3: TPanel
      Left = 1330
      Top = 0
      Width = 10
      Height = 154
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 151
      Height = 154
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 3
      object Panel4: TPanel
        Left = 2
        Top = 2
        Width = 147
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Estados'
        TabOrder = 0
      end
      object cblEV_IDESTADO: TARTCheckListBox
        Left = 2
        Top = 22
        Width = 147
        Height = 130
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        AutoAjustarColumnas = False
        Locked = False
        SQL = 
          'SELECT ve_descripcion descripcion, ve_id codigop FROM srt.sve_ve' +
          'ntanillaestado '
      end
    end
    object Panel6: TPanel
      Left = 151
      Top = 0
      Width = 252
      Height = 154
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 4
      object Panel7: TPanel
        Left = 2
        Top = 2
        Width = 248
        Height = 20
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Tipos de env'#237'o'
        TabOrder = 0
      end
      object cblEV_IDTIPOENVIO: TARTCheckListBox
        Left = 2
        Top = 22
        Width = 248
        Height = 130
        Align = alClient
        BevelEdges = []
        BorderStyle = bsNone
        Columns = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        AutoAjustarColumnas = False
        Locked = False
        SQL = 
          'select tv_descripcion descripcion, tv_id codigo from srt.stv_tip' +
          'oenvio'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 154
    Width = 1340
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1336
      end>
    ExplicitTop = 154
    ExplicitWidth = 1340
    inherited ToolBar: TToolBar
      Width = 1327
      ExplicitWidth = 1327
    end
  end
  inherited Grid: TArtDBGrid
    Top = 183
    Width = 1340
    Height = 561
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'EV_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORIA'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOCOMUNICACION'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAENVIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOENVIO'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAALTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOALTA'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOMODIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHABAJA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOBAJA'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 215
    Top = 252
    Width = 742
    Height = 405
    ExplicitLeft = 215
    ExplicitTop = 252
    ExplicitWidth = 742
    ExplicitHeight = 405
    inherited BevelAbm: TBevel
      Top = 369
      Width = 734
      ExplicitTop = 157
      ExplicitWidth = 586
    end
    inherited btnAceptar: TButton
      Left = 586
      Top = 375
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 586
      ExplicitTop = 375
    end
    inherited btnCancelar: TButton
      Left = 662
      Top = 375
      ExplicitLeft = 662
      ExplicitTop = 375
    end
    object pnlDatos: TPanel
      Left = 0
      Top = 0
      Width = 742
      Height = 157
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        742
        157)
      object Label10: TLabel
        Left = 10
        Top = 54
        Width = 47
        Height = 13
        Caption = 'Categor'#237'a'
      end
      object Label11: TLabel
        Left = 362
        Top = 53
        Width = 101
        Height = 13
        Caption = 'Tipo de comunicaci'#243'n'
      end
      object Label12: TLabel
        Left = 10
        Top = 3
        Width = 58
        Height = 13
        Caption = 'Fecha env'#237'o'
      end
      object Label13: TLabel
        Left = 122
        Top = 3
        Width = 65
        Height = 13
        Caption = 'Usuario env'#237'o'
      end
      object Label14: TLabel
        Left = 362
        Top = 102
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label15: TLabel
        Left = 11
        Top = 103
        Width = 49
        Height = 13
        Caption = 'Tipo env'#237'o'
      end
      inline fraCategoria: TfraCodDesc
        Left = 9
        Top = 72
        Width = 348
        Height = 23
        TabOrder = 0
        ExplicitLeft = 9
        ExplicitTop = 72
        ExplicitWidth = 348
        DesignSize = (
          348
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 315
          ExplicitLeft = 32
          ExplicitWidth = 315
        end
        inherited edCodigo: TPatternEdit
          Width = 30
          ExplicitWidth = 30
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'ES_ID'
          FieldDesc = 'ES_NOMBRE'
          FieldID = 'ES_ID'
          TableName = 'SRT.SES_ESERVICIOSSECTOR'
          Left = 112
          Top = 65530
        end
      end
      inline fraTipo: TfraCodDesc
        Left = 361
        Top = 72
        Width = 375
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 361
        ExplicitTop = 72
        ExplicitWidth = 375
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 343
          ExplicitLeft = 32
          ExplicitWidth = 343
        end
        inherited edCodigo: TPatternEdit
          Width = 30
          ExplicitWidth = 30
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'NULL'
          FieldCodigo = 'ET_ID'
          FieldDesc = 'ET_NOMBRE'
          FieldID = 'ET_ID'
          TableName = 'SRT.SET_ESERVICIOSTIPOS'
          Left = 124
          Top = 65530
        end
      end
      object edFechaEnvio: TDateComboBox
        Left = 9
        Top = 23
        Width = 110
        Height = 21
        TabOrder = 2
      end
      inline fraUsuarioEnvio: TfraCodDesc
        Left = 121
        Top = 21
        Width = 617
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ExplicitLeft = 121
        ExplicitTop = 21
        ExplicitWidth = 617
        inherited cmbDescripcion: TArtComboBox
          Left = 113
          Width = 503
          ExplicitLeft = 113
          ExplicitWidth = 503
        end
        inherited edCodigo: TPatternEdit
          Width = 110
          ExplicitWidth = 110
        end
        inherited Propiedades: TPropiedadesFrame
          ExtraCondition = 'AND SE_USUARIOGENERICO = '#39'N'#39
          FieldBaja = 'SE_FECHABAJA'
          FieldCodigo = 'SE_USUARIO'
          FieldDesc = 'SE_NOMBRE'
          FieldID = 'SE_USUARIO'
          ShowBajas = True
          TableName = 'ART.USE_USUARIOS'
          Left = 152
          Top = 65530
        end
      end
      inline fraEstado: TfraCodDesc
        Left = 361
        Top = 120
        Width = 374
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 361
        ExplicitTop = 120
        ExplicitWidth = 374
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 341
          ExplicitLeft = 32
          ExplicitWidth = 341
        end
        inherited edCodigo: TPatternEdit
          Width = 30
          ExplicitWidth = 30
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'VE_FECHABAJA'
          FieldCodigo = 'VE_ID'
          FieldDesc = 'VE_DESCRIPCION'
          FieldID = 'VE_ID'
          TableName = 'SRT.SVE_VENTANILLAESTADO'
          Left = 116
          Top = 65530
        end
      end
      inline fraTipoEnvio: TfraCodDesc
        Left = 10
        Top = 121
        Width = 346
        Height = 23
        TabOrder = 5
        ExplicitLeft = 10
        ExplicitTop = 121
        ExplicitWidth = 346
        inherited cmbDescripcion: TArtComboBox
          Left = 32
          Width = 313
          ExplicitLeft = 32
          ExplicitWidth = 313
        end
        inherited edCodigo: TPatternEdit
          Width = 30
          ExplicitWidth = 30
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'TV_FECHABAJA'
          FieldCodigo = 'TV_ID'
          FieldDesc = 'TV_DESCRIPCION'
          FieldID = 'TV_ID'
          TableName = 'SRT.STV_TIPOENVIO'
          Left = 120
        end
      end
    end
    object pnlGen: TPanel
      Left = 0
      Top = 157
      Width = 742
      Height = 123
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      object pnlEstablecimientoEnvio: TPanel
        Left = 0
        Top = 41
        Width = 742
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
      end
      object pnlContactoEnvio: TPanel
        Left = 0
        Top = 82
        Width = 742
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
      end
      object pnlEmpresaEnvio: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT srt.sev_envioventanilla.*,'
      
        '       NVL(srt.sev_envioventanilla.ev_cuit, srt.sev_envioventani' +
        'lla.ev_cuil) cuit,'
      '       srt.ses_eserviciossector.es_nombre categoria,'
      '       srt.set_eserviciostipos.et_nombre tipocomunicacion,'
      '       usu1.se_nombre usuarioenvio,'
      '       NVL(usu2.se_nombre, ev_usualta) usuarioalta,'
      '       usu3.se_nombre usuariomodif,'
      '       usu4.se_nombre usuariobaja,'
      '       srt.sve_ventanillaestado.ve_descripcion estado,'
      '       srt.sev_envioventanilla.ev_fechaalta fechaalta,'
      '       srt.sev_envioventanilla.ev_fechamodif fechamodif,'
      '       srt.sev_envioventanilla.ev_fechabaja fechabaja'
      '  FROM srt.sev_envioventanilla,'
      '       srt.ses_eserviciossector,'
      '       srt.set_eserviciostipos,'
      '       art.use_usuarios usu1,'
      '       art.use_usuarios usu2,'
      '       art.use_usuarios usu3,'
      '       art.use_usuarios usu4,'
      '       srt.sve_ventanillaestado'
      ' WHERE ev_idcategoria = es_id(+)'
      '   AND ev_idtipocomunicacion = et_id(+)'
      '   AND ev_usuenvio = usu1.se_usuario(+)'
      '   AND ev_usualta = usu2.se_usuario(+)'
      '   AND ev_usumodif = usu3.se_usuario(+)'
      '   AND ev_usubaja = usu4.se_usuario(+)'
      '   AND ev_idestado = ve_id(+)')
    Top = 304
    object sdqConsultaEV_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EV_ID'
      Required = True
    end
    object sdqConsultaEV_CUIT: TStringField
      DisplayLabel = 'C.U.I.T.'
      FieldName = 'EV_CUIT'
      Size = 11
    end
    object sdqConsultaCATEGORIA: TStringField
      DisplayLabel = 'Categor'#237'a'
      FieldName = 'CATEGORIA'
      Size = 100
    end
    object sdqConsultaTIPOCOMUNICACION: TStringField
      DisplayLabel = 'Tipo de comunicaci'#243'n'
      FieldName = 'TIPOCOMUNICACION'
      Size = 100
    end
    object sdqConsultaEV_FECHAENVIO: TDateTimeField
      DisplayLabel = 'Fecha de env'#237'o'
      FieldName = 'EV_FECHAENVIO'
    end
    object sdqConsultaUSUARIOENVIO: TStringField
      DisplayLabel = 'Usuario env'#237'o'
      FieldName = 'USUARIOENVIO'
      Size = 50
    end
    object sdqConsultaESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 400
    end
    object sdqConsultaEV_FECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'EV_FECHAALTA'
      Required = True
    end
    object sdqConsultaUSUARIOALTA: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'USUARIOALTA'
      Size = 50
    end
    object sdqConsultaEV_FECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha modificaci'#243'n'
      FieldName = 'EV_FECHAMODIF'
    end
    object sdqConsultaUSUARIOMODIF: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'USUARIOMODIF'
      Size = 50
    end
    object sdqConsultaEV_USUMODIF: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'EV_USUMODIF'
    end
    object sdqConsultaEV_FECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'EV_FECHABAJA'
    end
    object sdqConsultaUSUARIOBAJA: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'USUARIOBAJA'
      Size = 50
    end
    object sdqConsultaFECHAALTA: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'FECHAALTA'
      Required = True
    end
    object sdqConsultaFECHAMODIF: TDateTimeField
      DisplayLabel = 'Fecha modif'
      FieldName = 'FECHAMODIF'
    end
    object sdqConsultaFECHABAJA: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'FECHABAJA'
    end
    object sdqConsultaEV_IDESTABLECI: TFloatField
      FieldName = 'EV_IDESTABLECI'
    end
    object sdqConsultaEV_CUIL: TStringField
      FieldName = 'EV_CUIL'
      Size = 11
    end
    object sdqConsultaEV_IDCATEGORIA: TFloatField
      FieldName = 'EV_IDCATEGORIA'
      Required = True
    end
    object sdqConsultaEV_IDTIPOCOMUNICACION: TFloatField
      FieldName = 'EV_IDTIPOCOMUNICACION'
      Required = True
    end
    object sdqConsultaEV_ARCHIVO: TStringField
      FieldName = 'EV_ARCHIVO'
      Size = 400
    end
    object sdqConsultaEV_USUENVIO: TStringField
      FieldName = 'EV_USUENVIO'
    end
    object sdqConsultaEV_IDESTADO: TFloatField
      FieldName = 'EV_IDESTADO'
      Required = True
    end
    object sdqConsultaEV_USUALTA: TStringField
      FieldName = 'EV_USUALTA'
      Required = True
    end
    object sdqConsultaEV_USUBAJA: TStringField
      FieldName = 'EV_USUBAJA'
    end
    object sdqConsultaEV_IDENVIO: TFloatField
      FieldName = 'EV_IDENVIO'
      Required = True
    end
    object sdqConsultaEV_IDTIPOENVIO: TFloatField
      FieldName = 'EV_IDTIPOENVIO'
      Required = True
    end
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
  end
  inherited dsConsulta: TDataSource
    Top = 304
  end
  inherited SortDialog: TSortDialog
    Top = 332
  end
  inherited ExportDialog: TExportDialog
    Top = 332
  end
  inherited QueryPrint: TQueryPrint
    Top = 360
  end
  inherited Seguridad: TSeguridad
    Top = 276
  end
  inherited FormStorage: TFormStorage
    Top = 276
  end
  inherited PrintDialog: TPrintDialog
    Top = 360
  end
  inherited ShortCutControl: TShortCutControl
    Top = 276
  end
  inherited FieldHider: TFieldHider
    Top = 304
  end
  object sdqInsert: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'INSERT INTO srt.sev_envioventanilla(ev_cuit, ev_idestableci,'
      '                                    ev_cuil, ev_idcategoria,'
      '                                    ev_archivo,'
      
        '                                    ev_idenvio, ev_idtipoenvio, ' +
        'ev_comunicacion)'
      '    VALUES (:ev_cuit, :ev_idestableci,'
      '            :ev_cuil, :ev_idcategoria,'
      '            :ev_archivo,'
      '            :ev_idenvio, :ev_idtipoenvio, :ev_comunicacion)')
    Left = 24
    Top = 388
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ev_cuit'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_idestableci'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_cuil'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_idcategoria'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_archivo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_idenvio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_idtipoenvio'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ev_comunicacion'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EV_ID'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'C.U.I.T.'
      FieldName = 'EV_CUIT'
      Size = 11
    end
    object StringField2: TStringField
      DisplayLabel = 'Categor'#237'a'
      FieldName = 'CATEGORIA'
      Size = 100
    end
    object StringField3: TStringField
      DisplayLabel = 'Tipo de comunicaci'#243'n'
      FieldName = 'TIPOCOMUNICACION'
      Size = 100
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Fecha de env'#237'o'
      FieldName = 'EV_FECHAENVIO'
    end
    object StringField4: TStringField
      DisplayLabel = 'Usuario env'#237'o'
      FieldName = 'USUARIOENVIO'
      Size = 50
    end
    object StringField5: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 400
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'EV_FECHAALTA'
      Required = True
    end
    object StringField6: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'USUARIOALTA'
      Size = 50
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Fecha modificaci'#243'n'
      FieldName = 'EV_FECHAMODIF'
    end
    object StringField7: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'USUARIOMODIF'
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'EV_USUMODIF'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'EV_FECHABAJA'
    end
    object StringField9: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'USUARIOBAJA'
      Size = 50
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'FECHAALTA'
      Required = True
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Fecha modif'
      FieldName = 'FECHAMODIF'
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'FECHABAJA'
    end
    object FloatField2: TFloatField
      FieldName = 'EV_IDESTABLECI'
    end
    object StringField10: TStringField
      FieldName = 'EV_CUIL'
      Size = 11
    end
    object FloatField3: TFloatField
      FieldName = 'EV_IDCATEGORIA'
      Required = True
    end
    object FloatField4: TFloatField
      FieldName = 'EV_IDTIPOCOMUNICACION'
      Required = True
    end
    object StringField11: TStringField
      FieldName = 'EV_ARCHIVO'
      Size = 400
    end
    object StringField12: TStringField
      FieldName = 'EV_USUENVIO'
    end
    object FloatField5: TFloatField
      FieldName = 'EV_IDESTADO'
      Required = True
    end
    object StringField13: TStringField
      FieldName = 'EV_USUALTA'
      Required = True
    end
    object StringField14: TStringField
      FieldName = 'EV_USUBAJA'
    end
    object FloatField6: TFloatField
      FieldName = 'EV_IDENVIO'
      Required = True
    end
    object FloatField7: TFloatField
      FieldName = 'EV_IDTIPOENVIO'
      Required = True
    end
    object StringField15: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
  end
  object sdqEnvio: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM srt.sev_envioventanilla'
      ' WHERE ev_idenvio = :ev_idenvio')
    Left = 52
    Top = 388
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ev_idenvio'
        ParamType = ptInput
      end>
    object FloatField8: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EV_ID'
      Required = True
    end
    object StringField16: TStringField
      DisplayLabel = 'C.U.I.T.'
      FieldName = 'EV_CUIT'
      Size = 11
    end
    object StringField17: TStringField
      DisplayLabel = 'Categor'#237'a'
      FieldName = 'CATEGORIA'
      Size = 100
    end
    object StringField18: TStringField
      DisplayLabel = 'Tipo de comunicaci'#243'n'
      FieldName = 'TIPOCOMUNICACION'
      Size = 100
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = 'Fecha de env'#237'o'
      FieldName = 'EV_FECHAENVIO'
    end
    object StringField19: TStringField
      DisplayLabel = 'Usuario env'#237'o'
      FieldName = 'USUARIOENVIO'
      Size = 50
    end
    object StringField20: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 400
    end
    object DateTimeField9: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'EV_FECHAALTA'
      Required = True
    end
    object StringField21: TStringField
      DisplayLabel = 'Usuario alta'
      FieldName = 'USUARIOALTA'
      Size = 50
    end
    object DateTimeField10: TDateTimeField
      DisplayLabel = 'Fecha modificaci'#243'n'
      FieldName = 'EV_FECHAMODIF'
    end
    object StringField22: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'USUARIOMODIF'
      Size = 50
    end
    object StringField23: TStringField
      DisplayLabel = 'Usuario modif.'
      FieldName = 'EV_USUMODIF'
    end
    object DateTimeField11: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'EV_FECHABAJA'
    end
    object StringField24: TStringField
      DisplayLabel = 'Usuario baja'
      FieldName = 'USUARIOBAJA'
      Size = 50
    end
    object DateTimeField12: TDateTimeField
      DisplayLabel = 'Fecha alta'
      FieldName = 'FECHAALTA'
      Required = True
    end
    object DateTimeField13: TDateTimeField
      DisplayLabel = 'Fecha modif'
      FieldName = 'FECHAMODIF'
    end
    object DateTimeField14: TDateTimeField
      DisplayLabel = 'Fecha baja'
      FieldName = 'FECHABAJA'
    end
    object FloatField9: TFloatField
      FieldName = 'EV_IDESTABLECI'
    end
    object StringField25: TStringField
      FieldName = 'EV_CUIL'
      Size = 11
    end
    object FloatField10: TFloatField
      FieldName = 'EV_IDCATEGORIA'
      Required = True
    end
    object FloatField11: TFloatField
      FieldName = 'EV_IDTIPOCOMUNICACION'
      Required = True
    end
    object StringField26: TStringField
      FieldName = 'EV_ARCHIVO'
      Size = 400
    end
    object StringField27: TStringField
      FieldName = 'EV_USUENVIO'
    end
    object FloatField12: TFloatField
      FieldName = 'EV_IDESTADO'
      Required = True
    end
    object StringField28: TStringField
      FieldName = 'EV_USUALTA'
      Required = True
    end
    object StringField29: TStringField
      FieldName = 'EV_USUBAJA'
    end
    object FloatField13: TFloatField
      FieldName = 'EV_IDENVIO'
      Required = True
    end
    object FloatField14: TFloatField
      FieldName = 'EV_IDTIPOENVIO'
      Required = True
    end
    object StringField30: TStringField
      FieldName = 'CUIT'
      Size = 11
    end
  end
end
