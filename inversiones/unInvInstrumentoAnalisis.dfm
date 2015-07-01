inherited frmInvInstrumentoAnalisis: TfrmInvInstrumentoAnalisis
  Left = 260
  Top = 241
  Caption = 'Instrumento en An'#225'lisis'
  ClientHeight = 570
  ClientWidth = 792
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 260
  ExplicitTop = 241
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 134
    Visible = True
    ExplicitTop = 1
    ExplicitWidth = 792
    ExplicitHeight = 134
    DesignSize = (
      792
      134)
    object gbTipoInstrumento: TGroupBox
      Left = 4
      Top = 2
      Width = 619
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        619
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 604
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 604
        DesignSize = (
          604
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 539
          ExplicitWidth = 539
        end
      end
    end
    object gbVencimiento: TGroupBox
      Left = 4
      Top = 45
      Width = 220
      Height = 43
      Caption = 'Fecha Vencimiento'
      TabOrder = 2
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaVencimDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaVencimHasta
        TabOrder = 0
      end
      object edFechaVencimHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaVencimDesde
        TabOrder = 1
      end
    end
    object gbCodCajaValores: TGroupBox
      Left = 627
      Top = 2
      Width = 161
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'C'#243'd. Caja Valores / Certificado'
      TabOrder = 1
      object edCodCajaVal: TEdit
        Left = 9
        Top = 15
        Width = 142
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 0
      end
    end
    object rgGrupoEcon: TRadioGroup
      Left = 4
      Top = 88
      Width = 172
      Height = 43
      Caption = 'Pertenece al Grupo Econ'#243'mico'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 5
    end
    object gbFechaLiquidacion: TGroupBox
      Left = 228
      Top = 45
      Width = 220
      Height = 43
      Caption = 'Fecha Liquidaci'#243'n'
      TabOrder = 3
      object Label2: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaLiquidDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaLiquidHasta
        TabOrder = 0
      end
      object edFechaLiquidHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaLiquidDesde
        TabOrder = 1
      end
    end
    object gbFechaLicitacion: TGroupBox
      Left = 452
      Top = 45
      Width = 220
      Height = 43
      Caption = 'Fecha Licitaci'#243'n'
      TabOrder = 4
      object Label3: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaLicitacDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaLicitacHasta
        TabOrder = 0
      end
      object edFechaLicitacHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaLicitacDesde
        TabOrder = 1
      end
    end
    object rgLicitacionCargada: TRadioGroup
      Left = 181
      Top = 88
      Width = 172
      Height = 43
      Caption = 'Licitaci'#243'n Cargada'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 6
    end
    object rgResultadoCargado: TRadioGroup
      Left = 357
      Top = 88
      Width = 172
      Height = 43
      Caption = 'Resultado Cargado'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 7
    end
  end
  inherited CoolBar: TCoolBar
    Top = 134
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 134
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCargarLicitacion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cargar Licitaci'#243'n'
        ImageIndex = 16
        OnClick = tbCargarLicitacionClick
      end
      object tbCargarResultado: TToolButton
        Left = 393
        Top = 0
        Hint = 'Cargar Resultado'
        ImageIndex = 52
        OnClick = tbCargarResultadoClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbAdjuntos: TToolButton
        Left = 424
        Top = 0
        Hint = 'Adjuntos'
        DropdownMenu = mnuAdjuntos
        ImageIndex = 28
        Style = tbsDropDown
        OnClick = tbAdjuntosClick
      end
      object ToolButton2: TToolButton
        Left = 462
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 470
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton9: TToolButton
        Left = 493
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 501
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 524
        Top = 0
        Width = 111
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object chkNoMostrarBajas: TCheckBox
          Left = 4
          Top = 3
          Width = 105
          Height = 17
          Caption = 'No Mostrar Bajas'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 163
    Width = 792
    Height = 264
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_INSTRUMENTO'
        Title.Caption = 'Tipo Instrumento'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DENOMINACION'
        Title.Caption = 'Denominaci'#243'n'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Title.Caption = 'Moneda'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_EMISION'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Emisi'#243'n'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_LICITACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Licitaci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_LIQUIDACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Liquidaci'#243'n'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Vencimiento'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMORTIZACION'
        Title.Caption = 'Amortizaci'#243'n'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES'
        Title.Caption = 'Inter'#233's'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALIFICACION'
        Title.Caption = 'Calificaci'#243'n'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'METODO'
        Title.Caption = 'M'#233'todo'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA_REFERENCIA'
        Title.Caption = 'Tasa Referencia'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA_INTERES'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa Inter'#233's'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIR'
        Title.Alignment = taCenter
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISOR'
        Title.Caption = 'Emisor'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIDUCIARIO'
        Title.Caption = 'Fiduciario'
        Width = 143
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRUPO_ECONOMICO'
        Title.Alignment = taCenter
        Title.Caption = 'Grupo Econ.'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EXISTENOMBREARCHIVO'
        Title.Alignment = taCenter
        Title.Caption = 'Archivo Adj.'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MERCADO'
        Title.Caption = 'Mercado'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VERSION'
        Title.Alignment = taCenter
        Title.Caption = 'Versi'#243'n'
        Width = 63
        Visible = True
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 427
    Width = 792
    Height = 143
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      792
      143)
    object gbLicitacion: TGroupBox
      Left = 4
      Top = 3
      Width = 784
      Height = 68
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Licitaci'#243'n'
      TabOrder = 0
      DesignSize = (
        784
        68)
      object Label4: TLabel
        Left = 4
        Top = 18
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nominal'
      end
      object Label5: TLabel
        Left = 198
        Top = 18
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tasa'
      end
      object Label6: TLabel
        Left = 394
        Top = 18
        Width = 61
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Precio'
      end
      object Label7: TLabel
        Left = 590
        Top = 18
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Colocador'
      end
      object Label8: TLabel
        Left = 4
        Top = 43
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cta. Comit.'
      end
      object Label9: TLabel
        Left = 198
        Top = 43
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cta. Depos.'
      end
      object Label10: TLabel
        Left = 394
        Top = 43
        Width = 61
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cta. Pagad.'
      end
      object DBEdit14: TDBEdit
        Left = 68
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'NOMINAL_LICITACION'
        DataSource = dsConsulta
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 262
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'TASA_LICITACION'
        DataSource = dsConsulta
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 458
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'PRECIO_LICITACION'
        DataSource = dsConsulta
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 653
        Top = 15
        Width = 123
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clMedGray
        DataField = 'COLOCADOR'
        DataSource = dsConsulta
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 68
        Top = 40
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'CUENTA_COMITENTE'
        DataSource = dsConsulta
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 262
        Top = 40
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'CUENTA_DEPOSITANTE'
        DataSource = dsConsulta
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 458
        Top = 40
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'CUENTA_PAGADORA'
        DataSource = dsConsulta
        TabOrder = 6
      end
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 72
      Width = 784
      Height = 68
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Resultado'
      TabOrder = 1
      DesignSize = (
        784
        68)
      object Label11: TLabel
        Left = 4
        Top = 18
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tasa'
      end
      object Label12: TLabel
        Left = 198
        Top = 18
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Precio'
      end
      object Label13: TLabel
        Left = 388
        Top = 18
        Width = 67
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'C'#243'd. Caja Val.'
      end
      object Label14: TLabel
        Left = 590
        Top = 18
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'C'#243'd, SSN'
      end
      object Label15: TLabel
        Left = 4
        Top = 43
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Monto'
      end
      object Label41: TLabel
        Left = 198
        Top = 43
        Width = 59
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nominal'
      end
      object DBEdit7: TDBEdit
        Left = 68
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'TASA_RESULTADO'
        DataSource = dsConsulta
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 262
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'PRECIO_RESULTADO'
        DataSource = dsConsulta
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 458
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'COD_CAJA_VALORES'
        DataSource = dsConsulta
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 653
        Top = 15
        Width = 123
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clMedGray
        DataField = 'CODIGO_SSN'
        DataSource = dsConsulta
        TabOrder = 3
      end
      object DBEdit11: TDBEdit
        Left = 68
        Top = 40
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'MONTO'
        DataSource = dsConsulta
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 262
        Top = 40
        Width = 121
        Height = 21
        TabStop = False
        Color = clMedGray
        DataField = 'NOMINAL_RESULTADO'
        DataSource = dsConsulta
        TabOrder = 5
      end
    end
  end
  object fpABMLicitacion: TFormPanel [4]
    Left = 379
    Top = 424
    Width = 552
    Height = 214
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      552
      214)
    object Bevel1: TBevel
      Left = 4
      Top = 178
      Width = 544
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label32: TLabel
      Left = 9
      Top = 37
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Tasa'
    end
    object Label36: TLabel
      Left = 9
      Top = 109
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Comitente'
    end
    object Label28: TLabel
      Left = 9
      Top = 13
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Nominal'
    end
    object Label29: TLabel
      Left = 9
      Top = 61
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Precio'
    end
    object Label30: TLabel
      Left = 9
      Top = 85
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Colocador'
    end
    object Label31: TLabel
      Left = 9
      Top = 133
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Depositante'
    end
    object Label33: TLabel
      Left = 9
      Top = 157
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Pagadora'
    end
    object btnAceptarLicit: TButton
      Left = 394
      Top = 184
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarLicitClick
    end
    object btnCancelarLicit: TButton
      Left = 472
      Top = 184
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
    end
    inline fraCtaComitenteLicAltaModif: TfraCodigoDescripcion
      Left = 110
      Top = 104
      Width = 437
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      ExplicitLeft = 110
      ExplicitTop = 104
      ExplicitWidth = 437
      DesignSize = (
        437
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 372
        ExplicitWidth = 372
      end
    end
    object edTasaLIcAltaModif: TCurrencyEdit
      Left = 110
      Top = 33
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      MinValue = -100.000000000000000000
      TabOrder = 1
    end
    object edPrecioLicAltaModif: TCurrencyEdit
      Left = 110
      Top = 57
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = '$ ,0.000000;-$ ,0.000000'
      HideSelection = False
      MaxLength = 19
      MaxValue = 999999999999.000000000000000000
      TabOrder = 2
    end
    inline fraColocadorLicAltaModif: TfraCodigoDescripcion
      Left = 110
      Top = 80
      Width = 437
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 110
      ExplicitTop = 80
      ExplicitWidth = 437
      DesignSize = (
        437
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 372
        ExplicitWidth = 372
      end
      inherited edCodigo: TPatternEdit
        OnChange = fraColocadorLicAltaModifedCodigoChange
      end
    end
    inline fraCtaDepositLicAltaModif: TfraCodigoDescripcion
      Left = 109
      Top = 128
      Width = 437
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 109
      ExplicitTop = 128
      ExplicitWidth = 437
      DesignSize = (
        437
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 372
        ExplicitWidth = 372
      end
    end
    inline fraCtaPagadoraLicAltaModif: TfraCodigoDescripcion
      Left = 109
      Top = 152
      Width = 437
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 109
      ExplicitTop = 152
      ExplicitWidth = 437
      DesignSize = (
        437
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 372
        ExplicitWidth = 372
      end
    end
    object edNominalLicAltaModif: TCurrencyEdit
      Left = 110
      Top = 9
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 9999999999.000000000000000000
      TabOrder = 0
    end
  end
  object fpABMResultado: TFormPanel [5]
    Left = 743
    Top = 206
    Width = 215
    Height = 212
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      215
      212)
    object Bevel2: TBevel
      Left = 4
      Top = 176
      Width = 207
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
      ExplicitTop = 152
    end
    object Label34: TLabel
      Left = 9
      Top = 36
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Tasa'
    end
    object Label38: TLabel
      Left = 9
      Top = 60
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Precio'
    end
    object Label35: TLabel
      Left = 9
      Top = 78
      Width = 102
      Height = 27
      AutoSize = False
      Caption = 'C'#243'd. Caja Valores/ Certificado'
      WordWrap = True
    end
    object Label37: TLabel
      Left = 9
      Top = 108
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo SSN'
    end
    object Label39: TLabel
      Left = 9
      Top = 132
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Monto'
    end
    object Label40: TLabel
      Left = 9
      Top = 13
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Nominal'
    end
    object Label42: TLabel
      Left = 9
      Top = 160
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Versi'#243'n'
    end
    object btnAceptarRes: TButton
      Left = 57
      Top = 182
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 7
      OnClick = btnAceptarResClick
    end
    object btnCancelarRes: TButton
      Left = 135
      Top = 182
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 8
    end
    object edTasaResAltaModif: TCurrencyEdit
      Left = 110
      Top = 32
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      MinValue = -100.000000000000000000
      TabOrder = 1
    end
    object edPrecioResAltaModif: TCurrencyEdit
      Left = 110
      Top = 56
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000000000000000000
      TabOrder = 2
    end
    object edCodCajaValResAltaModif: TEdit
      Left = 110
      Top = 80
      Width = 96
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 3
    end
    object edCodigoSSNResAltaModif: TEdit
      Left = 110
      Top = 104
      Width = 96
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 4
    end
    object edMontoResAltaModif: TCurrencyEdit
      Left = 110
      Top = 128
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 15
      MaxValue = 999999999999.000000000000000000
      TabOrder = 5
    end
    object edNominalResAltaModif: TCurrencyEdit
      Left = 110
      Top = 9
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 9999999999.000000000000000000
      TabOrder = 0
    end
    object edVersionResAltaModif: TIntEdit
      Left = 110
      Top = 152
      Width = 96
      Height = 21
      TabOrder = 6
      Text = '1'
      MaxLength = 8
      MaxValue = 99999999
      MinValue = 1
      Value = 1
      Options = [ioAllowEmpty, ioAllowNegative]
    end
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 163
    Width = 550
    Height = 461
    BorderStyle = bsDialog
    ExplicitLeft = 152
    ExplicitTop = 163
    ExplicitWidth = 550
    ExplicitHeight = 461
    DesignSize = (
      550
      461)
    inherited BevelAbm: TBevel
      Top = 425
      Width = 542
      ExplicitTop = 426
      ExplicitWidth = 542
    end
    object Label16: TLabel [1]
      Left = 6
      Top = 11
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tipo Instrumento'
    end
    object Label17: TLabel [2]
      Left = 6
      Top = 36
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Denominaci'#243'n'
    end
    object Label18: TLabel [3]
      Left = 6
      Top = 60
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Moneda'
    end
    object Label19: TLabel [4]
      Left = 6
      Top = 179
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Calificaci'#243'n'
    end
    object lblEmisorAltaModif: TLabel [5]
      Left = 6
      Top = 380
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Emisor'
    end
    object lblFiduciarioAltaModif: TLabel [6]
      Left = 6
      Top = 404
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Fiduciario'
    end
    object Label20: TLabel [7]
      Left = 6
      Top = 313
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tasa Referencia'
    end
    object lblMontoAltaModif: TLabel [8]
      Left = 6
      Top = 83
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Monto Emisi'#243'n'
    end
    object Label21: TLabel [9]
      Left = 6
      Top = 107
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Licitaci'#243'n'
    end
    object Label22: TLabel [10]
      Left = 6
      Top = 131
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Liquidaci'#243'n'
    end
    object Label23: TLabel [11]
      Left = 6
      Top = 155
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Vencimiento'
    end
    object Label24: TLabel [12]
      Left = 6
      Top = 203
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Amortizaci'#243'n'
    end
    object Label25: TLabel [13]
      Left = 6
      Top = 227
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Intereses'
    end
    object Label26: TLabel [14]
      Left = 6
      Top = 288
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tasa Inter'#233's'
    end
    object Label27: TLabel [15]
      Left = 6
      Top = 336
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'TIR'
    end
    inherited btnAceptar: TButton
      Left = 392
      Top = 431
      TabOrder = 18
      ExplicitLeft = 392
      ExplicitTop = 432
    end
    inherited btnCancelar: TButton
      Left = 470
      Top = 431
      TabOrder = 19
      ExplicitLeft = 470
      ExplicitTop = 432
    end
    inline fraTipoInstrumentoAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 7
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 96
      ExplicitTop = 7
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    object edDescripcionAltaModif: TEdit
      Left = 97
      Top = 32
      Width = 445
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 80
      TabOrder = 1
    end
    inline fraMonedaAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 55
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 96
      ExplicitTop = 55
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    object edCalificacionAltaModif: TEdit
      Left = 97
      Top = 175
      Width = 96
      Height = 21
      MaxLength = 10
      TabOrder = 7
    end
    object chkGrupoEconAltaModif: TCheckBox
      Left = 4
      Top = 357
      Width = 188
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pertenece al Grupo Econ'#243'mico'
      Checked = True
      State = cbChecked
      TabOrder = 15
    end
    inline fraEmisorAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 376
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 16
      ExplicitLeft = 96
      ExplicitTop = 376
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    inline fraFiduciarioAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 400
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 17
      ExplicitLeft = 96
      ExplicitTop = 400
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    inline fraTasaRefAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 308
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 13
      ExplicitLeft = 96
      ExplicitTop = 308
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    object edMontoEmisAltaModif: TCurrencyEdit
      Left = 97
      Top = 80
      Width = 110
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 16
      MaxValue = 9999999999.000000000000000000
      TabOrder = 3
    end
    object edLicitacionAltaModif: TDateComboBox
      Left = 97
      Top = 103
      Width = 89
      Height = 21
      TabOrder = 4
    end
    object edLiquidacionAltaModif: TDateComboBox
      Left = 97
      Top = 127
      Width = 89
      Height = 21
      TabOrder = 5
    end
    object edVencimientoAltaModif: TDateComboBox
      Left = 97
      Top = 151
      Width = 89
      Height = 21
      TabOrder = 6
    end
    object rgMetodoAltaModif: TRadioGroup
      Left = 96
      Top = 244
      Width = 185
      Height = 37
      Caption = 'M'#233'todo'
      Columns = 2
      Items.Strings = (
        'Tasa'
        'Precio')
      TabOrder = 10
      TabStop = True
    end
    object edTasaAltaModif: TCurrencyEdit
      Left = 97
      Top = 285
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      MinValue = -100.000000000000000000
      TabOrder = 12
    end
    object edTIRAltaModif: TCurrencyEdit
      Left = 97
      Top = 333
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      TabOrder = 14
    end
    inline fraAmortizacionAltaModif: TfraCtbTablas
      Left = 96
      Top = 197
      Width = 449
      Height = 23
      TabOrder = 8
      ExplicitLeft = 96
      ExplicitTop = 197
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 396
        ExplicitWidth = 396
      end
    end
    inline fraInteresAltaModif: TfraCtbTablas
      Left = 97
      Top = 221
      Width = 449
      Height = 23
      TabOrder = 9
      ExplicitLeft = 97
      ExplicitTop = 221
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 396
        ExplicitWidth = 396
      end
    end
    object rgMercadoAltaModif: TRadioGroup
      Left = 287
      Top = 244
      Width = 185
      Height = 37
      Caption = 'Mercado'
      Columns = 2
      Items.Strings = (
        'Primario'
        'Secundario')
      TabOrder = 11
      TabStop = True
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT IA_ID IDNIA, TI_DESCRIPCION TIPO_INSTRUMENTO, IA_DESCRIPC' +
        'ION DENOMINACION, MO_NOMBRE MONEDA,'
      
        '       IA_MONTOEMISION MONTO_EMISION, IA_FECHALICITACION FECHA_L' +
        'ICITACION, '
      
        '       IA_FECHALIQUIDACION FECHA_LIQUIDACION, IA_FECHAVENCIMIENT' +
        'O FECHA_VENCIMIENTO, '
      
        '       AMO.TB_DESCRIPCION AMORTIZACION, INT.TB_DESCRIPCION INTER' +
        'ES, IA_CALIFICACION CALIFICACION, '
      
        '       DECODE(IA_METODO, '#39'T'#39', '#39'Tasa'#39', '#39'P'#39', '#39'Precio'#39') METODO, TR_' +
        'NOMBRE TASA_REFERENCIA, IA_TASA TASA_INTERES, '
      
        '       IA_TIR TIR, EM_NOMBRE EMISOR, FI_NOMBRE FIDUCIARIO, IA_GR' +
        'UPOECONOMICO GRUPO_ECONOMICO,'
      '       IA_FECHABAJA FECHA_BAJA,'
      '       /* LICITACION */'
      
        '       IA_NOMINALLICITACION NOMINAL_LICITACION, IA_TASALICITACIO' +
        'N TASA_LICITACION,'
      
        '       IA_PRECIOLICITACION PRECIO_LICITACION, NS_NOMBRE COLOCADO' +
        'R, COM.IC_NUMERO CUENTA_COMITENTE,'
      
        '       DEP.IC_NUMERO CUENTA_DEPOSITANTE, CB_NUMERO CUENTA_PAGADO' +
        'RA,'
      '       /* RESULTADO */'
      
        '       IA_TASARESULTADO TASA_RESULTADO, IA_PRECIORESULTADO PRECI' +
        'O_RESULTADO, '
      
        '       IA_CODCAJAVALORES COD_CAJA_VALORES, IA_CODIGOSSN CODIGO_S' +
        'SN, IA_MONTO MONTO'
      
        '  FROM CTB_TABLAS INT, CTB_TABLAS AMO, NTI_TIPOINSTRUMENTO, NEM_' +
        'EMISOR, NIC_INSTITUCIONCUENTA COM, '
      
        '       NIC_INSTITUCIONCUENTA DEP, ZCB_CUENTABANCARIA, NFI_FIDUCI' +
        'ARIO, NMO_MONEDA, NTR_TASAREFERENCIA, '
      '       NNS_INSTITUCION, NIA_INSTRUMENTOENANALISIS'
      ' WHERE TI_ID = IA_IDTIPOINSTRUMENTO'
      '   AND MO_ID = IA_IDMONEDA'
      '   AND TR_ID(+) = IA_IDTASAREFERENCIA'
      '   AND EM_ID(+) = IA_IDEMISOR'
      '   AND FI_ID(+) = IA_IDFIDUCIARIO'
      '   AND NS_ID(+) = IA_IDCOLOCADOR'
      '   AND CB_ID(+) = IA_IDCUENTAPAGADORA'
      '   AND COM.IC_ID = IA_IDCUENTACOMITENTE'
      '   AND DEP.IC_ID = IA_IDCUENTADEPOSITANTE'
      '   AND AMO.TB_CODIGO(+) = IA_AMORTIZACION'
      '   AND AMO.TB_CLAVE(+) = '#39'PLINT'#39
      '   AND INT.TB_CODIGO(+) = IA_INTERES'
      '   AND INT.TB_CLAVE(+) = '#39'PLINT'#39
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end>
    Left = 109
    Top = 200
  end
  object mnuAdjuntos: TPopupMenu
    Left = 80
    Top = 284
    object mnuAdjuntosCargar: TMenuItem
      Caption = 'Cargar'
      OnClick = mnuAdjuntosCargarClick
    end
    object mnuAdjuntosVisualizar: TMenuItem
      Caption = 'Visualizar'
      OnClick = mnuAdjuntosVisualizarClick
    end
    object mnuAdjuntosEliminar: TMenuItem
      Caption = 'Eliminar'
      OnClick = mnuAdjuntosEliminarClick
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 24
    Top = 312
  end
end
