inherited frmPresupuestosCargados: TfrmPresupuestosCargados
  Left = 350
  Top = 129
  Width = 805
  Height = 502
  Caption = 'Consulta de presupuestos cargados'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 720
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 797
    Height = 213
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label2: TLabel
      Left = 12
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Prestador'
    end
    object Label3: TLabel
      Left = 252
      Top = 128
      Width = 52
      Height = 13
      Caption = 'N'#176' Presup.'
    end
    object Label4: TLabel
      Left = 12
      Top = 128
      Width = 54
      Height = 13
      Caption = 'N'#176' Solicitud'
    end
    object Label5: TLabel
      Left = 76
      Top = 128
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object Label6: TLabel
      Left = 164
      Top = 128
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label7: TLabel
      Left = 314
      Top = 128
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object Label8: TLabel
      Left = 401
      Top = 128
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label9: TLabel
      Left = 12
      Top = 168
      Width = 78
      Height = 13
      Caption = 'Regi'#243'n Sanitaria'
    end
    object Label10: TLabel
      Left = 320
      Top = 168
      Width = 44
      Height = 13
      Caption = 'Localidad'
    end
    inline fraCONTRATO: TfraEmpresa
      Left = 10
      Top = 24
      Width = 776
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
        Left = 672
      end
      inherited edContrato: TIntEdit
        Left = 719
      end
      inherited cmbRSocial: TArtComboBox
        Width = 537
      end
    end
    inline fraIDENTIFICADOR: TfraPrestador
      Left = 9
      Top = 71
      Width = 781
      Height = 50
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 1
      inherited lbCUIT: TLabel
        Width = 24
      end
      inherited lbSec: TLabel
        Width = 21
      end
      inherited lbIdentif: TLabel
        Width = 40
      end
      inherited lbRSocial: TLabel
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Left = 258
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 709
        Width = 13
      end
      inherited lbTelefono: TLabel
        Left = 621
        Visible = True
      end
      inherited cmbPrestFantasia: TArtComboBox
        Width = 248
      end
      inherited cmbPrestador: TArtComboBox
        Width = 451
      end
      inherited edPresDomicilio: TEdit
        Width = 205
      end
      inherited edPresLocalidad: TEdit
        Left = 308
        Width = 304
      end
      inherited edPresCPostal: TEdit
        Left = 726
      end
      inherited edPresTelefono: TEdit
        Left = 641
        Visible = True
      end
      inherited sdqDatos: TSDQuery
        Top = 52
      end
      inherited dsDatos: TDataSource
        Top = 52
      end
    end
    object edNRO_PRESUPUESTO: TIntEdit
      Left = 248
      Top = 144
      Width = 61
      Height = 21
      TabOrder = 5
    end
    object edNRO_SOLICITUD: TIntEdit
      Left = 8
      Top = 144
      Width = 61
      Height = 21
      TabOrder = 2
    end
    object edSP_FECHASOLICITUDDesde: TDateComboBox
      Left = 72
      Top = 144
      Width = 86
      Height = 21
      TabOrder = 3
    end
    object edSP_FECHASOLICITUDHasta: TDateComboBox
      Left = 160
      Top = 144
      Width = 86
      Height = 21
      TabOrder = 4
    end
    object edPP_FECHAALTADesde: TDateComboBox
      Left = 312
      Top = 144
      Width = 86
      Height = 21
      TabOrder = 6
    end
    object edPP_FECHAALTAHasta: TDateComboBox
      Left = 400
      Top = 144
      Width = 86
      Height = 21
      TabOrder = 7
    end
    inline fraCOD_REG_SANITARIA: TfraCodDesc
      Left = 8
      Top = 184
      Width = 304
      Height = 23
      TabOrder = 8
      inherited Propiedades: TPropiedadesFrame
        ExtraCondition = ' AND TB_CLAVE = '#39'REGSA'#39' AND TB_CODIGO > '#39'0'#39' '
        FieldBaja = 'TB_FECHABAJA'
        FieldCodigo = 'TB_CODIGO'
        FieldDesc = 'TB_DESCRIPCION'
        FieldID = 'TB_CODIGO'
        OrderBy = 'TB_DESCRIPCION'
        ShowBajas = True
        TableName = 'ART.CTB_TABLAS'
      end
    end
    inline fraLOCALIDAD: TfraCodDesc
      Left = 316
      Top = 184
      Width = 470
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      inherited edCodigo: TPatternEdit [0]
      end
      inherited cmbDescripcion: TArtComboBox [1]
        Width = 405
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'baja'
        FieldCodigo = 'codigo'
        FieldDesc = 'descripcion'
        FieldID = 'id'
        ShowBajas = True
        Sql = 
          'SELECT tabla.* FROM (SELECT CP_LOCALIDAD as id, CP_CODIGO as cod' +
          'igo, CP_LOCALIDAD as descripcion, null as baja FROM ART.CCP_CODI' +
          'GOPOSTAL where cp_codigo > 1440 union SELECT '#39'CAPITAL FEDERAL'#39' a' +
          's id, '#39'CAP.FED.'#39' as codigo, '#39'CAPITAL FEDERAL'#39' as descripcion, nu' +
          'll as baja FROM DUAL) tabla WHERE 1 = 1'
        TableName = 'tabla'
      end
    end
    object rgPresSinSolic: TRadioGroup
      Left = 489
      Top = 134
      Width = 151
      Height = 37
      Caption = 'Ver Presup. sin solicitud'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 10
    end
    object rgVerBajas: TRadioGroup
      Left = 643
      Top = 134
      Width = 151
      Height = 37
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Ver Bajas'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 11
    end
  end
  inherited CoolBar: TCoolBar
    Top = 213
    Width = 797
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 793
      end>
    inherited ToolBar: TToolBar
      Width = 780
    end
  end
  inherited Grid: TArtDBGrid
    Top = 242
    Width = 797
    Height = 211
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    OnGetCellParams = GridGetCellParams
    TitleHeight = 34
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_SOLICITUD'
        Title.Caption = 'N'#176' Solicitud'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FECHASOLICITUD'
        Title.Caption = 'Fecha Solicitud'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NROESTABLECI'
        Title.Caption = 'N'#176' Est.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ES_NOMBRE'
        Title.Caption = 'Establecimiento'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDENTIFICADOR'
        Title.Caption = 'Identificador'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRO_PRESUPUESTO'
        Title.Caption = 'N'#176' Presupuesto'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PP_FECHAALTA'
        Title.Caption = 'Carga del presupuesto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REG_SANITARIA'
        Title.Caption = 'Reg. Sanitaria'
        Width = 47
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 453
    Width = 797
    Height = 19
    Align = alBottom
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT DISTINCT *'
      
        '  FROM (SELECT sp_id AS nro_solicitud, sp_fechasolicitud, sp_con' +
        'trato AS contrato, em_nombre,'
      
        '               co_estado, art.afiliacion.is_empresavip(co_contra' +
        'to) AS empresa_vip,'
      
        '               es_nroestableci, es_nombre, ca_identificador AS i' +
        'dentificador,'
      
        '               ca_descripcion AS prestador, ca_localidad AS loca' +
        'lidad,'
      
        '               tb_descripcion AS reg_sanitaria, cp_regionsanitar' +
        'ia AS cod_reg_sanitaria,'
      
        '               pp_nropresupuesto AS nro_presupuesto, pp_fechaalt' +
        'a, pp_fechabaja, 1 AS tipo'
      
        '          FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco' +
        '_contrato, art.ctb_tablas,'
      
        '               art.ccp_codigopostal, art.cpr_prestador, comunes.' +
        'cpp_presupuestoprestador cpp,'
      '               comunes.csp_solicitudpresupuesto csp'
      '         WHERE sp_id = pp_idsolicitud'
      '           AND pp_idestablecimiento = es_id'
      '           AND es_contrato = co_contrato'
      '           AND pp_idprestador = ca_identificador'
      '           AND sp_contrato = co_contrato'
      '           AND co_idempresa = em_id'
      '           AND ca_codpostal = cp_codigo(+)'
      '           AND ca_localidad = cp_localidad(+)'
      '           AND cp_regionsanitaria = tb_codigo(+)'
      '           AND tb_clave(+) = '#39'REGSA'#39
      '        UNION ALL'
      
        '        SELECT NULL AS nro_solicitud, NULL AS sp_fechasolicitud,' +
        ' es_contrato, em_nombre,'
      
        '               co_estado, art.afiliacion.is_empresavip(co_contra' +
        'to) AS empresa_vip,'
      
        '               es_nroestableci, es_nombre, ca_identificador AS i' +
        'dentificador,'
      
        '               ca_descripcion AS prestador, ca_localidad AS loca' +
        'lidad,'
      
        '               tb_descripcion AS reg_sanitaria, cp_regionsanitar' +
        'ia AS cod_reg_sanitaria,'
      
        '               pp_nropresupuesto AS nro_presupuesto, pp_fechaalt' +
        'a, pp_fechabaja, 2 AS tipo'
      
        '          FROM afi.aem_empresa, afi.aes_establecimiento, afi.aco' +
        '_contrato, art.ctb_tablas,'
      
        '               art.ccp_codigopostal, art.cpr_prestador, comunes.' +
        'cpp_presupuestoprestador cpp'
      '         WHERE pp_idprestador = ca_identificador'
      '           AND pp_idestablecimiento = es_id'
      '           AND es_contrato = co_contrato'
      '           AND co_idempresa = em_id'
      '           AND ca_codpostal = cp_codigo(+)'
      '           AND ca_localidad = cp_localidad(+)'
      '           AND cp_regionsanitaria = tb_codigo(+)'
      '           AND tb_clave(+) = '#39'REGSA'#39
      '           AND NOT EXISTS(SELECT 1'
      
        '                            FROM comunes.csp_solicitudpresupuest' +
        'o'
      '                           WHERE sp_id = pp_idsolicitud)'
      '       /* UNION ALL'
      
        '        SELECT sp_id AS nro_solicitud, sp_fechasolicitud, sp_con' +
        'trato, em_nombre,'
      
        '               co_estado, art.afiliacion.is_empresavip(co_contra' +
        'to) AS empresa_vip,'
      
        '               es_nroestableci, es_nombre, NULL AS identificador' +
        ', NULL AS prestador,'
      
        '               es_localidad AS localidad, tb_descripcion AS reg_' +
        'sanitaria,'
      
        '               cp_regionsanitaria AS cod_reg_sanitaria, NULL AS ' +
        'nro_presupuesto, TO_DATE(NULL),'
      '               TO_DATE(NULL), 3 AS tipo'
      
        '          FROM afi.aem_empresa, art.ctb_tablas, art.ccp_codigopo' +
        'stal, afi.aes_establecimiento,'
      
        '               afi.aco_contrato, comunes.csp_solicitudpresupuest' +
        'o csp'
      '         WHERE sp_contrato = co_contrato'
      '           AND sp_idestablecimiento = es_id'
      '           AND es_contrato = co_contrato'
      '           AND co_idempresa = em_id'
      '           AND es_cpostal = cp_codigo(+)'
      '           AND es_localidad = cp_localidad(+)'
      '           AND cp_regionsanitaria = tb_codigo(+)'
      '           AND tb_clave(+) = '#39'REGSA'#39
      '           AND NOT EXISTS(SELECT 1'
      
        '                            FROM comunes.cpp_presupuestoprestado' +
        'r'
      '                           WHERE sp_id = pp_idsolicitud) */)'
      ' WHERE 1 = 1')
    Left = 16
    Top = 292
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 292
  end
  inherited SortDialog: TSortDialog
    Left = 16
    Top = 320
  end
  inherited ExportDialog: TExportDialog
    Left = 44
    Top = 320
  end
  inherited QueryPrint: TQueryPrint
    Left = 44
    Top = 348
  end
  inherited Seguridad: TSeguridad
    Left = 16
    Top = 264
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 264
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 348
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
    Left = 72
    Top = 264
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 292
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
    Left = 100
    Top = 264
  end
end
