object frmABMAdminstracionRecupero: TfrmABMAdminstracionRecupero
  Left = 284
  Top = 140
  Caption = 'Administraci'#243'n de Recupero'
  ClientHeight = 292
  ClientWidth = 804
  Color = clBtnFace
  Constraints.MinHeight = 322
  Constraints.MinWidth = 812
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    804
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object lbAbogado: TLabel
    Left = 71
    Top = 172
    Width = 46
    Height = 13
    Caption = 'Abogado:'
  end
  object lbMotivo: TLabel
    Left = 82
    Top = 144
    Width = 35
    Height = 13
    Caption = 'Motivo:'
  end
  object lbEstado: TLabel
    Left = 81
    Top = 117
    Width = 36
    Height = 13
    Caption = 'Estado:'
  end
  object lbRS_SINIESTRO: TLabel
    Left = 74
    Top = 36
    Width = 43
    Height = 13
    Caption = 'Siniestro:'
  end
  object lbMontoaRecuperar: TLabel
    Left = 22
    Top = 197
    Width = 95
    Height = 13
    Caption = 'Monto a Recuperar:'
  end
  object lbMontoRecuperado: TLabel
    Left = 276
    Top = 197
    Width = 95
    Height = 13
    Caption = 'Monto Recuperado:'
  end
  object lbDestinatario: TLabel
    Left = 58
    Top = 249
    Width = 59
    Height = 13
    Caption = 'Destinatario:'
  end
  object lbFecha: TLabel
    Left = 473
    Top = 38
    Width = 33
    Height = 13
    Caption = 'Fecha:'
  end
  object lbFechaTerminado: TLabel
    Left = 620
    Top = 38
    Width = 86
    Height = 13
    Caption = 'Fecha Terminado:'
  end
  object lbTipoDestinatario: TLabel
    Left = 19
    Top = 222
    Width = 98
    Height = 13
    Caption = 'Tipo de Destinatario:'
  end
  object Label1: TLabel
    Left = 73
    Top = 64
    Width = 44
    Height = 13
    Caption = 'Empresa:'
  end
  object lbObservaciones: TLabel
    Left = 43
    Top = 274
    Width = 74
    Height = 13
    Caption = 'Observaciones:'
  end
  object Label2: TLabel
    Left = 67
    Top = 92
    Width = 50
    Height = 13
    Alignment = taRightJustify
    Caption = 'Empleado:'
  end
  object Label3: TLabel
    Left = 359
    Top = 40
    Width = 60
    Height = 13
    Caption = 'Mediaciones'
  end
  object Label4: TLabel
    Left = 228
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Juicios'
  end
  object tbGestionDeuda: TToolBar
    Left = 0
    Top = 0
    Width = 804
    Height = 28
    Caption = 'tbGestionDeuda'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    TabOrder = 14
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
    object tbSiniestros: TToolButton
      Left = 117
      Top = 0
      Hint = 'Siniestros(Ctrl+S)'
      Caption = 'tbSiniestros'
      ImageIndex = 15
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSiniestrosClick
    end
    object tbEventos: TToolButton
      Left = 140
      Top = 0
      Hint = 'Eventos (Ctrl+T)'
      Caption = 'tbEventos'
      ImageIndex = 16
      ParentShowHint = False
      ShowHint = True
      OnClick = tbEventosClick
    end
    object tbCobros: TToolButton
      Left = 163
      Top = 0
      Hint = 'Cobros'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = tbCobrosClick
    end
    object ToolButton3: TToolButton
      Left = 186
      Top = 0
      Width = 11
      Caption = 'ToolButton3'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object tbImprimir: TToolButton
      Left = 197
      Top = 0
      Hint = 'Impresi'#243'n (Ctrl+I)'
      Caption = 'tbImprimir'
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      Visible = False
    end
    object tbVerImagenes: TToolButton
      Left = 220
      Top = 0
      Hint = 'Ver Im'#225'genes Digitalizadas'
      Caption = 'tbVerImagenes'
      ImageIndex = 31
      ParentShowHint = False
      ShowHint = True
      OnClick = tbVerImagenesClick
    end
    object tbSalir: TToolButton
      Left = 243
      Top = 0
      Hint = 'Salir'
      Caption = 'tbSalir'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSalirClick
    end
  end
  inline fraAbogados: TfraAbogadosLegales
    Left = 122
    Top = 166
    Width = 672
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    ExplicitLeft = 122
    ExplicitTop = 166
    ExplicitWidth = 672
    DesignSize = (
      672
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 44
      Top = 1
      Width = 626
      ExplicitLeft = 44
      ExplicitTop = 1
      ExplicitWidth = 626
    end
    inherited edCodigo: TPatternEdit
      Top = 1
      Width = 42
      ExplicitTop = 1
      ExplicitWidth = 42
    end
  end
  inline fraMotivo: TfraCtbTablas
    Left = 122
    Top = 139
    Width = 676
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    ExplicitLeft = 122
    ExplicitTop = 139
    ExplicitWidth = 676
    DesignSize = (
      676
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 50
      Width = 621
      ExplicitLeft = 50
      ExplicitWidth = 621
    end
  end
  inline fraEstado: TfraCtbTablas
    Left = 122
    Top = 113
    Width = 677
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    ExplicitLeft = 122
    ExplicitTop = 113
    ExplicitWidth = 677
    DesignSize = (
      677
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 46
      Width = 626
      ExplicitLeft = 46
      ExplicitWidth = 626
    end
    inherited edCodigo: TPatternEdit
      Width = 44
      ExplicitWidth = 44
    end
  end
  object edRS_SINIESTRO: TSinEdit
    Left = 124
    Top = 34
    Width = 100
    Height = 21
    OnExit = edRS_SINIESTROExit
    TabOrder = 0
    ViewStyle = [etSiniestro, etOrden]
  end
  object edRS_FECHA: TDateComboBox
    Left = 508
    Top = 35
    Width = 88
    Height = 20
    TabOrder = 1
  end
  object edRS_MONTOARECUPERAR: TCurrencyEdit
    Left = 123
    Top = 193
    Width = 121
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    AutoSize = False
    TabOrder = 8
  end
  object edRS_MONTORECUPERADO: TCurrencyEdit
    Left = 372
    Top = 193
    Width = 121
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    AutoSize = False
    Color = clWhite
    Enabled = False
    TabOrder = 9
  end
  object edRS_FTERMINADO: TDateComboBox
    Left = 709
    Top = 33
    Width = 88
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
  inline fraTipoDestinatario: TfraCtbTablas
    Left = 122
    Top = 218
    Width = 674
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 10
    ExplicitLeft = 122
    ExplicitTop = 218
    ExplicitWidth = 674
    DesignSize = (
      674
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 54
      Width = 617
      ExplicitLeft = 54
      ExplicitWidth = 617
    end
  end
  object edRS_DESTINATARIO: TEdit
    Left = 123
    Top = 245
    Width = 285
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 11
  end
  inline fraEmpresa: TfraEmpresa
    Left = 124
    Top = 60
    Width = 670
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    ExplicitLeft = 124
    ExplicitTop = 60
    ExplicitWidth = 670
    ExplicitHeight = 21
    DesignSize = (
      670
      21)
    inherited lbContrato: TLabel
      Left = 566
      Top = 5
      ExplicitLeft = 566
      ExplicitTop = 5
    end
    inherited mskCUIT: TMaskEdit
      Color = clWhite
    end
    inherited edContrato: TIntEdit
      Left = 611
      Color = clWhite
      ExplicitLeft = 611
    end
    inherited cmbRSocial: TArtComboBox
      Left = 132
      Width = 428
      Color = clWhite
      ExplicitLeft = 132
      ExplicitWidth = 428
    end
  end
  inline fraTrabajador: TfraTrabajador
    Left = 124
    Top = 88
    Width = 695
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 4
    ExplicitLeft = 124
    ExplicitTop = 88
    ExplicitWidth = 695
    DesignSize = (
      695
      22)
    inherited mskCUIL: TMaskEdit
      Color = clWhite
    end
    inherited cmbNombre: TArtComboBox
      Width = 528
      Color = clWhite
      ExplicitWidth = 528
    end
  end
  object edRS_OBSERVACIONES: TEdit
    Left = 123
    Top = 270
    Width = 664
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 250
    TabOrder = 13
  end
  inline fraDestinatario: TfraCodigoDescripcion
    Left = 418
    Top = 244
    Width = 308
    Height = 23
    TabOrder = 12
    OnExit = fraDestinatarioExit
    ExplicitLeft = 418
    ExplicitTop = 244
    ExplicitWidth = 308
    DesignSize = (
      308
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 243
      CharCase = ecUpperCase
      ExplicitWidth = 243
    end
  end
  object edMEDIACIONES: TEdit
    Left = 420
    Top = 36
    Width = 45
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 15
  end
  object edJUICIO: TEdit
    Left = 262
    Top = 36
    Width = 90
    Height = 21
    TabStop = False
    Color = clBtnFace
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 16
  end
  object chkARecuperar: TCheckBox
    Left = 544
    Top = 194
    Width = 109
    Height = 17
    Alignment = taLeftJustify
    Caption = 'A Recuperar'
    Enabled = False
    TabOrder = 17
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 9
    Top = 93
  end
  object sdqAuxiliar: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT EX_CUIT, EX_CUIL '
      '  FROM sex_expedientes '
      'WHERE EX_SINIESTRO = :NroSiniestro'
      '     AND EX_ORDEN = :NroOrden')
    Left = 9
    Top = 49
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NroSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NroOrden'
        ParamType = ptInput
      end>
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
      end
      item
        Key = 16455
        LinkControl = tbGuardar
      end
      item
        Key = 16467
        LinkControl = tbSiniestros
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16468
        LinkControl = tbEventos
      end>
    Left = 9
    Top = 137
  end
end
