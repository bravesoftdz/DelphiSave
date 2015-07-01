inherited frmIndicadoresGestionTel: TfrmIndicadoresGestionTel
  Left = 78
  Top = 71
  Caption = 'Indicadores de Gesti'#243'n Telef'#243'nica'
  ClientHeight = 390
  ClientWidth = 692
  Constraints.MinHeight = 420
  Constraints.MinWidth = 700
  OldCreateOrder = True
  ExplicitLeft = 78
  ExplicitTop = 71
  ExplicitWidth = 700
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 48
    ExplicitWidth = 692
    ExplicitHeight = 48
    object gbFecha: TGroupBox
      Left = 107
      Top = 1
      Width = 206
      Height = 43
      Caption = ' Fecha '
      TabOrder = 1
      object Label4: TLabel
        Left = 97
        Top = 20
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
        Left = 6
        Top = 16
        Width = 88
        Height = 21
        MaxDateCombo = edFechaHasta
        TabOrder = 0
      end
      object edFechaHasta: TDateComboBox
        Left = 112
        Top = 16
        Width = 88
        Height = 21
        MinDateCombo = edFechaDesde
        TabOrder = 1
      end
    end
    object gbNroSeleccion: TGroupBox
      Left = 2
      Top = 1
      Width = 102
      Height = 43
      Caption = ' Nro. de Selecci'#243'n '
      TabOrder = 0
      object edNroSeleccion: TIntEdit
        Left = 7
        Top = 15
        Width = 88
        Height = 21
        TabOrder = 0
        Text = '0'
        Alignment = taRightJustify
        MaxLength = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 315
      Top = 1
      Width = 375
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Gestor'
      TabOrder = 2
      DesignSize = (
        375
        43)
      inline fraGestorCuenta: TfraStaticCodigoDescripcion
        Left = 6
        Top = 13
        Width = 362
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 13
        ExplicitWidth = 362
        DesignSize = (
          362
          23)
        inherited edCodigo: TPatternEdit
          Left = 2
          Width = 48
          ExplicitLeft = 2
          ExplicitWidth = 48
        end
        inherited cmbDescripcion: TComboGrid
          Left = 52
          Width = 309
          ExplicitLeft = 52
          ExplicitWidth = 309
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 48
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 48
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
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
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
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
    Top = 77
    Width = 692
    Height = 313
    OnGetCellParams = GridGetCellParams
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SELECCION'
        Title.Alignment = taCenter
        Title.Caption = 'Selecci'#243'n'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GESTOR'
        Title.Caption = 'Gestor'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDA_SELECCION'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Selecci'#243'n'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEUDA_ACTUAL'
        Title.Alignment = taCenter
        Title.Caption = 'Deuda Actual'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DEUDA_REGULARIZADA'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Deuda Regulariz.'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATOS'
        Title.Alignment = taCenter
        Title.Caption = 'Contratos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATOS_REGULARIZADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Contratos Regulariz.'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS_PARCIALES'
        Title.Alignment = taCenter
        Title.Caption = 'Pagos Parciales'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIN_PAGOS'
        Title.Alignment = taCenter
        Title.Caption = 'Sin Pagos'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_REGULARIZADOS'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Regulariz.'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_PAGOS_PARCIALES'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. Pagos Parciales'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_SIN_PAGOS'
        Title.Alignment = taCenter
        Title.Caption = 'Porc. sin Pagos'
        Width = 80
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT IG_FECHA FECHA, IG_IDSELECCIONPLAN SELECCION, GC_NOMBRE G' +
        'ESTOR, IG_DEUDA DEUDA_SELECCION, IG_DEUDAACTUAL DEUDA_ACTUAL,'
      
        '       ROUND((1 - IG_DEUDAACTUAL / IG_DEUDA) * 100, 2) PORC_DEUD' +
        'A_REGULARIZADA, IG_CONTRATOS CONTRATOS,'
      
        '       IG_REGULARIZADOS CONTRATOS_REGULARIZADOS, IG_PAGOSPARCIAL' +
        'ES PAGOS_PARCIALES, IG_SINPAGOS SIN_PAGOS,'
      
        '       ROUND((IG_REGULARIZADOS / IG_CONTRATOS) * 100, 2) PORC_RE' +
        'GULARIZADOS,'
      
        '       ROUND((IG_PAGOSPARCIALES / IG_CONTRATOS) * 100, 2) PORC_P' +
        'AGOS_PARCIALES,'
      
        '       ROUND((IG_SINPAGOS / IG_CONTRATOS) * 100, 2) PORC_SIN_PAG' +
        'OS'
      '  FROM AGC_GESTORCUENTA, V_ZIG_INDICADORGESTION_TMP'
      ' WHERE GC_ID = IG_IDGESTOR '
      'UNION ALL'
      
        'SELECT IG_FECHA FECHA, IG_IDSELECCIONPLAN SELECCION, GC_NOMBRE G' +
        'ESTOR, IG_DEUDA DEUDA_SELECCION, IG_DEUDAACTUAL DEUDA_ACTUAL,'
      
        '       ROUND((1 - IG_DEUDAACTUAL / IG_DEUDA) * 100, 2) PORC_DEUD' +
        'A_REGULARIZADA, IG_CONTRATOS CONTRATOS,'
      
        '       IG_REGULARIZADOS CONTRATOS_REGULARIZADOS, IG_PAGOSPARCIAL' +
        'ES PAGOS_PARCIALES, IG_SINPAGOS SIN_PAGOS,'
      
        '       ROUND((IG_REGULARIZADOS / IG_CONTRATOS) * 100, 2) PORC_RE' +
        'GULARIZADOS,'
      
        '       ROUND((IG_PAGOSPARCIALES / IG_CONTRATOS) * 100, 2) PORC_P' +
        'AGOS_PARCIALES,'
      
        '       ROUND((IG_SINPAGOS / IG_CONTRATOS) * 100, 2) PORC_SIN_PAG' +
        'OS'
      '  FROM AGC_GESTORCUENTA, ZIG_INDICADORGESTION'
      ' WHERE GC_ID = IG_IDGESTOR')
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
    Left = 112
    Top = 200
  end
end
