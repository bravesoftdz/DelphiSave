object frmAnalisisEmision: TfrmAnalisisEmision
  Left = 207
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Proceso de Devengado'
  ClientHeight = 204
  ClientWidth = 429
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
    429
    204)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 145
    Width = 425
    Height = 29
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsBottomLine
  end
  object gbDatos: TGroupBox
    Left = 3
    Top = -3
    Width = 425
    Height = 127
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 86
      Height = 13
      Caption = 'Mes de Cobertura'
    end
    object Label2: TLabel
      Left = 33
      Top = 105
      Width = 64
      Height = 13
      Caption = 'Desv'#237'o desde'
    end
    object Label6: TLabel
      Left = 32
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object Label15: TLabel
      Left = 35
      Top = 78
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label3: TLabel
      Left = 9
      Top = 39
      Width = 102
      Height = 13
      Caption = 'Fecha de Distribuci'#243'n'
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
      TabOrder = 3
    end
    object chkExtremos: TCheckBox
      Left = 184
      Top = 36
      Width = 160
      Height = 17
      Caption = 'An'#225'lisis de Casos Extremos'
      TabOrder = 4
    end
    object chkExtremosDesvio: TCheckBox
      Left = 184
      Top = 59
      Width = 192
      Height = 17
      Caption = 'An'#225'lisis de Casos Extremos - Desv'#237'o'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object edDesvio: TCurrencyEdit
      Left = 100
      Top = 101
      Width = 57
      Height = 21
      AutoSize = False
      TabOrder = 6
    end
    object rbPlanilla: TRadioButton
      Left = 184
      Top = 107
      Width = 113
      Height = 17
      Caption = 'Planilla '#250'nicamente'
      Checked = True
      TabOrder = 7
      TabStop = True
    end
    object rbPlanillaImpresion: TRadioButton
      Left = 308
      Top = 107
      Width = 113
      Height = 17
      Caption = 'Planilla e Impresi'#243'n'
      TabOrder = 8
    end
    object edFDistrDesde: TDateComboBox
      Left = 68
      Top = 53
      Width = 88
      Height = 21
      MaxDateCombo = edFDistrHasta
      TabOrder = 1
    end
    object edFDistrHasta: TDateComboBox
      Left = 68
      Top = 75
      Width = 88
      Height = 21
      MinDateCombo = edFDistrDesde
      TabOrder = 2
    end
  end
  object gbDestino: TGroupBox
    Left = 3
    Top = 125
    Width = 425
    Height = 43
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Guardar la planilla Excel en... '
    TabOrder = 1
    DesignSize = (
      425
      43)
    object edFilename: TFilenameEdit
      Left = 5
      Top = 14
      Width = 416
      Height = 21
      DialogKind = dkSave
      Filter = 'Archivos Excel (*.xls)|*.xls'
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
    Left = 267
    Top = 178
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
    Left = 347
    Top = 178
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
  object ExportDialog: TExportDialog
    DataSet = sdqConsulta
    Fields = <>
    Caption = 'Exportaci'#243'n de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    ExportFileType = etExcelFile
    Rows = 0
    Left = 7
    Top = 176
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT *'
      'FROM TMP.TDE_DESVIOEMISION'
      '')
    Left = 36
    Top = 176
    object sdqConsultaDE_CUIT: TStringField
      DisplayLabel = 'CUIT'
      FieldName = 'DE_CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaDE_CONTRATO: TFloatField
      DisplayLabel = 'Contrato'
      FieldName = 'DE_CONTRATO'
      Required = True
    end
    object sdqConsultaDE_NOMBRE: TStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'DE_NOMBRE'
      Required = True
      Size = 60
    end
    object sdqConsultaDE_PERIODOACTUAL: TStringField
      DisplayLabel = 'Periodo Actual'
      FieldName = 'DE_PERIODOACTUAL'
      Required = True
      Size = 6
    end
    object sdqConsultaDE_EMPLEADOSACTUAL: TFloatField
      DisplayLabel = 'Empleados Actual'
      FieldName = 'DE_EMPLEADOSACTUAL'
    end
    object sdqConsultaDE_MASAACTUAL: TFloatField
      DisplayLabel = 'Masa Sal. Actual'
      FieldName = 'DE_MASAACTUAL'
    end
    object sdqConsultaDE_EMISIONNETAACTUAL: TFloatField
      DisplayLabel = 'Emisi'#243'n Neta Actual'
      FieldName = 'DE_EMISIONNETAACTUAL'
    end
    object sdqConsultaDE_DEVENGADOCUOTAACTUAL: TFloatField
      DisplayLabel = 'Dev. Cuota Actual'
      FieldName = 'DE_DEVENGADOCUOTAACTUAL'
    end
    object sdqConsultaDE_DEVENGADOFONDOACTUAL: TFloatField
      DisplayLabel = 'Dev. Fondo Actual'
      FieldName = 'DE_DEVENGADOFONDOACTUAL'
    end
    object sdqConsultaDE_PERIODOANTERIOR: TStringField
      DisplayLabel = 'Periodo Anterior'
      FieldName = 'DE_PERIODOANTERIOR'
      Required = True
      Size = 6
    end
    object sdqConsultaDE_EMPLEADOSANTERIOR: TFloatField
      DisplayLabel = 'Empleados Anterior'
      FieldName = 'DE_EMPLEADOSANTERIOR'
    end
    object sdqConsultaDE_MASAANTERIOR: TFloatField
      DisplayLabel = 'Masa Sal. Anterior'
      FieldName = 'DE_MASAANTERIOR'
    end
    object sdqConsultaDE_EMISIONNETAANTERIOR: TFloatField
      DisplayLabel = 'Emisi'#243'n Neta Anterior'
      FieldName = 'DE_EMISIONNETAANTERIOR'
    end
    object sdqConsultaDE_DEVENGADOCUOTAANTERIOR: TFloatField
      DisplayLabel = 'Dev. Cuota Anterior'
      FieldName = 'DE_DEVENGADOCUOTAANTERIOR'
    end
    object sdqConsultaDE_DEVENGADOFONDOANTERIOR: TFloatField
      DisplayLabel = 'Dev. Fondo Anterior'
      FieldName = 'DE_DEVENGADOFONDOANTERIOR'
    end
  end
end
