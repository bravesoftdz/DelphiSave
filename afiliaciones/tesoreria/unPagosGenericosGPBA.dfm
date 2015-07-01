inherited frmPagosGenericosGPBA: TfrmPagosGenericosGPBA
  Width = 560
  Height = 450
  Caption = 'Pagos Gen'#233'ricos GPBA'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 552
    Height = 44
    Visible = True
    object chkNoMostrarBajas: TCheckBox
      Left = 426
      Top = 26
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object gbFechaAprobado: TGroupBox
      Left = 2
      Top = 0
      Width = 207
      Height = 41
      Caption = 'Fecha Aprobado'
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
      object edFechaAprobadoDesde: TDateComboBox
        Left = 8
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaAprobadoHasta
        TabOrder = 0
      end
      object edFechaAprobadoHasta: TDateComboBox
        Left = 112
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaAprobadoDesde
        TabOrder = 1
      end
    end
    object gbFechaSeleccion: TGroupBox
      Left = 212
      Top = 0
      Width = 207
      Height = 41
      Caption = 'Fecha Selecci'#243'n'
      TabOrder = 1
      object Label2: TLabel
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
      object edFechaSeleccionDesde: TDateComboBox
        Left = 8
        Top = 14
        Width = 88
        Height = 21
        MaxDateCombo = edFechaSeleccionHasta
        TabOrder = 0
      end
      object edFechaSeleccionHasta: TDateComboBox
        Left = 112
        Top = 14
        Width = 88
        Height = 21
        MinDateCombo = edFechaSeleccionDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 44
    Width = 552
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 548
      end>
    inherited ToolBar: TToolBar
      Width = 535
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSeleccion: TToolButton
        Left = 370
        Top = 0
        Hint = 'Selecci'#243'n'
        ImageIndex = 9
        OnClick = tbSeleccionClick
      end
      object ToolButton2: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
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
    Top = 73
    Width = 552
    Height = 350
    Columns = <
      item
        Expanded = False
        FieldName = 'CONPAGO'
        Title.Caption = 'Concepto Pago'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_PAGO'
        Title.Caption = 'Grupo Pago'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BASE_ORIGEN'
        Title.Caption = 'Base Origen'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Alignment = taCenter
        Title.Caption = 'Estado'
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'F_FACTURA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Factura'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'F_CARGA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Carga'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'F_APROBACION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobaci'#243'n'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTO'
        Title.Alignment = taCenter
        Title.Caption = 'Costo'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT_PRESTADOR'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT Prestador'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_PRESTADOR'
        Title.Caption = 'Nombre Prestador'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_FACTURA'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Factura'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLANTE'
        Title.Alignment = taCenter
        Title.Caption = 'Volante'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Pago'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUAPRO'
        Title.Caption = 'Usuario Aprobado'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHASELECCION'
        Title.Alignment = taCenter
        Title.Caption = 'F. Selecci'#243'n'
        Width = 81
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 69
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 184
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT VG_CONPAGO CONPAGO, TB_DESCRIPCION GRUPO_PAGO, '#39'PM Generi' +
        'cos'#39' BASE_ORIGEN, SUBSTR(VO_ESTADO, 1, 1) ESTADO,'
      
        '       VO_FECHAFACTURA F_FACTURA, VO_FECHALTA F_CARGA, VO_FECHAP' +
        'AGO F_APROBACION, VG_IMPFACTURADO COSTO,'
      '       CA_CLAVE CUIT_PRESTADOR, CA_DESCRIPCION NOMBRE_PRESTADOR,'
      
        '       VO_FACTURATIPO || '#39'-'#39' || VO_FACTURAESTABLE || '#39'-'#39' || VO_F' +
        'ACTURANRO NUMERO_FACTURA, VO_VOLANTE VOLANTE,'
      '       VG_NUMPAGO NUMPAGO, VO_USUAPRO USUAPRO'
      
        '  FROM CTB_TABLAS, SCP_CONPAGO, CPR_PRESTADOR, SVG_VOL_GENERICO,' +
        ' SVO_VOLANTES, OGG_GPBAGENERICO'
      ' WHERE VG_VOLANTE = GG_VOLANTE'
      '   AND VG_NUMPAGO = GG_NUMPAGO'
      '   AND VO_VOLANTE = VG_VOLANTE'
      '   AND VO_PRESTADOR = CA_IDENTIFICADOR'
      '   AND VG_CONPAGO = CP_CONPAGO'
      '   AND TB_CLAVE = '#39'GGPBA'#39
      '   AND TB_CODIGO = CP_GRUPOGPBA'
      '   AND 1 = 2'
      '   ')
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
    Left = 108
    Top = 200
  end
end
