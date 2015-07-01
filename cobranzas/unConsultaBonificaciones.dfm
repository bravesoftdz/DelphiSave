inherited frmConsultaBonificaciones: TfrmConsultaBonificaciones
  Left = 276
  Top = 218
  Caption = 'Consulta de Bonificaciones'
  ClientHeight = 470
  ClientWidth = 692
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  OldCreateOrder = True
  ExplicitLeft = 276
  ExplicitTop = 218
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid [0]
    AlignWithMargins = True
    Left = 3
    Top = 79
    Width = 686
    Height = 388
    Columns = <
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DENOMINACION'
        Title.Caption = 'Denominaci'#243'n'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIODO'
        Title.Alignment = taCenter
        Title.Caption = 'Periodo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTA_EMITIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Cuota Emitida'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE_BONIFICACION'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Bonificaci'#243'n'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTA_PROMEDIO_ANUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Cuota Promedio Anual'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BONIFICACION_ACUMULADA'
        Title.Alignment = taCenter
        Title.Caption = 'Bonificaci'#243'n Acumulada'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_BONIFICADO'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Bonificado'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Observaciones'
        Width = 258
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AUTORIZADO'
        Title.Alignment = taCenter
        Title.Caption = 'Autorizado'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUTORIZA'
        Title.Caption = 'Autoriza'
        Width = 143
        Visible = True
      end>
  end
  object pgGrillas: TPageControl [1]
    Left = 0
    Top = 76
    Width = 692
    Height = 394
    ActivePage = tsPlanesPago
    Align = alClient
    TabOrder = 3
    OnChange = pgGrillasChange
    ExplicitHeight = 397
    object tsCapital: TTabSheet
      Caption = 'Capital'
    end
    object tsPlanesPago: TTabSheet
      Caption = 'Planes de Pago'
      ImageIndex = 1
      ExplicitHeight = 369
      object GridPlanesPago: TArtDBGrid
        Left = 0
        Top = 0
        Width = 684
        Height = 366
        Align = alClient
        DataSource = dsPlanesPago
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
        FooterBand = False
        TitleHeight = 17
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FECHA_APROBADO'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATO'
            Title.Alignment = taCenter
            Title.Caption = 'Contrato'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODREG'
            Title.Alignment = taCenter
            Title.Caption = 'R'#233'g.'
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CUIT'
            Title.Alignment = taCenter
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DENOMINACION'
            Title.Caption = 'Denominaci'#243'n'
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Title.Caption = 'Estado'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLAN_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Plan Pago'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEUDA_CUOTA_NOMINAL'
            Title.Alignment = taCenter
            Title.Caption = 'Deuda Cuota Nominal'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INT_MORA'
            Title.Alignment = taCenter
            Title.Caption = 'Inter'#233's Mora'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INT_FIN'
            Title.Alignment = taCenter
            Title.Caption = 'Inter'#233's Financiaci'#243'n'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_INT_MORA'
            Title.Alignment = taCenter
            Title.Caption = 'Descuento Inter'#233's Mora'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_INT_FIN'
            Title.Alignment = taCenter
            Title.Caption = 'Descuento Inter'#233's Financiaci'#243'n'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Title.Caption = 'Observaciones'
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUOTAS'
            Title.Alignment = taCenter
            Title.Caption = 'Cuotas'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AUTORIZA'
            Title.Caption = 'Autoriza'
            Width = 184
            Visible = True
          end>
      end
    end
  end
  inherited pnlFiltros: TPanel [2]
    Width = 692
    Height = 47
    ExplicitWidth = 692
    ExplicitHeight = 47
    object gbVencimiento: TGroupBox
      Left = 6
      Top = 1
      Width = 220
      Height = 43
      Caption = 'Fecha'
      TabOrder = 0
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
    object gbDirectorio: TGroupBox
      Left = 230
      Top = 1
      Width = 103
      Height = 43
      TabOrder = 1
      object chkDirectorio: TCheckBox
        Left = 16
        Top = 19
        Width = 73
        Height = 13
        Caption = 'Directorio'
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar [3]
    Top = 47
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 47
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Left = 11
      Width = 677
      ExplicitLeft = 11
      ExplicitWidth = 677
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
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
        Visible = False
        ExplicitLeft = 331
      end
      inherited ToolButton11: TToolButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT FECHA, CONTRATO, CUIT, DENOMINACION, ESTADO, PERIODO, CUO' +
        'TA_EMITIDA, IMPORTE_BONIFICACION, CUOTA_PROMEDIO_ANUAL,'
      
        '       BONIFICACION_ACUMULADA, BONIFICACION_ACUMULADA / CUOTA_PR' +
        'OMEDIO_ANUAL PORC_BONIFICADO, OBS, AUTORIZADO, AUTORIZA'
      '  FROM (SELECT EB_IDEMPRESA EMPRESA_TOT,'
      
        '               SUM(EB_FIJOCUOTA*(ART.UTILES.PERIODOS_CONTARCANTI' +
        'DAD(EB_PERIODOVIGENCIADESDE, EB_PERIODOVIGENCIAHASTA) + 1)) BONI' +
        'FICACION_ACUMULADA'
      '          FROM EMI.IEB_EMPRESABONIFICACION'
      '         WHERE EB_FECHABAJA IS NULL'
      '           AND EB_TIPOBONIFICACION = '#39'F'#39
      '           AND EB_FIJOCUOTA > 0'
      '           AND 1 = 2'
      '         GROUP BY EB_IDEMPRESA),'
      
        '       (SELECT EM_ID EMPRESA_DET, RC_CONTRATO CONTRATO, EM_CUIT ' +
        'CUIT, EM_NOMBRE DENOMINACION, RC_PERIODO PERIODO,'
      
        '               ART.DISCOVERER.GET_DESCRIPCIONCODIGO(CO_ESTADO, '#39 +
        'AFEST'#39') ESTADO, TRUNC(EB_FECHAALTA) FECHA,'
      
        '               ART.DEUDA.GET_CUOTAPROMEDIO(RC_CONTRATO, EB_PERIO' +
        'DOVIGENCIAHASTA, '#39'N'#39') CUOTA_PROMEDIO_ANUAL,'
      '               RC_DEVENGADOCUOTA + CASE'
      
        '                 WHEN EB_FECHAAUTORIZA IS NOT NULL THEN EB_FIJOC' +
        'UOTA'
      '                 ELSE 0'
      
        '               END CUOTA_EMITIDA, EB_FIJOCUOTA IMPORTE_BONIFICAC' +
        'ION, EB_OBSERVACIONES OBS,'
      
        '               DECODE(EB_FECHAAUTORIZA, NULL, '#39'NO'#39', '#39'SI'#39') AUTORI' +
        'ZADO,'
      
        '               SE_NOMBRE || '#39' ('#39' || ART.DISCOVERER.GET_DESCRIPCI' +
        'ONCODIGO(SE_CARGO, '#39'USCAR'#39') || '#39')'#39' AUTORIZA'
      
        '          FROM ART.USE_USUARIOS, EMI.IEB_EMPRESABONIFICACION, AE' +
        'M_EMPRESA, ACO_CONTRATO, ZRC_RESUMENCOBRANZA'
      '         WHERE EM_ID = EB_IDEMPRESA'
      '           AND EM_ID = CO_IDEMPRESA'
      '           AND CO_CONTRATO = RC_CONTRATO'
      '           AND EB_USUAUTORIZA = SE_USUARIO'
      
        '           AND RC_PERIODO BETWEEN EB_PERIODOVIGENCIADESDE AND EB' +
        '_PERIODOVIGENCIAHASTA'
      '           AND EB_FECHABAJA IS NULL'
      '           AND EB_TIPOBONIFICACION = '#39'F'#39
      '           AND EB_FIJOCUOTA > 0'
      
        '           AND ART.DEUDA.GET_CUOTAPROMEDIO(RC_CONTRATO, EB_PERIO' +
        'DOVIGENCIAHASTA, '#39'N'#39') > 0'
      '           AND 1 = 2)'
      ' WHERE EMPRESA_DET = EMPRESA_TOT'
      '   AND 1 = 2'
      '')
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
        LinkControl = tbSalir
      end>
    Left = 110
    Top = 200
  end
  object sdqPlanesPago: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqPlanesPagoAfterOpen
    SQL.Strings = (
      
        'SELECT CO_CONTRATO CONTRATO, EM_CUIT CUIT, EM_NOMBRE DENOMINACIO' +
        'N, PP_ID PLAN_PAGO, PP_FECHAAPROBADO FECHA_APROBADO,'
      
        '       ART.DISCOVERER.GET_DESCRIPCIONCODIGO(CO_ESTADO, '#39'AFEST'#39') ' +
        'ESTADO, AP_MONTODEUDA DEUDA_CUOTA_NOMINAL, INT_MORA, INT_FIN,'
      
        '       INT_MORA *(AP_QUITAINTMORAFINANC + AP_QUITAINTMORACONT) /' +
        ' 100 DESC_INT_MORA, AP_QUITAINTFINANC DESC_INT_FIN,'
      '       PP_OBSERVACIONES OBS, CUOTAS,'
      
        '       SE_NOMBRE || '#39' ('#39' || ART.DISCOVERER.GET_DESCRIPCIONCODIGO' +
        '(SE_CARGO, '#39'USCAR'#39') || '#39')'#39' AUTORIZA'
      '  FROM (SELECT PD_IDPLANPAGO, SUM(PD_INTERESMORA) INT_MORA'
      '          FROM ZPD_PLANDEUDA'
      '         WHERE 1 = 2'
      '         GROUP BY PD_IDPLANPAGO),'
      
        '       (SELECT PC_IDPLANPAGO, SUM(PC_INTERESFINANC) INT_FIN, COU' +
        'NT(*) - 1 CUOTAS'
      '          FROM ZPC_PLANCUOTA'
      '         WHERE 1 = 2'
      '        GROUP BY PC_IDPLANPAGO),'
      
        '       ART.USE_USUARIOS, ZAP_AUTORIZACIONPLAN, ZPP_PLANPAGO, ACO' +
        '_CONTRATO, AEM_EMPRESA'
      ' WHERE PP_ID = AP_IDPLAN'
      '   AND PP_ID = PD_IDPLANPAGO'
      '   AND PP_ID = PC_IDPLANPAGO'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND CO_CONTRATO = PP_CONTRATO'
      '   AND PP_USUAPROBADO = SE_USUARIO'
      '   AND 1 = 2'
      '   ')
    Left = 24
    Top = 312
  end
  object dsPlanesPago: TDataSource
    DataSet = sdqPlanesPago
    Left = 52
    Top = 312
  end
  object SortDialogPlanesPago: TSortDialog
    Caption = 'Orden'
    AutoModifySql = False
    DataSet = sdqPlanesPago
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 80
    Top = 256
  end
  object mnuImprimir: TPopupMenu
    Left = 108
    Top = 256
    object mnuImprimirReporte: TMenuItem
      Caption = 'Imprimir Reporte'
      OnClick = mnuImprimirReporteClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
  end
end
