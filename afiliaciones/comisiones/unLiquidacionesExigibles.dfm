inherited frmLiquidacionesExigibles: TfrmLiquidacionesExigibles
  Left = 109
  Top = 125
  Width = 550
  Height = 400
  Caption = 'Liquidaciones Exigibles'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 550
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 542
    Height = 50
    object GroupBox3: TGroupBox
      Left = 3
      Top = 1
      Width = 258
      Height = 47
      Caption = 'Fecha'
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label3: TLabel
        Left = 134
        Top = 22
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaDesde: TDateComboBox
        Left = 39
        Top = 18
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 164
        Top = 18
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 50
    Width = 542
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 538
      end>
    inherited ToolBar: TToolBar
      Width = 525
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
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 24
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 25
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
    Top = 79
    Width = 542
    Height = 294
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDOINICIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Inicial'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIQUIDACIONES'
        Title.Alignment = taCenter
        Title.Caption = 'Liquidaciones'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETOS'
        Title.Alignment = taCenter
        Title.Caption = 'Ret. O.S.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETIB'
        Title.Alignment = taCenter
        Title.Caption = 'Ret. I.B.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETGCIAS'
        Title.Alignment = taCenter
        Title.Caption = 'Ret. Gcias.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETIVA'
        Title.Alignment = taCenter
        Title.Caption = 'Ret. IVA'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUES'
        Title.Alignment = taCenter
        Title.Caption = 'Cheques'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDOFINAL'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Final'
        Width = 80
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   cuit, nombre, comision.get_siliqsnoexigibles(cuit, :des' +
        'de) saldoinicial, ROUND(SUM(liquidacion), 2) liquidaciones,'
      
        '         ROUND(SUM(obrasocial), 2) retos, ROUND(SUM(ingbrutos), ' +
        '2) retib, ROUND(SUM(ganancias), 2) retgcias,'
      
        '         ROUND(SUM(retiva), 2) retiva, ROUND(SUM(cheque), 2) che' +
        'ques,'
      
        '         comision.get_siliqsnoexigibles(cuit, :desde) + ROUND(SU' +
        'M(liquidacion), 2)'
      
        '         -(ROUND(SUM(obrasocial), 2) + ROUND(SUM(ingbrutos), 2) ' +
        '+ ROUND(SUM(ganancias), 2) + ROUND(SUM(retiva), 2)'
      '           + ROUND(SUM(cheque), 2)) saldofinal'
      
        '    FROM (SELECT ve_cuit cuit, ve_nombre nombre, (lc_comision + ' +
        'lc_iva) * lf_monto /(lc_comision + lc_iva) liquidacion,'
      
        '                 lc_obrasocial * lf_monto /(lc_comision + lc_iva' +
        ') obrasocial,'
      
        '                 lc_ingbrutos * lf_monto /(lc_comision + lc_iva)' +
        ' ingbrutos,'
      
        '                 lc_ganancias * lf_monto /(lc_comision + lc_iva)' +
        ' ganancias, lc_retiva * lf_monto/(lc_comision + lc_iva) retiva, ' +
        '0 cheque'
      
        '            FROM xve_vendedor, xev_entidadvendedor, xfc_factura,' +
        ' xlf_liqfactura, xlc_liqcomision'
      '           WHERE ev_id = fc_identidadvend'
      '             AND ve_id = ev_idvendedor'
      '             AND fc_id = lf_idfactura'
      '             AND lc_id = lf_idliqcomision'
      '             AND lf_fechabaja IS NULL'
      '          UNION ALL'
      
        '          SELECT ve_cuit cuit, ve_nombre nombre, 0 liquidacion, ' +
        '-lc_obrasocial * lf_monto /(lc_comision + lc_iva) obrasocial,'
      
        '                 -lc_ingbrutos * lf_monto /(lc_comision + lc_iva' +
        ') ingbrutos,'
      
        '                 -lc_ganancias * lf_monto /(lc_comision + lc_iva' +
        ') ganancias,'
      
        '                 -lc_retiva * lf_monto /(lc_comision + lc_iva) r' +
        'etiva,'
      
        '                 (lc_comision + lc_iva) * lf_monto /(lc_comision' +
        ' + lc_iva) cheque'
      
        '            FROM rce_chequeemitido, xve_vendedor, xev_entidadven' +
        'dedor, xfc_factura, xlf_liqfactura, xlc_liqcomision'
      '           WHERE ev_id = fc_identidadvend'
      '             AND ve_id = ev_idvendedor'
      '             AND fc_id = lf_idfactura'
      '             AND lc_id = lf_idliqcomision'
      '             AND ce_id = fc_idchequeemitido'
      '             AND lf_fechabaja IS NULL)'
      'GROUP BY cuit, nombre')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'desde'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'desde'
        ParamType = ptInput
      end>
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
    Left = 108
    Top = 200
  end
end
