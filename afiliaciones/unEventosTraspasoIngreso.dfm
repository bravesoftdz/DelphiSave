object frmEventosTraspasoIngreso: TfrmEventosTraspasoIngreso
  Left = 292
  Top = 151
  ActiveControl = fraEmpresa.mskCUIT
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Administraci'#243'n de Evento de Traspaso Ingreso'
  ClientHeight = 205
  ClientWidth = 512
  Color = clBtnFace
  Constraints.MaxHeight = 243
  Constraints.MaxWidth = 528
  Constraints.MinHeight = 232
  Constraints.MinWidth = 520
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    512
    205)
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 45
    Top = 92
    Width = 34
    Height = 13
    Caption = 'Evento'
  end
  object Label1: TLabel
    Left = 50
    Top = 116
    Width = 30
    Height = 13
    Caption = 'Fecha'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 384
    Top = 116
    Width = 32
    Height = 13
    Caption = 'Deuda'
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 8
    Top = 140
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object Label12: TLabel
    Left = 200
    Top = 116
    Width = 73
    Height = 13
    Caption = 'Per'#237'odo Deuda'
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 63
    Top = 44
    Width = 18
    Height = 13
    Caption = 'Cuit'
  end
  object Label5: TLabel
    Left = 66
    Top = 68
    Width = 13
    Height = 13
    Caption = 'Art'
  end
  object cmbFecha: TDateComboBox
    Left = 88
    Top = 112
    Width = 88
    Height = 21
    TabOrder = 3
  end
  object edDeuda: TCurrencyEdit
    Left = 420
    Top = 112
    Width = 88
    Height = 21
    AutoSize = False
    DisplayFormat = '$ ,0.00;-$ ,0.00;$ ,0.00'
    TabOrder = 5
  end
  object edObservaciones: TMemo
    Left = 88
    Top = 136
    Width = 420
    Height = 64
    TabOrder = 6
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 512
    Height = 26
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    object tbGrabar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Grabar (Ctrl-G)'
      Caption = 'tlbNuevo'
      ImageIndex = 3
      OnClick = tbGrabarClick
    end
    object ToolButton3: TToolButton
      Left = 23
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbSalir: TToolButton
      Left = 28
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
  end
  object edTI_PERIODO: TPeriodoPicker
    Left = 280
    Top = 112
    Width = 49
    Height = 21
    TabOrder = 4
    TabStop = True
    Color = clWindow
    Periodo.AllowNull = True
    Periodo.Orden = poAnoMes
    Periodo.Separador = #0
    Periodo.Mes = 0
    Periodo.Ano = 0
    Periodo.MaxPeriodo = '205304'
    Periodo.MinPeriodo = '195305'
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
  inline fraEventos: TfraStaticCTB_TABLAS
    Left = 88
    Top = 88
    Width = 420
    Height = 25
    TabOrder = 2
    inherited edCodigo: TPatternEdit
      Left = 0
    end
    inherited cmbDescripcion: TComboGrid
      Left = 61
      Width = 360
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'TB_CLAVE'
        'TB_ESPECIAL1')
      ColWidths = (
        40
        300
        -1
        -1
        -1
        -1)
    end
  end
  inline fraEmpresa: TfraEmpresaSolicitud
    Left = 88
    Top = 40
    Width = 420
    Height = 23
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
    inherited lbRSocial: TLabel
      Left = 88
    end
    inherited lbContrato: TLabel
      Left = 185
      Visible = False
    end
    inherited lbFormulario: TLabel
      Left = 292
      Width = 50
      Font.Name = 'Tahoma'
    end
    inherited edContrato: TIntEdit
      Left = 190
      Visible = False
    end
    inherited cmbRSocial: TArtComboBox
      Left = 132
      Width = 152
    end
    inherited edFormulario: TPatternEdit
      Left = 346
      Width = 72
    end
  end
  inline fraArtAnterior: TfraStaticCodigoDescripcion
    Left = 88
    Top = 64
    Width = 420
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    TabStop = True
    inherited edCodigo: TPatternEdit
      Left = 0
      Top = 0
      Width = 74
    end
    inherited cmbDescripcion: TComboGrid
      Left = 76
      Top = 0
      Width = 344
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16455
        LinkControl = tbGrabar
      end>
    Left = 16
    Top = 255
  end
end
