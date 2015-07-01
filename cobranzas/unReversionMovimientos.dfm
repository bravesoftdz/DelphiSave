inherited frmReversionMovimientos: TfrmReversionMovimientos
  Left = 250
  Top = 174
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Reversi'#243'n de Movimientos'
  ClientHeight = 370
  ClientWidth = 777
  Constraints.MinHeight = 400
  Constraints.MinWidth = 785
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  ExplicitLeft = 250
  ExplicitTop = 174
  ExplicitWidth = 785
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 777
    Height = 87
    ExplicitWidth = 777
    ExplicitHeight = 87
    DesignSize = (
      777
      87)
    object gbEmpresa: TGroupBox
      Left = 0
      Top = 0
      Width = 509
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 0
      DesignSize = (
        509
        43)
      object Label3: TLabel
        Left = 6
        Top = 18
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraContrato: TfraEmpresa
        Left = 33
        Top = 14
        Width = 466
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
        ExplicitLeft = 33
        ExplicitTop = 14
        ExplicitWidth = 466
        ExplicitHeight = 21
        DesignSize = (
          466
          21)
        inherited lbContrato: TLabel
          Left = 364
          ExplicitLeft = 364
        end
        inherited edContrato: TIntEdit
          Left = 409
          ExplicitLeft = 409
        end
        inherited cmbRSocial: TArtComboBox
          Width = 227
          ExplicitWidth = 227
        end
      end
    end
    object gbMovimiento: TGroupBox
      Left = 197
      Top = 43
      Width = 580
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'C'#243'digo de Movimiento'
      TabOrder = 2
      DesignSize = (
        580
        43)
      inline fraCodigoMovimiento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 564
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 564
        DesignSize = (
          564
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 501
          ExplicitWidth = 501
        end
      end
    end
    object gbPeriodos: TGroupBox
      Left = 0
      Top = 43
      Width = 195
      Height = 43
      Caption = 'Rango de Periodos'
      TabOrder = 1
      object lbRSocial: TLabel
        Left = 10
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
        FocusControl = fraContrato.cmbRSocial
      end
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Hasta'
        FocusControl = fraContrato.cmbRSocial
      end
      object ppPeriodoDesde: TPeriodoPicker
        Left = 46
        Top = 15
        Width = 49
        Height = 21
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
      object ppPeriodoHasta: TPeriodoPicker
        Left = 136
        Top = 15
        Width = 49
        Height = 21
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
    object gbFiltro: TRadioGroup
      Left = 510
      Top = 0
      Width = 266
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Filtro por...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo de Movimiento'
        'C'#243'd. Ajuste Saldo Acr.')
      TabOrder = 3
      OnClick = gbFiltroClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 87
    Width = 777
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 771
      end>
    ExplicitTop = 87
    ExplicitWidth = 777
    inherited ToolBar: TToolBar
      Width = 762
      ExplicitWidth = 762
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbRevertir: TToolButton
        Left = 370
        Top = 0
        Hint = 'Revertir Movimientos (Ctrl+R)'
        ImageIndex = 28
        OnClick = tbRevertirClick
      end
      object tbTotalesRegGrilla: TToolButton
        Left = 393
        Top = 0
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbTotalesRegGrillaClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 424
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 116
    Width = 777
    Height = 254
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pmnuMarcar
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADIST'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha contable'
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARECA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de recaudaci'#243'n'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTERECLAMADO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Reclamado AFIP'
        Width = 128
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    OnGetTotals = QueryPrintGetTotals
    OnReportBegin = QueryPrintReportBegin
  end
  inherited Seguridad: TSeguridad
    Claves = <
      item
        Name = 'PermitirBonificacion'
      end>
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
        LinkControl = tbSalir2
      end
      item
        Key = 16466
        LinkControl = tbRevertir
      end>
  end
  object pmnuMarcar: TPopupMenu
    Left = 112
    Top = 256
    object mnuMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mnuMarcarTodosClick
    end
    object mnuDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mnuDesmarcarTodosClick
    end
  end
end
