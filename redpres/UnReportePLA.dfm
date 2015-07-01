inherited frmReportePLA: TfrmReportePLA
  Left = 520
  Top = 189
  Caption = 'Reporte PLA'
  ClientHeight = 319
  ClientWidth = 503
  Scaled = False
  ExplicitLeft = 520
  ExplicitTop = 189
  ExplicitWidth = 511
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 503
    Height = 42
    ExplicitWidth = 503
    ExplicitHeight = 42
    object gbFecha: TGroupBox
      Left = 0
      Top = -1
      Width = 192
      Height = 42
      Caption = 'Fecha'
      TabOrder = 0
      object Label1: TLabel
        Left = 90
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Serif'
        Font.Style = []
        ParentFont = False
      end
      object dcFecDesde: TDateComboBox
        Left = 3
        Top = 16
        Width = 85
        Height = 21
        MaxDateCombo = dcFecHasta
        TabOrder = 0
      end
      object dcFecHasta: TDateComboBox
        Left = 104
        Top = 15
        Width = 85
        Height = 21
        MinDateCombo = dcFecDesde
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 195
      Top = 0
      Width = 135
      Height = 41
      Caption = 'Monto superior a'
      TabOrder = 1
      object ceMonto: TCurrencyEdit
        Left = 7
        Top = 14
        Width = 118
        Height = 21
        Margins.Left = 1
        Margins.Top = 1
        TabOrder = 0
        Value = 50000.000000000000000000
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 42
    Width = 503
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 499
      end>
    ExplicitTop = 42
    ExplicitWidth = 503
    inherited ToolBar: TToolBar
      Width = 490
      ExplicitWidth = 490
      inherited tbImprimir: TToolButton
        DropdownMenu = pmImprimir
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
        Left = 354
        ExplicitLeft = 354
      end
      inherited tbSalir: TToolButton
        Left = 362
        ExplicitLeft = 362
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 71
    Width = 503
    Height = 248
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   ca_clave cuit, ca_descripcion descripcion, SUM(art.ameb' +
        'pba.get_montopagado(vo_volante)) monto'
      '    FROM art.svo_volantes, art.cpr_prestador'
      '   WHERE ca_identificador = vo_prestador'
      '     AND vo_fechapago BETWEEN :desde AND :hasta'
      'GROUP BY ca_clave, ca_descripcion'
      
        '  HAVING SUM(art.amebpba.get_montopagado(vo_volante)) >= :monto ' +
        ' --50000'
      'ORDER BY SUM(art.amebpba.get_montopagado(vo_volante)) DESC')
    ParamData = <
      item
        DataType = ftDate
        Name = 'desde'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'hasta'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'monto'
        ParamType = ptInput
      end>
    object sdqConsultaCUIT: TStringField
      FieldName = 'CUIT'
      Required = True
      Size = 11
    end
    object sdqConsultaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 150
    end
    object sdqConsultaMONTO: TFloatField
      FieldName = 'MONTO'
    end
  end
  inherited QueryPrint: TQueryPrint
    Title.Text = 'Reporte PLA'
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 80
    Top = 260
  end
  object pmImprimir: TPopupMenu
    Left = 72
    Top = 144
    object mnuImprimirGrilla: TMenuItem
      Caption = 'Imprimir Grilla'
      OnClick = mnuImprimirGrillaClick
    end
    object mnuImprimirReporte: TMenuItem
      Caption = 'Imprimir Reporte'
      OnClick = mnuImprimirReporteClick
    end
  end
end
