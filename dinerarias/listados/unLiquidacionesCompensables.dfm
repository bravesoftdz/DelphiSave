inherited frmLiquidacionesCompensables: TfrmLiquidacionesCompensables
  Left = 103
  Top = 106
  Width = 600
  Height = 400
  Caption = 'Liquidaciones Compensables'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Height = 55
    object gbFechaAutorizacion: TGroupBox
      Left = 4
      Top = 2
      Width = 267
      Height = 51
      Caption = ' Fecha de Autorizaci'#243'n'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label2: TLabel
        Left = 137
        Top = 22
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edFechaAutorizDesde: TDateComboBox
        Left = 44
        Top = 19
        Width = 89
        Height = 21
        MaxDateCombo = edFechaAutorizHasta
        TabOrder = 0
      end
      object edFechaAutorizHasta: TDateComboBox
        Left = 170
        Top = 19
        Width = 89
        Height = 21
        MinDateCombo = edFechaAutorizDesde
        TabOrder = 1
      end
    end
    object rgTipoEmpresa: TRadioGroup
      Left = 275
      Top = 2
      Width = 170
      Height = 51
      Caption = ' Tipo de Empresa'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Todas'
        '&Sin Deuda')
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 55
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
      inherited tbImprimir: TToolButton
        DropdownMenu = mnuImprimir
        Style = tbsDropDown
      end
      inherited tbExportar: TToolButton
        Left = 252
      end
      inherited tbEnviarMail: TToolButton
        Left = 275
      end
      inherited ToolButton8: TToolButton
        Left = 298
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 84
    Width = 592
    Height = 289
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MP_SINCOMPLETO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Alignment = taCenter
        Title.Caption = 'CUIT'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 145
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Alignment = taCenter
        Title.Caption = 'CUIL'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LE_NUMLIQUI'
        Title.Alignment = taCenter
        Title.Caption = 'Liq.'
        Width = 44
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_FECHADES'
        Title.Alignment = taCenter
        Title.Caption = 'F. Desde'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_FECHAHAS'
        Title.Alignment = taCenter
        Title.Caption = 'F. Hasta'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_FPROCESO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Proceso'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LE_FAPROBCOBRANZAS'
        Title.Alignment = taCenter
        Title.Caption = 'F. Autoriz.'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LE_IMPORPERI'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 75
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT MP_SINCOMPLETO, LE_NUMLIQUI, EX_CUIT, EM_NOMBRE, EX_CUIL,' +
        ' TJ_NOMBRE,'
      
        '       LE_FECHADES, LE_FECHAHAS, LE_IMPORPERI, LE_FAPROBCOBRANZA' +
        'S, LE_FPROCESO'
      
        '  FROM CTJ_TRABAJADOR, AEM_EMPRESA, SEX_EXPEDIENTES, SLE_LIQUIEM' +
        'PSIN, TMP_LIQCOMPENSABLES'
      ' WHERE MP_SINIESTRO = LE_SINIESTRO'
      '   AND MP_ORDEN = LE_ORDEN'
      '   AND MP_RECAIDA = LE_RECAIDA'
      '   AND MP_NUMLIQUI = LE_NUMLIQUI'
      '   AND LE_SINIESTRO = EX_SINIESTRO'
      '   AND LE_ORDEN = EX_ORDEN'
      '   AND LE_RECAIDA = EX_RECAIDA'
      '   AND EM_CUIT = EX_CUIT'
      '   AND TJ_CUIL = EX_CUIL'
      ''
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
        LinkControl = tbSalir
      end>
    Left = 112
    Top = 200
  end
  object mnuImprimir: TPopupMenu
    Left = 156
    Top = 200
    object mnuLiquidaciones: TMenuItem
      Caption = 'Imprimir Liquidaciones'
      OnClick = mnuLiquidacionesClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
  end
end
