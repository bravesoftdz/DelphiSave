object frmABMConcursosQuiebras: TfrmABMConcursosQuiebras
  Left = 57
  Top = 13
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Administraci'#243'n de Juicios (Concursos y Quiebras)'
  ClientHeight = 553
  ClientWidth = 727
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 733
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    727
    553)
  PixelsPerInch = 96
  TextHeight = 13
  object lbNroJuicio: TLabel
    Left = 22
    Top = 43
    Width = 70
    Height = 13
    Caption = 'Nro. de Orden:'
  end
  object lbAbogado: TLabel
    Left = 236
    Top = 97
    Width = 46
    Height = 13
    Caption = 'Abogado:'
  end
  object lbFuero: TLabel
    Left = 62
    Top = 230
    Width = 30
    Height = 13
    Caption = 'Fuero:'
  end
  object lbJurisdiccion: TLabel
    Left = 251
    Top = 255
    Width = 58
    Height = 13
    Caption = 'Jurisdicci'#243'n:'
  end
  object lbJuzgado: TLabel
    Left = 29
    Top = 255
    Width = 63
    Height = 13
    Caption = 'Juzgado Nro:'
  end
  object lbSecretaria: TLabel
    Left = 147
    Top = 255
    Width = 53
    Height = 13
    Anchors = [akTop]
    Caption = 'Secretar'#237'a:'
  end
  object lbParteDemandada: TLabel
    Left = 54
    Top = 122
    Width = 38
    Height = 13
    Caption = 'Sindico:'
  end
  object lbDireccionSindico: TLabel
    Left = 44
    Top = 147
    Width = 48
    Height = 13
    Caption = 'Direcci'#243'n:'
  end
  object lbLocalidad: TLabel
    Left = 43
    Top = 172
    Width = 49
    Height = 13
    Caption = 'Localidad:'
  end
  object lbTelefonos: TLabel
    Left = 42
    Top = 197
    Width = 50
    Height = 13
    Caption = 'Tel'#233'fonos:'
  end
  object Label4: TLabel
    Left = 56
    Top = 281
    Width = 36
    Height = 13
    Caption = 'Estado:'
  end
  object Label5: TLabel
    Left = 374
    Top = 281
    Width = 41
    Height = 13
    Caption = 'Autorizo:'
  end
  object lbLegajo: TLabel
    Left = 58
    Top = 97
    Width = 35
    Height = 13
    Caption = 'Legajo:'
    FocusControl = fraEmpresa.mskCUIT
  end
  object Label9: TLabel
    Left = 47
    Top = 69
    Width = 44
    Height = 13
    Caption = 'Empresa:'
    FocusControl = fraEmpresa.mskCUIT
  end
  object lblExpediente: TLabel
    Left = 534
    Top = 255
    Width = 39
    Height = 13
    Caption = 'N'#186' Exp.:'
  end
  object Label12: TLabel
    Left = 655
    Top = 254
    Width = 5
    Height = 13
    Caption = '/'
  end
  object tbGestionDeuda: TToolBar
    Left = 0
    Top = 0
    Width = 727
    Height = 28
    Caption = 'tbGestionDeuda'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    TabOrder = 19
    object rbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo'
      Caption = 'rbNuevo'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbGuardar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Guardar (Ctrl-G)'
      Caption = 'tbGuardar'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = tbGuardarClick
    end
    object ToolButton1: TToolButton
      Left = 46
      Top = 0
      Width = 13
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object tbLimpiar: TToolButton
      Left = 59
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'tbLimpiar'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = tbLimpiarClick
    end
    object tbBuscar: TToolButton
      Left = 82
      Top = 0
      Caption = 'tbBuscar'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object ToolButton2: TToolButton
      Left = 105
      Top = 0
      Width = 12
      Caption = 'ToolButton2'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object tbEmpresa: TToolButton
      Left = 117
      Top = 0
      Hint = 'Empresas (Ctrl+E)'
      Caption = 'tbEmpresa'
      ImageIndex = 17
      ParentShowHint = False
      ShowHint = True
      OnClick = tbEmpresaClick
    end
    object tbEventos: TToolButton
      Left = 140
      Top = 0
      Hint = 'Eventos (Ctrl+T)'
      Caption = 'tbEventos'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = tbEventosClick
    end
    object tbAcuerdo: TToolButton
      Left = 163
      Top = 0
      Hint = 'Acuerdos (Ctrl+S)'
      Caption = 'tbAcuerdos'
      ImageIndex = 20
      ParentShowHint = False
      ShowHint = True
      OnClick = tbAcuerdoClick
    end
    object tbGastosYHonorarios: TToolButton
      Left = 186
      Top = 0
      Hint = 'Gastos y Honorarios (Ctrl+H)'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = tbGastosYHonorariosClick
    end
    object ToolButton3: TToolButton
      Left = 209
      Top = 0
      Width = 11
      Caption = 'ToolButton3'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object tbImprimir: TToolButton
      Left = 220
      Top = 0
      Hint = 'Impresi'#243'n (Ctrl+I)'
      Caption = 'tbImprimir'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbVerImagenes: TToolButton
      Left = 243
      Top = 0
      Hint = 'Ver Im'#225'genes Digitalizadas'
      Caption = 'tbVerImagenes'
      ImageIndex = 31
      ParentShowHint = False
      ShowHint = True
      OnClick = tbVerImagenesClick
    end
    object tbSalir: TToolButton
      Left = 266
      Top = 0
      Hint = 'Salir'
      Caption = 'tbSalir'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSalirClick
    end
  end
  object edCQ_NROORDEN: TIntEdit
    Left = 98
    Top = 39
    Width = 81
    Height = 21
    TabStop = False
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Alignment = taRightJustify
  end
  inline fraAbogados: TfraAbogadosLegales
    Left = 286
    Top = 93
    Width = 414
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    ExplicitLeft = 286
    ExplicitTop = 93
    ExplicitWidth = 414
    DesignSize = (
      414
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 45
      Top = 1
      Width = 366
      ExplicitLeft = 45
      ExplicitTop = 1
      ExplicitWidth = 366
    end
    inherited edCodigo: TPatternEdit
      Top = 1
      Width = 42
      ExplicitTop = 1
      ExplicitWidth = 42
    end
  end
  inline fraEmpresa: TfraEmpresa
    Left = 98
    Top = 66
    Width = 598
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    ExplicitLeft = 98
    ExplicitTop = 66
    ExplicitWidth = 598
    ExplicitHeight = 21
    DesignSize = (
      598
      21)
    inherited lbContrato: TLabel
      Left = 494
      Top = 5
      ExplicitLeft = 494
      ExplicitTop = 5
    end
    inherited edContrato: TIntEdit
      Left = 539
      ExplicitLeft = 539
    end
    inherited cmbRSocial: TArtComboBox
      Width = 324
      ExplicitWidth = 324
    end
  end
  inline fraFuero: TfraCtbTablas
    Left = 97
    Top = 225
    Width = 601
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 8
    ExplicitLeft = 97
    ExplicitTop = 225
    ExplicitWidth = 601
    DesignSize = (
      601
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 47
      Width = 554
      ExplicitLeft = 47
      ExplicitWidth = 554
    end
    inherited edCodigo: TPatternEdit
      Width = 44
      ExplicitWidth = 44
    end
  end
  object edCQ_JUZGADO: TIntEdit
    Left = 98
    Top = 251
    Width = 44
    Height = 21
    TabOrder = 9
    MaxLength = 3
  end
  object edCQ_SECRETARIA: TIntEdit
    Left = 206
    Top = 251
    Width = 41
    Height = 21
    Anchors = [akTop]
    TabOrder = 10
    Alignment = taRightJustify
    MaxLength = 3
  end
  object gbFechas: TGroupBox
    Left = 12
    Top = 304
    Width = 316
    Height = 140
    Caption = 'Fechas'
    TabOrder = 16
    object lbConcurso: TLabel
      Left = 15
      Top = 15
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Concurso:'
    end
    object lbQuiebra: TLabel
      Left = 23
      Top = 40
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quiebra:'
    end
    object Label6: TLabel
      Left = 8
      Top = 67
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Asignaci'#243'n:'
    end
    object Label7: TLabel
      Left = 172
      Top = 41
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vto.Art.32'
    end
    object Label8: TLabel
      Left = 155
      Top = 62
      Width = 64
      Height = 26
      Alignment = taRightJustify
      Caption = 'Toma Conoc.      Quiebra'
      WordWrap = True
    end
    object Label10: TLabel
      Left = 155
      Top = 10
      Width = 64
      Height = 26
      Alignment = taRightJustify
      Caption = 'Toma Conoc.    Concurso'
      WordWrap = True
    end
    object Label11: TLabel
      Left = 166
      Top = 92
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vto.Art.200'
    end
    object Label1: TLabel
      Left = 5
      Top = 86
      Width = 58
      Height = 26
      Alignment = taRightJustify
      Caption = 'Verificaci'#243'n '#13#10'de cr'#233'dito:'
    end
    object Label3: TLabel
      Left = 7
      Top = 118
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fin Gesti'#243'n:'
    end
    object edCQ_FECHACONCURSO: TDateComboBox
      Left = 66
      Top = 11
      Width = 88
      Height = 21
      TabOrder = 0
      OnChange = edCQ_FECHACONCURSOChange
    end
    object edCQ_FECHAQUIEBRA: TDateComboBox
      Left = 66
      Top = 37
      Width = 88
      Height = 21
      TabOrder = 2
      OnChange = edCQ_FECHAQUIEBRAChange
    end
    object edCQ_FECHAASIGN: TDateComboBox
      Left = 66
      Top = 63
      Width = 88
      Height = 21
      TabOrder = 4
    end
    object edCQ_FECHAVTOART32: TDateComboBox
      Left = 222
      Top = 37
      Width = 88
      Height = 21
      TabOrder = 3
    end
    object edCQ_FECHAVTOART200: TDateComboBox
      Left = 222
      Top = 89
      Width = 88
      Height = 21
      TabOrder = 7
    end
    object edFechaPresArt32: TDateComboBox
      Left = 222
      Top = 11
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edFechaPresArt200: TDateComboBox
      Left = 222
      Top = 63
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object edCQ_FECHAVERIFICACION: TDateComboBox
      Left = 66
      Top = 89
      Width = 87
      Height = 21
      TabOrder = 6
    end
    object edCQ_FECHAFINGESTION: TDateComboBox
      Left = 66
      Top = 114
      Width = 88
      Height = 21
      TabOrder = 8
    end
  end
  object edCQ_SINDICO: TEdit
    Left = 97
    Top = 118
    Width = 600
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object edCQ_DIRECCIONSIND: TEdit
    Left = 97
    Top = 143
    Width = 600
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object edCQ_LOCALIDADSIND: TEdit
    Left = 97
    Top = 168
    Width = 600
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edCQ_TELEFONOSIND: TEdit
    Left = 97
    Top = 193
    Width = 600
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
  end
  inline fraEstado: TfraCtbTablas
    Left = 97
    Top = 276
    Width = 269
    Height = 23
    TabOrder = 14
    ExplicitLeft = 97
    ExplicitTop = 276
    ExplicitWidth = 269
    DesignSize = (
      269
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 48
      Width = 220
      ExplicitLeft = 48
      ExplicitWidth = 220
    end
    inherited edCodigo: TPatternEdit
      Width = 44
      ExplicitWidth = 44
    end
  end
  inline fraUsuario: TfraUsuario
    Left = 417
    Top = 277
    Width = 281
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 15
    ExplicitLeft = 417
    ExplicitTop = 277
    ExplicitWidth = 281
    DesignSize = (
      281
      21)
    inherited edCodigo: TPatternEdit
      Width = 69
      Color = clInactiveCaption
      ExplicitWidth = 69
    end
    inherited cmbDescripcion: TArtComboBox
      Left = 71
      Width = 212
      Color = clInactiveCaption
      ExplicitLeft = 71
      ExplicitWidth = 212
    end
  end
  object gbImportes: TGroupBox
    Left = 339
    Top = 304
    Width = 384
    Height = 98
    Anchors = [akTop, akRight]
    Caption = 'Importes'
    TabOrder = 17
    DesignSize = (
      384
      98)
    object lbDemandado: TLabel
      Left = 6
      Top = 25
      Width = 74
      Height = 13
      Caption = 'Deuda nominal:'
    end
    object lbsentencia: TLabel
      Left = 196
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Deuda Total:'
    end
    object lbMontoprivilegio: TLabel
      Left = 6
      Top = 54
      Width = 89
      Height = 26
      Caption = 'Monto de privilegio'#13#10'     Verificado:'
    end
    object Label2: TLabel
      Left = 196
      Top = 54
      Width = 91
      Height = 26
      Caption = 'Monto quirografario'#13#10'       Verificado:'
    end
    object edCQ_DEUDANOMINAL: TCurrencyEdit
      Left = 101
      Top = 21
      Width = 87
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      Anchors = [akTop]
      TabOrder = 0
    end
    object edCQ_DEUDATOTAL: TCurrencyEdit
      Left = 292
      Top = 21
      Width = 85
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      Anchors = [akTop]
      TabOrder = 1
    end
    object edCQ_MONTOPRIVILEGIO: TCurrencyEdit
      Left = 101
      Top = 58
      Width = 87
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edCQ_MONTOQUIROG: TCurrencyEdit
      Left = 292
      Top = 58
      Width = 85
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
  end
  object gbPeriodos: TGroupBox
    Left = 339
    Top = 404
    Width = 303
    Height = 40
    Anchors = [akTop, akRight]
    Caption = 'Periodos'
    TabOrder = 18
    object lbUltPeriodoConcurso: TLabel
      Left = 13
      Top = 17
      Width = 89
      Height = 13
      Caption = 'Ult. Per. Concurso:'
    end
    object lbUltPeriodoQuiebra: TLabel
      Left = 159
      Top = 17
      Width = 81
      Height = 13
      Caption = 'Ult. Per. Quiebra:'
    end
    object edCQ_ULTPERCONCURSO: TPeriodoPicker
      Left = 105
      Top = 14
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clInactiveCaption
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205306'
      Periodo.MinPeriodo = '195307'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
      Enabled = False
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
    object edCQ_ULTPERQUIEBRA: TPeriodoPicker
      Left = 242
      Top = 14
      Width = 49
      Height = 21
      TabOrder = 1
      Color = clInactiveCaption
      Periodo.AllowNull = True
      Periodo.Orden = poAnoMes
      Periodo.Separador = #0
      Periodo.Mes = 0
      Periodo.Ano = 0
      Periodo.MaxPeriodo = '205306'
      Periodo.MinPeriodo = '195307'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = True
      Enabled = False
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
  object edCQ_LEGAJO: TEdit
    Left = 97
    Top = 94
    Width = 133
    Height = 21
    MaxLength = 20
    TabOrder = 2
  end
  object DBGrid: TArtDBGrid
    Left = 0
    Top = 473
    Width = 727
    Height = 80
    Align = alBottom
    DataSource = dsConsulta
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 20
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_ACUERDO'
        Title.Caption = 'Tipo de acuerdo'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAS'
        Title.Caption = 'Cuotas'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAS_PENDIENTES'
        Title.Caption = 'Cuotas Pendientes'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TOTAL'
        Title.Caption = 'Monto Total'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_PENDIENTE'
        Title.Caption = 'Monto Pendiente'
        Width = 135
        Visible = True
      end>
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 445
    Width = 727
    Height = 28
    Align = alBottom
    BorderWidth = 1
    Caption = 'ToolBar'
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    object tbImprimirAcuerdos: TToolButton
      Left = 0
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      ImageIndex = 4
      OnClick = tbImprimirAcuerdosClick
    end
    object tbExportarAcuerdos: TToolButton
      Left = 23
      Top = 0
      Hint = 'Exportar (Ctrl+E)'
      ImageIndex = 3
      OnClick = tbExportarAcuerdosClick
    end
  end
  inline fraJurisdiccion: TfraCodigoDescripcion
    Left = 314
    Top = 249
    Width = 217
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 11
    ExplicitLeft = 314
    ExplicitTop = 249
    ExplicitWidth = 217
    DesignSize = (
      217
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 152
      ExplicitWidth = 268
    end
  end
  object edCQ_NROEXPEDIENTE: TPatternEdit
    Left = 579
    Top = 251
    Width = 75
    Height = 21
    MaxLength = 10
    TabOrder = 12
    Pattern = 
      'abcdefghijklmn'#241'opqrstuvwxyzABCDEFGHIJKLMN'#209'OPQRSTUVWXYZ0123456789' +
      '-'
  end
  object edCQ_ANIOEXPEDIENTE: TPatternEdit
    Left = 666
    Top = 251
    Width = 32
    Height = 21
    MaxLength = 4
    TabOrder = 13
    Pattern = '0123456789'
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 193
    Top = 32
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 237
    Top = 32
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tbGuardar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16453
        LinkControl = tbEmpresa
      end
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16467
        LinkControl = tbAcuerdo
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16468
        LinkControl = tbEventos
      end
      item
        Key = 16456
        LinkControl = tbGastosYHonorarios
      end>
    Left = 265
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    Title = 'x'
    Left = 293
    Top = 32
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT TB_DESCRIPCION TIPO_ACUERDO, '
      
        #9'   COUNT(*) CUOTAS, SUM(DECODE(CA_FECHAPAGO,NULL,1,0)) CUOTAS_P' +
        'ENDIENTES, '
      
        #9'   SUM(CA_MONTO) MONTO_TOTAL, SUM(DECODE(CA_FECHAPAGO,NULL,CA_M' +
        'ONTO,0)) MONTO_PENDIENTE'
      '  FROM CTB_TABLAS, LCA_ACUERDOCYQ'
      ' WHERE TB_CODIGO(+) = CA_TIPO'
      '   AND TB_CLAVE(+) = '#39'TACYQ'#39
      '   AND CA_NROORDEN = :ID'
      '   AND CA_NROPAGO >0'
      ' GROUP BY TB_DESCRIPCION'
      '')
    Left = 75
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 103
    Top = 520
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Acuerdos'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -11
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = []
    SubTitle.Alignment = taLeftJustify
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxPortrait
    PrinterOptions.PrintDialog = PrintDialog
    Left = 103
    Top = 492
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 75
    Top = 492
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 132
    Top = 492
  end
end
