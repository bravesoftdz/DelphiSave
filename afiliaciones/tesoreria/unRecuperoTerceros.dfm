inherited frmRecuperoTerceros: TfrmRecuperoTerceros
  Left = 197
  Top = 233
  Width = 690
  Height = 350
  Caption = 'Recupero de Terceros'
  Constraints.MinHeight = 350
  Constraints.MinWidth = 690
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 682
    Height = 91
    Caption = '  '
    DesignSize = (
      682
      91)
    object gbEmpresa: TGroupBox
      Left = 3
      Top = 0
      Width = 549
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa '
      TabOrder = 0
      DesignSize = (
        549
        44)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 15
        Width = 531
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
        TabOrder = 0
        DesignSize = (
          531
          21)
        inherited lbContrato: TLabel
          Left = 427
        end
        inherited edContrato: TIntEdit
          Left = 474
        end
        inherited cmbRSocial: TArtComboBox
          Width = 292
        end
      end
    end
    object gbSiniestro: TGroupBox
      Left = 556
      Top = 0
      Width = 122
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Siniestro'
      TabOrder = 1
      object edSiniestro: TSinEdit
        Left = 9
        Top = 17
        Width = 104
        Height = 21
        TabOrder = 0
        ViewStyle = [etSiniestro, etOrden]
      end
    end
    object gbFecha: TGroupBox
      Left = 467
      Top = 44
      Width = 212
      Height = 44
      Anchors = [akTop, akRight]
      Caption = 'Fecha Recibo'
      TabOrder = 3
      object Label1: TLabel
        Left = 101
        Top = 21
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object edFechaDesde: TDateComboBox
        Left = 9
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 117
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbHolding: TGroupBox
      Left = 3
      Top = 44
      Width = 461
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Holding'
      TabOrder = 2
      DesignSize = (
        461
        44)
      inline fraHolding: TfraCodDesc
        Left = 8
        Top = 14
        Width = 448
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          448
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 383
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'GE_FECHABAJA'
          FieldCodigo = 'GE_CODIGO'
          FieldDesc = 'GE_DESCRIPCION'
          FieldID = 'GE_ID'
          IdType = ctInteger
          ShowBajas = True
          TableName = 'AGE_GRUPOECONOMICO'
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 91
    Width = 682
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 678
      end>
    inherited ToolBar: TToolBar
      Width = 665
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 120
    Width = 682
    Height = 203
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHARECIBO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Recibo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NRORECIBO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Recibo'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 258
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROCHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Cheque'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VENCIMIENTOCHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Vencim. Cheque'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVORECHAZO'
        Title.Caption = 'Motivo Rechazo'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROPLAN'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Plan'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROCUOTA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Cuota'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPOECONOMICO'
        Title.Caption = 'Holding'
        Width = 160
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT RV_FECHA FECHARECIBO, TO_CHAR(RV_SERIE, '#39'FM0999'#39') || '#39'-'#39' ' +
        '|| TO_CHAR(RV_NUMERO, '#39'FM09999999'#39') NRORECIBO,'
      
        '       RS_SINIESTRO SINIESTRO, RS_ORDEN ORDEN, EM_CUIT CUIT, EM_' +
        'NOMBRE EMPRESA, CO_CONTRATO CONTRATO, '
      
        '       TJ_CUIL CUIL, TJ_NOMBRE TRABAJADOR, TV_DESCRIPCION TIPO, ' +
        'VA_IMPORTE IMPORTE, VA_NROCHEQUE NROCHEQUE, '
      
        '       VA_VENCIMIENTO VENCIMIENTOCHEQUE, EST.TB_DESCRIPCION ESTA' +
        'DO, MRECH.TB_DESCRIPCION MOTIVORECHAZO, '
      
        '       XP_ID NROPLAN, XC_NROCUOTA NROCUOTA, GE_DESCRIPCION GRUPO' +
        'ECONOMICO'
      
        '  FROM AGE_GRUPOECONOMICO, AEM_EMPRESA, ACO_CONTRATO, CTJ_TRABAJ' +
        'ADOR, ART.SEX_EXPEDIENTES, '
      
        '       ART.LRS_RECUPEROSINIESTROS, LXP_RECUPEROPLAN, LXC_RECUPER' +
        'OCUOTA, RRV_RECIBOVALOR, LXV_RECUPEROVALOR, '
      
        '       ZVA_VALOR, ZBA_BANCO, OTV_TIPOVALOR, ART.CTB_TABLAS EST, ' +
        'ART.CTB_TABLAS MRECH'
      ' WHERE XC_ID = XV_IDCUOTA'
      '   AND XP_ID = XC_IDPLANPAGO'
      '   AND RS_ID = XP_IDRECUPEROSINIESTRO'
      '   AND TJ_ID = EX_IDTRABAJADOR'
      '   AND EM_ID = CO_IDEMPRESA'
      '   AND EM_IDGRUPOECONOMICO = GE_ID(+)'
      '   AND CO_CONTRATO = EX_CONTRATO'
      '   AND EX_SINIESTRO = RS_SINIESTRO'
      '   AND EX_ORDEN = RS_ORDEN'
      '   AND EX_RECAIDA = 0'
      '   AND VA_IDBANCO = BA_ID(+)'
      '   AND VA_IDTIPOVALOR = TV_ID'
      '   AND MRECH.TB_CLAVE(+) = '#39'MRECH'#39
      '   AND VA_MOTIVORECHAZO = MRECH.TB_CODIGO(+)'
      '   AND EST.TB_CLAVE = '#39'ESVAL'#39
      '   AND VA_ESTADO = EST.TB_CODIGO'
      '   AND VA_ID = XV_IDVALOR'
      '   AND XV_IDRECIBO = RV_ID'
      '   AND XV_FECHABAJA IS NULL'
      '   AND 1 = 2 ')
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
end
