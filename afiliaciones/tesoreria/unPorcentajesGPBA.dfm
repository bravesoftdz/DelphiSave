inherited frmPorcentajesGPBA: TfrmPorcentajesGPBA
  Width = 580
  Height = 450
  Caption = 'Porcentajes GPBA'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 572
    Visible = True
    object gbPeriodo: TGroupBox
      Left = 5
      Top = 1
      Width = 76
      Height = 41
      Caption = 'Periodo'
      TabOrder = 0
      object ppPeriodo: TPeriodoPicker
        Left = 10
        Top = 14
        Width = 56
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
    object chkNoMostrarBajas: TCheckBox
      Left = 88
      Top = 27
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Width = 572
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 568
      end>
    inherited ToolBar: TToolBar
      Width = 555
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 572
    Height = 349
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPITAS_GPBA'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas GPBA'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPITAS_ART'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas ART'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porcentaje'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 78
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 196
    Top = 128
    Width = 188
    Height = 156
    Constraints.MaxHeight = 156
    Constraints.MaxWidth = 188
    Constraints.MinHeight = 156
    Constraints.MinWidth = 188
    DesignSize = (
      188
      156)
    inherited BevelAbm: TBevel
      Top = 120
      Width = 180
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 14
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Periodo'
    end
    object Label2: TLabel [2]
      Left = 10
      Top = 40
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'C'#225'pitas GPBA'
    end
    object Label3: TLabel [3]
      Left = 10
      Top = 67
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'C'#225'pitas ART'
    end
    object Label4: TLabel [4]
      Left = 10
      Top = 96
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Porcentaje'
    end
    inherited btnAceptar: TButton
      Left = 30
      Top = 126
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 108
      Top = 126
      TabOrder = 5
    end
    object ppPeriodoCarga: TPeriodoPicker
      Left = 85
      Top = 10
      Width = 56
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
    object edCapitasGPBACarga: TIntEdit
      Left = 85
      Top = 37
      Width = 85
      Height = 21
      TabOrder = 1
      MaxLength = 8
    end
    object edCapitasARTCarga: TIntEdit
      Left = 85
      Top = 64
      Width = 85
      Height = 21
      TabOrder = 2
      MaxLength = 8
    end
    object edPorcentajeCarga: TCurrencyEdit
      Left = 85
      Top = 92
      Width = 85
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = ',0.000;-,0.000'
      MaxValue = 100.000000000000000000
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT GP_PERIODO PERIODO, GP_CAPITASGPBA CAPITAS_GPBA, GP_CAPIT' +
        'ASART CAPITAS_ART, '
      '       GP_PORCENTAJE PORCENTAJE, GP_FECHABAJA FECHA_BAJA'
      '  FROM OGP_GPBAPORCENTAJE'
      ' WHERE 1 = 2')
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
