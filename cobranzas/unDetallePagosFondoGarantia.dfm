inherited frmDetallePagosFondoGarantia: TfrmDetallePagosFondoGarantia
  Left = 72
  Top = 91
  Caption = 'Detalle de Pagos del Fondo de Garant'#237'a'
  ClientHeight = 370
  ClientWidth = 654
  Constraints.MinHeight = 400
  Constraints.MinWidth = 625
  ExplicitLeft = 72
  ExplicitTop = 91
  ExplicitWidth = 662
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 654
    Height = 9
    ExplicitWidth = 654
    ExplicitHeight = 9
  end
  inherited CoolBar: TCoolBar
    Top = 9
    Width = 654
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 650
      end>
    ExplicitTop = 9
    ExplicitWidth = 654
    inherited ToolBar: TToolBar
      Width = 641
      ExplicitWidth = 641
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 38
    Width = 654
    Height = 332
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Pago'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 58
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
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 272
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as'
        Width = 46
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 160
    Top = 108
    Width = 183
    Height = 97
    ActiveControl = edDP_PERIODO
    Constraints.MaxHeight = 97
    Constraints.MaxWidth = 183
    Constraints.MinHeight = 97
    Constraints.MinWidth = 183
    ExplicitLeft = 160
    ExplicitTop = 108
    ExplicitWidth = 183
    ExplicitHeight = 97
    DesignSize = (
      183
      97)
    inherited BevelAbm: TBevel
      Top = 61
      Width = 175
      ExplicitTop = 39
      ExplicitWidth = 168
    end
    object Label10: TLabel [1]
      Left = 8
      Top = 41
      Width = 36
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Importe'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 12
      Width = 36
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Periodo'
    end
    inherited btnAceptar: TButton
      Left = 25
      Top = 67
      TabOrder = 2
      ExplicitLeft = 18
      ExplicitTop = 45
    end
    inherited btnCancelar: TButton
      Left = 103
      Top = 67
      TabOrder = 3
      ExplicitLeft = 96
      ExplicitTop = 45
    end
    object edDP_IMPORTE: TCurrencyEdit
      Left = 53
      Top = 37
      Width = 118
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 1
    end
    object edDP_PERIODO: TPeriodoPicker
      Left = 53
      Top = 12
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 7
      Periodo.Ano = 2005
      Periodo.Valor = '200507'
      Periodo.MaxPeriodo = '205507'
      Periodo.MinPeriodo = '199606'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poMesAno
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
      AutoExit = True
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PF_ID NRO_PAGO, DP_CONTRATO CONTRATO, EM_NOMBRE NOMBRE, E' +
        'M_CUIT CUIT, '
      '       DP_PERIODO PERIODO, DP_IMPORTE IMPORTE'
      
        '  FROM AEM_EMPRESA, ACO_CONTRATO, ZDP_DETALLEPAGOFONDOGTIA, ZPF_' +
        'PAGOFONDOGARANTIA'
      ' WHERE PF_ID = DP_IDPAGO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_CONTRATO = DP_CONTRATO'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
    Left = 108
    Top = 200
  end
end
