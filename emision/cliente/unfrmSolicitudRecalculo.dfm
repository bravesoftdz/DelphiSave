inherited frmPedidosRecalculo: TfrmPedidosRecalculo
  Left = 95
  Top = 123
  Width = 693
  Caption = 'Pedidos de Rec'#225'lculo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 685
    Height = 109
    Visible = True
    object lblEmpresa: TLabel
      Left = 6
      Top = 11
      Width = 44
      Height = 13
      Caption = 'Empresa:'
    end
    object lblPeriodosFiltro: TLabel
      Left = 6
      Top = 35
      Width = 46
      Height = 13
      Caption = 'Per'#237'odos:'
    end
    object lblHastaPeriodosFiltro: TLabel
      Left = 107
      Top = 35
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblFechaDesdeFiltro: TLabel
      Left = 6
      Top = 62
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblFechaHastaFIltro: TLabel
      Left = 145
      Top = 62
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object lblMotivo: TLabel
      Left = 6
      Top = 89
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 54
      Top = 5
      Width = 611
      Height = 24
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
      inherited lbRSocial: TLabel
        Left = 90
      end
      inherited lbContrato: TLabel
        Left = 507
      end
      inherited edContrato: TIntEdit
        Left = 554
      end
      inherited cmbRSocial: TArtComboBox
        Left = 135
        Width = 365
      end
    end
    object ppPeriodosHastaFiltro: TPeriodoPicker
      Left = 123
      Top = 32
      Width = 49
      Height = 21
      TabOrder = 2
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object edFechaDesde: TDateComboBox
      Left = 54
      Top = 59
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edFechaHasta: TDateComboBox
      Left = 162
      Top = 59
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 266
      Top = 30
      Width = 187
      Height = 50
      Caption = 'Estados'
      TabOrder = 5
      object chkAutorizadas: TCheckBox
        Left = 13
        Top = 20
        Width = 78
        Height = 17
        Caption = 'Autorizadas'
        TabOrder = 0
      end
      object chkSinAutorizar: TCheckBox
        Left = 99
        Top = 20
        Width = 84
        Height = 17
        Caption = 'Sin Autorizar'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object ppPeriodosDesdeFiltro: TPeriodoPicker
      Left = 54
      Top = 32
      Width = 49
      Height = 21
      TabOrder = 1
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    inline fraMotivoFiltro: TfraCodigoDescripcionExt
      Left = 52
      Top = 84
      Width = 282
      Height = 23
      TabOrder = 6
      inherited cmbDescripcion: TArtComboBox
        Width = 217
      end
    end
    object chkExcluirBajas: TCheckBox
      Left = 340
      Top = 86
      Width = 84
      Height = 17
      Caption = 'Excluir Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
  end
  inherited CoolBar: TCoolBar
    Top = 109
    Width = 685
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 681
      end>
    inherited ToolBar: TToolBar
      Width = 668
      inherited tbPropiedades: TToolButton
        Hint = 'Recalcular'
        OnClick = tbPropiedadesClick
      end
      object Panel1: TPanel
        Left = 370
        Top = 0
        Width = 268
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object lblReferenciaSolicitudCumplida: TLabel
          Left = 30
          Top = 5
          Width = 43
          Height = 13
          Caption = 'Cumplida'
        end
        object pnColorSolicitudCumplida: TPanel
          Left = 10
          Top = 3
          Width = 16
          Height = 15
          BevelOuter = bvNone
          Color = 14811135
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 138
    Width = 685
    Height = 301
    Columns = <
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'se_nombre'
        Title.Caption = 'Nom. Solicitante'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'se_usuario'
        Title.Caption = 'Solicitante'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Razon Social'
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mp_descripcion'
        Title.Caption = 'Motivo'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_observacion'
        Title.Caption = 'Observacion'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SA_FECHACUMPLIMIENTO'
        Title.Caption = 'F.Cumplimiento'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sa_usuariocumplimiento'
        Title.Caption = 'Usuario Cumpl.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 101
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Top = 72
    Width = 525
    Height = 337
    OnClose = fpAbmClose
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 301
      Width = 517
    end
    object lblCUIT: TLabel [1]
      Left = 28
      Top = 19
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object lblPeriodosSolicitud: TLabel [2]
      Left = 13
      Top = 155
      Width = 43
      Height = 13
      Caption = 'Per'#237'odos'
    end
    object lblHastaPeriodos: TLabel [3]
      Left = 110
      Top = 154
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object Label1: TLabel [4]
      Left = 22
      Top = 71
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label2: TLabel [5]
      Left = 22
      Top = 94
      Width = 31
      Height = 13
      Caption = 'Obser.'
    end
    object Label3: TLabel [6]
      Left = 6
      Top = 44
      Width = 49
      Height = 13
      Caption = 'Solicitante'
    end
    object lblPedidoSinPeriodo: TLabel [7]
      Left = 266
      Top = 155
      Width = 189
      Height = 13
      Caption = 'Pedido sin per'#237'odos a recalcular.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    inherited btnAceptar: TButton
      Left = 367
      Top = 307
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Left = 445
      Top = 307
      TabOrder = 9
    end
    inline fraEmpresa: TfraEmpresa
      Left = 58
      Top = 15
      Width = 454
      Height = 21
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
        454
        21)
      inherited lbRSocial: TLabel
        Left = 88
      end
      inherited lbContrato: TLabel
        Left = 350
      end
      inherited edContrato: TIntEdit
        Left = 397
      end
      inherited cmbRSocial: TArtComboBox
        Width = 215
        DataSource = nil
      end
    end
    object ppPeriodoDesde: TPeriodoPicker
      Left = 58
      Top = 151
      Width = 49
      Height = 21
      TabOrder = 4
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object ppPeriodoHasta: TPeriodoPicker
      Left = 125
      Top = 151
      Width = 49
      Height = 21
      TabOrder = 5
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205506'
      Periodo.MinPeriodo = '195506'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    object tbComandosDetalle: TToolBar
      Left = 179
      Top = 147
      Width = 82
      Height = 28
      Align = alNone
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      object tbAdd: TToolButton
        Left = 0
        Top = 2
        Hint = 'Nuevo'
        ImageIndex = 28
        OnClick = tbAddClick
      end
      object tbDelete: TToolButton
        Left = 23
        Top = 2
        Hint = 'Eliminar'
        ImageIndex = 27
        OnClick = tbDeleteClick
      end
      object ToolButton1: TToolButton
        Left = 46
        Top = 2
        Width = 8
        Caption = 'ToolButton1'
        Enabled = False
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbLimpiarNomina: TToolButton
        Left = 54
        Top = 2
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarNominaClick
      end
    end
    inline fraMotivo: TfraCodigoDescripcionExt
      Left = 57
      Top = 66
      Width = 458
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited cmbDescripcion: TArtComboBox
        Width = 393
      end
    end
    object edObservacion: TMemo
      Left = 58
      Top = 93
      Width = 455
      Height = 53
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object lstPeriodos: TListBox
      Left = 18
      Top = 178
      Width = 497
      Height = 117
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = 4
      ItemHeight = 13
      TabOrder = 7
    end
    inline fraSolicitante: TfraCodigoDescripcionExt
      Left = 57
      Top = 40
      Width = 458
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Left = 86
        Width = 370
      end
      inherited edCodigo: TPatternEdit
        Width = 82
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT ipr.*,'
      '       ita.ta_descripcion,'
      '       ita.ta_id,'
      '       ina.na_descripcion,'
      '       ina.na_id,'
      '       isa.sa_contrato,'
      '       aem.em_nombre,'
      '       isa.sa_fechacumplimiento,'
      '       isa.sa_tipocumplimiento,'
      '       ita.ta_tipoanalisis,'
      '       ma_descripcion,'
      '       isa.sa_observacion,'
      '       isa.sa_id,'
      '       decode(isa.sa_tipocumplimiento,             '
      '       '#39'A'#39', '#39'Aprobada'#39',                           '
      '       '#39'N'#39', '#39'No Aprobada'#39',                       '
      '       '#39'D'#39', '#39'Derivada'#39',                         '
      '       '#39'M'#39', '#39'Mixto'#39',                                     '
      '       '#39'Pendiente'#39') Estado'
      '  FROM emi.ipr_pedidorecalculo ipr,'
      '       emi.isa_solicitudautorizacion isa,'
      '       afi.aco_contrato aco,'
      '       afi.aem_empresa aem,'
      '       emi.ina_nivelautorizacion ina,'
      '       emi.ita_tipoautorizacion ita,'
      '       emi.ima_motivoautorizacion,'
      '       emi.imp_motivopedidorecalculo imp'
      ' WHERE (    (aco.co_contrato = isa.sa_contrato)'
      '        AND (aem.em_id = aco.co_idempresa)'
      '        AND (ina.na_id = isa.sa_idnivelautorizacion)'
      '        AND (isa.sa_idmotivo =  ma_id(+)) '
      '        AND (ita.ta_id = isa.sa_idtipoautorizacion))'
      '        AND (ipr.pr_idsolicitudautorizacion = sa_id)'
      '        AND (ipr.pr_idmotivopedido = imp.mp_id)'
      '        AND 1 = 2'
      '')
  end
  inherited ShortCutControl: TShortCutControl
    Left = 51
    Top = 144
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
    Left = 51
    Top = 172
  end
  object cdsPeriodos: TClientDataSet
    Active = True
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'Periodo'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'TipoCumplimiento'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'cdsPeriodoIndex'
        Fields = 'Periodo'
        Options = [ixUnique]
      end>
    IndexName = 'cdsPeriodoIndex'
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 320
    Data = {
      5B0000009619E0BD0100000018000000020000000000030000005B0007506572
      696F646F0100490000000100055749445448020002000600105469706F43756D
      706C696D69656E746F01004900000001000557494454480200020001000000}
    object cdsPeriodosPeriodo: TStringField
      FieldName = 'Periodo'
      Size = 6
    end
    object cdsPeriodosTipoCumplimiento: TStringField
      FieldName = 'TipoCumplimiento'
      Size = 1
    end
  end
  object dsPeriodos: TDataSource
    DataSet = cdsPeriodos
    Left = 52
    Top = 320
  end
end
