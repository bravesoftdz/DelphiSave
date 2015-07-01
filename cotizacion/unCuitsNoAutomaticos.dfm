inherited frmCuitsNoAutomaticos: TfrmCuitsNoAutomaticos
  Left = 540
  Top = 256
  Width = 560
  Height = 296
  Caption = 'C.U.I.T. No Autocotiza'
  Constraints.MinWidth = 560
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar [0]
    Top = 48
    Width = 552
    Height = 32
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 548
      end>
    inherited ToolBar: TToolBar
      Width = 535
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid [1]
    Top = 80
    Width = 552
    Height = 189
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cuitarmado'
        Title.Alignment = taCenter
        Title.Caption = 'C.U.I.T.'
        Width = 122
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cn_fechadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Desde'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cn_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cn_observaciones'
        Title.Caption = 'Observaciones'
        Width = 286
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechamodif'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 119
        Visible = True
      end>
  end
  inherited pnlFiltros: TPanel [2]
    Width = 552
    Height = 48
    Visible = True
    object gbFactorFiltro: TGroupBox
      Left = 3
      Top = 0
      Width = 136
      Height = 44
      TabOrder = 0
      object Factor: TLabel
        Left = 4
        Top = 20
        Width = 37
        Height = 13
        Caption = 'C.U.I.T.'
      end
      object edCuitBusqueda: TMaskEdit
        Left = 48
        Top = 16
        Width = 81
        Height = 21
        EditMask = '99-99999999-c;0;'
        MaxLength = 13
        TabOrder = 0
        OnExit = edCuitBusquedaExit
      end
    end
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 32
    Width = 400
    Height = 200
    Caption = 'C.U.I.T.'
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    ActiveControl = edCuit
    inherited BevelAbm: TBevel
      Top = 164
      Width = 392
    end
    object lbFactor: TLabel [1]
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = 'C.U.I.T.'
    end
    object lbValor: TLabel [2]
      Left = 8
      Top = 36
      Width = 64
      Height = 13
      Caption = 'Fecha Desde'
    end
    object lbFechaVigencia: TLabel [3]
      Left = 8
      Top = 60
      Width = 66
      Height = 13
      Caption = 'Obervaciones'
    end
    object Label2: TLabel [4]
      Left = 232
      Top = 36
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    inherited btnAceptar: TButton
      Left = 240
      Top = 170
      Width = 72
      TabOrder = 4
    end
    inherited btnCancelar: TButton
      Left = 320
      Top = 170
      Width = 72
      TabOrder = 5
    end
    object edFechaDesde: TDateComboBox
      Left = 80
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 1
    end
    object edFechaHasta: TDateComboBox
      Left = 304
      Top = 32
      Width = 88
      Height = 21
      TabOrder = 2
    end
    object memoObservaciones: TMemo
      Left = 80
      Top = 56
      Width = 312
      Height = 100
      Lines.Strings = (
        '1111111'
        '2222222'
        '333333'
        '444444'
        '55555555'
        '666666666'
        '777777777')
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object edCuit: TMaskEdit
      Left = 80
      Top = 8
      Width = 81
      Height = 21
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      TabOrder = 0
    end
  end
  inherited sdqConsulta: TSDQuery
    Top = 172
  end
  inherited dsConsulta: TDataSource
    Top = 172
  end
  inherited SortDialog: TSortDialog
    Top = 200
  end
  inherited ExportDialog: TExportDialog
    Top = 200
  end
  inherited QueryPrint: TQueryPrint
    Top = 228
  end
  inherited Seguridad: TSeguridad
    Top = 144
  end
  inherited FormStorage: TFormStorage
    Top = 144
  end
  inherited PrintDialog: TPrintDialog
    Top = 228
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
        LinkControl = tbSalir
      end>
    Top = 144
  end
  inherited FieldHider: TFieldHider
    Top = 172
  end
end
