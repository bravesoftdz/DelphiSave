inherited frmFFDetalleRendicion: TfrmFFDetalleRendicion
  Left = 354
  Top = 202
  Caption = 'Detalle de Rendiciones'
  ClientWidth = 692
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  FormStyle = fsNormal
  Visible = False
  ExplicitLeft = 354
  ExplicitTop = 202
  ExplicitWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 692
    Height = 63
    Visible = True
    ExplicitWidth = 692
    ExplicitHeight = 63
    object chkNoMostrarBajas: TCheckBox
      Left = 232
      Top = 46
      Width = 105
      Height = 17
      Caption = 'No Mostrar Bajas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object rgAprobadoBusq: TRadioGroup
      Left = 7
      Top = 2
      Width = 219
      Height = 59
      Caption = 'Aprobado'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Pendientes'
        'Si'
        'No')
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Top = 63
    Width = 692
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    ExplicitTop = 51
    ExplicitWidth = 692
    inherited ToolBar: TToolBar
      Width = 677
      ExplicitWidth = 677
      inherited tbPropiedades: TToolButton
        Hint = 'Aprobar'
        Visible = True
        OnClick = tbPropiedadesClick
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        Visible = True
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbSumatoria: TToolButton
        Left = 370
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 23
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
    Top = 92
    Width = 692
    Height = 344
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEN'
        Title.Alignment = taCenter
        Title.Caption = 'Orden'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Reca'#237'da'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Concepto Pago'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONPAGO'
        Title.Caption = 'Descr. Concepto Pago'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPROBANTE'
        Title.Caption = 'Comprobante'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_COMPROBANTE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Comprobante'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALLE'
        Title.Caption = 'Detalle'
        Width = 219
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'Aprobado'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_APROBADO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Aprobado'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALISIS'
        Title.Caption = 'Motivo'
        Width = 245
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_BAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 76
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 168
    Top = 122
    Width = 514
    Height = 382
    BorderStyle = bsDialog
    ExplicitLeft = 168
    ExplicitTop = 122
    ExplicitWidth = 514
    ExplicitHeight = 382
    DesignSize = (
      514
      382)
    inherited BevelAbm: TBevel
      Top = 346
      Width = 506
      ExplicitTop = 346
      ExplicitWidth = 472
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 12
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Siniestro'
    end
    object Label2: TLabel [2]
      Left = 10
      Top = 37
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Concepto'
    end
    object Label3: TLabel [3]
      Left = 10
      Top = 89
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label19: TLabel [4]
      Left = 10
      Top = 115
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Importe'
    end
    object Label4: TLabel [5]
      Left = 10
      Top = 62
      Width = 63
      Height = 13
      Caption = 'Comprobante'
    end
    object Label5: TLabel [6]
      Left = 10
      Top = 140
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Detalle'
    end
    object Label6: TLabel [7]
      Left = 10
      Top = 273
      Width = 72
      Height = 13
      AutoSize = False
      Caption = 'Motivo'
    end
    inherited btnAceptar: TButton
      Left = 356
      Top = 352
      TabOrder = 10
      ExplicitLeft = 322
      ExplicitTop = 352
    end
    inherited btnCancelar: TButton
      Left = 434
      Top = 352
      TabOrder = 11
      ExplicitLeft = 400
      ExplicitTop = 352
    end
    object edSiniestroAltaModif: TSinEdit
      Left = 84
      Top = 8
      Width = 115
      Height = 21
      TabOrder = 0
    end
    inline fraConceptoAltaModif: TfraCodigoDescripcion
      Left = 83
      Top = 33
      Width = 423
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 83
      ExplicitTop = 33
      ExplicitWidth = 423
      DesignSize = (
        423
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 90
        Width = 334
        ExplicitLeft = 90
        ExplicitWidth = 334
      end
      inherited edCodigo: TPatternEdit
        Width = 85
        ExplicitWidth = 85
      end
    end
    object edFechaAltaModif: TDateComboBox
      Left = 84
      Top = 86
      Width = 88
      Height = 21
      TabOrder = 5
    end
    object edImporteAltaModif: TCurrencyEdit
      Left = 84
      Top = 112
      Width = 88
      Height = 21
      Margins.Left = 1
      Margins.Top = 1
      AutoSize = False
      MaxLength = 12
      TabOrder = 6
    end
    object edLetraFacAltaModif: TEdit
      Left = 84
      Top = 60
      Width = 17
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 1
      TabOrder = 2
      OnKeyPress = edLetraFacAltaModifKeyPress
    end
    object edSituFacAltaModif: TEdit
      Left = 103
      Top = 60
      Width = 40
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 4
      TabOrder = 3
      OnExit = edSituFacAltaModifExit
      OnKeyPress = edSituFacAltaModifKeyPress
    end
    object edNumFacAltaModif: TEdit
      Left = 146
      Top = 60
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      MaxLength = 8
      TabOrder = 4
      OnExit = edNumFacAltaModifExit
    end
    object edDetalleAltaModif: TMemo
      Left = 84
      Top = 138
      Width = 422
      Height = 71
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 400
      TabOrder = 7
    end
    object rgAprobarAltaModif: TRadioGroup
      Left = 86
      Top = 210
      Width = 83
      Height = 56
      Caption = 'Aprobar'
      ItemIndex = 0
      Items.Strings = (
        'Si'
        'No')
      TabOrder = 8
    end
    object edMotivoAltaModif: TMemo
      Left = 84
      Top = 271
      Width = 422
      Height = 71
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 400
      TabOrder = 9
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT EX_SINIESTRO SINIESTRO, EX_ORDEN ORDEN, EX_RECAIDA RECAID' +
        'A,'
      
        '       FD_CONPAGO CONPAGO, CP_DENPAGO DESC_CONPAGO, FD_IMPORTE I' +
        'MPORTE,'
      
        '       FD_COMPROBANTE COMPROBANTE, FD_FECHACOMPROBANTE FECHA_COM' +
        'PROBANTE,'
      
        '       FD_APROBADO APROBADO, TRUNC(FD_FECHAAPROBADO) FECHA_APROB' +
        'ADO,'
      
        '       FD_ANALISIS ANALISIS, TRUNC(FD_FECHABAJA) FECHA_BAJA, FD_' +
        'ID ID,'
      '       TRUNC(FR_FECHACIERRE) FECHA_CIERRE, FD_DETALLE DETALLE'
      
        '  FROM OFR_RENDICION, OFD_RENDICIONDETALLE, SEX_EXPEDIENTES, SCP' +
        '_CONPAGO'
      ' WHERE FD_IDEXPEDIENTE = EX_ID(+)'
      '   AND FD_CONPAGO = CP_CONPAGO'
      '   AND FD_IDRENDICION = FR_ID'
      '   AND FD_IDRENDICION = :IdRendicion'
      '   AND 1 = 2'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdRendicion'
        ParamType = ptInput
      end>
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
    Left = 109
    Top = 201
  end
end
