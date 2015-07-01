object fraOpcionProgramacion: TfraOpcionProgramacion
  Left = 0
  Top = 0
  Width = 589
  Height = 58
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  DesignSize = (
    589
    58)
  object cbOpcion: TJvgCheckBox
    Left = 7
    Top = 0
    Width = 143
    Height = 20
    Caption = 'Emisi'#243'n Mensual Real'
    OnClick = cbOpcionClick
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    GlyphShift.X = 0
    GlyphShift.Y = 0
    Transparent = True
    TextStyles.Passive = fstNone
    TextStyles.Active = fstNone
    TextStyles.Disabled = fstNone
    Colors.Background = 15855064
    Colors.BackgroundActive = 15855064
    Options = [fcoFastDraw, fcoUnderlinedActive]
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Illumination.ShadowDepth = 0
  end
  object lblPeriodoComprendido: TLabel
    Left = 18
    Top = 23
    Width = 106
    Height = 13
    Caption = 'Per'#237'odo Comprendido:'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 45
    Width = 584
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object lblError: TLabel
    Left = 328
    Top = 2
    Width = 251
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Error...La emisi'#243'n estimada mensual no corresponde'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object cbInmediato: TCheckBox
    Left = 246
    Top = 2
    Width = 71
    Height = 17
    Caption = 'Inmediato'
    Checked = True
    State = cbChecked
    TabOrder = 2
    Visible = False
    OnClick = cbInmediatoClick
  end
  object tbProcesosEmision: TToolBar
    Left = 508
    Top = 17
    Width = 77
    Height = 28
    Align = alNone
    BorderWidth = 1
    Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
    EdgeBorders = []
    Flat = True
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbReprogramar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Reprogramar'
      Caption = 'Reprogramar'
      ImageIndex = 16
      OnClick = tbReprogramarClick
    end
    object tbExplorar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Explorar el Resultado del Proceso'
      Caption = 'Explorar Proceso'
      ImageIndex = 14
      OnClick = tbExplorarClick
    end
    object tbEjecutar: TToolButton
      Left = 46
      Top = 0
      Hint = 'Ejecutar'
      Caption = 'Ejecutar'
      ImageIndex = 32
      OnClick = tbEjecutarClick
    end
  end
  object edtPeriodoComprendido: TPeriodoPicker
    Left = 127
    Top = 20
    Width = 49
    Height = 21
    TabOrder = 1
    Color = clWindow
    Periodo.AllowNull = False
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 6
    Periodo.Ano = 2005
    Periodo.Valor = '200506'
    Periodo.MaxPeriodo = '205506'
    Periodo.MinPeriodo = '195506'
    WidthMes = 19
    Separation = 0
    ShowButton = False
    ShowOrder = poAnoMes
    ReadOnly = True
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
  object pnFechasProgramacion: TPanel
    Left = 191
    Top = 16
    Width = 313
    Height = 26
    BevelOuter = bvNone
    TabOrder = 3
    object lblEjecucion: TLabel
      Left = 3
      Top = 7
      Width = 49
      Height = 13
      Caption = 'Ejecuci'#243'n:'
    end
    object lblProximaEjecucion: TLabel
      Left = 170
      Top = 7
      Width = 43
      Height = 13
      Caption = 'Anterior:'
    end
    object edtFechaEjecucion: TDateComboBox
      Left = 55
      Top = 4
      Width = 90
      Height = 21
      Date = 38353.000000000000000000
      Text = '01/01/2005'
      TabOrder = 0
      OnChange = edtFechaEjecucionChange
      OnExit = edtFechaEjecucionExit
    end
    object edtFechaAnteriorEjecucion: TDateComboBox
      Left = 218
      Top = 4
      Width = 92
      Height = 21
      Date = 38384.000000000000000000
      Text = '01/02/2005'
      Color = 10930928
      ReadOnly = True
      TabOrder = 1
    end
  end
  object sdqProgramacion: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT   b.job,'
      '         b.failures,'
      '         NULL,'
      '         b.next_date next_date,'
      '         b.last_date last_date,'
      '         (b.log_user),'
      '         (b.priv_user),'
      '         (b.schema_user),'
      '         0,'
      '         b.INTERVAL,'
      '         b.what,'
      '         DECODE (broken, '#39'Y'#39', '#39'Broken'#39', '#39'Scheduled'#39') status,'
      '         NULL,'
      
        '         broken, emi.utiles.get_periododevengablemensual(ge_id) ' +
        'estado,'
      '         emi.utiles.get_maximoperiododev periodo_comprometido,'
      '         GE_EMISIONINMEDIATO emisioninmediato'
      ''
      '    FROM SYS.dba_jobs b, emi.ige_grupoemision g'
      '   WHERE g.ge_id = :Id'
      '     AND g.ge_idjob = b.job (+)'
      ''
      ''
      ''
      ''
      '')
    Left = 16
    Top = 35
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
