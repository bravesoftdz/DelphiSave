object fraProcesoArchivo: TfraProcesoArchivo
  Left = 0
  Top = 0
  Width = 786
  Height = 98
  TabOrder = 0
  DesignSize = (
    786
    98)
  object pbProgreso: TJvgProgress
    Left = 11
    Top = 81
    Width = 769
    Height = 14
    Colors.Delineate = clGray
    Colors.Shadow = clBlack
    Colors.Background = clBlack
    Gradient.FromColor = 33023
    Gradient.ToColor = clYellow
    Gradient.Active = True
    Gradient.Orientation = fgdVertical
    Gradient.PercentFilling = 0
    GradientBack.FromColor = clBlack
    GradientBack.ToColor = clGreen
    GradientBack.Active = False
    GradientBack.Orientation = fgdVertical
    Percent = 0
    CaptionAlignment = taCenter
    Step = 5
    Options = []
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Avance [%d%%]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object lblId: TLabel
    Left = 13
    Top = 4
    Width = 22
    Height = 13
    Caption = 'ID: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNombreArchivo: TLabel
    Left = 418
    Top = 20
    Width = 52
    Height = 13
    Caption = 'Nombre: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorID: TLabel
    Left = 42
    Top = 4
    Width = 63
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblValorNombreArchivo: TLabel
    Left = 470
    Top = 19
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblCodigoArchivo: TLabel
    Left = 13
    Top = 20
    Width = 91
    Height = 13
    Caption = 'C'#243'digo Archivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorCodigoArchivo: TLabel
    Left = 114
    Top = 21
    Width = 103
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblSubCodigoArchivo: TLabel
    Left = 230
    Top = 21
    Width = 70
    Height = 13
    Caption = 'Sub-C'#243'digo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorSubCodigo: TLabel
    Left = 323
    Top = 19
    Width = 86
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblRegistrosProcesados: TLabel
    Left = 231
    Top = 37
    Width = 98
    Height = 13
    Caption = 'Reg.Procesados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorCantidadProcesados: TLabel
    Left = 348
    Top = 38
    Width = 60
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblRegistrosErrores: TLabel
    Left = 417
    Top = 38
    Width = 102
    Height = 13
    Caption = 'Registros Errores:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCantidadErrores: TLabel
    Left = 543
    Top = 37
    Width = 48
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblRegistrosTotales: TLabel
    Left = 13
    Top = 37
    Width = 74
    Height = 13
    Caption = 'Reg.Totales:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorCantidadRegistros: TLabel
    Left = 114
    Top = 37
    Width = 103
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lFechaArchivo: TLabel
    Left = 13
    Top = 56
    Width = 87
    Height = 13
    Caption = 'Fecha Archivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblFechaProgProceso: TLabel
    Left = 144
    Top = 56
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblHoraProceso: TLabel
    Left = 231
    Top = 56
    Width = 79
    Height = 13
    Caption = 'Hora Archivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorHoraProceso: TLabel
    Left = 341
    Top = 55
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblObservacion: TLabel
    Left = 146
    Top = 5
    Width = 471
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 604
    Top = 38
    Width = 124
    Height = 13
    Caption = 'Registros Calculados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorCantidadCalculados: TLabel
    Left = 730
    Top = 37
    Width = 48
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 230
    Top = 4
    Width = 90
    Height = 13
    Caption = 'Fecha Proceso:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblFechaProceso: TLabel
    Left = 326
    Top = 4
    Width = 131
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblEstado: TLabel
    Left = 604
    Top = 4
    Width = 44
    Height = 13
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object chkTerminado: TCheckBox
    Left = 414
    Top = 55
    Width = 179
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Terminado            '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object tbProcesosEmision: TToolBar
    Left = 605
    Top = 54
    Width = 52
    Height = 26
    Align = alNone
    Anchors = [akTop, akRight]
    BorderWidth = 1
    Caption = 'Botones Reglas Aceptaci'#243'n y Rechazo'
    EdgeBorders = []
    Flat = True
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Transparent = True
    object tbMostrarErrores: TToolButton
      Left = 0
      Top = 0
      Caption = 'tbMostrarErrores'
      ImageIndex = 14
      OnClick = tbMostrarErroresClick
    end
    object tbEliminarProceso: TToolButton
      Left = 23
      Top = 0
      Hint = 'Eliminar Proceso Agendado'
      Caption = 'Eliminar Proceso Agendado'
      ImageIndex = 8
      OnClick = tbEliminarProcesoClick
    end
  end
  object TimerRefresh: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerRefreshTimer
    Left = 640
    Top = 4
  end
end
