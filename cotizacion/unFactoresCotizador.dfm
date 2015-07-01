inherited frmFactoresCotizador: TfrmFactoresCotizador
  Left = 527
  Top = 215
  Width = 560
  Height = 296
  Caption = 'Factores Constantes del Cotizador'
  Constraints.MinWidth = 560
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar [0]
    Top = 101
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
    end
  end
  inherited Grid: TArtDBGrid [1]
    Top = 133
    Width = 552
    Height = 136
    Columns = <
      item
        Expanded = False
        FieldName = 'factor'
        Title.Caption = 'Factor'
        Width = 162
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ft_valor'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ft_fechavigenciadesde'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Vigencia Desde'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ft_fechavigenciahasta'
        Title.Caption = 'Fecha Vigencia Hasta'
        Width = 115
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
  inherited fpAbm: TFormPanel [2]
    Left = 116
    Top = 104
    Width = 400
    Height = 128
    Caption = 'Factor'
    BorderStyle = bsDialog
    OnShow = fpAbmShow
    ActiveControl = fraFactor.edCodigo
    inherited BevelAbm: TBevel
      Top = 92
      Width = 392
    end
    object lbFactor: TLabel [1]
      Left = 8
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Factor'
    end
    object lbValor: TLabel [2]
      Left = 8
      Top = 36
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object lbFechaVigencia: TLabel [3]
      Left = 8
      Top = 60
      Width = 108
      Height = 13
      Caption = 'Fecha Vigencia Desde'
    end
    inherited btnAceptar: TButton
      Left = 240
      Top = 98
      Width = 72
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 320
      Top = 98
      Width = 72
      TabOrder = 4
    end
    object edValor: TCurrencyEdit
      Left = 48
      Top = 32
      Width = 88
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = ',0.0000;-,0.0000'
      MaxValue = 9999.999900000000000000
      TabOrder = 1
    end
    object edVigenciaDesde: TDateComboBox
      Left = 124
      Top = 56
      Width = 88
      Height = 21
      TabOrder = 2
    end
    inline fraFactor: TfraCodDesc
      Left = 48
      Top = 8
      Width = 344
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 279
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'df_fechabaja'
        FieldCodigo = 'df_id'
        FieldDesc = 'df_detalle'
        FieldID = 'df_id'
        TableName = 'afi.adf_descripcionfactores'
      end
    end
  end
  inherited pnlFiltros: TPanel [3]
    Width = 552
    Height = 101
    Visible = True
    object gbVigenciaFiltro: TGroupBox
      Left = 2
      Top = 49
      Width = 191
      Height = 48
      Caption = 'Vigencia'
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 20
        Width = 89
        Height = 13
        Caption = 'Fecha de Vigencia'
      end
      object cmbFT_FECHAVIGENCIADesde: TDateComboBox
        Left = 96
        Top = 16
        Width = 88
        Height = 21
        TabOrder = 0
      end
    end
    object gbFactorFiltro: TGroupBox
      Left = 3
      Top = 0
      Width = 429
      Height = 48
      Caption = 'Factor'
      TabOrder = 1
      DesignSize = (
        429
        48)
      object Factor: TLabel
        Left = 4
        Top = 20
        Width = 30
        Height = 13
        Caption = 'Factor'
      end
      inline fraFactorFiltro: TfraCodDesc
        Left = 40
        Top = 16
        Width = 377
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 312
        end
        inherited Propiedades: TPropiedadesFrame
          FieldBaja = 'df_fechabaja'
          FieldCodigo = 'df_id'
          FieldDesc = 'df_detalle'
          FieldID = 'df_id'
          TableName = 'afi.adf_descripcionfactores'
        end
      end
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
