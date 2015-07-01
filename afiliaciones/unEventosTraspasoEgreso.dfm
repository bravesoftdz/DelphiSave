object frmEventosTraspasoEgreso: TfrmEventosTraspasoEgreso
  Left = 219
  Top = 108
  BorderStyle = bsSingle
  Caption = 'Administraci'#243'n de Evento de Traspaso Egreso'
  ClientHeight = 317
  ClientWidth = 530
  Color = clBtnFace
  Constraints.MaxHeight = 355
  Constraints.MaxWidth = 546
  Constraints.MinHeight = 344
  Constraints.MinWidth = 538
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    530
    317)
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 46
    Top = 140
    Width = 37
    Height = 13
    Caption = 'Evento:'
  end
  object Label1: TLabel
    Left = 51
    Top = 196
    Width = 33
    Height = 13
    Caption = 'Fecha:'
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 399
    Top = 196
    Width = 35
    Height = 13
    Caption = 'Deuda:'
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 9
    Top = 244
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object Label12: TLabel
    Left = 186
    Top = 196
    Width = 88
    Height = 13
    Caption = 'Fecha Generaci'#243'n'
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 8
    Top = 220
    Width = 76
    Height = 13
    Caption = 'Deuda Nominal:'
    Layout = tlCenter
  end
  object Label5: TLabel
    Left = 228
    Top = 220
    Width = 46
    Height = 13
    Caption = 'Intereses:'
    Layout = tlCenter
  end
  object Label6: TLabel
    Left = 373
    Top = 220
    Width = 61
    Height = 13
    Caption = 'Consolidado:'
    Layout = tlCenter
  end
  object Label11: TLabel
    Left = 8
    Top = 168
    Width = 73
    Height = 13
    Caption = 'Cla'#250'sula RGRL'
  end
  object rgClausulaRgrl: TRadioGroup
    Left = 88
    Top = 156
    Width = 128
    Height = 32
    Columns = 2
    Items.Strings = (
      'S'#205
      'NO')
    TabOrder = 2
  end
  object cmbFecha: TDateComboBox
    Left = 87
    Top = 192
    Width = 88
    Height = 21
    TabOrder = 3
  end
  object edDeuda: TCurrencyEdit
    Left = 438
    Top = 192
    Width = 88
    Height = 21
    AutoSize = False
    DisplayFormat = '$ ,0.00;-$ ,0.00;$ ,0.00'
    TabOrder = 5
  end
  object edObservaciones: TMemo
    Left = 87
    Top = 240
    Width = 440
    Height = 72
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 530
    Height = 26
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    object tbGrabar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Grabar (Ctrl-G)'
      Caption = 'tlbNuevo'
      ImageIndex = 3
      OnClick = tbGrabarClick
    end
    object ToolButton8: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 31
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tbSalirClick
    end
  end
  object cmbFechaGeneracion: TDateComboBox
    Left = 277
    Top = 192
    Width = 88
    Height = 21
    TabOrder = 4
  end
  inline fraEventos: TfraStaticCTB_TABLAS
    Left = 86
    Top = 136
    Width = 441
    Height = 25
    TabOrder = 1
    inherited cmbDescripcion: TComboGrid
      Width = 377
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
  object edDeudaNominal: TCurrencyEdit
    Left = 87
    Top = 216
    Width = 88
    Height = 21
    AutoSize = False
    DisplayFormat = '$ ,0.00;-$ ,0.00;$ ,0.00'
    TabOrder = 6
    OnChange = edDeudaNominalChange
  end
  object edIntereses: TCurrencyEdit
    Left = 277
    Top = 216
    Width = 88
    Height = 21
    AutoSize = False
    DisplayFormat = '$ ,0.00;-$ ,0.00;$ ,0.00'
    TabOrder = 7
    OnChange = edInteresesChange
  end
  object edConsolidado: TCurrencyEdit
    Left = 438
    Top = 216
    Width = 88
    Height = 21
    AutoSize = False
    DisplayFormat = '$ ,0.00;-$ ,0.00;$ ,0.00'
    TabOrder = 8
  end
  object gbEmpresa: TGroupBox
    Left = 0
    Top = 26
    Width = 530
    Height = 104
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      530
      104)
    object Label7: TLabel
      Left = 6
      Top = 14
      Width = 18
      Height = 13
      Caption = 'Cuit'
    end
    object Label9: TLabel
      Left = 8
      Top = 68
      Width = 376
      Height = 26
      AutoSize = False
      Caption = 
        'Di'#243' cumplimiento con la obligaci'#243'n de presentar el Relevamiento ' +
        'General de Riesgos Laborales y el Plan de Regularizaci'#243'n'
      WordWrap = True
    end
    object Label8: TLabel
      Left = 2
      Top = 44
      Width = 58
      Height = 13
      Caption = 'ART Futura:'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 29
      Top = 11
      Width = 495
      Height = 22
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
      inherited lbContrato: TLabel
        Left = 393
      end
      inherited edContrato: TIntEdit
        Left = 438
      end
      inherited cmbRSocial: TArtComboBox
        Width = 256
        DataSource = nil
      end
    end
    object rgDioCumplimiento: TRadioGroup
      Left = 388
      Top = 64
      Width = 137
      Height = 32
      Columns = 2
      Enabled = False
      Items.Strings = (
        'S'#237
        'No')
      TabOrder = 1
    end
    object ToolBar2: TToolBar
      Left = 468
      Top = 35
      Width = 57
      Height = 30
      Align = alNone
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = True
      object tbModificarArt: TToolButton
        Left = 0
        Top = 0
        ImageIndex = 7
        OnClick = tbModificarArtClick
      end
      object tbGuardarArt: TToolButton
        Left = 23
        Top = 0
        Hint = 'Guardar estado del contrato'
        Caption = 'tbGuarda'
        ImageIndex = 3
        OnClick = tbGuardarArtClick
      end
    end
    inline fraArtFutura: TfraStaticCodigoDescripcion
      Left = 60
      Top = 39
      Width = 405
      Height = 22
      Anchors = [akLeft]
      TabOrder = 3
      TabStop = True
      inherited edCodigo: TPatternEdit
        Left = 5
        Width = 74
      end
      inherited cmbDescripcion: TComboGrid
        Left = 83
        Width = 318
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
    Top = 259
  end
end
