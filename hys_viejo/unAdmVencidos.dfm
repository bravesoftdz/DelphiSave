inherited frmAdmVencidos: TfrmAdmVencidos
  Left = 279
  Top = 202
  Width = 768
  Height = 467
  Caption = 'Administraci'#243'n de Vencidos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 760
    Height = 103
    object Label1: TLabel
      Left = 8
      Top = 59
      Width = 46
      Height = 13
      Caption = 'Preventor'
    end
    object Label2: TLabel
      Left = 390
      Top = 59
      Width = 57
      Height = 13
      Caption = 'Coordinador'
    end
    object Label4: TLabel
      Left = 390
      Top = 83
      Width = 60
      Height = 13
      Caption = 'Mes  Desde:'
    end
    object Label3: TLabel
      Left = 508
      Top = 83
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label19: TLabel
      Left = 8
      Top = 7
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    object Label14: TLabel
      Left = 8
      Top = 33
      Width = 30
      Height = 13
      Caption = 'Estab.'
    end
    object lblTipoMedicion: TLabel
      Left = 390
      Top = 33
      Width = 56
      Height = 13
      Caption = 'T. Medici'#243'n'
    end
    inline fraPreventorFiltro: TfraCodigoDescripcion
      Left = 59
      Top = 54
      Width = 325
      Height = 23
      TabOrder = 3
      DesignSize = (
        325
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 256
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
      end
    end
    inline fraCoordinadorFiltro: TfraCodigoDescripcion
      Left = 451
      Top = 54
      Width = 307
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      DesignSize = (
        307
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 68
        Width = 237
        CharCase = ecUpperCase
      end
      inherited edCodigo: TPatternEdit
        Width = 64
        CharCase = ecNormal
      end
    end
    object chkSinPreventor: TCheckBox
      Left = 8
      Top = 83
      Width = 117
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Incluir Sin Preventor'
      TabOrder = 5
    end
    object cbNoTercerizado: TCheckBox
      Left = 148
      Top = 83
      Width = 54
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Propio'
      TabOrder = 6
    end
    object cbTercerizado: TCheckBox
      Left = 224
      Top = 83
      Width = 66
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Terceros'
      TabOrder = 7
    end
    object edMes: TPeriodoPicker
      Left = 452
      Top = 79
      Width = 49
      Height = 21
      TabOrder = 8
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
    object edMesHasta: TPeriodoPicker
      Left = 541
      Top = 79
      Width = 49
      Height = 21
      TabOrder = 9
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
    inline fraEmpresaFiltro: TfraEmpresa
      Left = 60
      Top = 3
      Width = 696
      Height = 21
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
      DesignSize = (
        696
        21)
      inherited lbContrato: TLabel
        Left = 592
      end
      inherited edContrato: TIntEdit
        Left = 639
      end
      inherited cmbRSocial: TArtComboBox
        Width = 457
      end
    end
    object edEstablecimiento: TPatternEdit
      Left = 60
      Top = 29
      Width = 321
      Height = 21
      TabOrder = 1
      Pattern = '1234567890-,'
    end
    object cmbTipoMedicion: TCheckCombo
      Left = 452
      Top = 29
      Width = 304
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Items.Strings = (
        'ACCIDENTES'
        'ACCIDENTESCONFALLIDAS'
        'ENFERMEDADES'
        'ENFERMEDADESCONFALLIDAS'
        'FGRL'
        'FGRLCONFALLIDAS'
        'PAL'
        'PALCONFALLIDAS'
        'PAPE'
        'PAPECONFALLIDAS'
        'PRS'
        'PRSCONFALLIDAS'
        'VEROSIMILITUD'
        'VEROSIMILITUDCONFALLIDAS'
        'VISITASOBRA'
        'VISITASOBRACONFALLIDAS')
    end
  end
  inherited CoolBar: TCoolBar
    Top = 103
    Width = 760
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 756
      end>
    inherited ToolBar: TToolBar
      Width = 743
      inherited tbPropiedades: TToolButton
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbEnviarMail: TToolButton
        Visible = True
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'Sumatoria'
        ImageIndex = 48
        OnClick = tbSumatoriaClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 132
    Width = 760
    Height = 308
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    MultiSelect = True
  end
  object fpObservaciones: TFormPanel [3]
    Left = 212
    Top = 183
    Width = 447
    Height = 137
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      447
      137)
    object BevelAbm: TBevel
      Left = 4
      Top = 101
      Width = 439
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object lbObservacion: TLabel
      Left = 4
      Top = 11
      Width = 66
      Height = 13
      Caption = 'Observaci'#243'n :'
    end
    object lbObservacionLibre: TLabel
      Left = 4
      Top = 39
      Width = 63
      Height = 26
      Caption = 'Observaci'#243'n '#13#10'     Libre'
    end
    object btnAceptarObservacion: TButton
      Left = 289
      Top = 107
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarObservacionClick
    end
    object btnCancelarObservacion: TButton
      Left = 367
      Top = 107
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraObservacion: TfraCodigoDescripcion
      Left = 72
      Top = 5
      Width = 368
      Height = 23
      TabOrder = 2
      DesignSize = (
        368
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 303
        DataSource = nil
      end
    end
    object edObservacionLibre: TMemo
      Left = 72
      Top = 32
      Width = 365
      Height = 64
      TabOrder = 3
    end
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
end
