inherited frmInvConsultarOperacionesResultados: TfrmInvConsultarOperacionesResultados
  Left = 305
  Top = 190
  Caption = 'Consultar Operaciones y Resultados'
  ClientHeight = 470
  ClientWidth = 692
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  OldCreateOrder = True
  ExplicitLeft = 305
  ExplicitTop = 190
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid [0]
    Top = 156
    Width = 692
    Height = 314
    MultiSelect = True
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_INSTRUMENTO'
        Title.Caption = 'Tipo Instrumento'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTRUMENTO'
        Title.Caption = 'Denominaci'#243'n'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACION'
        Title.Caption = 'Operaci'#243'n'
        Width = 135
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Title.Alignment = taCenter
        Title.Caption = 'Precio'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMINAL'
        Title.Alignment = taCenter
        Title.Caption = 'Nominal'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESIDUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Residual'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARANCEL'
        Title.Alignment = taCenter
        Title.Caption = 'Arancel'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAZO_LIQUIDACION'
        Title.Caption = 'Plazo de Liquidaci'#243'n'
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CUSTODIA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Custodia'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCAJAVALORES'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Caja Valores/Certificado'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CONTABLE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Contable'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE_CONTABLE'
        Title.Alignment = taCenter
        Title.Caption = 'Valuaci'#243'n PEPS'
        Width = 85
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RESULTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Resultado'
        Width = 75
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'CONTABILIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'Confirmado'
        Width = 60
        Visible = True
      end>
  end
  object pgGrillas: TPageControl [1]
    Left = 0
    Top = 156
    Width = 692
    Height = 314
    ActivePage = tsOperaciones
    Align = alClient
    TabOrder = 3
    OnChange = pgGrillasChange
    object tsOperaciones: TTabSheet
      Caption = 'Operaciones'
    end
    object tsResultados: TTabSheet
      Caption = 'Resultados'
      ImageIndex = 1
      object GridResultados: TArtDBGrid
        Left = 0
        Top = 0
        Width = 684
        Height = 286
        Align = alClient
        DataSource = dsResultados
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = GridDblClick
        OnKeyDown = GridKeyDown
        IniStorage = FormStorage
        MultiSelect = True
        FooterBand = False
        OnPaintFooter = GridResultadosPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO_INSTRUMENTO'
            Title.Caption = 'Tipo Instrumento'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSTRUMENTO'
            Title.Caption = 'Denominaci'#243'n'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUPON'
            Title.Alignment = taCenter
            Title.Caption = 'Cup'#243'n'
            Width = 89
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA'
            Title.Alignment = taCenter
            Title.Caption = 'F. Cobrado'
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimiento'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTERES'
            Title.Alignment = taCenter
            Title.Caption = 'Inter'#233's'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMORTIZACION'
            Title.Alignment = taCenter
            Title.Caption = 'Amortizaci'#243'n'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Title.Alignment = taCenter
            Title.Caption = 'Importe Cobrado'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARANCEL'
            Title.Alignment = taCenter
            Title.Caption = 'Arancel'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NETO'
            Title.Alignment = taCenter
            Title.Caption = 'Importe Cobrado Neto'
            Width = 114
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Title.Caption = 'Banco'
            Width = 222
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUENTA'
            Title.Caption = 'Cuenta'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCAJAVALORES'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Caja Valores/Certificado'
            Width = 151
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_CONTABLE'
            Title.Alignment = taCenter
            Title.Caption = 'F. Contable'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE_CONTABLE'
            Title.Alignment = taCenter
            Title.Caption = 'Valuaci'#243'n PEPS'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESULTADO'
            Title.Alignment = taCenter
            Title.Caption = 'Resultado'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESIDUAL_COBRADO'
            Title.Caption = 'Residual Cobrado'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RETGANANCIAS'
            Title.Alignment = taCenter
            Title.Caption = 'Ret. Ganacias'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_SSN'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo SSN'
            Width = 69
            Visible = True
          end>
      end
    end
    object tsTenencia: TTabSheet
      Caption = 'Tenencia'
      ImageIndex = 2
      object GridTenencia: TArtDBGrid
        Left = 0
        Top = 0
        Width = 684
        Height = 286
        Align = alClient
        DataSource = dsTenencia
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = GridDblClick
        OnKeyDown = GridKeyDown
        IniStorage = FormStorage
        MultiSelect = True
        FooterBand = False
        OnPaintFooter = GridTenenciaPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_INSTRUMENTO'
            Title.Caption = 'Tipo Instrumento'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DENOMINACION'
            Title.Caption = 'Denominaci'#243'n'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODCAJAVALORES'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Caja Valores/Certificado'
            Width = 151
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimiento'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMINAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nominal'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESIDUAL'
            Title.Alignment = taCenter
            Title.Caption = 'Residual'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COTIZACION'
            Title.Alignment = taCenter
            Title.Caption = 'Cotizaci'#243'n'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALUACION_PEPS'
            Title.Alignment = taCenter
            Title.Caption = 'Valuaci'#243'n PEPS'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALUACION_CIERRE'
            Title.Alignment = taCenter
            Title.Caption = 'Valuaci'#243'n Cierre'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RXT'
            Title.Alignment = taCenter
            Title.Caption = 'Resultado por Tenencia'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTERES_DEVENGADO'
            Title.Alignment = taCenter
            Title.Caption = 'Inter'#233's Devengado'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REGULARIZADORA'
            Title.Alignment = taCenter
            Title.Caption = 'Regularizadora'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALUACION_CONTABLE'
            Title.Alignment = taCenter
            Title.Caption = 'Valuaci'#243'n Contable'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONEDA'
            Title.Alignment = taCenter
            Title.Caption = 'Moneda'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_SSN'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo SSN'
            Width = 69
            Visible = True
          end>
      end
    end
    object tsPlazosFijos: TTabSheet
      Caption = 'Plazos Fijos'
      ImageIndex = 3
      object GridPlazosFijos: TArtDBGrid
        Left = 0
        Top = 0
        Width = 684
        Height = 286
        Align = alClient
        DataSource = dsPlazosFijos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = GridDblClick
        OnKeyDown = GridKeyDown
        IniStorage = FormStorage
        MultiSelect = True
        FooterBand = False
        OnPaintFooter = GridPlazosFijosPaintFooter
        TitleHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO_INSTRUMENTO'
            Title.Caption = 'Tipo Instrumento'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CERTIFICADO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Caja Valores/Certificado'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSTITUCION'
            Title.Caption = 'Instituci'#243'n'
            Width = 158
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CONSTITUCION'
            Title.Alignment = taCenter
            Title.Caption = 'Constituci'#243'n'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAPITAL'
            Title.Alignment = taCenter
            Title.Caption = 'Capital'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TASA'
            Title.Alignment = taCenter
            Title.Caption = 'Tasa'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLAZO'
            Title.Alignment = taCenter
            Title.Caption = 'Plazo'
            Width = 89
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimiento'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INTERES'
            Title.Alignment = taCenter
            Title.Caption = 'Inter'#233's'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPUESTO'
            Title.Alignment = taCenter
            Title.Caption = 'Impuesto'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO'
            Title.Alignment = taCenter
            Title.Caption = 'Monto'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERACION'
            Title.Caption = 'Operaci'#243'n'
            Width = 135
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 79
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CONTABILIZADO'
            Title.Alignment = taCenter
            Title.Caption = 'Confirmado'
            Width = 60
            Visible = True
          end>
      end
    end
  end
  inherited pnlFiltros: TPanel [2]
    Width = 692
    Height = 127
    ExplicitWidth = 692
    ExplicitHeight = 127
    DesignSize = (
      692
      127)
    object gbTipoInstrumento: TGroupBox
      Left = 3
      Top = 1
      Width = 464
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo de Instrumento'
      TabOrder = 0
      DesignSize = (
        464
        43)
      inline fraTipoInstrumento: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 449
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 449
        DesignSize = (
          449
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 384
          ExplicitWidth = 384
        end
        inherited edCodigo: TPatternEdit
          OnChange = fraTipoInstrumentoedCodigoChange
        end
      end
    end
    object gbDenominacion: TGroupBox
      Left = 3
      Top = 44
      Width = 524
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Denominaci'#243'n'
      TabOrder = 2
      DesignSize = (
        524
        43)
      inline fraDenominacion: TfraCodigoDescripcion
        Left = 8
        Top = 14
        Width = 508
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 14
        ExplicitWidth = 508
        DesignSize = (
          508
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 443
          ExplicitWidth = 443
        end
      end
    end
    object gbVencimiento: TGroupBox
      Left = 470
      Top = 1
      Width = 220
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
      TabOrder = 1
      object Label1: TLabel
        Left = 103
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaDesde: TDateComboBox
        Left = 9
        Top = 15
        Width = 89
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 121
        Top = 15
        Width = 89
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbCodCajaValores: TGroupBox
      Left = 530
      Top = 44
      Width = 161
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'C'#243'd. Caja Valores / Certificado'
      TabOrder = 3
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
    object rgContabilizados: TRadioGroup
      Left = 3
      Top = 87
      Width = 190
      Height = 37
      Caption = 'Contabilizados'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 4
    end
    object chkDecimales: TCheckBox
      Left = 393
      Top = 108
      Width = 108
      Height = 17
      Caption = 'Solo 2 Decimales'
      TabOrder = 6
      OnClick = chkDecimalesClick
    end
    object rgConfirmados: TRadioGroup
      Left = 197
      Top = 87
      Width = 190
      Height = 37
      Caption = 'Confirmados'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Si'
        'No'
        'Todos')
      TabOrder = 5
    end
  end
  inherited CoolBar: TCoolBar [3]
    Top = 127
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 127
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbMarcarContabilizados: TToolButton
        Left = 370
        Top = 0
        Hint = 'Marcar Contabilizados'
        ImageIndex = 44
        OnClick = tbMarcarContabilizadosClick
      end
      object tbConfirmar: TToolButton
        Left = 393
        Top = 0
        Hint = 'Marcar Confirmados'
        Caption = 'tbConfirmar'
        ImageIndex = 29
        OnClick = tbConfirmarClick
      end
      object ToolButton1: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 424
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 48
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton7: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 455
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION INSTRUMEN' +
        'TO, TO_DESCRIPCION OPERACION, OI_FECHA FECHA,'
      
        '       OI_IMPORTENOMINAL NOMINAL, OI_IMPORTERESIDUAL RESIDUAL, O' +
        'I_PRECIO PRECIO, OI_ARANCEL ARANCEL, OI_MONTO MONTO,'
      
        '       BA_NOMBRE BANCO, ZCB.CB_NUMERO CUENTA, RCB.CB_DESCRIPCION' +
        ' PLAZO_LIQUIDACION, OI_FECHACUSTODIA FECHA_CUSTODIA,'
      
        '       IN_CODCAJAVALORES CODCAJAVALORES, OI_FECHACONTABLE FECHA_' +
        'CONTABLE, OI_ID ID,'
      
        '       ART.INVERSION.GET_COSTOOPERACION(OI_ID) IMPORTE_CONTABLE,' +
        ' TI_ID, IN_CODIGOSSN CODIGO_SSN,'
      
        '       CASE WHEN TO_SIGNO = -1 THEN NVL(OI_MONTO, 0)-ART.INVERSI' +
        'ON.GET_COSTOOPERACION(OI_ID) END RESULTADO'
      
        '  FROM RCB_CLEARINGBANCARIO RCB, ZBA_BANCO, ZCB_CUENTABANCARIA Z' +
        'CB, NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO,'
      '       NIN_INSTRUMENTO, NTI_TIPOINSTRUMENTO'
      ' WHERE TO_ID = OI_IDTIPOOPERACION'
      '   AND BA_ID(+) = CB_IDBANCO'
      '   AND ZCB.CB_ID(+) = OI_IDCUENTABANCARIA'
      '   AND RCB.CB_ID(+) = OI_PLAZOLIQUIDACION'
      '   AND IN_ID = OI_IDINSTRUMENTO'
      '   AND TI_ID = IN_IDTIPOINSTRUMENTO'
      '   AND OI_FECHABAJA IS NULL'
      '   AND IN_FECHABAJA IS NULL'
      '   AND 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
    Zoom = 85
    Options = [qoZoomPrint, qoZoomCalcFontSize]
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited FieldHider: TFieldHider
    SortDialog = nil
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
    Left = 110
    Top = 200
  end
  object sdqResultados: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqResultadosAfterOpen
    SQL.Strings = (
      
        'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_DESCRIPCION INSTRUMEN' +
        'TO, '#39'COBRO CUPON'#39' TIPO, CU_FECHACOBRADO FECHA, CU_NUMERO CUPON,'
      
        '       CU_VENCIMIENTO VENCIMIENTO, CU_INTERESCOBRADO INTERES, CU' +
        '_AMORTIZACIONCOBRADA AMORTIZACION,'
      
        '       CU_AMORTIZACIONCOBRADA + CU_INTERESCOBRADO IMPORTE, CU_AR' +
        'ANCEL ARANCEL,'
      
        '       CU_AMORTIZACIONCOBRADA + CU_INTERESCOBRADO - CU_ARANCEL -' +
        ' NVL(CU_RETGANANCIAS, 0) NETO, BA_NOMBRE BANCO, CB_NUMERO CUENTA' +
        ','
      
        '       IN_CODCAJAVALORES CODCAJAVALORES, CU_FECHACONTABLE FECHA_' +
        'CONTABLE, IN_CODIGOSSN CODIGO_SSN,'
      
        '       ART.INVERSION.GET_COSTOCOBROCUPON(CU_ID) * NVL(ART.INVERS' +
        'ION.GET_COTIZACIONMONEDA(IN_IDMONEDA, LAST_DAY(ADD_MONTHS(CU_FEC' +
        'HACOBRADO, -1))), 1) IMPORTE_CONTABLE,'
      
        '       CU_AMORTIZACIONCOBRADA-(ART.INVERSION.GET_COSTOCOBROCUPON' +
        '(CU_ID) * NVL(ART.INVERSION.GET_COTIZACIONMONEDA(IN_IDMONEDA, LA' +
        'ST_DAY(ADD_MONTHS(CU_FECHACOBRADO, -1))), 1)) RESULTADO,'
      
        '       CU_RESIDUAL RESIDUAL_COBRADO, CU_ID ID, NVL(CU_RETGANANCI' +
        'AS, 0) RETGANANCIAS, TI_ID'
      
        '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA, NIN_INSTRUMENTO, NCU_CUPON' +
        ', NTI_TIPOINSTRUMENTO'
      ' WHERE TI_ID = IN_IDTIPOINSTRUMENTO'
      '   AND IN_ID = CU_IDINSTRUMENTO'
      '   AND BA_ID(+) = CB_IDBANCO'
      '   AND CB_ID(+) = CU_IDCUENTABANCARIA'
      '   AND CU_FECHABAJA IS NULL'
      '   AND IN_FECHABAJA IS NULL'
      '   AND CU_FECHACOBRADO IS NOT NULL'
      '   AND 1 = 2'
      '')
    Left = 24
    Top = 312
  end
  object dsResultados: TDataSource
    DataSet = sdqResultados
    Left = 52
    Top = 312
  end
  object SortDialogResultados: TSortDialog
    Caption = 'Orden'
    AutoModifySql = False
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 80
    Top = 256
  end
  object SortDialogTenencia: TSortDialog
    Caption = 'Orden'
    AutoModifySql = False
    DataSet = sdqTenencia
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 108
    Top = 256
  end
  object sdqTenencia: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqTenenciaAfterOpen
    SQL.Strings = (
      
        'SELECT CODIGO, TIPO_INSTRUMENTO, DENOMINACION, CODCAJAVALORES, V' +
        'ENCIMIENTO, NOMINAL, RESIDUAL, COTIZACION,'
      
        '       VALUACION_PEPS, RESIDUAL * COTIZACION * MONEDA VALUACION_' +
        'CIERRE, (RESIDUAL * COTIZACION * MONEDA) - VALUACION_PEPS RXT,'
      
        '       INTERES_DEVENGADO, 0 REGULARIZADORA, (RESIDUAL * COTIZACI' +
        'ON * MONEDA) + INTERES_DEVENGADO VALUACION_CONTABLE,'
      '       TI_ID, IN_ID, IN_CODCAJAVALORES, MONEDA, CODIGO_SSN'
      
        '  FROM (SELECT IN_ID CODIGO, TI_DESCRIPCION TIPO_INSTRUMENTO, IN' +
        '_DESCRIPCION DENOMINACION,'
      
        '               IN_CODCAJAVALORES CODCAJAVALORES, IN_VENCIMIENTO ' +
        'VENCIMIENTO,'
      
        '               ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID, NVL(N' +
        'ULL, TRUNC(SYSDATE))) NOMINAL,'
      
        '               ART.INVERSION.GET_RESIDUALINSTRUMENTO(IN_ID, NVL(' +
        'NULL, TRUNC(SYSDATE))) RESIDUAL,'
      
        '               NVL(ART.INVERSION.GET_COTIZACIONINSTRUMENTO(IN_ID' +
        ', NVL(NULL, TRUNC(SYSDATE))), 1) COTIZACION,'
      
        '               NVL(ART.INVERSION.GET_COTIZACIONMONEDA(IN_IDMONED' +
        'A, NVL(NULL, TRUNC(SYSDATE))), 1) MONEDA,'
      
        '               ART.INVERSION.GET_RDOXTENENCIA(IN_ID, NVL(NULL, T' +
        'RUNC(SYSDATE)), '#39'V'#39') VALUACION_PEPS,'
      
        '               NVL(ART.INVERSION.GET_INTERESDEVENGADO(IN_ID, NVL' +
        '(NULL, TRUNC(SYSDATE))), 0) INTERES_DEVENGADO,'
      
        '               TI_ID, IN_ID, IN_CODCAJAVALORES, IN_CODIGOSSN COD' +
        'IGO_SSN'
      '          FROM NTI_TIPOINSTRUMENTO, NIN_INSTRUMENTO'
      '         WHERE TI_ID = IN_IDTIPOINSTRUMENTO'
      '           AND TI_PLAZOFIJO = '#39'N'#39
      '           AND IN_FECHABAJA IS NULL)'
      ' WHERE 1 = 2'
      '')
    Left = 24
    Top = 340
  end
  object dsTenencia: TDataSource
    DataSet = sdqTenencia
    Left = 52
    Top = 340
  end
  object sdqPlazosFijos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPlazosFijosAfterOpen
    SQL.Strings = (
      
        'SELECT TI_DESCRIPCION TIPO_INSTRUMENTO, IN_CODCAJAVALORES CERTIF' +
        'ICADO, NS_NOMBRE INSTITUCION, IN_CONSTITUCION CONSTITUCION,'
      
        '       ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) CAPITAL, IN_T' +
        'ASA TASA, IN_PLAZO PLAZO, IN_VENCIMIENTO VENCIMIENTO,'
      
        '       ROUND(ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) * IN_TA' +
        'SA / 100 * IN_PLAZO / 365, 2) INTERES, 0 IMPUESTO,'
      
        '       ART.INVERSION.GET_NOMINALINSTRUMENTO(IN_ID) + ROUND(ART.I' +
        'NVERSION.GET_NOMINALINSTRUMENTO(IN_ID) * IN_TASA / 100 * IN_PLAZ' +
        'O / 365, 2) MONTO,'
      
        '       TO_DESCRIPCION OPERACION, OI_FECHA FECHA, DECODE(OI_CONTA' +
        'BILIZADO, NULL, '#39'N'#39', '#39'S'#39') CONTABILIZADO,'
      '       OI_CONTABILIZADO CONTABILIZ'
      
        '  FROM RCB_CLEARINGBANCARIO RCB, ZBA_BANCO, ZCB_CUENTABANCARIA Z' +
        'CB, NTO_TIPOOPERACION, NOI_OPERACIONINSTRUMENTO,'
      '       NIN_INSTRUMENTO, NTI_TIPOINSTRUMENTO, NNS_INSTITUCION'
      'WHERE TO_ID = OI_IDTIPOOPERACION'
      '   AND BA_ID(+) = CB_IDBANCO'
      '   AND ZCB.CB_ID(+) = OI_IDCUENTABANCARIA'
      '   AND RCB.CB_ID(+) = OI_PLAZOLIQUIDACION'
      '   AND IN_ID = OI_IDINSTRUMENTO'
      '   AND TI_ID = IN_IDTIPOINSTRUMENTO'
      '   AND NS_ID = IN_IDINSTITUCION'
      '   AND OI_FECHABAJA IS NULL'
      '   AND IN_FECHABAJA IS NULL'
      '   AND TI_PLAZOFIJO = '#39'S'#39
      '   AND 1 = 2'
      '')
    Left = 23
    Top = 368
  end
  object dsPlazosFijos: TDataSource
    DataSet = sdqPlazosFijos
    Left = 52
    Top = 368
  end
  object SortDialogPlazosFijos: TSortDialog
    Caption = 'Orden'
    AutoModifySql = False
    DataSet = sdqPlazosFijos
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 138
    Top = 256
  end
end
