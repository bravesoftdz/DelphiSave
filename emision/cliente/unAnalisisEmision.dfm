object frmAnalisisEmision: TfrmAnalisisEmision
  Left = 257
  Top = 322
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Proceso de Devengado'
  ClientHeight = 185
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    383
    185)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 145
    Width = 379
    Height = 10
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsBottomLine
  end
  object gbDatos: TGroupBox
    Left = 3
    Top = -3
    Width = 379
    Height = 108
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 18
      Width = 86
      Height = 13
      Caption = 'Mes de Cobertura'
    end
    object Label2: TLabel
      Left = 24
      Top = 57
      Width = 64
      Height = 13
      Caption = 'Desv'#237'o desde'
    end
    object edPeriodo: TPeriodoPicker
      Left = 98
      Top = 14
      Width = 57
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205406'
      Periodo.MinPeriodo = '195407'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
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
    object chkEmision: TCheckBox
      Left = 184
      Top = 13
      Width = 132
      Height = 17
      Caption = 'An'#225'lisis de Emisi'#243'n'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkExtremos: TCheckBox
      Left = 184
      Top = 36
      Width = 160
      Height = 17
      Caption = 'An'#225'lisis de Casos Extremos'
      TabOrder = 2
    end
    object chkExtremosDesvio: TCheckBox
      Left = 184
      Top = 59
      Width = 192
      Height = 17
      Caption = 'An'#225'lisis de Casos Extremos - Desv'#237'o'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object edDesvio: TCurrencyEdit
      Left = 98
      Top = 53
      Width = 57
      Height = 21
      AutoSize = False
      TabOrder = 4
    end
    object rbPlanilla: TRadioButton
      Left = 34
      Top = 85
      Width = 113
      Height = 17
      Caption = 'Planilla '#250'nicamente'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object rbPlanillaImpresion: TRadioButton
      Left = 158
      Top = 85
      Width = 113
      Height = 17
      Caption = 'Planilla e Impresi'#243'n'
      TabOrder = 6
    end
  end
  object gbDestino: TGroupBox
    Left = 3
    Top = 106
    Width = 379
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Guardar la planilla Excel en... '
    TabOrder = 1
    DesignSize = (
      379
      43)
    object edFilename: TFilenameEdit
      Left = 5
      Top = 14
      Width = 370
      Height = 21
      DialogKind = dkSave
      Filter = 'Archivos Excel (*.xls)|*.xls|Todos los archivos (*.*)|*.*'
      InitialDir = 'c:\'
      DialogOptions = [ofOverwritePrompt, ofPathMustExist, ofEnableSizing]
      DialogTitle = 'Selecci'#243'n de planilla de salida'
      Color = clBtnFace
      DirectInput = False
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 0
    end
  end
  object btnGenerar: TButton
    Left = 221
    Top = 159
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Generar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnGenerarClick
  end
  object btnSalir: TButton
    Left = 301
    Top = 159
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salir'
    TabOrder = 3
    OnClick = btnSalirClick
  end
  object ExcelApplication: TExcelApplication
    AutoConnect = True
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 350
    Top = 6
  end
end
