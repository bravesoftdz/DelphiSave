inherited frmReservasEmbargos: TfrmReservasEmbargos
  Caption = 'Reservas Embargos'
  ClientHeight = 340
  ClientWidth = 388
  Constraints.MinHeight = 370
  Constraints.MinWidth = 396
  ExplicitWidth = 396
  ExplicitHeight = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 388
    Height = 43
    ExplicitHeight = 43
    object gbPeriodo: TGroupBox
      Left = 3
      Top = 0
      Width = 79
      Height = 41
      Caption = 'Periodo'
      TabOrder = 0
      object edPeriodo: TPeriodoPicker
        Left = 10
        Top = 14
        Width = 60
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
        Fuente.Name = 'MS Sans Serif'
        Fuente.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NullDropDown = SetMax
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 43
    Width = 388
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 384
      end>
    ExplicitTop = 43
    ExplicitWidth = 388
    inherited ToolBar: TToolBar
      Width = 375
      ExplicitWidth = 375
      inherited tbNuevo: TToolButton
        Hint = 'Cargar'
        Visible = True
        OnClick = tbNuevoClick
      end
      inherited ToolButton6: TToolButton
        Left = 0
        Wrap = True
        ExplicitLeft = 0
        ExplicitHeight = 30
      end
      inherited tbImprimir: TToolButton
        Left = 0
        Top = 30
        ExplicitLeft = 0
        ExplicitTop = 30
      end
      inherited tbExportar: TToolButton
        Left = 23
        Top = 30
        ExplicitLeft = 23
        ExplicitTop = 30
      end
      inherited tbEnviarMail: TToolButton
        Left = 46
        Top = 30
        ExplicitLeft = 46
        ExplicitTop = 30
      end
      inherited ToolButton8: TToolButton
        Left = 69
        Top = 30
        ExplicitLeft = 69
        ExplicitTop = 30
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 77
        Top = 30
        ExplicitLeft = 77
        ExplicitTop = 30
      end
      inherited tbMaxRegistros: TToolButton
        Left = 100
        Top = 30
        Visible = False
        ExplicitLeft = 100
        ExplicitTop = 30
      end
      inherited ToolButton11: TToolButton
        Left = 123
        Top = 30
        ExplicitLeft = 123
        ExplicitTop = 30
      end
      inherited tbSalir: TToolButton
        Left = 131
        Top = 30
        Visible = False
        ExplicitLeft = 131
        ExplicitTop = 30
      end
      object tbSumatoria: TToolButton
        Left = 154
        Top = 30
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 177
        Top = 30
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 185
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object ToolButton2: TToolButton
        Left = 208
        Top = 30
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 72
    Width = 388
    Height = 268
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_CARPETA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Carpeta'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMBARGO'
        Title.Alignment = taCenter
        Title.Caption = 'Embargo'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEDUCCIONES'
        Title.Alignment = taCenter
        Title.Caption = 'Deducciones'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESERVA'
        Title.Alignment = taCenter
        Title.Caption = 'Reserva'
        Width = 90
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT RE_PERIODO PERIODO, RE_CARPETA NRO_CARPETA, RE_EMBARGO EM' +
        'BARGO,'
      '       RE_DEDUCCIONES DEDUCCIONES, RE_RESERVA RESERVA'
      '  FROM ORE_RESERVAEMBARGO'
      ' WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
    Left = 112
    Top = 200
  end
end
