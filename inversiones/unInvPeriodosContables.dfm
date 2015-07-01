inherited frmInvPeriodosContables: TfrmInvPeriodosContables
  Left = 469
  Top = 173
  Caption = 'Per'#237'odos Contables'
  ClientHeight = 470
  ClientWidth = 564
  Constraints.MinHeight = 500
  Constraints.MinWidth = 572
  ExplicitLeft = 469
  ExplicitTop = 173
  ExplicitWidth = 572
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 564
    Height = 46
    Visible = True
    ExplicitWidth = 564
    ExplicitHeight = 46
    DesignSize = (
      564
      46)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 474
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        474
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 459
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 459
        DesignSize = (
          459
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 394
          ExplicitWidth = 394
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 480
      Top = 1
      Width = 79
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Periodo'
      TabOrder = 1
      object edPeriodo: TPeriodoPicker
        Left = 12
        Top = 15
        Width = 54
        Height = 22
        TabOrder = 0
        TabStop = True
        Color = clWindow
        Periodo.AllowNull = True
        Periodo.Orden = poAnoMes
        Periodo.Separador = #0
        Periodo.Mes = 0
        Periodo.Ano = 0
        Periodo.MaxPeriodo = '209606'
        Periodo.MinPeriodo = '199606'
        WidthMes = 19
        Separation = 2
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
    Top = 46
    Width = 564
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 558
      end>
    ExplicitTop = 46
    ExplicitWidth = 564
    inherited ToolBar: TToolBar
      Width = 549
      ExplicitWidth = 549
      inherited tbNuevo: TToolButton
        Hint = 'Abrir Per'#237'odo (Ctrl+N)'
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Hint = 'Cerrar Periodo (Ctrl+Del)'
        ImageIndex = 39
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 75
    Width = 564
    Height = 395
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Per'#237'odo'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_INSTRUMENTO'
        Title.Caption = 'Tipo Instrumento'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Alta'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_ALTA'
        Title.Caption = 'Usuario Alta'
        Width = 132
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_MODIF'
        Title.Alignment = taCenter
        Title.Caption = 'F. Modificaci'#243'n'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USU_MODIF'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 145
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 172
    Top = 100
    Width = 163
    Height = 73
    Constraints.MaxHeight = 73
    Constraints.MaxWidth = 163
    Constraints.MinHeight = 73
    Constraints.MinWidth = 163
    ExplicitLeft = 172
    ExplicitTop = 100
    ExplicitWidth = 163
    ExplicitHeight = 73
    DesignSize = (
      163
      73)
    inherited BevelAbm: TBevel
      Top = 37
      Width = 155
      ExplicitTop = 37
      ExplicitWidth = 155
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
    end
    inherited btnAceptar: TButton
      Left = 5
      Top = 43
      TabOrder = 1
      ExplicitLeft = 5
      ExplicitTop = 43
    end
    inherited btnCancelar: TButton
      Left = 83
      Top = 43
      TabOrder = 2
      ExplicitLeft = 83
      ExplicitTop = 43
    end
    object edPeriodoAltaModif: TPeriodoPicker
      Left = 49
      Top = 8
      Width = 54
      Height = 22
      TabOrder = 0
      TabStop = True
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '209606'
      Periodo.MinPeriodo = '199606'
      WidthMes = 19
      Separation = 2
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
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT PC_ID ID, PC_PERIODO PERIODO, '
      
        '       DECODE(PC_ESTADO, '#39'A'#39', '#39'Abierto'#39', '#39'C'#39', '#39'Cerrado'#39', '#39'Err'#243'ne' +
        'o'#39') ESTADO,'
      '       TRUNC(PC_FECHAALTA) FECHA_ALTA, PC_USUALTA USU_ALTA,'
      '       TRUNC(PC_FECHAMODIF) FECHA_MODIF, PC_USUMODIF USU_MODIF'
      '  FROM NPC_PERIODOCONTABLE'
      ' WHERE 1 = 2'
      '')
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
        LinkControl = tbSalir
      end>
    Left = 110
    Top = 200
  end
end
