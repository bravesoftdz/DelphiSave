inherited frmDetalleIndicadores: TfrmDetalleIndicadores
  Left = 544
  Top = 240
  Width = 743
  Height = 447
  Caption = 'Detalle Indicadores'
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 735
    Height = 86
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 57
      Height = 13
      Caption = 'Coordinador'
    end
    object Label3: TLabel
      Left = 504
      Top = 13
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hasta'
    end
    object Label4: TLabel
      Left = 384
      Top = 13
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Mes  Desde:'
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 71
      Top = 9
      Width = 300
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        300
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 232
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
      end
    end
    inline fraCoordinadorFiltro: TfraCodigoDescripcion
      Left = 71
      Top = 33
      Width = 300
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        300
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 232
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
      end
    end
    object cbTercerizado: TCheckBox
      Left = 296
      Top = 64
      Width = 114
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Terceros'
      TabOrder = 2
    end
    object cbNoTercerizado: TCheckBox
      Left = 156
      Top = 64
      Width = 72
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Propio'
      TabOrder = 3
    end
    object chkSinPreventor: TCheckBox
      Left = 8
      Top = 64
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Incluir Sin Preventor'
      TabOrder = 4
    end
    object edMesHasta: TPeriodoPicker
      Left = 537
      Top = 9
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 8
      Periodo.Ano = 2011
      Periodo.Valor = '201108'
      Periodo.MaxPeriodo = '206106'
      Periodo.MinPeriodo = '196107'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      OnChange = edMesChange
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
    object edMes: TPeriodoPicker
      Left = 449
      Top = 9
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 8
      Periodo.Ano = 2011
      Periodo.Valor = '201108'
      Periodo.MaxPeriodo = '206106'
      Periodo.MinPeriodo = '196107'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      OnChange = edMesChange
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
  inherited CoolBar: TCoolBar
    Top = 86
    Width = 735
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 731
      end>
    inherited ToolBar: TToolBar
      Width = 718
    end
  end
  inherited Grid: TArtDBGrid
    Top = 115
    Width = 735
    Height = 305
  end
  inherited SortDialog: TSortDialog
    UseFieldIndex = True
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
    Left = 109
    Top = 200
  end
end
