inherited frmDevolPagoExcesoPagos: TfrmDevolPagoExcesoPagos
  Left = 5
  Top = 93
  Caption = 'Pagos de Devoluci'#243'n de Pago en Exceso'
  ClientHeight = 441
  ClientWidth = 766
  Constraints.MinHeight = 400
  Constraints.MinWidth = 774
  ExplicitLeft = 5
  ExplicitTop = 93
  ExplicitWidth = 774
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 766
    Height = 52
    Visible = True
    ExplicitWidth = 766
    ExplicitHeight = 52
    DesignSize = (
      766
      52)
    object gbNroPago: TGroupBox
      Left = 3
      Top = 0
      Width = 97
      Height = 49
      Caption = 'N'#186' de Pago'
      TabOrder = 0
      object edPE_id: TIntEdit
        Left = 8
        Top = 19
        Width = 81
        Height = 21
        TabOrder = 0
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 102
      Top = 0
      Width = 209
      Height = 49
      Caption = 'Fecha de Pago'
      TabOrder = 1
      object Label4: TLabel
        Left = 100
        Top = 24
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
      object edPE_FECHAALTADesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edPE_FECHAALTAHasta
        TabOrder = 0
      end
      object edPE_FECHAALTAHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edPE_FECHAALTADesde
        TabOrder = 1
      end
    end
    object gbEmpresa: TGroupBox
      Left = 313
      Top = 0
      Width = 452
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 2
      DesignSize = (
        452
        49)
      object Label1: TLabel
        Left = 8
        Top = 22
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      inline fraPE_CONTRATO: TfraEmpresa
        Left = 36
        Top = 18
        Width = 406
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ExplicitLeft = 36
        ExplicitTop = 18
        ExplicitWidth = 406
        ExplicitHeight = 21
        DesignSize = (
          406
          21)
        inherited lbRSocial: TLabel
          Left = 88
          ExplicitLeft = 88
        end
        inherited lbContrato: TLabel
          Left = 302
          ExplicitLeft = 302
        end
        inherited edContrato: TIntEdit
          Left = 349
          ExplicitLeft = 349
        end
        inherited cmbRSocial: TArtComboBox
          Width = 167
          ExplicitWidth = 167
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 52
    Width = 766
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 760
      end>
    ExplicitTop = 52
    ExplicitWidth = 766
    inherited ToolBar: TToolBar
      Width = 751
      ExplicitWidth = 751
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Detalle (Ctrl+D)'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
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
        Visible = True
        ExplicitLeft = 300
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 308
        Visible = True
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
        Visible = False
        ExplicitLeft = 362
      end
      object tbGenerarMovim: TToolButton
        Left = 385
        Top = 0
        Hint = 'Generar Movimientos (Ctrl+G)'
        ImageIndex = 25
        OnClick = tbGenerarMovimClick
      end
      object ToolButton1: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 416
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton2: TToolButton
        Left = 439
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 447
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 81
    Width = 766
    Height = 360
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Pago'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODREG'
        Title.Alignment = taCenter
        Title.Caption = 'R'#233'g.'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 169
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pago'
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_MOVIMIENTO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Movimiento'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Title.Caption = 'Cheque'
        Width = 126
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_CHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cheque'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN_PAGO'
        Title.Caption = 'Orden Pago'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACION_CHEQUE'
        Title.Caption = 'Situaci'#243'n Cheque'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BENEFICIARIO'
        Title.Caption = 'Beneficiario'
        Width = 237
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 68
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 188
    Top = 124
    ExplicitLeft = 188
    ExplicitTop = 124
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PE_ID NRO_PAGO, CO_CONTRATO CONTRATO, EM_NOMBRE NOMBRE, E' +
        'M_CUIT CUIT, PE_IMPORTE IMPORTE, '
      
        '       TRUNC(PE_FECHAALTA) FECHA_PAGO, PE_FECHAMOVIMIENTO FECHA_' +
        'MOVIMIENTO, CE_NUMERO CHEQUE, '
      
        '       CE_FECHACHEQUE FECHA_CHEQUE, CE_ORDENPAGO ORDEN_PAGO, TB_' +
        'DESCRIPCION SITUACION_CHEQUE'
      
        '  FROM CTB_TABLAS, RCE_CHEQUEEMITIDO, AEM_EMPRESA, ACO_CONTRATO,' +
        ' ZPE_DEVOLUCIONPAGOEXCESO'
      ' WHERE PE_CONTRATO = CO_CONTRATO'
      '   AND CO_IDEMPRESA = EM_ID'
      '   AND PE_IDCHEQUEEMITIDO = CE_ID(+)'
      '   AND TB_CODIGO(+) = CE_SITUACION'
      '   AND TB_CLAVE(+) = '#39'SITCH'#39
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
      end
      item
        Key = 16452
        LinkControl = tbPropiedades
      end
      item
        Key = 16455
        LinkControl = tbGenerarMovim
      end>
    Left = 109
    Top = 200
  end
  object mnuImprimir: TPopupMenu
    Left = 152
    Top = 201
    object mnuImprimirDetallePago: TMenuItem
      Caption = 'Imprimir Reporte'
      OnClick = mnuImprimirDetallePagoClick
    end
    object mnuImprimirResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImprimirResultadosClick
    end
  end
end
