object dlgBusqSini: TdlgBusqSini
  Left = 202
  Top = 108
  Width = 590
  Height = 346
  ActiveControl = fraEmpresa.cmbRSocial
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Buscar Siniestros'
  Color = clBtnFace
  Constraints.MinHeight = 264
  Constraints.MinWidth = 440
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    582
    319)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 156
    Top = 88
    Width = 55
    Height = 13
    Caption = 'Diagn'#243'stico'
  end
  object grpEmpresa: TGroupBox
    Left = 0
    Top = 0
    Width = 582
    Height = 41
    Align = alTop
    Caption = 'Empresa'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 38
      Top = 15
      Width = 542
      Height = 24
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
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
        Left = 435
      end
      inherited edContrato: TIntEdit
        Left = 480
      end
      inherited cmbRSocial: TArtComboBox
        Width = 302
      end
    end
  end
  object grpTrabajador: TGroupBox
    Left = 0
    Top = 41
    Width = 582
    Height = 41
    Align = alTop
    Caption = 'Trabajador'
    TabOrder = 1
    inline fraTrabajadorSIN: TfraTrabajadorSIN
      Left = 2
      Top = 15
      Width = 578
      Height = 24
      Align = alClient
      TabOrder = 0
      inherited lbTrabCUIL: TLabel
        Width = 23
      end
      inherited dbcTrabNombre: TArtComboBox
        Width = 406
      end
    end
  end
  object dbgBusqueda: TRxDBGrid
    Left = 4
    Top = 108
    Width = 573
    Height = 205
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsBusqueda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgBusquedaDblClick
    OnKeyPress = dbgBusquedaKeyPress
    Columns = <
      item
        Color = 14811135
        Expanded = False
        FieldName = 'CODSINI'
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_SINIESTRORED'
        Title.Caption = 'Siniestro Mutual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAACCIDENTE'
        Title.Caption = 'Fecha de Accidente'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Caption = 'Fecha de Baja'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHARECAIDA'
        Title.Caption = 'Fecha de Raca'#237'da'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'Fecha de Alta'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Tipo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 220
        Visible = True
      end>
  end
  object tbHerramientas: TToolBar
    Left = 4
    Top = 84
    Width = 149
    Height = 24
    Align = alNone
    Caption = 'tbHerramientas'
    DisabledImages = frmPrincipal.imgGenBW
    EdgeBorders = [ebRight]
    Flat = True
    Images = frmPrincipal.imgGenColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object tbBuscar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Buscar (F3)'
      ImageIndex = 20
      OnClick = tbBuscarClick
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbLimpiar: TToolButton
      Left = 31
      Top = 0
      Hint = 'Limpiar (Ctrl + L)'
      ImageIndex = 3
      OnClick = tbLimpiarClick
    end
    object tbRefrescar: TToolButton
      Left = 54
      Top = 0
      Hint = 'Refrescar (F5)'
      Enabled = False
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      OnClick = tbRefrescarClick
    end
    object tbOrden: TToolButton
      Left = 77
      Top = 0
      Hint = 'Orden (Ctrl+O)'
      DropdownMenu = pmnuOrden
      ImageIndex = 5
      Style = tbsDropDown
    end
    object tbSeparador2: TToolButton
      Left = 113
      Top = 0
      Width = 8
      Caption = 'tbSeparador2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 121
      Top = 0
      Hint = 'Salir (Esc)'
      Caption = 'tbSalir'
      ImageIndex = 8
      OnClick = tbSalirClick
    end
  end
  object edDiagnostico: TEdit
    Left = 216
    Top = 84
    Width = 361
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    TabOrder = 4
  end
  object sdqBusqueda: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterScroll = sdqBusquedaAfterScroll
    SQL.Strings = (
      'SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA,'
      
        '       EX_SINIESTRO || '#39'/'#39' || EX_ORDEN || '#39'/'#39' || EX_RECAIDA CODS' +
        'INI,'
      '       EX_SINIESTRORED,'
      '       EX_CONTRATO, MP_CUIT, EM_NOMBRE, TJ_CUIL, TJ_NOMBRE,'
      
        '       EX_DIAGNOSTICO, EX_FECHAACCIDENTE, EX_BAJAMEDICA, EX_FECH' +
        'ARECAIDA,'
      '       EX_ALTAMEDICA, TB_DESCRIPCION, EX_ID'
      'FROM CTB_TABLAS, CTJ_TRABAJADORES, CMP_EMPRESAS, SEX_EXPEDIENTES'
      'WHERE NVL(EX_TIPO, '#39'1'#39') = TB_CODIGO(+)'
      'AND TB_CLAVE = '#39'STIPO'#39
      'AND MP_CUIT = EX_CUIT'
      'AND TJ_CUIL = EX_CUIL'
      'AND EX_SINIESTRO = -1')
    Left = 52
    Top = 168
    object sdqBusquedaEX_SINIESTRO: TFloatField
      FieldName = 'EX_SINIESTRO'
      Required = True
    end
    object sdqBusquedaEX_ORDEN: TFloatField
      FieldName = 'EX_ORDEN'
      Required = True
    end
    object sdqBusquedaEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqBusquedaCODSINI: TStringField
      FieldName = 'CODSINI'
      Required = True
      Size = 122
    end
    object sdqBusquedaEX_SINIESTRORED: TFloatField
      FieldName = 'EX_SINIESTRORED'
    end
    object sdqBusquedaEX_CONTRATO: TFloatField
      FieldName = 'EX_CONTRATO'
    end
    object sdqBusquedaEM_CUIT: TStringField
      FieldName = 'EM_CUIT'
      Required = True
      Size = 11
    end
    object sdqBusquedaEM_NOMBRE: TStringField
      FieldName = 'EM_NOMBRE'
      Size = 60
    end
    object sdqBusquedaTJ_CUIL: TStringField
      FieldName = 'TJ_CUIL'
      Required = True
      Size = 11
    end
    object sdqBusquedaTJ_NOMBRE: TStringField
      FieldName = 'TJ_NOMBRE'
      Size = 60
    end
    object sdqBusquedaEX_DIAGNOSTICO: TStringField
      FieldName = 'EX_DIAGNOSTICO'
      Size = 250
    end
    object sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField
      FieldName = 'EX_FECHAACCIDENTE'
    end
    object sdqBusquedaEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object sdqBusquedaEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object sdqBusquedaEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqBusquedaTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqBusquedaEX_ID: TFloatField
      FieldName = 'EX_ID'
    end
  end
  object dsBusqueda: TDataSource
    DataSet = sdqBusqueda
    Left = 80
    Top = 168
  end
  object pmnuOrden: TPopupMenu
    Left = 24
    Top = 168
    object mnuOrdSinOrdenRec: TMenuItem
      Caption = 'Siniestro / Orden / Reca'#237'da'
      OnClick = mnuOrdenClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuOrdTrabajador: TMenuItem
      Tag = 1
      Caption = 'Trabajador'
      OnClick = mnuOrdenClick
    end
    object mnuOrdEmpresa: TMenuItem
      Tag = 2
      Caption = 'Empresa'
      OnClick = mnuOrdenClick
    end
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 114
        OnShortCutPress = tbBuscarClick
        LinkControl = tbBuscar
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        OnShortCutPress = ShortCutControlShortCuts3ShortCutPress
        LinkControl = tbOrden
      end
      item
        Key = 27
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 134
  end
end
