inherited frmPagosFondoGarantia: TfrmPagosFondoGarantia
  Left = 11
  Top = 51
  Width = 777
  Height = 450
  Caption = 'Pagos del Fondo de Garant'#237'a'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 777
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 769
    Height = 52
    object gbNroPago: TGroupBox
      Left = 3
      Top = 0
      Width = 97
      Height = 49
      Caption = 'N'#186' de Pago'
      TabOrder = 0
      object edPF_ID: TIntEdit
        Left = 8
        Top = 19
        Width = 81
        Height = 21
        TabOrder = 0
      end
    end
    object gbFechaAlta: TGroupBox
      Left = 103
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
      object edPF_FECHAALTADesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edPF_FECHAALTAHasta
        TabOrder = 0
      end
      object edPF_FECHAALTAHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edPF_FECHAALTADesde
        TabOrder = 1
      end
    end
    object gbFechaEnvio: TGroupBox
      Left = 315
      Top = 0
      Width = 209
      Height = 49
      Caption = 'Fecha de Env'#237'o'
      TabOrder = 2
      object Label1: TLabel
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
      object edPF_FECHAENVIODesde: TDateComboBox
        Left = 9
        Top = 20
        Width = 88
        Height = 21
        MaxDateCombo = edPF_FECHAENVIOHasta
        TabOrder = 0
      end
      object edPF_FECHAENVIOHasta: TDateComboBox
        Left = 115
        Top = 20
        Width = 88
        Height = 21
        MinDateCombo = edPF_FECHAENVIODesde
        TabOrder = 1
      end
    end
    object grpNumCheque: TGroupBox
      Left = 527
      Top = 0
      Width = 119
      Height = 49
      Caption = 'N'#186' de Cheque'
      TabOrder = 3
      object edCE_NUMERO: TPatternEdit
        Left = 8
        Top = 19
        Width = 102
        Height = 21
        MaxLength = 20
        TabOrder = 0
        Pattern = '0123456789'
      end
    end
    object grpNroOP: TGroupBox
      Left = 648
      Top = 0
      Width = 120
      Height = 49
      Caption = 'N'#186' de Orden de Pago'
      TabOrder = 4
      object edCE_ORDENPAGO: TIntEdit
        Left = 8
        Top = 19
        Width = 103
        Height = 21
        TabOrder = 0
        MaxLength = 8
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 52
    Width = 769
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 765
      end>
    inherited ToolBar: TToolBar
      Width = 752
      inherited ToolButton4: TToolButton
        Visible = True
      end
      inherited tbPropiedades: TToolButton
        Hint = 'Ver Detalle (Ctrl+D)'
        Visible = True
        OnClick = tbPropiedadesClick
      end
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
      end
      inherited tbMostrarFiltros: TToolButton
        Left = 306
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
        Visible = False
      end
      object tbEnvioSRT: TToolButton
        Left = 383
        Top = 0
        Hint = 'Env'#237'o SRT (Ctrl+R)'
        ImageIndex = 17
        OnClick = tbEnvioSRTClick
      end
      object tbBoletaDeposito: TToolButton
        Left = 406
        Top = 0
        Hint = 'Cargar Boleta Dep'#243'sito (Ctrl+B)'
        ImageIndex = 16
        OnClick = tbBoletaDepositoClick
      end
      object ToolButton7: TToolButton
        Left = 429
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSumatoria: TToolButton
        Left = 437
        Top = 0
        Hint = 'Sumatoria'
        ImageIndex = 37
        Style = tbsCheck
        OnClick = tbSumatoriaClick
      end
      object ToolButton1: TToolButton
        Left = 460
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 38
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 468
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlBusqueda: TPanel
        Left = 491
        Top = 0
        Width = 91
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object chkSoloActivos: TCheckBox
          Left = 4
          Top = 2
          Width = 83
          Height = 17
          Caption = 'Solo Activos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 81
    Width = 769
    Height = 342
    OnGetCellParams = GridGetCellParams
    OnPaintFooter = GridPaintFooter
    Columns = <
      item
        Expanded = False
        FieldName = 'NRO_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Nro. Pago'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pago'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOLETA_DEPOSITO'
        Title.Caption = 'Boleta Dep'#243'sito'
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_DEPOSITO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Dep'#243'sito'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA_ENVIO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Env'#237'o'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHEQUE'
        Title.Caption = 'Cheque'
        Width = 136
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHACHEQUE'
        Title.Alignment = taCenter
        Title.Caption = 'F. Cheque'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDENPAGO'
        Title.Caption = 'Orden Pago'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. Baja'
        Width = 70
        Visible = True
      end>
  end
  object fpBoletaDeposito: TFormPanel [3]
    Left = 276
    Top = 164
    Width = 216
    Height = 96
    Caption = 'Boleta de Dep'#243'sito'
    FormWidth = 0
    FormHeigth = 0
    BorderStyle = bsToolWindow
    Position = poOwnerFormCenter
    Constraints.MaxHeight = 96
    Constraints.MaxWidth = 216
    Constraints.MinHeight = 96
    Constraints.MinWidth = 216
    OnEnter = fpBoletaDepositoEnter
    DesignSize = (
      216
      96)
    object BevelAbm: TBevel
      Left = 4
      Top = 62
      Width = 211
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label2: TLabel
      Left = 13
      Top = 41
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 9
      Top = 14
      Width = 30
      Height = 13
      Caption = 'Boleta'
    end
    object btnAceptarBoletaDepos: TButton
      Left = 56
      Top = 68
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
      OnClick = btnAceptarBoletaDeposClick
    end
    object btnCancelarBoletaDepos: TButton
      Left = 134
      Top = 68
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 3
    end
    object edFBoletaDepos: TDateComboBox
      Left = 49
      Top = 37
      Width = 88
      Height = 21
      MaxDateCombo = edPF_FECHAENVIOHasta
      TabOrder = 1
    end
    object edBoletaDeposito: TEdit
      Left = 49
      Top = 9
      Width = 159
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT PF_ID NRO_PAGO, PF_IMPORTE IMPORTE, TRUNC(PF_FECHAALTA) F' +
        'ECHA_PAGO, '
      
        '       PF_BOLETADEPOSITO BOLETA_DEPOSITO, PF_FECHADEPOSITO FECHA' +
        '_DEPOSITO, PF_FECHAENVIO FECHA_ENVIO'
      '  FROM ZPF_PAGOFONDOGARANTIA'
      ' WHERE 1 = 2'
      ' ')
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
        LinkControl = tbSalir2
      end
      item
        Key = 16452
        LinkControl = tbPropiedades
      end
      item
        Key = 16466
        LinkControl = tbEnvioSRT
      end
      item
        Key = 16450
        LinkControl = tbBoletaDeposito
      end>
    Left = 108
    Top = 200
  end
  object mnuImprimir: TPopupMenu
    Left = 108
    Top = 257
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
