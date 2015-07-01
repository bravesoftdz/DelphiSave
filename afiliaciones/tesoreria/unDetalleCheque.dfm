inherited frmDetalleCheque: TfrmDetalleCheque
  Width = 560
  Height = 400
  Caption = 'Detalle del Cheque'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 560
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 552
    Height = 11
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 11
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
      ButtonWidth = 25
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Left = 25
      end
      inherited tbNuevo: TToolButton
        Left = 33
      end
      inherited tbModificar: TToolButton
        Left = 58
      end
      inherited tbEliminar: TToolButton
        Left = 83
      end
      inherited ToolButton4: TToolButton
        Left = 108
      end
      inherited tbPropiedades: TToolButton
        Left = 116
      end
      inherited ToolButton3: TToolButton
        Left = 141
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Left = 149
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        Left = 174
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Left = 199
      end
      inherited ToolButton6: TToolButton
        Left = 224
      end
      inherited tbImprimir: TToolButton
        Left = 232
      end
      inherited tbExportar: TToolButton
        Left = 257
      end
      inherited tbEnviarMail: TToolButton
        Left = 282
      end
      inherited ToolButton8: TToolButton
        Left = 307
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 315
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Left = 340
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 365
        Visible = False
      end
      inherited tbSalir: TToolButton
        Left = 373
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 398
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 423
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 431
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 40
    Width = 552
    Height = 333
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Title.Caption = 'N'#250'mero'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALLE'
        Title.Caption = 'Detalle'
        Width = 158
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
        FieldName = 'CONCEPTO_PAGO'
        Title.Caption = 'Concepto de Pago'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CONCEPTO_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Concepto Pago'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GBA'
        Title.Alignment = taCenter
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NROCHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. de Cheque'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Orden de Pago'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITOS'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bitos'
        Width = 70
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT '#39'Siniestro'#39' tipo, art.utiles.armar_siniestro(le_siniestro' +
        ', le_orden, le_recaida, '#39'/'#39') numero,'
      
        '       '#39'Trabajador: '#39' || tj_nombre || '#39' Empresa: '#39' || em_nombre ' +
        'detalle, le_numliqui liquidacion, cp_denpago concepto_pago,'
      '       le_imporperi importe, le_faprobado fecha_aprobado'
      
        '  FROM ctj_trabajador, aem_empresa, art.sex_expedientes, art.scp' +
        '_conpago, art.sle_liquiempsin'
      ' WHERE cp_conpago = le_conpago'
      '   AND ex_siniestro = le_siniestro'
      '   AND ex_orden = le_orden'
      '   AND ex_recaida = le_recaida'
      '   AND em_cuit = ex_cuit'
      '   AND tj_id = ex_idtrabajador'
      '   AND 1 = 2')
    Left = 28
    Top = 132
  end
  inherited dsConsulta: TDataSource
    Left = 56
    Top = 132
  end
  inherited SortDialog: TSortDialog
    Left = 28
    Top = 160
  end
  inherited ExportDialog: TExportDialog
    Left = 56
    Top = 160
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
    Left = 56
    Top = 188
  end
  inherited Seguridad: TSeguridad
    Left = 28
    Top = 104
  end
  inherited FormStorage: TFormStorage
    Left = 56
    Top = 104
  end
  inherited PrintDialog: TPrintDialog
    Left = 28
    Top = 188
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
    Left = 84
    Top = 104
  end
  inherited FieldHider: TFieldHider
    Left = 84
    Top = 132
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
    Left = 112
    Top = 104
  end
end
