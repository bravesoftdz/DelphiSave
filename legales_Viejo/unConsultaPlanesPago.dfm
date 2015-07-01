inherited frmConsultaPlanesPago: TfrmConsultaPlanesPago
  Left = 195
  Top = 131
  Caption = 'Planes de Pago'
  ClientHeight = 513
  ClientWidth = 742
  Constraints.MinHeight = 450
  Constraints.MinWidth = 750
  ExplicitLeft = 195
  ExplicitTop = 131
  ExplicitWidth = 750
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 742
    Height = 126
    Visible = True
    ExplicitWidth = 742
    ExplicitHeight = 126
    DesignSize = (
      742
      126)
    object gbFecha: TGroupBox
      Left = 532
      Top = 81
      Width = 207
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
      TabOrder = 6
      object Label1: TLabel
        Left = 98
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaDesde: TDateComboBox
        Left = 8
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 112
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 4
      Top = -1
      Width = 735
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa '
      TabOrder = 0
      DesignSize = (
        735
        41)
      inline fraEmpresaBusq: TfraEmpresa
        Left = 8
        Top = 15
        Width = 717
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
        ExplicitLeft = 8
        ExplicitTop = 15
        ExplicitWidth = 717
        ExplicitHeight = 21
        DesignSize = (
          717
          21)
        inherited lbContrato: TLabel
          Left = 613
          ExplicitLeft = 613
        end
        inherited edContrato: TIntEdit
          Left = 660
          ExplicitLeft = 660
        end
        inherited cmbRSocial: TArtComboBox
          Width = 478
          DataSource = nil
          ExplicitWidth = 478
        end
      end
    end
    object gbEstado: TGroupBox
      Left = 4
      Top = 81
      Width = 300
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Estado'
      TabOrder = 3
      DesignSize = (
        300
        41)
      object cmbEstados: TDBCheckCombo
        Left = 9
        Top = 14
        Width = 282
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsEstados
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
    object gbSiniestro: TGroupBox
      Left = 420
      Top = 81
      Width = 108
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Siniestro'
      TabOrder = 5
      object edSiniestro: TSinEdit
        Left = 8
        Top = 14
        Width = 92
        Height = 21
        TabOrder = 0
        ViewStyle = [etSiniestro, etOrden]
      end
    end
    object GroupBox1: TGroupBox
      Left = 308
      Top = 40
      Width = 430
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Deudor'
      TabOrder = 2
      DesignSize = (
        430
        41)
      inline fraEmpresaDeudoraBusq: TfraEmpresa
        Left = 8
        Top = 15
        Width = 415
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
        ExplicitLeft = 8
        ExplicitTop = 15
        ExplicitWidth = 415
        ExplicitHeight = 21
        DesignSize = (
          415
          21)
        inherited lbContrato: TLabel
          Left = 311
          Visible = False
          ExplicitLeft = 311
        end
        inherited edContrato: TIntEdit
          Left = 358
          Width = 55
          TabStop = False
          Visible = False
          ExplicitLeft = 358
          ExplicitWidth = 55
        end
        inherited cmbRSocial: TArtComboBox
          Left = 128
          Width = 286
          Columns = <
            item
              Expanded = False
              FieldName = 'CUIT'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTRATO'
              Title.Caption = 'Contrato'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Title.Caption = 'Raz'#243'n Social'
              Width = 260
              Visible = True
            end>
          DataSource = nil
          ExplicitLeft = 128
          ExplicitWidth = 286
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 308
      Top = 81
      Width = 108
      Height = 41
      Anchors = [akTop, akRight]
      Caption = 'Nro. de Plan'
      TabOrder = 4
      DesignSize = (
        108
        41)
      object edPlanBusq: TIntEdit
        Left = 8
        Top = 15
        Width = 91
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        MaxLength = 10
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 40
      Width = 300
      Height = 41
      Caption = 'Concepto'
      TabOrder = 1
      DesignSize = (
        300
        41)
      object cmbConceptos: TDBCheckCombo
        Left = 9
        Top = 14
        Width = 282
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ItemsSeparator = ';'
        DataSource = dsConceptos
        KeyField = 'TB_CODIGO'
        ListField = 'TB_DESCRIPCION'
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 126
    Width = 742
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 736
      end>
    ExplicitTop = 126
    ExplicitWidth = 742
    inherited ToolBar: TToolBar
      Width = 727
      ExplicitWidth = 727
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbConvertirA: TToolButton
        Left = 370
        Top = 0
        Hint = 'Pasar a Plan'
        ImageIndex = 26
        OnClick = tbConvertirAClick
      end
      object ToolButton7: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbCancelar: TToolButton
        Left = 401
        Top = 0
        Hint = 'Pasar a No Cumplido'
        ImageIndex = 25
        OnClick = tbCancelarClick
      end
      object ToolButton9: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 432
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object ToolButton2: TToolButton
        Left = 455
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object plnActivos: TPanel
        Left = 463
        Top = 0
        Width = 93
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkSoloActivos: TCheckBox
          Left = 6
          Top = 3
          Width = 81
          Height = 17
          Caption = 'Solo Activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 155
    Width = 742
    Height = 358
    Columns = <
      item
        Expanded = False
        FieldName = 'PLAN'
        Title.Alignment = taCenter
        Title.Caption = 'Plan'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 173
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUITDEUDORA'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT Deudor'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESADEUDORA'
        Title.Caption = 'Deudor'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRCONCEPTO'
        Title.Caption = 'Concepto'
        Width = 179
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 240
    Width = 480
    Height = 163
    Constraints.MaxHeight = 163
    Constraints.MinHeight = 163
    Constraints.MinWidth = 480
    ExplicitLeft = 132
    ExplicitTop = 240
    ExplicitWidth = 480
    ExplicitHeight = 163
    DesignSize = (
      480
      163)
    inherited BevelAbm: TBevel
      Top = 127
      Width = 472
      ExplicitTop = 127
      ExplicitWidth = 472
    end
    object Label2: TLabel [1]
      Left = 4
      Top = 9
      Width = 49
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Siniestro'
    end
    object Label3: TLabel [2]
      Left = 3
      Top = 31
      Width = 49
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fecha'
    end
    object Label4: TLabel [3]
      Left = 3
      Top = 57
      Width = 49
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Importe'
    end
    object Label5: TLabel [4]
      Left = 3
      Top = 80
      Width = 49
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Deudor'
    end
    object Label6: TLabel [5]
      Left = 3
      Top = 104
      Width = 49
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Concepto'
    end
    inherited btnAceptar: TButton
      Left = 322
      Top = 133
      TabOrder = 5
      ExplicitLeft = 322
      ExplicitTop = 133
    end
    inherited btnCancelar: TButton
      Left = 400
      Top = 133
      TabOrder = 6
      ExplicitLeft = 400
      ExplicitTop = 133
    end
    object edSiniestroAlta: TSinEdit
      Left = 60
      Top = 5
      Width = 87
      Height = 21
      OnEnter = edSiniestroAltaEnter
      OnExit = edSiniestroAltaExit
      TabOrder = 0
      ViewStyle = [etSiniestro, etOrden]
    end
    object edFechaAlta: TDateComboBox
      Left = 60
      Top = 29
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edImporteAlta: TCurrencyEdit
      Left = 60
      Top = 53
      Width = 88
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      TabOrder = 2
    end
    inline fraEmprDeudoraAlta: TfraEmpresa
      Left = 60
      Top = 77
      Width = 415
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
      TabOrder = 3
      ExplicitLeft = 60
      ExplicitTop = 77
      ExplicitWidth = 415
      ExplicitHeight = 21
      DesignSize = (
        415
        21)
      inherited lbContrato: TLabel
        Left = 311
        Visible = False
        ExplicitLeft = 311
      end
      inherited edContrato: TIntEdit
        Left = 358
        Width = 55
        TabStop = False
        Visible = False
        ExplicitLeft = 358
        ExplicitWidth = 55
      end
      inherited cmbRSocial: TArtComboBox
        Left = 128
        Width = 286
        Columns = <
          item
            Expanded = False
            FieldName = 'CUIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Caption = 'Contrato'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Raz'#243'n Social'
            Width = 260
            Visible = True
          end>
        DataSource = nil
        ExplicitLeft = 128
        ExplicitWidth = 286
      end
    end
    inline fraConceptoAlta: TfraStaticCTB_TABLAS
      Left = 59
      Top = 100
      Width = 416
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 59
      ExplicitTop = 100
      ExplicitWidth = 416
      DesignSize = (
        416
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 352
        ExplicitWidth = 352
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT XP_ID PLAN, XP_FECHA FECHA, TB_DESCRIPCION ESTADO, RS_SIN' +
        'IESTRO SINIESTRO, RS_ORDEN ORDEN, EM_CUIT CUIT,'
      
        '       EM_NOMBRE EMPRESA, CO_CONTRATO CONTRATO, TJ_CUIL CUIL, TJ' +
        '_NOMBRE TRABAJADOR, XP_FECHABAJA FECHA_BAJA'
      
        '  FROM AEM_EMPRESA, ACO_CONTRATO, CTJ_TRABAJADOR, SEX_EXPEDIENTE' +
        'S, CTB_TABLAS, LXP_RECUPEROPLAN, LRS_RECUPEROSINIESTROS'
      ' WHERE RS_ID = XP_IDRECUPEROSINIESTRO'
      '   AND TJ_ID = EX_IDTRABAJADOR'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_CONTRATO = EX_CONTRATO'
      '   AND EX_SINIESTRO = RS_SINIESTRO'
      '   AND EX_ORDEN = RS_ORDEN'
      '   AND EX_RECAIDA = 0'
      '   AND TB_CODIGO = XP_ESTADO'
      '   AND TB_CLAVE = '#39'ESPLR'#39
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
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
        LinkControl = tbSalir2
      end>
    Left = 109
    Top = 200
  end
  object sdqEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'ESPLR'#39
      '   AND TB_CODIGO <> '#39'0'#39
      ' ORDER BY TB_DESCRIPCION'
      ''
      ' ')
    Left = 66
    Top = 92
  end
  object dsEstados: TDataSource
    DataSet = sdqEstados
    Left = 94
    Top = 92
  end
  object sdqConceptos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      '  FROM CTB_TABLAS'
      ' WHERE TB_CLAVE = '#39'LCPRS'#39
      '   AND TB_CODIGO <> '#39'0'#39
      ' ORDER BY TB_DESCRIPCION'
      ''
      ' ')
    Left = 66
    Top = 52
  end
  object dsConceptos: TDataSource
    DataSet = sdqConceptos
    Left = 94
    Top = 52
  end
end
