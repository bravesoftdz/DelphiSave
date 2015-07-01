object frmCargaDocumentacion: TfrmCargaDocumentacion
  Left = 272
  Top = 181
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Carga de Documentaci'#243'n'
  ClientHeight = 469
  ClientWidth = 643
  Color = clBtnFace
  Constraints.MinHeight = 375
  Constraints.MinWidth = 649
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    643
    469)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDatoAux: TLabel
    Left = 13
    Top = 119
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
  end
  object bvSeparador1: TBevel
    Left = -1
    Top = 353
    Width = 645
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblDocumento: TLabel
    Left = 13
    Top = 145
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Documento'
  end
  object BvSeparador2: TBevel
    Left = 2
    Top = 110
    Width = 641
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object lblObservaciones: TLabel
    Left = 13
    Top = 197
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Observac.'
  end
  object lblCantidadHojas: TLabel
    Left = 13
    Top = 173
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Cant. Hojas'
  end
  object lblCodigoDocumento: TLabel
    Left = 318
    Top = 173
    Width = 78
    Height = 13
    Caption = 'Nro. Documento'
  end
  object lblFechaMovimientoDesde: TLabel
    Left = 504
    Top = 173
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Label1: TLabel
    Left = 140
    Top = 173
    Width = 54
    Height = 13
    Caption = 'Nro. Correo'
  end
  object Bevel1: TBevel
    Left = -1
    Top = 394
    Width = 645
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblSecTrazabilidad: TLabel
    Left = 158
    Top = 119
    Width = 89
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Sec. Trazabilidad'
    Visible = False
  end
  object btnGuardarYContinuar: TButton
    Left = 291
    Top = 363
    Width = 127
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Guar&dar y Continuar'
    TabOrder = 11
    OnClick = btnGuardarYContinuarClick
  end
  object btnCancelar: TButton
    Left = 552
    Top = 363
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 13
    OnClick = btnCancelarClick
  end
  object edHojas: TIntEdit
    Left = 74
    Top = 170
    Width = 61
    Height = 21
    TabOrder = 4
    Text = '1'
    Alignment = taRightJustify
    MaxLength = 4
    Value = 1
  end
  object edObservaciones: TMemo
    Left = 74
    Top = 198
    Width = 553
    Height = 103
    Anchors = [akLeft, akTop, akRight, akBottom]
    MaxLength = 512
    TabOrder = 8
  end
  object btnGuardar: TButton
    Left = 422
    Top = 363
    Width = 122
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Gu&ardar'
    TabOrder = 12
    OnClick = btnGuardarClick
  end
  object rgbOpcionDestino: TRadioGroup
    Left = 383
    Top = 307
    Width = 244
    Height = 39
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' Destino '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Digitalizaci'#243'n'
      'Guarda')
    TabOrder = 10
    OnClick = rgbOpcionDestinoClick
  end
  inline fraTipoDocumento: TfraCodigoDescripcion
    Left = 74
    Top = 141
    Width = 555
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    ExplicitLeft = 74
    ExplicitTop = 141
    ExplicitWidth = 555
    DesignSize = (
      555
      23)
    inherited cmbDescripcion: TArtComboBox
      Width = 490
      ExplicitWidth = 490
    end
  end
  object edFechaVisita: TDateComboBox
    Left = 540
    Top = 170
    Width = 88
    Height = 21
    TabOrder = 7
  end
  object edCodigoDocumento: TPatternEdit
    Left = 402
    Top = 170
    Width = 97
    Height = 21
    MaxLength = 13
    TabOrder = 6
    OnExit = edCodigoDocumentoExit
    Pattern = '0123456789'
  end
  object edNroCorreo: TEdit
    Left = 199
    Top = 170
    Width = 114
    Height = 21
    MaxLength = 20
    TabOrder = 5
    OnKeyUp = edNroCorreoKeyUp
  end
  object gbTesoreria: TGroupBox
    Left = 74
    Top = 307
    Width = 305
    Height = 39
    Anchors = [akLeft, akBottom]
    TabOrder = 9
    object lblNroLote: TLabel
      Left = 5
      Top = 16
      Width = 36
      Height = 13
      Caption = 'N'#186' Lote'
    end
    object Label2: TLabel
      Left = 155
      Top = 16
      Width = 49
      Height = 13
      Caption = 'F. Entrega'
    end
    object edLote: TIntEdit
      Left = 50
      Top = 12
      Width = 101
      Height = 21
      TabOrder = 0
    end
    object edFechaEntrega: TDateComboBox
      Left = 210
      Top = 12
      Width = 88
      Height = 21
      TabOrder = 1
    end
  end
  object edRecaida: TIntEdit
    Left = 74
    Top = 115
    Width = 60
    Height = 21
    TabOrder = 0
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 2
    MaxValue = 99
  end
  object edNroEstableci: TIntEdit
    Left = 74
    Top = 115
    Width = 60
    Height = 21
    TabOrder = 1
    Text = '0'
    OnExit = edNroEstableciExit
    OnKeyPress = edNroEstableciKeyPress
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object btnCargaMasiva: TButton
    Left = 16
    Top = 363
    Width = 127
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Carga &Masiva'
    TabOrder = 14
    OnClick = btnCargaMasivaClick
  end
  object chkImprimirEtiqueta: TCheckBox
    Left = 411
    Top = 118
    Width = 101
    Height = 17
    TabStop = False
    Alignment = taLeftJustify
    Caption = 'Imprimir Etiqueta'
    TabOrder = 16
    OnClick = chkImprimirEtiquetaClick
  end
  object chkSoloUnaEtiqueta: TCheckBox
    Left = 521
    Top = 118
    Width = 106
    Height = 17
    TabStop = False
    Alignment = taLeftJustify
    Caption = 'Solo Una Etiqueta'
    TabOrder = 17
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 401
    Width = 634
    Height = 66
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Documentos Pendientes de Generar el Lote por el Usuario'
    TabOrder = 15
    object Label4: TLabel
      Left = 254
      Top = 35
      Width = 88
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cant. Documentos'
    end
    object Label5: TLabel
      Left = 453
      Top = 35
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cant. Hojas'
    end
    object gbFechaEstado: TGroupBox
      Left = 8
      Top = 17
      Width = 219
      Height = 43
      Caption = 'Fecha Carga Documentos'
      TabOrder = 0
      object Label3: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaMovimientoDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabStop = False
        MaxDateCombo = edFechaMovimientoHasta
        TabOrder = 0
        OnChange = edFechaMovimientoDesdeChange
        OnExit = DoCargarCantDoc
      end
      object edFechaMovimientoHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        TabStop = False
        MinDateCombo = edFechaMovimientoDesde
        TabOrder = 1
        OnChange = edFechaMovimientoHastaChange
        OnExit = DoCargarCantDoc
      end
    end
    object edCantDoc: TCardinalEdit
      Left = 347
      Top = 32
      Width = 105
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edCantHojas: TCardinalEdit
      Left = 523
      Top = 32
      Width = 103
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
      OnChange = edCantHojasChange
    end
  end
  object edSecTrazabilidad: TCurrencyEdit
    Left = 253
    Top = 115
    Width = 129
    Height = 21
    Margins.Left = 1
    Margins.Top = 1
    TabStop = False
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0;-0'
    MaxLength = 10
    TabOrder = 2
    Visible = False
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 208
    Top = 24
  end
end
