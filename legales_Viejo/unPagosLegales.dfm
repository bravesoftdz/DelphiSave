inherited frmPagosLegales: TfrmPagosLegales
  Left = 151
  Top = 132
  ActiveControl = edNroLiquidacion
  Caption = 'frmPagosLegales'
  ClientHeight = 680
  ClientWidth = 1028
  ExplicitWidth = 1036
  ExplicitHeight = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 1028
    Height = 186
    Visible = True
    ExplicitWidth = 1028
    ExplicitHeight = 186
    DesignSize = (
      1028
      186)
    object lblNroLiquidacion: TLabel
      Left = 6
      Top = 7
      Width = 77
      Height = 13
      Caption = 'Nro. Liquidaci'#243'n'
    end
    object lblTipoBeneficiario: TLabel
      Left = 6
      Top = 31
      Width = 79
      Height = 13
      Caption = 'Tipo Beneficiario'
    end
    object lblBeneficiario: TLabel
      Left = 306
      Top = 32
      Width = 55
      Height = 13
      Caption = 'Beneficiario'
    end
    object Label3: TLabel
      Left = 679
      Top = 100
      Width = 18
      Height = 16
      AutoSize = False
      Color = clGreen
      ParentColor = False
    end
    object Label2: TLabel
      Left = 701
      Top = 102
      Width = 97
      Height = 13
      Caption = 'Concepto Duplicado'
    end
    object edNroLiquidacion: TIntEdit
      Left = 90
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 0
    end
    inline fraTipoBeneficiario: TfraCodigoDescripcionExt
      Left = 89
      Top = 27
      Width = 213
      Height = 23
      TabOrder = 1
      ExplicitLeft = 89
      ExplicitTop = 27
      ExplicitWidth = 213
      DesignSize = (
        213
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 28
        Width = 184
        ExplicitLeft = 28
        ExplicitWidth = 184
      end
      inherited edCodigo: TPatternEdit
        Width = 23
        Pattern = '0123456789'
        ExplicitWidth = 23
      end
    end
    inline fraBeneficiario: TfraCodigoDescripcionExt
      Left = 364
      Top = 27
      Width = 660
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ExplicitLeft = 364
      ExplicitTop = 27
      ExplicitWidth = 660
      ExplicitHeight = 24
      DesignSize = (
        660
        24)
      inherited cmbDescripcion: TArtComboBox
        Left = 60
        Width = 598
        CharCase = ecUpperCase
        OnDropDown = fraBeneficiariocmbDescripcionDropDown
        ExplicitLeft = 60
        ExplicitWidth = 598
      end
      inherited edCodigo: TPatternEdit
        Width = 55
        Pattern = '0123456789'
        ExplicitWidth = 55
      end
    end
    object gbPago: TGroupBox
      Left = 0
      Top = 50
      Width = 665
      Height = 129
      Caption = ' Pago '
      TabOrder = 3
      object lblPagueseA: TLabel
        Left = 9
        Top = 20
        Width = 95
        Height = 13
        Caption = 'Autorizado al Cobro:'
      end
      object lblChequeA: TLabel
        Left = 9
        Top = 46
        Width = 107
        Height = 13
        Caption = 'Cheque a la Orden de:'
      end
      object Label4: TLabel
        Left = 11
        Top = 73
        Width = 36
        Height = 13
        Caption = 'Detalle:'
      end
      object edChequeAlaOrdenDe: TEdit
        Left = 120
        Top = 43
        Width = 521
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        TabOrder = 1
      end
      inline fraPagueseA: TfraCodigoDescripcionExt
        Left = 119
        Top = 17
        Width = 527
        Height = 23
        TabOrder = 0
        ExplicitLeft = 119
        ExplicitTop = 17
        ExplicitWidth = 527
        DesignSize = (
          527
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 84
          Width = 442
          OnChange = fraPagueseAcmbDescripcionChange
          ExplicitLeft = 84
          ExplicitWidth = 442
        end
        inherited edCodigo: TPatternEdit
          Width = 78
          MaxLength = 11
          ExplicitWidth = 78
        end
      end
      object edDetalleImpresion: TMemo
        Left = 120
        Top = 68
        Width = 521
        Height = 53
        MaxLength = 500
        TabOrder = 2
      end
    end
    object chkPagoExclusivo: TCheckBox
      Left = 679
      Top = 60
      Width = 97
      Height = 17
      Caption = 'Pago Exclusivo'
      TabOrder = 4
      OnClick = chkPagoExclusivoClick
    end
    object chkEnviarADelegacion: TCheckBox
      Left = 679
      Top = 79
      Width = 118
      Height = 17
      Caption = 'Enviar a Delegaci'#243'n'
      Enabled = False
      TabOrder = 5
      OnClick = chkEnviarADelegacionClick
    end
  end
  inherited CoolBar: TCoolBar
    Top = 186
    Width = 1028
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1022
      end>
    ExplicitTop = 186
    ExplicitWidth = 1028
    inherited ToolBar: TToolBar
      Width = 1015
      ExplicitWidth = 1015
      object tbAprobacionConceptosDuplicados: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aprobaci'#243'n Conceptos Duplicados'
        Caption = 'tbAprobacionConceptosDuplicados'
        ImageIndex = 23
        OnClick = tbAprobacionConceptosDuplicadosClick
      end
      object tbEditar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Editar'
        Caption = 'tbEditar'
        ImageIndex = 15
        OnClick = tbEditarClick
      end
      object tbMEP: TToolButton
        Left = 416
        Top = 0
        Hint = 'Pago Electr'#243'nico'
        Caption = 'tbMEP'
        Enabled = False
        ImageIndex = 18
        OnClick = tbMEPClick
      end
      object tbSeparador2: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'tbSeparador2'
        ImageIndex = 17
        Style = tbsSeparator
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 215
    Width = 1028
    Height = 407
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Title.Caption = 'Concepto'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOBENEFICIARIO'
        Title.Caption = 'Tipo Acreedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIODESC'
        Title.Caption = 'Descripci'#243'n'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUITCUIL'
        Title.Caption = 'CUIL/CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTECONRETENCION'
        Title.Caption = 'Importe c/Ret.'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTEPAGO'
        Title.Caption = 'Importe s/Ret.'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROFACTURA'
        Title.Caption = 'Factura'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAFACTURA'
        Title.Caption = 'Fecha Factura'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDENNRO'
        Title.Caption = 'Nro.Orden'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDENFECHA'
        Title.Caption = 'Fecha Orden'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUENRO'
        Title.Caption = 'Nro.Cheque'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUEFECHA'
        Title.Caption = 'Fecha Cheque'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMENTARIO'
        Title.Caption = 'Observaciones'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACION'
        Title.Caption = 'Operaci'#243'n'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estadoduplicado'
        Title.Caption = 'Estado Aprobaci'#243'n Duplicado'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAAPROBACION'
        Title.Caption = 'Fecha Aprobaci'#243'n'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVOAPROBACION'
        Title.Caption = 'Motivo Aprobaci'#243'n'
        Width = 94
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 21
    Top = 257
    Width = 577
    Height = 370
    BorderStyle = bsNone
    ExplicitLeft = 21
    ExplicitTop = 257
    ExplicitWidth = 577
    ExplicitHeight = 370
    DesignSize = (
      577
      370)
    inherited BevelAbm: TBevel
      Top = 333
      Width = 569
      ExplicitTop = 333
      ExplicitWidth = 569
    end
    inherited btnAceptar: TButton
      Left = 420
      Top = 340
      Width = 74
      ExplicitLeft = 420
      ExplicitTop = 340
      ExplicitWidth = 74
    end
    inherited btnCancelar: TButton
      Left = 497
      Top = 340
      ExplicitLeft = 497
      ExplicitTop = 340
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 577
      Height = 229
      Align = alTop
      TabOrder = 2
      DesignSize = (
        577
        229)
      object lblEtapa: TLabel
        Left = 8
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Juicio'
      end
      object lblConceptoPago: TLabel
        Left = 6
        Top = 42
        Width = 49
        Height = 26
        Alignment = taCenter
        Caption = 'Concepto Pago'
        WordWrap = True
      end
      object Bevel1: TBevel
        Left = 3
        Top = 101
        Width = 557
        Height = 7
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object lblNroFactura: TLabel
        Left = 8
        Top = 110
        Width = 62
        Height = 13
        Caption = 'Nro. Factura:'
      end
      object lblFechaFacturaPago: TLabel
        Left = 399
        Top = 110
        Width = 69
        Height = 13
        Caption = 'Fecha Factura'
      end
      object lblDetalleFacturaPago: TLabel
        Left = 8
        Top = 134
        Width = 36
        Height = 13
        Caption = 'Detalle:'
      end
      object lblImpSujetoaRetGanaciasPago: TLabel
        Left = 8
        Top = 158
        Width = 84
        Height = 13
        Caption = 'Imp.c/Ret. Gcias:'
      end
      object lblImporteSinRetGanaciasPago: TLabel
        Left = 373
        Top = 158
        Width = 83
        Height = 13
        Caption = 'Imp.s/Ret. Gcias:'
      end
      object lblFechaVencimiento: TLabel
        Left = 8
        Top = 182
        Width = 118
        Height = 13
        Caption = 'F. Vencimiento del Pago:'
      end
      object lbFechaRecepcionFactura: TLabel
        Left = 8
        Top = 206
        Width = 124
        Height = 13
        Caption = 'Fecha Recepci'#243'n Factura'
      end
      object lbSector: TLabel
        Left = 273
        Top = 183
        Width = 61
        Height = 13
        Caption = #193'rea/Sector:'
        Visible = False
      end
      object lbIntereses: TLabel
        Left = 9
        Top = 77
        Width = 43
        Height = 13
        Caption = 'Intereses'
      end
      object lbCuotas: TLabel
        Left = 482
        Top = 48
        Width = 39
        Height = 13
        Caption = 'Cuotas: '
      end
      inline fraConceptoPago: TfraCodigoDescripcionExt
        Left = 64
        Top = 44
        Width = 412
        Height = 23
        TabOrder = 1
        ExplicitLeft = 64
        ExplicitTop = 44
        ExplicitWidth = 412
        DesignSize = (
          412
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 347
          ExplicitWidth = 347
        end
        inherited edCodigo: TPatternEdit
          Pattern = '0123456789'
        end
      end
      object pnlFactura: TPanel
        Left = 92
        Top = 106
        Width = 121
        Height = 23
        Hint = 
          'Si se desconoce el Nro. de Factura, dejarlo en blanco y '#13#10'el Sis' +
          'tema lo generar'#225' autom'#225'ticamente'
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        object peLetraFactura: TPatternEdit
          Left = 3
          Top = 0
          Width = 15
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          Alignment = taCenter
          Pattern = 'ABCM'
        end
        object meSituacionFactura: TMaskEdit
          Left = 25
          Top = 0
          Width = 31
          Height = 21
          CharCase = ecUpperCase
          EditMask = '0999;0;_'
          MaxLength = 4
          TabOrder = 1
        end
        object meNumeroFactura: TMaskEdit
          Left = 65
          Top = 0
          Width = 56
          Height = 21
          CharCase = ecUpperCase
          EditMask = '09999999;0;_'
          MaxLength = 8
          TabOrder = 2
        end
      end
      object edFechaFacturaPago: TDateComboBox
        Left = 473
        Top = 106
        Width = 91
        Height = 21
        TabOrder = 4
      end
      object edObservaciones: TEdit
        Left = 96
        Top = 130
        Width = 468
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 249
        TabOrder = 5
      end
      object edImpSujetoaRetGanaciasPago: TCurrencyEdit
        Left = 96
        Top = 154
        Width = 97
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$,0.00;-$,0.00'
        MaxValue = 99999999.000000000000000000
        MinValue = -99999999.000000000000000000
        TabOrder = 6
      end
      object edImpSinRetencionesGanPagos: TCurrencyEdit
        Left = 461
        Top = 154
        Width = 103
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        DisplayFormat = '$,0.00;-$,0.00'
        MaxValue = 99999999.000000000000000000
        MinValue = -99999999.000000000000000000
        TabOrder = 7
      end
      object dcbFechaVencimientoPago: TDateComboBox
        Left = 144
        Top = 178
        Width = 91
        Height = 21
        TabOrder = 8
      end
      object edFechaRecepcionFactura: TDateComboBox
        Left = 144
        Top = 202
        Width = 91
        Height = 21
        TabOrder = 9
      end
      inline fraSectores: TfraCodigoDescripcionExt
        Left = 337
        Top = 177
        Width = 229
        Height = 23
        Color = clBtnFace
        ParentColor = False
        TabOrder = 10
        Visible = False
        ExplicitLeft = 337
        ExplicitTop = 177
        ExplicitWidth = 229
        DesignSize = (
          229
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 72
          Width = 156
          ExplicitLeft = 72
          ExplicitWidth = 156
        end
        inherited edCodigo: TPatternEdit
          Width = 69
          ExplicitWidth = 69
        end
      end
      inline fraInteresesInstancias: TfraCodigoDescripcionExt
        Left = 64
        Top = 71
        Width = 505
        Height = 23
        TabOrder = 2
        ExplicitLeft = 64
        ExplicitTop = 71
        ExplicitWidth = 505
        DesignSize = (
          505
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 440
          ExplicitWidth = 440
        end
        inherited edCodigo: TPatternEdit
          Pattern = '0123456789'
        end
      end
      inline fraEtapa: TfraCodigoDescripcionExt
        Left = 64
        Top = 15
        Width = 505
        Height = 23
        TabOrder = 0
        ExplicitLeft = 64
        ExplicitTop = 15
        ExplicitWidth = 505
        DesignSize = (
          505
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 440
          ExplicitWidth = 440
        end
        inherited edCodigo: TPatternEdit
          Pattern = '0123456789'
        end
      end
      object edCuotas: TPatternEdit
        Left = 525
        Top = 44
        Width = 39
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 10
        ReadOnly = True
        TabOrder = 11
        Pattern = '0123456789'
      end
    end
    object gbComprobantes: TGroupBox
      Left = 0
      Top = 229
      Width = 577
      Height = 55
      Align = alTop
      Caption = ' Comprobantes de Pagos '
      TabOrder = 3
      Visible = False
      object Label6: TLabel
        Left = 12
        Top = 24
        Width = 140
        Height = 13
        Caption = 'Dep'#243'sito de Tasa de Justicia:'
      end
      object Label7: TLabel
        Left = 318
        Top = 24
        Width = 98
        Height = 13
        Caption = 'B.U.D.I (Multa SRT):'
      end
      object edComprobante: TEdit
        Left = 156
        Top = 22
        Width = 103
        Height = 21
        MaxLength = 10
        TabOrder = 0
      end
      object edBUDI: TEdit
        Left = 420
        Top = 22
        Width = 103
        Height = 21
        MaxLength = 10
        TabOrder = 1
      end
    end
    object gbReclamo: TGroupBox
      Left = 0
      Top = 284
      Width = 577
      Height = 41
      Align = alTop
      TabOrder = 4
      Visible = False
      object Label8: TLabel
        Left = 304
        Top = 16
        Width = 80
        Height = 13
        Caption = 'Importe Embargo'
      end
      object Label9: TLabel
        Left = 7
        Top = 16
        Width = 106
        Height = 13
        Caption = 'Importe Rec. Extraord.'
      end
      object btnBuscarEmbargo: TBitBtn
        Left = 548
        Top = 12
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 0
        OnClick = btnBuscarEmbargoClick
      end
      object edEmbargo: TCurrencyEdit
        Left = 388
        Top = 12
        Width = 160
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        TabOrder = 1
      end
      object edRecursoExtraord: TCurrencyEdit
        Left = 116
        Top = 12
        Width = 160
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        AutoSize = False
        TabOrder = 2
      end
      object btnBuscarJuicio: TBitBtn
        Left = 276
        Top = 12
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = btnBuscarJuicioClick
      end
    end
  end
  object fpImpresionLiquidacion: TFormPanel [4]
    Left = 190
    Top = 566
    Width = 637
    Height = 86
    Caption = 'Impresi'#243'n de Conceptos de Pago'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      637
      86)
    object btnAceptarImpresion: TButton
      Left = 480
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarImpresionClick
    end
    object btnCancelarCambioPreventor: TButton
      Left = 558
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object gbCopias: TGroupBox
      Left = 0
      Top = 0
      Width = 637
      Height = 52
      Align = alTop
      Caption = ' Cantidad Copias '
      TabOrder = 2
      object lblCantidadCopias: TLabel
        Left = 21
        Top = 23
        Width = 109
        Height = 13
        Caption = 'Recibo de Liquidaci'#243'n:'
      end
      object lblLiquidacion: TLabel
        Left = 301
        Top = 23
        Width = 54
        Height = 13
        Caption = 'Liquidaci'#243'n'
      end
      object udCantidadReciboLiquidacion: TUpDown
        Left = 177
        Top = 19
        Width = 15
        Height = 21
        Associate = edCantidadCopiasReciboLiquidacion
        Position = 2
        TabOrder = 1
      end
      object edCantidadCopiasReciboLiquidacion: TIntEdit
        Left = 136
        Top = 19
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '2'
        Alignment = taRightJustify
        MaxLength = 3
        MaxValue = 999
        MinValue = 1
        Value = 2
      end
      object udCantidadLiquidacion: TUpDown
        Left = 401
        Top = 19
        Width = 15
        Height = 21
        Associate = edCantidadCopiasLiquidacion
        Position = 2
        TabOrder = 3
      end
      object edCantidadCopiasLiquidacion: TIntEdit
        Left = 360
        Top = 19
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '2'
        Alignment = taRightJustify
        MaxLength = 3
        MaxValue = 999
        MinValue = 1
        Value = 2
      end
    end
  end
  object fpJuzgado: TFormPanel [5]
    Left = 409
    Top = 463
    Width = 423
    Height = 65
    Caption = 'Impresi'#243'n de Conceptos de Pago'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      423
      65)
    object lbEtapaJuzgado: TLabel
      Left = 10
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Juicio :'
    end
    object btnAcept: TButton
      Left = 266
      Top = 35
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 344
      Top = 35
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    inline fraJuicioJuzgado: TfraCodigoDescripcionExt
      Left = 53
      Top = 7
      Width = 368
      Height = 23
      TabOrder = 2
      ExplicitLeft = 53
      ExplicitTop = 7
      ExplicitWidth = 368
      DesignSize = (
        368
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 84
        Width = 281
        ExplicitLeft = 84
        ExplicitWidth = 281
      end
      inherited edCodigo: TPatternEdit
        Width = 78
        MaxLength = 11
        ExplicitWidth = 78
      end
    end
  end
  object pnAprobacionConDup: TFormPanel [6]
    Left = 468
    Top = 284
    Width = 423
    Height = 141
    Caption = 'Aprobaci'#243'n de Conceptos Duplicados'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    DesignSize = (
      423
      141)
    object lbMotivo: TLabel
      Left = 10
      Top = 55
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object btnAceptarAprobConDup: TButton
      Left = 266
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarAprobConDupClick
    end
    object btnCancelarAprobConDup: TButton
      Left = 344
      Top = 111
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object gbAprobacion: TGroupBox
      Left = 120
      Top = 4
      Width = 185
      Height = 41
      TabOrder = 2
      object cbAprobadoConDup: TCheckBox
        Left = 16
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Aprobado'
        TabOrder = 0
        OnClick = cbAprobadoConDupClick
      end
      object cbRechazadoConDup: TCheckBox
        Left = 96
        Top = 16
        Width = 81
        Height = 17
        Caption = 'Rechazado'
        TabOrder = 1
        OnClick = cbRechazadoConDupClick
      end
    end
    object edMotivo: TMemo
      Left = 56
      Top = 50
      Width = 361
      Height = 57
      MaxLength = 400
      TabOrder = 3
    end
  end
  object Panel1: TPanel [7]
    Left = 0
    Top = 651
    Width = 1028
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    Visible = False
    DesignSize = (
      1028
      29)
    object btnAceptarEdicion: TButton
      Left = 875
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarEdicionClick
    end
    object btnCancelarEdicion: TButton
      Left = 951
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarEdicionClick
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 871
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  object fpPagoElectronico: TFormPanel [8]
    Left = 653
    Top = 341
    Width = 390
    Height = 250
    Caption = 'Pago Electronico'
    FormWidth = 0
    FormHeigth = 0
    FormLeft = 0
    FormTop = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 250
    Constraints.MinHeight = 250
    Constraints.MinWidth = 390
    DesignSize = (
      390
      250)
    object Label1: TLabel
      Left = 6
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Nro. Oficio:'
    end
    object Label5: TLabel
      Left = 6
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Juzgado: '
    end
    object Label10: TLabel
      Left = 6
      Top = 92
      Width = 54
      Height = 13
      Caption = 'Secretaria: '
    end
    object Label11: TLabel
      Left = 6
      Top = 119
      Width = 56
      Height = 13
      Caption = 'Expediente:'
    end
    object Label12: TLabel
      Left = 6
      Top = 146
      Width = 30
      Height = 13
      Caption = 'Fuero:'
    end
    object Label13: TLabel
      Left = 6
      Top = 173
      Width = 45
      Height = 13
      Caption = 'Caratula: '
    end
    object Label14: TLabel
      Left = 6
      Top = 202
      Width = 25
      Height = 13
      Caption = 'CBU:'
    end
    object edCBU1: TIntEdit
      Left = 70
      Top = 198
      Width = 67
      Height = 21
      TabOrder = 6
      MaxLength = 8
    end
    object edJuzgado: TEdit
      Left = 70
      Top = 62
      Width = 142
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object edSecretaria: TEdit
      Left = 70
      Top = 89
      Width = 73
      Height = 21
      MaxLength = 2
      TabOrder = 2
    end
    object edExpediente: TEdit
      Left = 70
      Top = 116
      Width = 72
      Height = 21
      MaxLength = 10
      TabOrder = 3
    end
    object edFuero: TEdit
      Left = 70
      Top = 142
      Width = 315
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 76
      TabOrder = 4
    end
    object edCaratula: TEdit
      Left = 70
      Top = 169
      Width = 314
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 76
      TabOrder = 5
    end
    object edNroOficio: TEdit
      Left = 70
      Top = 36
      Width = 143
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object edCBU2: TPatternEdit
      Left = 144
      Top = 198
      Width = 121
      Height = 21
      MaxLength = 14
      TabOrder = 7
      Pattern = '0123456789'
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 390
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      object tbGuardar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Guardar'
        Caption = 'tbGuardar'
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
      object ToolButton10: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbLimpiarPagoElec: TToolButton
        Left = 31
        Top = 0
        Caption = 'Limpiar'
        ImageIndex = 1
        OnClick = tbLimpiarPagoElecClick
      end
      object ToolButton9: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbSalirPagoElec: TToolButton
        Left = 62
        Top = 0
        Caption = 'tbSalirPagoElec'
        ImageIndex = 5
        OnClick = tbSalirPagoElecClick
      end
    end
  end
  object plTotalesPago: TPanel [9]
    Left = 0
    Top = 622
    Width = 1028
    Height = 29
    Align = alBottom
    Enabled = False
    TabOrder = 9
    object lbSumatoria: TLabel
      Left = 8
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object lblSumatoriaPagosConRet: TEdit
      Left = 624
      Top = 4
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object lblSumatoriaPagosSinRet: TEdit
      Left = 764
      Top = 4
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT pl_id AS ID, pl_idliquidacion AS idliquidacion,'
      
        '       DECODE(pl_estado, '#39'C'#39', '#39'Cargado'#39', '#39'A'#39', '#39'Anulado'#39', '#39'X'#39', '#39'C' +
        'ancelado'#39', '#39'E'#39', '#39'Aprobado'#39', '#39#39') AS estado,'
      '       pl_estado letraestado,'
      
        '       cp_denpago AS concepto, pl_idbeneficiariopago idbeneficia' +
        'rio, bp_descripcion AS tipobeneficiario,'
      
        '       pl_detallebeneficiario AS beneficiario, pl_cuitcuil AS cu' +
        'itcuil, pl_importeconretencion AS importeconretencion,'
      '       pl_importepago AS importepago,'
      
        '       lpl.pl_letrafactura || '#39'-'#39' || lpl.pl_situacionfactura || ' +
        #39'-'#39' || lpl.pl_numerofactura AS nrofactura,'
      
        '       pl_fechafactura AS fechafactura, ce_ordenpago AS ordennro' +
        ', ce_fechaop AS ordenfecha, ce_numero AS chequenro,'
      
        '       ce_fechacheque AS chequefecha, pl_comentario AS comentari' +
        'o, to_descripcion AS operacion, pl_idjuicioentramite AS idetapa,'
      
        '       pl_letrafactura AS letrafactura, pl_situacionfactura AS s' +
        'ituacionfactura, pl_numerofactura AS numerofactura,'
      
        '       pl_fecharecepfactura AS fecharecepfactura, pl_fechavencim' +
        'ientopago AS fechavencimientopago,'
      
        '       pl_pagoexclusivo AS pagoexclusivo, pl_numpago AS numpago,' +
        ' pl_conpago AS conpago,'
      
        '       PL_DUPLICADO duplicado, PL_ESTADODUPLICIDAD letraestadodu' +
        'pli, '
      
        '       DECODE(PL_ESTADODUPLICIDAD, '#39'A'#39', '#39'Aprobado'#39', '#39'R'#39', '#39'Rechaz' +
        'ado'#39', '#39#39') AS estadoduplicado, '
      
        '       PL_FECHAAPROBACION fechaaprobacion, PL_MOTIVOAPROBACION m' +
        'otivoaprobacion '
      
        '  FROM rce_chequeemitido, legales.lpl_pagolegal lpl, legales.lbp' +
        '_beneficiariopago lbp, art.scp_conpago scp,'
      
        '       legales.lto_tipooperacion lto, legales.llj_liquidacionjui' +
        'cio'
      ' WHERE (    (lpl.pl_idbeneficiariopago = lbp.bp_id(+))'
      '        AND (lpl.pl_conpago = scp.cp_conpago)'
      '        AND (lpl.pl_idtipooperacion = lto.to_id(+)))'
      '   AND ce_id(+) = pl_idchequeemitido'
      '   AND pl_idliquidacion = lj_id'
      '   AND 1 = 2')
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
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 260
  end
end
