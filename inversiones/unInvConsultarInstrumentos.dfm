inherited frmInvConsultarInstrumentos: TfrmInvConsultarInstrumentos
  Left = 329
  Top = 86
  Caption = 'Consulta de Instrumentos'
  ClientHeight = 842
  ClientWidth = 792
  Constraints.MinHeight = 450
  Constraints.MinWidth = 800
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 329
  ExplicitTop = 86
  ExplicitWidth = 800
  ExplicitHeight = 872
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 792
    Height = 176
    Visible = True
    ExplicitWidth = 792
    ExplicitHeight = 176
    DesignSize = (
      792
      176)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 565
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        565
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 550
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 550
        DesignSize = (
          550
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 485
          ExplicitWidth = 485
        end
      end
    end
    object gbVencimiento: TGroupBox
      Left = 570
      Top = 1
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha Vencimiento'
      TabOrder = 1
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
    object gbInstit: TGroupBox
      Left = 3
      Top = 44
      Width = 565
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Instituci'#243'n'
      TabOrder = 2
      DesignSize = (
        565
        43)
      inline fraInstitucion: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 550
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 550
        DesignSize = (
          550
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 485
          ExplicitWidth = 485
        end
      end
    end
    object rgGrupoEcon: TRadioGroup
      Left = 279
      Top = 130
      Width = 172
      Height = 43
      Caption = 'Pertenece al Grupo Econ'#243'mico'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 8
    end
    object gbConstitucion: TGroupBox
      Left = 570
      Top = 44
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Constituci'#243'n'
      TabOrder = 3
      object Label4: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaDesdeConst: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaHastaConst
        TabOrder = 0
      end
      object edFechaHastaConst: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaVencimDesde
        TabOrder = 1
      end
    end
    object gbCodCajaValores: TGroupBox
      Left = 3
      Top = 130
      Width = 161
      Height = 43
      Caption = 'C'#243'd. Caja Valores / Certificado'
      TabOrder = 6
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
    object gbCartera: TGroupBox
      Left = 168
      Top = 130
      Width = 107
      Height = 43
      Caption = 'En Cartera al'
      TabOrder = 7
      object edFechaEnCartera: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 86
      Width = 386
      Height = 43
      Caption = 'Tipo'
      TabOrder = 4
      DesignSize = (
        386
        43)
      inline fraTipo: TfraCtbTablas
        Left = 8
        Top = 14
        Width = 372
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 372
        DesignSize = (
          372
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 319
          ExplicitWidth = 319
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 391
      Top = 86
      Width = 398
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Grupo'
      TabOrder = 5
      DesignSize = (
        398
        43)
      inline fraGrupo: TfraCtbTablas
        Left = 8
        Top = 14
        Width = 382
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 382
        DesignSize = (
          382
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 329
          ExplicitWidth = 329
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 176
    Width = 792
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 786
      end>
    ExplicitTop = 176
    ExplicitWidth = 792
    inherited ToolBar: TToolBar
      Width = 777
      ExplicitWidth = 777
      DesignSize = (
        773
        23)
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
        Style = tbsDropDown
        ExplicitWidth = 38
      end
      inherited tbExportar: TToolButton
        Left = 254
        ExplicitLeft = 254
      end
      inherited tbEnviarMail: TToolButton
        Left = 277
        ExplicitLeft = 277
      end
      inherited ToolButton8: TToolButton
        Left = 300
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        ExplicitLeft = 308
      end
      inherited tbMaxRegistros: TToolButton
        Left = 331
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 0
        Wrap = True
        ExplicitLeft = 0
        ExplicitHeight = 30
      end
      inherited tbSalir: TToolButton
        Left = 0
        Top = 30
        Visible = False
        ExplicitLeft = 0
        ExplicitTop = 30
      end
      object tbConsCupones: TToolButton
        Left = 23
        Top = 30
        Hint = 'Consultar Cupones'
        ImageIndex = 13
        OnClick = tbConsCuponesClick
      end
      object tbConsOperaciones: TToolButton
        Left = 46
        Top = 30
        Hint = 'Consultar Operaciones'
        ImageIndex = 55
        OnClick = tbConsOperacionesClick
      end
      object tbConsLicitaciones: TToolButton
        Left = 69
        Top = 30
        Hint = 'Consultar Licitaciones'
        ImageIndex = 25
        Visible = False
        OnClick = tbConsLicitacionesClick
      end
      object tbPrevision: TToolButton
        Left = 92
        Top = 30
        Hint = 'Previsi'#243'n'
        ImageIndex = 32
        OnClick = tbPrevisionClick
      end
      object ToolButton1: TToolButton
        Left = 115
        Top = 30
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbVisualizarAdjunto: TToolButton
        Left = 123
        Top = 30
        Hint = 'Visualizar Adjunto'
        ImageIndex = 22
        OnClick = tbVisualizarAdjuntoClick
      end
      object ToolButton9: TToolButton
        Left = 146
        Top = 30
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 154
        Top = 30
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 177
        Top = 30
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 185
        Top = 30
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBajas: TPanel
        Left = 208
        Top = 30
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
      object pnlCantReg: TPanel
        Left = 319
        Top = 30
        Width = 144
        Height = 22
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = ' Cant. Reg.: '
        TabOrder = 1
        object edCantRegGrilla: TCardinalEdit
          Left = 61
          Top = 0
          Width = 82
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clSilver
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 205
    Width = 792
    Height = 637
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_INSTRUMENTO'
        Title.Caption = 'Tipo Instrumento'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DENOMINACION'
        Title.Caption = 'Denominaci'#243'n'
        Width = 151
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VENCIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Vencimiento'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMINAL'
        Title.Alignment = taCenter
        Title.Caption = 'Nominal'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESIDUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Residual'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTITUCION'
        Title.Caption = 'Instituci'#243'n'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA'
        Title.Alignment = taCenter
        Title.Caption = 'Tasa / Margen'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASA_REFERENCIA'
        Title.Caption = 'Tasa Referencia'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_PLAZO'
        Title.Alignment = taCenter
        Title.Caption = 'D'#237'as Plazo'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCAJAVALORES'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Caja Valores/Certificado'
        Width = 146
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CONSTITUCION'
        Title.Alignment = taCenter
        Title.Caption = 'Constituci'#243'n'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Title.Caption = 'Moneda'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALIFICACION'
        Title.Alignment = taCenter
        Title.Caption = 'Calificaci'#243'n'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRUPOECON'
        Title.Alignment = taCenter
        Title.Caption = 'Pertenece Grupo Econ.'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_SSN'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo SSN'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GARANTIA'
        Title.Caption = 'Garant'#237'a'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAZO_LIQUIDACION'
        Title.Caption = 'Plazo de Liquidaci'#243'n'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUACION'
        Title.Alignment = taCenter
        Title.Caption = 'Valuaci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES_DEVENGADO'
        Title.Alignment = taCenter
        Title.Caption = 'Inter'#233's Devengado'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISOR'
        Title.Caption = 'Emisor'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIDUCIARIO'
        Title.Caption = 'Fiduciario'
        Width = 228
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO'
        Title.Caption = 'Grupo'
        Width = 187
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
  inherited fpAbm: TFormPanel
    Left = 168
    Top = 222
    Width = 550
    Height = 602
    BorderStyle = bsDialog
    ExplicitLeft = 168
    ExplicitTop = 222
    ExplicitWidth = 550
    ExplicitHeight = 602
    DesignSize = (
      550
      602)
    inherited BevelAbm: TBevel
      Top = 566
      Width = 542
      ExplicitTop = 496
      ExplicitWidth = 542
    end
    object Label2: TLabel [1]
      Left = 6
      Top = 11
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tipo Instrumento'
    end
    object Label3: TLabel [2]
      Left = 6
      Top = 111
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Vencimiento'
    end
    object Label6: TLabel [3]
      Left = 6
      Top = 137
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Instituci'#243'n'
    end
    object Label7: TLabel [4]
      Left = 6
      Top = 161
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tasa'
    end
    object Label8: TLabel [5]
      Left = 6
      Top = 85
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Plazo'
    end
    object Label9: TLabel [6]
      Left = 6
      Top = 207
      Width = 89
      Height = 27
      AutoSize = False
      Caption = 'C'#243'd. Caja Valores/ Certificado'
      WordWrap = True
    end
    object Label10: TLabel [7]
      Left = 6
      Top = 36
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Denominaci'#243'n'
    end
    object Label11: TLabel [8]
      Left = 6
      Top = 187
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tasa Referencia'
    end
    object Label12: TLabel [9]
      Left = 6
      Top = 61
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Constituci'#243'n'
    end
    object Label13: TLabel [10]
      Left = 6
      Top = 238
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Moneda'
    end
    object Label14: TLabel [11]
      Left = 6
      Top = 264
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Calificaci'#243'n'
    end
    object Label15: TLabel [12]
      Left = 6
      Top = 311
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo SSN'
    end
    object lblMontoAltaModif: TLabel [13]
      Left = 391
      Top = 391
      Width = 35
      Height = 13
      AutoSize = False
      Caption = 'Monto'
    end
    object Label5: TLabel [14]
      Left = 6
      Top = 338
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Garant'#237'a'
    end
    object Label16: TLabel [15]
      Left = 6
      Top = 358
      Width = 88
      Height = 28
      AutoSize = False
      Caption = 'Plazo de Liquidaci'#243'n'
      WordWrap = True
    end
    object lblCuentaAltaModif: TLabel [16]
      Left = 6
      Top = 419
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Cuenta'
    end
    object lblEmisorAltaModif: TLabel [17]
      Left = 6
      Top = 445
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Emisor'
    end
    object lblFiduciarioAltaModif: TLabel [18]
      Left = 6
      Top = 471
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Fiduciario'
    end
    object lblTipoAltaModif: TLabel [19]
      Left = 6
      Top = 496
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Tipo'
    end
    object lblGrupoAltaModif: TLabel [20]
      Left = 6
      Top = 521
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Grupo'
    end
    object Label17: TLabel [21]
      Left = 5
      Top = 546
      Width = 88
      Height = 13
      AutoSize = False
      Caption = 'Versi'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 392
      Top = 572
      TabOrder = 24
      ExplicitLeft = 392
      ExplicitTop = 572
    end
    inherited btnCancelar: TButton
      Left = 470
      Top = 572
      TabOrder = 25
      ExplicitLeft = 470
      ExplicitTop = 572
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
    object edVencimientoAltaModif: TDateComboBox
      Left = 97
      Top = 107
      Width = 89
      Height = 21
      TabOrder = 4
      OnExit = DoCalcularAdic
    end
    inline fraInstitucionAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 132
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 96
      ExplicitTop = 132
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    object edTasaAltaModif: TCurrencyEdit
      Left = 97
      Top = 158
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000;-% ,0.000'
      MaxValue = 100.000000000000000000
      TabOrder = 6
    end
    object edPlazoAltaModif: TCurrencyEdit
      Left = 97
      Top = 82
      Width = 96
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = ',0;-,0'
      MaxLength = 8
      MaxValue = 99999999.000000000000000000
      TabOrder = 3
      OnExit = DoCalcularAdic
    end
    object edCodCajaValAltaModif: TEdit
      Left = 97
      Top = 208
      Width = 96
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 8
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
    inline fraTasaRefAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 182
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      ExplicitLeft = 96
      ExplicitTop = 182
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    object edConstitucionAltaModif: TDateComboBox
      Left = 97
      Top = 57
      Width = 89
      Height = 21
      TabOrder = 2
      OnExit = DoCalcularAdic
    end
    inline fraMonedaAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 233
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      ExplicitLeft = 96
      ExplicitTop = 233
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    object chkGrupoEconAltaModif: TCheckBox
      Left = 4
      Top = 287
      Width = 188
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pertenece al Grupo Econ'#243'mico'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object edCalificacionAltaModif: TEdit
      Left = 97
      Top = 260
      Width = 96
      Height = 21
      MaxLength = 10
      TabOrder = 10
    end
    object edCodigoSSNAltaModif: TEdit
      Left = 97
      Top = 307
      Width = 96
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 12
    end
    object chkPrecancelableAltaModif: TCheckBox
      Left = 4
      Top = 389
      Width = 188
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Precancelable'
      Checked = True
      State = cbChecked
      TabOrder = 16
    end
    object edMontoAltaModif: TCurrencyEdit
      Left = 433
      Top = 388
      Width = 110
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 16
      MaxValue = 9999999999.000000000000000000
      TabOrder = 17
    end
    inline fraGarantiaAltaModif: TfraCtbTablas
      Left = 96
      Top = 333
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 14
      ExplicitLeft = 96
      ExplicitTop = 333
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 384
        ExplicitLeft = 64
        ExplicitWidth = 384
      end
      inherited edCodigo: TPatternEdit
        Width = 60
        ExplicitWidth = 60
      end
    end
    inline fraPlazoLiqAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 360
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
      ExplicitLeft = 96
      ExplicitTop = 360
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    inline fraCuentaAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 414
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 18
      ExplicitLeft = 96
      ExplicitTop = 414
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    inline fraEmisorAltaModif: TfraCodigoDescripcion
      Left = 96
      Top = 441
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 19
      ExplicitLeft = 96
      ExplicitTop = 441
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
      Top = 467
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 20
      ExplicitLeft = 96
      ExplicitTop = 467
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 384
        ExplicitWidth = 384
      end
    end
    inline fraTipoAltaModif: TfraCtbTablas
      Left = 96
      Top = 492
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 21
      ExplicitLeft = 96
      ExplicitTop = 492
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 384
        ExplicitLeft = 64
        ExplicitWidth = 384
      end
      inherited edCodigo: TPatternEdit
        Width = 60
        ExplicitWidth = 60
      end
    end
    inline fraGrupoAltaModif: TfraCtbTablas
      Left = 96
      Top = 517
      Width = 449
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 22
      ExplicitLeft = 96
      ExplicitTop = 517
      ExplicitWidth = 449
      DesignSize = (
        449
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 64
        Width = 384
        ExplicitLeft = 64
        ExplicitWidth = 384
      end
      inherited edCodigo: TPatternEdit
        Width = 60
        ExplicitWidth = 60
      end
    end
    object rgMercadoAltaModif: TRadioGroup
      Left = 358
      Top = 271
      Width = 185
      Height = 46
      Caption = 'Mercado'
      Columns = 2
      Items.Strings = (
        'Primario'
        'Secundario')
      TabOrder = 13
      TabStop = True
    end
    object edVersionAltaModif: TIntEdit
      Left = 97
      Top = 542
      Width = 96
      Height = 21
      TabOrder = 23
      Text = '1'
      MaxLength = 8
      MaxValue = 99999999
      MinValue = 1
      Value = 1
      Options = [ioAllowEmpty, ioAllowNegative]
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TI_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, IN_CONSTIT' +
        'UCION CONSTITUCION, '
      '       IN_DESCRIPCION DESCRIPCION, IN_VENCIMIENTO VENCIMIENTO,'
      '       IN_VALORNOMINAL NOMINAL, IN_VALORRESIDUAL RESIDUAL,'
      '       BA_NOMBRE BANCO, IN_TASA TASA, IN_PLAZO DIAS_PLAZO,'
      
        '       IN_FECHABAJA FECHA_BAJA, ART.INVERSION.GET_MONTOINSTRUMEN' +
        'TO(IN_ID) MONTO,'
      '       ART.INVERSION.GET_VALUACIONINSTRUMENTO(IN_ID) VALUACION,'
      
        '       ART.INVERSION.GET_INTERESDEVENGADO(IN_ID) INTERES_DEVENGA' +
        'DO'
      '  FROM ZBA_BANCO, NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO'
      ' WHERE TI_ID = IN_IDTIPOINSTRUMENTO'
      '   AND IN_IDBANCO = BA_ID(+)'
      '   AND 1 = 2')
    Top = 281
  end
  inherited dsConsulta: TDataSource
    Top = 281
  end
  inherited SortDialog: TSortDialog
    Top = 309
  end
  inherited ExportDialog: TExportDialog
    Top = 309
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Top = 337
  end
  inherited Seguridad: TSeguridad
    Top = 253
  end
  inherited FormStorage: TFormStorage
    Top = 253
  end
  inherited PrintDialog: TPrintDialog
    Top = 337
  end
  inherited ShortCutControl: TShortCutControl
    Top = 253
  end
  inherited FieldHider: TFieldHider
    Top = 281
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
    Left = 108
    Top = 253
  end
  object pmnuImprimir: TPopupMenu
    Left = 81
    Top = 337
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
    object mnuImpCondicEmision: TMenuItem
      Caption = 'Imprimir Condiciones de Emisi'#243'n'
      OnClick = mnuImpCondicEmisionClick
    end
  end
end
