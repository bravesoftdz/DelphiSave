inherited frmPagosNoComisionables: TfrmPagosNoComisionables
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  Caption = 'Pagos No Comisionables'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 618
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 32
    Top = 24
    Width = 30
    Height = 13
    Caption = 'Desde'
  end
  inherited pnlFiltros: TPanel
    Width = 800
    Height = 199
    DesignSize = (
      800
      199)
    object GBEntidad: TGroupBox
      Left = 1
      Top = 2
      Width = 799
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Entidad'
      TabOrder = 0
      DesignSize = (
        799
        45)
      inline fraEN_ID: TfraEntidadCUIT
        Left = 2
        Top = 15
        Width = 792
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraEN_IDExit
        DesignSize = (
          792
          23)
        inherited Label1: TLabel
          Left = 120
        end
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
          Font.Name = 'Tahoma'
        end
        inherited Label3: TLabel
          Top = 36
          Width = 59
        end
        inherited Label2: TLabel
          Left = 214
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 534
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
        inherited edEN_CODBANCO: TPatternEdit
          Left = 156
          Width = 50
        end
      end
    end
    object GBVendedor: TGroupBox
      Left = 0
      Top = 49
      Width = 800
      Height = 46
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        800
        46)
      inline fraVE_ID: TfraVendedoresCUIT
        Left = 3
        Top = 15
        Width = 793
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = fraVE_IDExit
        DesignSize = (
          793
          24)
        inherited lbRSocial: TLabel
          Width = 24
          Caption = 'CUIT'
        end
        inherited Label1: TLabel
          Left = 120
        end
        inherited Label2: TLabel
          Left = 214
          Width = 37
          Caption = 'Nombre'
        end
        inherited cmbDescripcion: TArtComboBox
          Left = 256
          Width = 534
        end
        inherited edCodigo: TPatternEdit
          Left = 156
          Width = 50
        end
        inherited mskCuit: TMaskEdit
          Left = 34
        end
      end
    end
    object GBEmpresa: TGroupBox
      Left = 0
      Top = 97
      Width = 800
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 2
      DesignSize = (
        800
        45)
      object lbRSocial: TLabel
        Left = 8
        Top = 19
        Width = 24
        Height = 13
        Caption = 'CUIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      inline fraCO_CONTRATO: TfraEmpresa
        Left = 35
        Top = 16
        Width = 757
        Height = 24
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
        DesignSize = (
          757
          24)
        inherited lbRSocial: TLabel
          Left = 90
        end
        inherited lbContrato: TLabel
          Left = 655
        end
        inherited mskCUIT: TMaskEdit
          Left = 2
        end
        inherited edContrato: TIntEdit
          Left = 700
          Width = 56
        end
        inherited cmbRSocial: TArtComboBox
          Left = 135
          Width = 514
        end
      end
    end
    object GBPeriodo: TGroupBox
      Left = 1
      Top = 145
      Width = 198
      Height = 45
      Caption = 'Per'#237'odo '
      TabOrder = 3
      object Label2: TLabel
        Left = 10
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 103
        Top = 20
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object ppMO_PERIODODesde: TPeriodoPicker
        Left = 47
        Top = 16
        Width = 49
        Height = 21
        OnEnter = ppMO_PERIODODesdeEnter
        TabOrder = 0
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
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
      object ppMO_PERIODOHasta: TPeriodoPicker
        Left = 136
        Top = 16
        Width = 49
        Height = 21
        OnEnter = ppMO_PERIODOHastaEnter
        TabOrder = 1
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '205309'
        Periodo.MinPeriodo = '195310'
        WidthMes = 19
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
    object GroupBox1: TGroupBox
      Left = 340
      Top = 145
      Width = 459
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      Caption = 'C'#243'digos'
      TabOrder = 4
      DesignSize = (
        459
        45)
      object cmbMV_CODIGO: TCheckCombo
        Left = 7
        Top = 17
        Width = 446
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object gbPLANPAGO: TGroupBox
      Left = 202
      Top = 145
      Width = 135
      Height = 45
      Caption = 'Plan de Pago'
      TabOrder = 5
      object chkVC_PLANPAGO: TCheckBox
        Left = 8
        Top = 20
        Width = 121
        Height = 17
        Caption = 'S'#243'lo estas relaciones'
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 199
    Width = 800
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 796
      end>
    inherited ToolBar: TToolBar
      Width = 783
      inherited tbNuevo: TToolButton
        Hint = 'Pasar a Comisionable (Ctrl+N)'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited tbImprimir: TToolButton
        Enabled = True
      end
      inherited tbExportar: TToolButton
        Enabled = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria (Ctrl+T)'
        Caption = 'tbSumatoria'
        ImageIndex = 24
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 228
    Width = 800
    Height = 352
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TitleFont.Name = 'Tahoma'
    MultiSelect = True
    OnContextPopup = GridContextPopup
    OnPaintFooter = GridPaintFooter
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EN_CODBANCO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_NOMBRE'
        Title.Caption = 'Nombre Entidad'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_VENDEDOR'
        Title.Caption = 'C'#243'd. Vendedor'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VE_NOMBRE'
        Title.Caption = 'Nombre Vendedor'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CO_CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 129
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MV_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 117
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MO_PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MO_IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 67
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    Left = 19
    Top = 302
  end
  inherited dsConsulta: TDataSource
    Left = 48
    Top = 302
  end
  inherited SortDialog: TSortDialog
    Left = 20
    Top = 330
  end
  inherited ExportDialog: TExportDialog
    Left = 48
    Top = 330
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Nombre Entidad'
        DataField = 'EN_NOMBRE'
        Width = 1300
        MaxLength = 0
      end
      item
        Title = 'C'#243'digo'
        DataField = 'EN_CODBANCO'
        Width = 310
        MaxLength = 0
      end
      item
        Title = 'C'#243'd. Vend.'
        DataField = 'VE_VENDEDOR'
        Width = 370
        MaxLength = 0
      end
      item
        Title = 'Nombre Vendedor'
        DataField = 'VE_NOMBRE'
        Width = 1300
        MaxLength = 0
      end
      item
        Title = 'Contrato'
        DataField = 'co_contrato'
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'em_cuit'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'EM_nombre'
        Width = 1400
        MaxLength = 0
      end
      item
        Title = 'C'#243'digo'
        TitleAlignment = taCenter
        DataField = 'MV_CODIGO'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Descripci'#243'n'
        DataField = 'MV_DESCRIPCION'
        Width = 1200
        MaxLength = 0
      end
      item
        Title = 'Per'#237'odo'
        TitleAlignment = taCenter
        DataField = 'MO_PERIODO'
        Alignment = taCenter
        Width = 300
        MaxLength = 0
      end
      item
        Title = 'Importe'
        TitleAlignment = taCenter
        DataField = 'MO_IMPORTE'
        Alignment = taRightJustify
        Width = 700
        MaxLength = 0
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 48
    Top = 358
  end
  inherited Seguridad: TSeguridad
    Left = 19
    Top = 274
  end
  inherited FormStorage: TFormStorage
    Left = 48
    Top = 274
  end
  inherited PrintDialog: TPrintDialog
    Left = 20
    Top = 358
  end
  inherited ShortCutControl: TShortCutControl
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
      end
      item
        Key = 16468
        LinkControl = tbSumatoria
      end>
    Left = 76
    Top = 274
  end
  inherited FieldHider: TFieldHider
    Left = 76
    Top = 302
  end
  object sdqCombo: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    Left = 376
    Top = 161
  end
end
