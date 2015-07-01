inherited frmListCuentaCorriente: TfrmListCuentaCorriente
  Left = 58
  Top = 145
  Width = 680
  Height = 400
  Caption = 'Cuentas Corrientes'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 680
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 672
    Height = 97
    DesignSize = (
      672
      97)
    object gbFecha: TGroupBox
      Left = 4
      Top = 3
      Width = 258
      Height = 47
      Caption = 'Fecha de Alta'
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
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
    object gbConcepto: TGroupBox
      Left = 4
      Top = 50
      Width = 389
      Height = 46
      Caption = 'Concepto'
      TabOrder = 2
      inline fraConcepto: TfraCodigoDescripcion
        Left = 8
        Top = 17
        Width = 373
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 308
        end
      end
    end
    object gbVendedor: TGroupBox
      Left = 266
      Top = 3
      Width = 403
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendedor'
      TabOrder = 1
      DesignSize = (
        403
        47)
      inline fraVendedores1: TfraVendedoresCUIT
        Left = 3
        Top = 17
        Width = 392
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 119
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 97
    Width = 672
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 668
      end>
    inherited ToolBar: TToolBar
      Width = 655
      inherited tbNuevo: TToolButton
        Enabled = False
      end
      inherited tbPropiedades: TToolButton
        Enabled = False
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Enabled = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Enabled = False
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 126
    Width = 672
    Height = 247
    Columns = <
      item
        Expanded = False
        FieldName = 'idcc'
        Title.Alignment = taCenter
        Title.Caption = 'ID Cta Cte'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_alta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha_baja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fecha'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vendedor'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Vendedor'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre'
        Title.Caption = 'Nombre'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cuit'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'concepto'
        Title.Caption = 'Concepto'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_comprobante'
        Title.Caption = 'Tipo Comprobante'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nro_comprobante'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Comprob.'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'debito'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bito'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'credito'
        Title.Alignment = taCenter
        Title.Caption = 'Cr'#233'dito'
        Width = 68
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT cc_id idcc, cc_fechaalta fecha_alta, cc_fechabaja fecha_b' +
        'aja,'
      
        '       cc_fecha fecha, ve_vendedor vendedor, ve_nombre nombre, v' +
        'e_cuit cuit,'
      
        '       cc_concepto concepto, cc_tipocomprobante tipo_comprobante' +
        ','
      '       cc_nrocomprobante nro_comprobante, cc_debito debito,'
      '       cc_credito credito'
      '  FROM xve_vendedor,'
      '       (SELECT cc_id cc_id, cc_identidad cc_identidad,'
      
        '               cc_idvendedor cc_idvendedor, cc_identvend cc_iden' +
        'tvend,'
      '               lc_fechaliq cc_fecha, co_descripcion cc_concepto,'
      '               cc_idconcepto, '#39'Liquidaci'#243'n'#39' cc_tipocomprobante,'
      '               cc_idliquidacion cc_nrocomprobante,'
      '               DECODE (co_signo, -1, cc_importe, 0) cc_debito,'
      '               DECODE (co_signo, 1, cc_importe, 0) cc_credito,'
      '               cc_detalle cc_detalle, cc_fechaalta, cc_fechabaja'
      
        '          FROM xlc_liqcomision, xco_concepto, xcc_cuentacorrient' +
        'e'
      
        '         WHERE co_id = cc_idconcepto AND lc_id = cc_idliquidacio' +
        'n'
      '        UNION ALL'
      '        SELECT cc_id cc_id, cc_identidad cc_identidad,'
      
        '               cc_idvendedor cc_idvendedor, cc_identvend cc_iden' +
        'tvend,'
      
        '               ce_fechacheque cc_fecha, co_descripcion cc_concep' +
        'to,'
      '               cc_idconcepto, ce_metodopago cc_tipocomprobante,'
      '               ce_numero cc_nrocomprobante,'
      '               DECODE (co_signo, -1, cc_importe, 0) cc_debito,'
      '               DECODE (co_signo, 1, cc_importe, 0) cc_credito,'
      '               cc_detalle cc_detalle, cc_fechaalta, cc_fechabaja'
      
        '          FROM rce_chequeemitido, xco_concepto, xcc_cuentacorrie' +
        'nte'
      
        '         WHERE co_id = cc_idconcepto AND ce_id = cc_idchequeemit' +
        'ido)'
      ' WHERE ve_id = cc_idvendedor')
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
end
