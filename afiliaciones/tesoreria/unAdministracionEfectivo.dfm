inherited frmAdministracionEfectivo: TfrmAdministracionEfectivo
  Left = 224
  Top = 114
  Width = 750
  Height = 500
  Caption = 'Administraci'#243'n de Efectivo'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 750
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 742
    Height = 49
    Visible = True
    object gbTipo: TGroupBox
      Left = 1
      Top = 1
      Width = 396
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Tipo'
      TabOrder = 0
      DesignSize = (
        396
        44)
      inline fraTipo: TfraStaticCTB_TABLAS
        Left = 8
        Top = 14
        Width = 381
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 317
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
    object gbFecha: TGroupBox
      Left = 401
      Top = 1
      Width = 212
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Fecha'
      TabOrder = 1
      object Label2: TLabel
        Left = 101
        Top = 21
        Width = 16
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
    object gbVer: TGroupBox
      Left = 617
      Top = 1
      Width = 122
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Ver'
      TabOrder = 2
      object chkSoloActivos: TCheckBox
        Left = 16
        Top = 17
        Width = 80
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Solo Activos'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Width = 742
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 738
      end>
    inherited ToolBar: TToolBar
      Width = 725
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbImprimir: TToolButton
        DropdownMenu = pmnuImprimir
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
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
      end
      inherited tbMaxRegistros: TToolButton
        Left = 329
      end
      inherited ToolButton11: TToolButton
        Left = 352
      end
      inherited tbSalir: TToolButton
        Left = 360
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 383
        Top = 0
        Hint = 'Sumatoria'
        Caption = 'tbSumatoria'
        ImageIndex = 23
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 406
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 414
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Width = 742
    Height = 395
    TitleFont.Name = 'Tahoma'
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 114
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_INGRESO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Ingreso'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_EGRESO'
        Title.Alignment = taCenter
        Title.Caption = 'Monto Egreso'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN_PAGO'
        Title.Caption = 'Orden de Pago'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO_EGRESO'
        Title.Caption = 'Motivo Egreso'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 329
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 71
        Visible = True
      end>
  end
  object fpImprimirMovDiarios: TFormPanel [3]
    Left = 8
    Top = 20
    Width = 421
    Height = 104
    Caption = 'Impresi'#243'n de Movimientos Diarios'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 104
    Constraints.MaxWidth = 421
    Constraints.MinHeight = 104
    Constraints.MinWidth = 421
    DesignSize = (
      421
      104)
    object Bevel1: TBevel
      Left = 4
      Top = 68
      Width = 413
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label3: TLabel
      Left = 8
      Top = 45
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object btnAceptarMovDiarios: TButton
      Left = 266
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAceptarMovDiariosClick
    end
    object btnCancelarMovDiarios: TButton
      Left = 341
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    inline fraTipoImpr: TfraStaticCTB_TABLAS
      Left = 47
      Top = 13
      Width = 367
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 303
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edFechaImpr: TDateComboBox
      Left = 48
      Top = 41
      Width = 88
      Height = 21
      TabOrder = 1
    end
  end
  inherited fpAbm: TFormPanel
    Left = 152
    Top = 96
    Width = 560
    Height = 334
    Constraints.MaxHeight = 334
    Constraints.MaxWidth = 560
    Constraints.MinHeight = 334
    Constraints.MinWidth = 560
    inherited BevelAbm: TBevel
      Top = 298
      Width = 552
    end
    object Label4: TLabel [1]
      Left = 8
      Top = 10
      Width = 73
      Height = 13
      Caption = 'Tipo Fondo Fijo'
    end
    object Label5: TLabel [2]
      Left = 424
      Top = 10
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object Label6: TLabel [3]
      Left = 8
      Top = 33
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 405
      Top = 304
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    inherited btnCancelar: TButton
      Left = 480
      Top = 304
      TabOrder = 7
    end
    inline fraTipoAlta: TfraStaticCTB_TABLAS
      Left = 85
      Top = 5
      Width = 334
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 270
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edFechaAlta: TDateComboBox
      Left = 465
      Top = 6
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edObservacionesAlta: TMemo
      Left = 86
      Top = 31
      Width = 466
      Height = 41
      MaxLength = 240
      TabOrder = 2
    end
    object rgTipoMovimientoAlta: TRadioGroup
      Left = 86
      Top = 74
      Width = 197
      Height = 37
      Caption = 'Tipo de Movimiento'
      Columns = 2
      Items.Strings = (
        'Ingreso'
        'Egreso')
      TabOrder = 3
      OnClick = rgTipoMovimientoAltaClick
    end
    object gbIngreso: TGroupBox
      Left = 86
      Top = 112
      Width = 466
      Height = 74
      Caption = 'Ingreso'
      TabOrder = 4
      object Label7: TLabel
        Left = 7
        Top = 20
        Width = 68
        Height = 13
        Caption = 'Monto Ingreso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbNumeroBoletaDeposito: TLabel
        Left = 7
        Top = 47
        Width = 72
        Height = 13
        Caption = 'Orden de Pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edMontoIngresoAlta: TCurrencyEdit
        Left = 88
        Top = 17
        Width = 108
        Height = 21
        TabStop = False
        AutoSize = False
        MaxLength = 12
        MaxValue = 999999999.000000000000000000
        ReadOnly = True
        TabOrder = 0
      end
      object edOrdenPagoAlta: TIntEdit
        Left = 88
        Top = 44
        Width = 108
        Height = 21
        TabOrder = 1
        MaxLength = 8
      end
    end
    object gbEgreso: TGroupBox
      Left = 86
      Top = 186
      Width = 466
      Height = 74
      Caption = 'Egreso'
      TabOrder = 5
      DesignSize = (
        466
        74)
      object Label8: TLabel
        Left = 7
        Top = 20
        Width = 66
        Height = 13
        Caption = 'Monto Egreso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 7
        Top = 48
        Width = 68
        Height = 13
        Caption = 'Motivo Egreso'
      end
      object edMontoEgresoAlta: TCurrencyEdit
        Left = 88
        Top = 17
        Width = 108
        Height = 21
        TabStop = False
        AutoSize = False
        MaxLength = 12
        MaxValue = 999999999.000000000000000000
        ReadOnly = True
        TabOrder = 0
      end
      inline fraMotivoEgresoAlta: TfraStaticCTB_TABLAS
        Left = 88
        Top = 43
        Width = 370
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TComboGrid
          Width = 306
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja'
            'TB_CLAVE'
            'TB_ESPECIAL1')
          ColWidths = (
            40
            300
            -1
            -1
            -1
            -1)
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT T.TB_DESCRIPCION TIPO, EF_FECHA FECHA, EF_MONTOINGRESO MO' +
        'NTO_INGRESO,'
      
        '       EF_MONTOEGRESO MONTO_EGRESO, EF_ORDENPAGO ORDEN_PAGO, M.T' +
        'B_DESCRIPCION MOTIVO_EGRESO,'
      '       EF_OBSERVACIONES OBSERVACIONES, EF_FECHABAJA'
      '  FROM CTB_TABLAS M, CTB_TABLAS T, REF_EFECTIVO'
      ' WHERE T.TB_CLAVE = '#39'TFFEF'#39
      '   AND T.TB_CODIGO = EF_TIPO'
      '   AND M.TB_CLAVE(+) = '#39'MEEFV'#39
      '   AND M.TB_CODIGO(+) = EF_MOTIVOEGRESO'
      '   AND 1 = 2'
      '   ')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
  inherited ShortCutControl: TShortCutControl
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
  end
  object pmnuImprimir: TPopupMenu
    Left = 88
    Top = 286
    object mnuImpMovDiarios: TMenuItem
      Caption = 'Imprimir Movimientos Diaros'
      OnClick = mnuImpMovDiariosClick
    end
    object mnuImpResultados: TMenuItem
      Caption = 'Imprimir Resultados'
      OnClick = mnuImpResultadosClick
    end
  end
end
