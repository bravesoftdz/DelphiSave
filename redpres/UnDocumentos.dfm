object frmDocumentos: TfrmDocumentos
  Left = 349
  Top = 214
  Width = 516
  Height = 437
  ActiveControl = cmbDestinatario
  BorderIcons = []
  Caption = 'Documentos'
  Color = clBtnFace
  Constraints.MinHeight = 391
  Constraints.MinWidth = 516
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    508
    410)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 188
    Top = 24
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Bevel2: TBevel
    Left = 0
    Top = 44
    Width = 505
    Height = 2
  end
  object Label4: TLabel
    Left = 4
    Top = 52
    Width = 58
    Height = 13
    Caption = 'Destinatario'
  end
  object Label3: TLabel
    Left = 4
    Top = 144
    Width = 71
    Height = 13
    Caption = 'Observaciones'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 208
    Width = 505
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object Label5: TLabel
    Left = 4
    Top = 4
    Width = 41
    Height = 13
    Caption = 'Siniestro'
  end
  object edsfada: TLabel
    Left = 188
    Top = 4
    Width = 42
    Height = 13
    Caption = 'Nro.Aut.'
  end
  object lblModulo: TLabel
    Left = 344
    Top = 4
    Width = 57
    Height = 13
    Caption = '                   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVolante: TLabel
    Left = 424
    Top = 4
    Width = 57
    Height = 13
    Caption = '                   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 4
    Top = 216
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label7: TLabel
    Left = 140
    Top = 216
    Width = 54
    Height = 13
    Caption = 'Descripcion'
  end
  object Label8: TLabel
    Left = 188
    Top = 52
    Width = 62
    Height = 13
    Caption = 'Fecha Desde'
  end
  object Label9: TLabel
    Left = 356
    Top = 52
    Width = 60
    Height = 13
    Caption = 'Fecha Hasta'
  end
  object edCodigo: TDBEdit
    Left = 48
    Top = 24
    Width = 133
    Height = 19
    TabStop = False
    Color = clMenu
    Ctl3D = False
    DataField = 'TD_CODIGO'
    DataSource = dsDocumentos
    ParentCtl3D = False
    TabOrder = 0
  end
  object edDescripcion: TDBEdit
    Left = 252
    Top = 24
    Width = 253
    Height = 19
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clMenu
    Ctl3D = False
    DataField = 'TD_DESCRIPCION'
    DataSource = dsDocumentos
    ParentCtl3D = False
    TabOrder = 1
  end
  object cmbDestinatario: TComboBox
    Left = 64
    Top = 48
    Width = 119
    Height = 21
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 2
    Text = 'Prestador'
    OnChange = cmbDestinatarioChange
    Items.Strings = (
      'Prestador'
      'Empresa')
  end
  object pnlPrestador: TPanel
    Left = 0
    Top = 72
    Width = 506
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      506
      33)
    inline fraPrestador: TfraPrestador
      Left = 3
      Top = 4
      Width = 498
      Height = 24
      VertScrollBar.Range = 49
      Anchors = [akLeft, akTop, akRight]
      AutoScroll = False
      TabOrder = 0
      inherited lbCUIT: TLabel
        Left = 0
        Width = 24
      end
      inherited lbSec: TLabel
        Left = 111
        Width = 21
      end
      inherited lbIdentif: TLabel
        Left = 182
        Width = 40
      end
      inherited lbRSocial: TLabel
        Left = 267
        Width = 38
      end
      inherited lbDomicilio: TLabel
        Width = 40
      end
      inherited lbLocalidad: TLabel
        Width = 44
      end
      inherited lbCPostal: TLabel
        Left = 403
        Width = 13
      end
      inherited mskPrestCUIT: TMaskEdit
        Left = 27
      end
      inherited cmbPrestador: TArtComboBox
        Left = 310
        Width = 171
      end
      inherited edPresLocalidad: TEdit
        Width = 28
      end
      inherited edPresCPostal: TEdit
        Left = 427
      end
      inherited edPrestIdentif: TIntEdit
        Left = 218
      end
      inherited edPrestSecuencia: TIntEdit
        Left = 134
      end
    end
  end
  object pnlEmpresa: TPanel
    Left = 0
    Top = 108
    Width = 506
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    DesignSize = (
      506
      33)
    object Label10: TLabel
      Left = 8
      Top = 10
      Width = 24
      Height = 13
      Caption = 'CUIT'
    end
    inline fraEmpresa: TfraEmpresa
      Left = 36
      Top = 6
      Width = 466
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
      inherited lbRSocial: TLabel
        Left = 92
      end
      inherited lbContrato: TLabel
        Left = 360
      end
      inherited mskCUIT: TMaskEdit
        Left = 3
        ReadOnly = True
      end
      inherited edContrato: TIntEdit
        Left = 407
        Width = 56
        ReadOnly = True
      end
      inherited cmbRSocial: TArtComboBox
        Left = 136
        Width = 219
        ReadOnly = True
      end
    end
  end
  object MemoObservaciones: TMemo
    Left = 0
    Top = 160
    Width = 507
    Height = 44
    Anchors = [akLeft, akTop, akRight]
    Ctl3D = True
    Lines.Strings = (
      '')
    MaxLength = 250
    ParentCtl3D = False
    TabOrder = 5
    WantReturns = False
  end
  object dbgDocumentos: TArtDBGrid
    Left = 0
    Top = 236
    Width = 507
    Height = 142
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = True
    DataSource = dsDocumentos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgDocumentosCellClick
    FooterBand = False
    TitleHeight = 17
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'TD_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TD_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 408
        Visible = True
      end>
  end
  object edSiniestro: TEdit
    Left = 48
    Top = 0
    Width = 79
    Height = 19
    TabStop = False
    Color = clMenu
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 9
  end
  object edOrden: TEdit
    Left = 128
    Top = 0
    Width = 28
    Height = 19
    TabStop = False
    Color = clMenu
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 10
  end
  object edRecaida: TEdit
    Left = 152
    Top = 0
    Width = 28
    Height = 19
    TabStop = False
    Color = clMenu
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 11
  end
  object edNroAuto: TEdit
    Left = 252
    Top = 0
    Width = 74
    Height = 19
    TabStop = False
    Color = clMenu
    Ctl3D = False
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 12
  end
  object isCodigo: TDBIncrementalSearch
    Left = 44
    Top = 212
    Width = 86
    Height = 21
    TabOrder = 13
    MinSearchLength = 3
    KeyField = 'TD_CODIGO'
    ListField = 'TD_CODIGO'
    ListSource = dsDocumentos
  end
  object isDescripcion: TDBIncrementalSearch
    Left = 200
    Top = 212
    Width = 306
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 14
    OnChange = isDescripcionChange
    MinSearchLength = 2
    KeyField = 'TD_DESCRIPCION'
    ListField = 'TD_DESCRIPCION'
    ListSource = dsDocumentos
  end
  object FecDde: TDateComboBox
    Left = 256
    Top = 48
    Width = 88
    Height = 21
    MaxDateCombo = FecHta
    Enabled = False
    TabOrder = 15
  end
  object FecHta: TDateComboBox
    Left = 420
    Top = 48
    Width = 88
    Height = 21
    MinDateCombo = FecDde
    Enabled = False
    TabOrder = 16
  end
  object btnAceptar: TJvXPButton
    Left = 356
    Top = 384
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 7
    Anchors = [akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnAceptarClick
  end
  object btnCancelar: TJvXPButton
    Left = 432
    Top = 384
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 8
    ModalResult = 2
    Anchors = [akRight, akBottom]
  end
  object sdqDocumentos: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterScroll = sdqDocumentosAfterScroll
    SQL.Strings = (
      'SELECT TD_CODIGO, TD_DESCRIPCION, TD_TIENEFECHAS'
      '  FROM ARCHIVO.RTD_TIPODOCUMENTO'
      ' WHERE TD_SECTOR IN ('#39'ARCHSIN'#39', '#39'MUTUAL'#39')'
      '   AND TD_FECHABAJA IS NULL')
    Left = 64
    Top = 284
    object sdqDocumentosTD_CODIGO: TStringField
      FieldName = 'TD_CODIGO'
      Required = True
      Size = 10
    end
    object sdqDocumentosTD_DESCRIPCION: TStringField
      FieldName = 'TD_DESCRIPCION'
      Required = True
      Size = 150
    end
    object sdqDocumentosTD_TIENEFECHAS: TStringField
      FieldName = 'TD_TIENEFECHAS'
      Size = 1
    end
  end
  object dsDocumentos: TDataSource
    DataSet = sdqDocumentos
    Left = 92
    Top = 284
  end
end
