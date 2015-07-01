object frmImpresionEstadodeCuenta: TfrmImpresionEstadodeCuenta
  Left = 216
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emisi'#243'n de Estados de Cuenta'
  ClientHeight = 364
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbTipoResumen: TGroupBox
    Left = 0
    Top = 86
    Width = 404
    Height = 81
    Caption = ' Tipo de Resumen '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblPeriodoDesde: TLabel
      Left = 246
      Top = 33
      Width = 73
      Height = 13
      Caption = 'Per'#237'odo Desde:'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPeriodoHasta: TLabel
      Left = 246
      Top = 57
      Width = 71
      Height = 13
      Caption = 'Per'#237'odo Hasta:'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object rbPerNoSaldados: TRadioButton
      Left = 12
      Top = 30
      Width = 137
      Height = 13
      Caption = 'Per'#237'odos no Saldados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rbPerNoSaldadosClick
    end
    object rbTotalPeriodos: TRadioButton
      Left = 12
      Top = 14
      Width = 137
      Height = 13
      Caption = 'Total de Per'#237'odos'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rbPerNoSaldadosClick
    end
    object cbRangoPeriodos: TCheckBox
      Left = 207
      Top = 11
      Width = 141
      Height = 17
      Caption = 'Rango de per'#237'odos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = cbRangoPeriodosClick
    end
    object ppHasta: TPeriodoPicker
      Left = 325
      Top = 55
      Width = 60
      Height = 21
      TabOrder = 6
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
      Enabled = False
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
    object ppDesde: TPeriodoPicker
      Left = 325
      Top = 30
      Width = 60
      Height = 21
      TabOrder = 5
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
      Enabled = False
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
    object chkSaldoAcreedor: TCheckBox
      Left = 41
      Top = 45
      Width = 104
      Height = 17
      Caption = 'Saldo Acreedor'
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object chkSaldoDeudor: TCheckBox
      Left = 41
      Top = 62
      Width = 104
      Height = 17
      Caption = 'Saldo Deudor'
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
  end
  object gbAdicionales: TGroupBox
    Left = 0
    Top = 226
    Width = 294
    Height = 67
    Caption = ' Adicionales '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object cbJudicial: TCheckBox
      Left = 5
      Top = 48
      Width = 144
      Height = 15
      Caption = 'Incluir Amortizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object chkNoMostrarConcQuiebra: TCheckBox
      Left = 5
      Top = 14
      Width = 144
      Height = 15
      Caption = 'No Incluir Conc./Quiebras'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object chkNoMostrarReclamoAFIP: TCheckBox
      Left = 5
      Top = 31
      Width = 144
      Height = 15
      Caption = 'No Incluir Reclamo AFIP'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object chkNoMostrarChequesRech: TCheckBox
      Left = 13
      Top = 63
      Width = 249
      Height = 15
      Caption = 'No Incluir cheques rechazados de la migraci'#243'n'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      Visible = False
    end
    object chkNoMostrarPrescripto: TCheckBox
      Left = 152
      Top = 14
      Width = 138
      Height = 15
      Caption = 'No Incluir Per. Prescripto'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 4
    end
  end
  object gbIntereses: TGroupBox
    Left = 0
    Top = 167
    Width = 404
    Height = 59
    Caption = ' C'#225'lculo de Intereses '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lvlVencimiento: TLabel
      Left = 44
      Top = 35
      Width = 108
      Height = 13
      Caption = 'Fecha de Vencimiento:'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edVencimiento: TDateComboBox
      Left = 158
      Top = 33
      Width = 88
      Height = 21
      TabStop = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Weekends = [Sun, Sat]
      TabOrder = 1
    end
    object cbIntereses: TCheckBox
      Left = 30
      Top = 13
      Width = 151
      Height = 17
      Caption = 'Determinar Intereses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cbInteresesClick
    end
    object chkInteresPerConcQuiebra: TCheckBox
      Left = 279
      Top = 8
      Width = 116
      Height = 16
      Caption = 'Per. Conc./Quiebra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object chkInteresesSaldoAcreedor: TCheckBox
      Left = 279
      Top = 26
      Width = 116
      Height = 14
      Caption = 'Saldo Acreedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object btnImprimir: TButton
    Left = 90
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 5
    OnClick = btnPrintClick
  end
  object btnSalir: TButton
    Left = 327
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 7
    OnClick = btnSalirClick
  end
  object btnPreview: TButton
    Left = 165
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 6
    OnClick = btnPreviewClick
  end
  object gbFechaContable: TGroupBox
    Left = 297
    Top = 226
    Width = 107
    Height = 67
    Caption = ' Fecha Contable '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object edFechaContable: TDateComboBox
      Left = 10
      Top = 28
      Width = 88
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object btnMail: TButton
    Left = 2
    Top = 337
    Width = 88
    Height = 25
    Caption = 'Enviar Correo'
    PopupMenu = pmnuEnviarCorreo
    TabOrder = 8
    OnClick = btnMailClick
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 86
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 9
    object gbAdjuntos: TGroupBox
      Left = 273
      Top = 0
      Width = 131
      Height = 43
      Caption = ' Adjuntar al correo '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object chkF817: TCheckBox
        Left = 10
        Top = 13
        Width = 111
        Height = 13
        TabStop = False
        Caption = 'F817'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object chkF801C: TCheckBox
        Left = 10
        Top = 26
        Width = 111
        Height = 13
        TabStop = False
        Caption = 'F801C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = chkF801CClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 273
      Height = 86
      Caption = ' Tipo de Emisi'#243'n '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object rbResumen: TRadioButton
        Left = 10
        Top = 17
        Width = 183
        Height = 17
        Caption = 'Resumen'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbResumenClick
      end
      object rbDetalleART: TRadioButton
        Left = 10
        Top = 39
        Width = 183
        Height = 17
        Caption = 'Detalle Saldo para ART'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = rbResumenClick
      end
      object chkTodosContratos: TCheckBox
        Left = 85
        Top = 17
        Width = 181
        Height = 17
        Caption = 'Todos los contratos para el CUIT'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object rbDetalleSumatoria: TRadioButton
        Left = 10
        Top = 60
        Width = 183
        Height = 17
        Caption = 'Detalle y Saldo (Total por C'#243'digo)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = rbResumenClick
      end
    end
    object gbTipoF801C: TGroupBox
      Left = 273
      Top = 43
      Width = 131
      Height = 43
      Caption = ' Tipo F801C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object rbTipo801CTotal: TRadioButton
        Left = 10
        Top = 14
        Width = 113
        Height = 12
        Caption = 'Total'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbTipo801CPorPeriodo: TRadioButton
        Left = 10
        Top = 27
        Width = 113
        Height = 12
        Caption = 'Por Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 293
    Width = 404
    Height = 43
    Caption = ' R'#233'gimen'
    TabOrder = 4
    DesignSize = (
      404
      43)
    inline fraTipoRegimen: TfraTipoRegimen
      Left = 9
      Top = 14
      Width = 386
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 9
      ExplicitTop = 14
      ExplicitWidth = 386
      ExplicitHeight = 25
      DesignSize = (
        386
        25)
      inherited cmbDescripcion: TArtComboBox
        Width = 340
        ExplicitWidth = 340
      end
      inherited edCodigo: TPatternEdit
        Left = 3
        ExplicitLeft = 3
      end
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <
      item
        Name = 'Consulta'
      end
      item
        Name = 'RestrictivoEspecial'
      end>
    PermitirEdicion = False
    Left = 290
    Top = 337
  end
  object pmnuEnviarCorreo: TPopupMenu
    Left = 246
    Top = 337
    object mnuEnvioIndividual: TMenuItem
      Caption = 'Env'#237'o Individual'
    end
    object mnuEnvioMasivoComprimido: TMenuItem
      Caption = 'Env'#237'o Masivo Comprimido'
    end
    object mnuEnvioMasivoNoComprimido: TMenuItem
      Caption = 'Env'#237'o Masivo No Comprimido'
    end
  end
end
