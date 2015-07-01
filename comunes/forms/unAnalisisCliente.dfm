inherited frmAnalisisCliente: TfrmAnalisisCliente
  Left = 267
  Top = 147
  Width = 560
  Height = 400
  Caption = 'An'#225'lisis del Cliente'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 552
    Height = 48
    Visible = True
    DesignSize = (
      552
      48)
    object GroupBox1: TGroupBox
      Left = 4
      Top = 3
      Width = 544
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        544
        39)
      object Label1: TLabel
        Left = 5
        Top = 15
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaBusqueda: TfraEmpresa
        Left = 32
        Top = 11
        Width = 504
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
          504
          21)
        inherited lbContrato: TLabel
          Left = 400
        end
        inherited edContrato: TIntEdit
          Left = 447
        end
        inherited cmbRSocial: TArtComboBox
          Left = 126
          Width = 265
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 552
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 548
      end>
    inherited ToolBar: TToolBar
      Width = 535
      inherited tbNuevo: TToolButton
        Hint = 'Nuevo Reporte (Ctrl+N)'
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 77
    Width = 552
    Height = 296
    TabOrder = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 169
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
        FieldName = 'PERIODODESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo Desde'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODOHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo Hasta'
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TODOSCONTRATOS'
        Title.Alignment = taCenter
        Title.Caption = 'Todos Contratos del CUIT'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de Alta'
        Width = 82
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 56
    Top = 104
    Width = 460
    Height = 144
    Constraints.MaxHeight = 144
    Constraints.MinHeight = 144
    Constraints.MinWidth = 460
    DesignSize = (
      460
      144)
    inherited BevelAbm: TBevel
      Top = 108
      Width = 452
    end
    inherited btnAceptar: TButton
      Left = 302
      Top = 114
      Caption = '&Generar'
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 380
      Top = 114
      TabOrder = 3
    end
    object gbContrato: TGroupBox
      Left = 7
      Top = 3
      Width = 447
      Height = 54
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        447
        54)
      object lblCUIT: TLabel
        Left = 5
        Top = 15
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraEmpresaAC: TfraEmpresa
        Left = 32
        Top = 11
        Width = 407
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
          407
          21)
        inherited lbContrato: TLabel
          Left = 303
        end
        inherited edContrato: TIntEdit
          Left = 350
        end
        inherited cmbRSocial: TArtComboBox
          Left = 126
          Width = 168
        end
      end
      object chkGenerarTodosContratos: TCheckBox
        Left = 32
        Top = 34
        Width = 236
        Height = 17
        Caption = 'Generar para Todos los Contratos del CUIT'
        TabOrder = 1
      end
    end
    object gbPeriodos: TGroupBox
      Left = 8
      Top = 57
      Width = 219
      Height = 43
      Caption = 'Rango de Periodos'
      TabOrder = 1
      object lblPeriodoHasta: TLabel
        Left = 113
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Hasta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPeriodoDesde: TLabel
        Left = 9
        Top = 18
        Width = 34
        Height = 13
        Caption = 'Desde:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ppDesde: TPeriodoPicker
        Left = 46
        Top = 15
        Width = 62
        Height = 21
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205212'
        Periodo.MinPeriodo = '195301'
        WidthMes = 22
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
      object ppHasta: TPeriodoPicker
        Left = 149
        Top = 15
        Width = 62
        Height = 21
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205212'
        Periodo.MinPeriodo = '195301'
        WidthMes = 22
        Separation = 0
        ShowButton = False
        ShowOrder = poAnoMes
        ReadOnly = False
        Enabled = True
        Fuente.Charset = DEFAULT_CHARSET
        Fuente.Color = clWindowText
        Fuente.Height = -11
        Fuente.Name = 'Tahoma'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT RP_CONTRATO CONTRATO, RP_PERIODODESDE PERIODODESDE, RP_PE' +
        'RIODOHASTA PERIODOHASTA,'
      
        '       RP_TODOSCONTRATOS TODOSCONTRATOS, RP_UBICACIONPDF UBICACI' +
        'ONPDF,'
      
        '       TRUNC(RP_FECHAALTA) FECHAALTA, UTILES.ARMAR_CUIT(EM_CUIT)' +
        ' CUIT, EM_NOMBRE RSOCIAL'
      ' FROM AEM_EMPRESA, ACO_CONTRATO, CRP_REPORTEPDF'
      'WHERE CO_CONTRATO =  RP_CONTRATO'
      '  AND CO_IDEMPRESA = EM_ID'
      '  AND 1 = 2'
      '  ')
    Left = 8
    Top = 285
  end
  inherited dsConsulta: TDataSource
    Left = 36
    Top = 285
  end
  inherited SortDialog: TSortDialog
    Left = 8
    Top = 313
  end
  inherited ExportDialog: TExportDialog
    Left = 36
    Top = 313
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    Left = 36
    Top = 341
  end
  inherited Seguridad: TSeguridad
    Left = 8
    Top = 257
  end
  inherited FormStorage: TFormStorage
    Left = 36
    Top = 257
  end
  inherited PrintDialog: TPrintDialog
    Left = 8
    Top = 341
  end
  inherited ShortCutControl: TShortCutControl
    Left = 64
    Top = 257
  end
  inherited FieldHider: TFieldHider
    Left = 64
    Top = 285
  end
  object ExcelApplication: TExcelApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 130
    Top = 259
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
    Left = 92
    Top = 258
  end
  object mnuImprimir: TPopupMenu
    Left = 132
    Top = 316
    object mnuReporteAC: TMenuItem
      Caption = 'Imprimir Reporte'
      OnClick = mnuReporteACClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
  end
end
