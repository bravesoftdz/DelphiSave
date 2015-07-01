inherited frmConsultaPagosGPBA: TfrmConsultaPagosGPBA
  Left = 175
  Top = 179
  Width = 600
  Height = 400
  Caption = 'Consulta de Pagos GPBA'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 44
    object gbFecha: TGroupBox
      Left = 4
      Top = 1
      Width = 207
      Height = 41
      Caption = 'Fecha'
      TabOrder = 0
      object Label1: TLabel
        Left = 98
        Top = 18
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edFechaDesde: TDateComboBox
        Left = 8
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 112
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 44
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbCargarTabla: TToolButton
        Left = 370
        Top = 0
        Hint = 'Cargar Tabla'
        ImageIndex = 22
        OnClick = tbCargarTablaClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 401
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 424
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 432
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 73
    Width = 592
    Height = 300
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Recaida'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUAPROBADO'
        Title.Caption = 'Usuario Aprobado'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAAPROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUICIOS'
        Title.Caption = 'Juicios'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIE10'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCCIE10'
        Title.Caption = 'Descripci'#243'n CIE10'
        Width = 144
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIL'
        Title.Alignment = taCenter
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 131
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
        FieldName = 'ORGANISMO'
        Title.Caption = 'Organismo'
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAACCIDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Accidente'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADENUNCIA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Denuncia'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONPAGO'
        Title.Caption = 'Concepto Pago'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPOPAGO'
        Title.Caption = 'Grupo Pago'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASEORIGEN'
        Title.Caption = 'Base Origen'
        Width = 79
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
        FieldName = 'FECHAFACTURA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Factura'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACARGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Desde'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Hasta'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMULA'
        Title.Caption = 'F'#243'rmula'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDADO'
        Title.Alignment = taCenter
        Title.Caption = 'Liquidado'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRIBUCIONES'
        Title.Alignment = taCenter
        Title.Caption = 'Contribuciones'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APORTES'
        Title.Alignment = taCenter
        Title.Caption = 'Aportes'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTO'
        Title.Alignment = taCenter
        Title.Caption = 'Costo'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUITPRESTADOR'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT Prest.'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREPRESTADOR'
        Title.Caption = 'Nombre Prestador'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDACION'
        Title.Alignment = taCenter
        Title.Caption = 'Liquidaci'#243'n'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Volante'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACTURA'
        Title.Alignment = taCenter
        Title.Caption = 'Factura'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOACREEDOR'
        Title.Caption = 'Tipo Acreedor'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDENPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Orden Pago'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Cheque'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cheque'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHADEBITADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Debitado'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHAEXIGIBLE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Exigible'
        Width = 77
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      '/* SINIESTROS DEL PERIODO */'
      
        'SELECT GP_SINIESTRO, GP_ORDEN, GP_RECAIDA, GP_USUAPROBADO, GP_FE' +
        'CHAAPROBADO, GP_JUICIOS, GP_CIE10,'
      
        '       GP_DESCCIE10, GP_CUIL, GP_TRABAJADOR, GP_CUIT, GP_ORGANIS' +
        'MO, GP_FECHAACCIDENTE, GP_FECHADENUNCIA,'
      
        '       GP_CONPAGO, GP_GRUPOPAGO, GP_BASEORIGEN, GP_ESTADO, GP_FE' +
        'CHAFACTURA, GP_FECHACARGA, GP_FECHADESDE,'
      
        '       GP_FECHAHASTA, GP_FORMULA, GP_LIQUIDADO, GP_CONTRIBUCIONE' +
        'S, GP_APORTES, GP_COSTO, GP_CUITPRESTADOR,'
      
        '       GP_NOMBREPRESTADOR, GP_LIQUIDACION, GP_VOLANTE, GP_FACTUR' +
        'A, GP_TIPOACREEDOR, GP_ORDENPAGO, GP_CHEQUE,'
      '       GP_FECHACHEQUE, GP_FECHADEBITADO, GP_FECHAEXIGIBLE'
      '  FROM V_OGP_GPBAPAGO, ACTUARIAL.SSG_STOCK_SINIESTROS_GBA'
      ' WHERE GP_SINIESTRO = SG_SINIESTRO'
      '   AND GP_ORDEN = SG_ORDEN'
      '   AND GP_RECAIDA = SG_RECAIDA'
      '   AND NVL(SG_FECHABAJA, SYSDATE) > GP_FECHAAPROBADO'
      '   AND 1 = 2'
      'UNION ALL'
      '/* BAJAS */'
      
        'SELECT GP_SINIESTRO, GP_ORDEN, GP_RECAIDA, GP_USUAPROBADO, GP_FE' +
        'CHAAPROBADO, GP_JUICIOS, GP_CIE10,'
      
        '       GP_DESCCIE10, GP_CUIL, GP_TRABAJADOR, GP_CUIT, GP_ORGANIS' +
        'MO, GP_FECHAACCIDENTE, GP_FECHADENUNCIA,'
      
        '       GP_CONPAGO, GP_GRUPOPAGO, GP_BASEORIGEN, GP_ESTADO, GP_FE' +
        'CHAFACTURA, GP_FECHACARGA, GP_FECHADESDE,'
      
        '       GP_FECHAHASTA, GP_FORMULA, GP_LIQUIDADO, GP_CONTRIBUCIONE' +
        'S, GP_APORTES, -GP_COSTO, GP_CUITPRESTADOR,'
      
        '       GP_NOMBREPRESTADOR, GP_LIQUIDACION, GP_VOLANTE, GP_FACTUR' +
        'A, GP_TIPOACREEDOR, GP_ORDENPAGO, GP_CHEQUE,'
      '       GP_FECHACHEQUE, GP_FECHADEBITADO, GP_FECHAEXIGIBLE'
      '  FROM V_OGP_GPBAPAGO, ACTUARIAL.SSG_STOCK_SINIESTROS_GBA'
      ' WHERE GP_SINIESTRO = SG_SINIESTRO'
      '   AND GP_ORDEN = SG_ORDEN'
      '   AND GP_RECAIDA = SG_RECAIDA'
      '   AND NVL(SG_FECHABAJA, SYSDATE) > GP_FECHAAPROBADO'
      '   AND 1 = 2'
      'UNION ALL'
      '/* ALTA DE SINIESTROS ANTERIORES */'
      
        'SELECT GP_SINIESTRO, GP_ORDEN, GP_RECAIDA, GP_USUAPROBADO, GP_FE' +
        'CHAAPROBADO, GP_JUICIOS, GP_CIE10,'
      
        '       GP_DESCCIE10, GP_CUIL, GP_TRABAJADOR, GP_CUIT, GP_ORGANIS' +
        'MO, GP_FECHAACCIDENTE, GP_FECHADENUNCIA,'
      
        '       GP_CONPAGO, GP_GRUPOPAGO, GP_BASEORIGEN, GP_ESTADO, GP_FE' +
        'CHAFACTURA, GP_FECHACARGA, GP_FECHADESDE,'
      
        '       GP_FECHAHASTA, GP_FORMULA, GP_LIQUIDADO, GP_CONTRIBUCIONE' +
        'S, GP_APORTES, GP_COSTO, GP_CUITPRESTADOR,'
      
        '       GP_NOMBREPRESTADOR, GP_LIQUIDACION, GP_VOLANTE, GP_FACTUR' +
        'A, GP_TIPOACREEDOR, GP_ORDENPAGO, GP_CHEQUE,'
      '       GP_FECHACHEQUE, GP_FECHADEBITADO, GP_FECHAEXIGIBLE'
      '  FROM V_OGP_GPBAPAGO, ACTUARIAL.SSG_STOCK_SINIESTROS_GBA'
      ' WHERE GP_SINIESTRO = SG_SINIESTRO'
      '   AND GP_ORDEN = SG_ORDEN'
      '   AND GP_RECAIDA = SG_RECAIDA'
      '   AND NVL(SG_FECHABAJA, SYSDATE) > GP_FECHAAPROBADO'
      '   AND SG_SITUACION <> '#39'P'#39
      '   AND 1 = 2'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLegal
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
    Left = 110
    Top = 200
  end
end
