inherited frmConsultoria: TfrmConsultoria
  Left = 676
  Top = 218
  Caption = 'Generaci'#243'n de Tablas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 49
    Visible = True
    ExplicitHeight = 49
    object Label1: TLabel
      Left = 4
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label2: TLabel
      Left = 4
      Top = 53
      Width = 30
      Height = 13
      Caption = 'F. Alta'
      Visible = False
    end
    object Label3: TLabel
      Left = 44
      Top = 53
      Width = 34
      Height = 13
      Caption = 'Desde:'
      Visible = False
    end
    object Label4: TLabel
      Left = 171
      Top = 54
      Width = 31
      Height = 13
      Caption = 'Hasta:'
      Visible = False
    end
    object Label5: TLabel
      Left = 301
      Top = 53
      Width = 67
      Height = 13
      Caption = 'F. Realizaci'#243'n'
      Visible = False
    end
    object Label6: TLabel
      Left = 371
      Top = 53
      Width = 34
      Height = 13
      Caption = 'Desde:'
      Visible = False
    end
    object Label7: TLabel
      Left = 500
      Top = 54
      Width = 31
      Height = 13
      Caption = 'Hasta:'
      Visible = False
    end
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 39
      Top = 3
      Width = 577
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
      ExplicitLeft = 39
      ExplicitTop = 3
      ExplicitWidth = 577
      ExplicitHeight = 21
      DesignSize = (
        577
        21)
      inherited lbContrato: TLabel
        Left = 473
        ExplicitLeft = 473
      end
      inherited edContrato: TIntEdit
        Left = 520
        ExplicitLeft = 520
      end
      inherited cmbRSocial: TArtComboBox
        Width = 338
        ExplicitWidth = 338
      end
    end
    object edFechaAltaDesde: TDateComboBox
      Left = 81
      Top = 50
      Width = 88
      Height = 21
      TabOrder = 1
      Visible = False
    end
    object edFechaAltaHasta: TDateComboBox
      Left = 204
      Top = 50
      Width = 88
      Height = 21
      TabOrder = 2
      Visible = False
    end
    object edFechaRealizacionDesde: TDateComboBox
      Left = 409
      Top = 50
      Width = 88
      Height = 21
      TabOrder = 3
      Visible = False
    end
    object edFechaRealizacionHasta: TDateComboBox
      Left = 532
      Top = 50
      Width = 88
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object cbPendiente: TCheckBox
      Left = 4
      Top = 29
      Width = 70
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pendiente'
      TabOrder = 5
    end
    object cbTerminado: TCheckBox
      Left = 87
      Top = 29
      Width = 71
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Terminado'
      TabOrder = 6
    end
    object cbExcluirBajas: TCheckBox
      Left = 529
      Top = 29
      Width = 85
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Excluir Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    ExplicitTop = 49
    inherited ToolBar: TToolBar
      Width = 608
      ExplicitWidth = 608
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      object tbProcesarRegistros: TToolButton
        Left = 370
        Top = 0
        Hint = 'Procesar Registros'
        Caption = 'tbProcesarRegistros'
        ImageIndex = 27
        OnClick = tbProcesarRegistrosClick
      end
      object tbImportar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Importar'
        Caption = 'Importar'
        ImageIndex = 21
        OnClick = tbImportarClick
      end
      object tbDesSeleccionarTodo: TToolButton
        Left = 416
        Top = 0
        Hint = 'Borrar Selecci'#243'n'
        Caption = 'tbDesSeleccionarTodo'
        ImageIndex = 45
        OnClick = tbDesSeleccionarTodoClick
      end
      object tbSeleccionarTodo: TToolButton
        Left = 439
        Top = 0
        Hint = 'Seleccionar Todos'
        Caption = 'tbSeleccionarTodo'
        ImageIndex = 46
        OnClick = tbSeleccionarTodoClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Height = 358
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnCellClick = GridCellClick
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SELECTED'
        Title.Caption = #191'?'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_ID'
        Title.Caption = 'ID '
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_CONTRATO'
        Title.Caption = 'Contrato'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EC_USUALTA'
        Title.Caption = 'Usuario de Alta'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EC_FECHAREALIZACION'
        Title.Caption = 'Fecha de Realizaci'#243'n'
        Visible = False
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT NULL SELECTED, hec.*, cpi.*, DECODE(pi_estado, '#39'P'#39', '#39'Pend' +
        'iente'#39', '#39'T'#39', '#39'Terminado'#39') estado, co_estado cobertura, em_nombre' +
        ', em_cuit'
      
        '  FROM afi.aem_empresa, afi.aco_contrato, hys.hec_empresasconsul' +
        'toria hec, comunes.cpi_pedidoinforme cpi'
      ' WHERE ec_idpedidoinforme = pi_id(+)'
      '   AND em_id = co_idempresa'
      '   AND ec_contrato = co_contrato'
      '   AND 1=2')
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
    Left = 80
    Top = 296
  end
end
