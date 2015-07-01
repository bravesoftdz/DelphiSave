inherited frmListSiniestrosConEmbargo: TfrmListSiniestrosConEmbargo
  Left = 360
  Top = 345
  Width = 698
  Height = 360
  Caption = 'Listado de siniestros con embargo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 690
    Height = 47
    object gbTipoEmbargo: TGroupBox
      Left = 2
      Top = 1
      Width = 202
      Height = 43
      Caption = ' Tipo '
      TabOrder = 0
      object rbTipoTodos: TRadioButton
        Left = 4
        Top = 20
        Width = 50
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbTipoSumaFija: TRadioButton
        Left = 134
        Top = 20
        Width = 63
        Height = 17
        Caption = 'Suma fija'
        TabOrder = 1
      end
      object rbTipoPorcentaje: TRadioButton
        Left = 58
        Top = 20
        Width = 74
        Height = 17
        Caption = 'Porcentaje'
        TabOrder = 2
      end
    end
    object gbFechaEmbargo: TGroupBox
      Left = 206
      Top = 1
      Width = 209
      Height = 43
      Caption = ' Fecha embargo '
      TabOrder = 1
      object Label1: TLabel
        Left = 98
        Top = 19
        Width = 12
        Height = 13
        Caption = '>>'
      end
      object dcEmbDesde: TDateComboBox
        Left = 7
        Top = 17
        Width = 88
        Height = 21
        MaxDateCombo = dcEmbHasta
        TabOrder = 0
      end
      object dcEmbHasta: TDateComboBox
        Left = 114
        Top = 17
        Width = 88
        Height = 21
        MinDateCombo = dcEmbDesde
        TabOrder = 1
      end
    end
    object gbSiniestro: TGroupBox
      Left = 418
      Top = 1
      Width = 137
      Height = 43
      Caption = ' Siniestro '
      TabOrder = 2
      object edSiniestro: TSinEdit
        Left = 8
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object gbActivos: TGroupBox
      Left = 558
      Top = 1
      Width = 131
      Height = 43
      Caption = ' Activos '
      TabOrder = 3
      object rbActivoTodos: TRadioButton
        Left = 73
        Top = 20
        Width = 51
        Height = 17
        Caption = 'Todos'
        TabOrder = 0
      end
      object rbActivoNo: TRadioButton
        Left = 36
        Top = 20
        Width = 33
        Height = 17
        Caption = 'No'
        TabOrder = 1
      end
      object rbActivoSi: TRadioButton
        Left = 3
        Top = 20
        Width = 31
        Height = 17
        Caption = 'Si'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 47
    Width = 690
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 686
      end>
    inherited ToolBar: TToolBar
      Width = 673
    end
  end
  inherited Grid: TArtDBGrid
    Top = 76
    Width = 690
    Height = 257
    OnGetCellParams = GridGetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FECHAALTA'
        Title.Alignment = taCenter
        Title.Caption = 'F. embargo'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'F. baja'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_PORCENTAJE'
        Title.Alignment = taCenter
        Title.Caption = 'Porcentaje'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_SUMAFIJA'
        Title.Alignment = taCenter
        Title.Caption = 'Suma fija'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRABAJADOR'
        Title.Caption = 'Trabajador'
        Width = 170
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CE_FORMAPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'F. pago'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BA_NOMBRECORTO'
        Title.Caption = 'Banco'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_ENVIOFONDOS'
        Title.Caption = 'Envio fondos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_CHEQUENOMBRE'
        Title.Caption = 'Cheque a nombre'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CE_RECIBOS'
        Title.Caption = 'Recibos'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 170
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLegal
    OnGetCellParams = QueryPrintGetCellParams
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
      end
      item
        Key = 16453
      end
      item
        Key = 16467
      end>
    Left = 80
    Top = 256
  end
end
