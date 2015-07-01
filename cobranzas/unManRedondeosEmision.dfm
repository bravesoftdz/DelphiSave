inherited frmManRedondeosEmision: TfrmManRedondeosEmision
  Left = 70
  Top = 92
  Width = 650
  Height = 450
  Caption = 'Mantenimiento de Redondeos de Emisi'#243'n'
  Constraints.MinHeight = 450
  Constraints.MinWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 8
  end
  inherited CoolBar: TCoolBar
    Top = 8
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 37
    Width = 642
    Height = 386
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RO_VIGENCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vig. Desde'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RO_DESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Desde'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RO_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Hasta'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RO_REDONDEO'
        Title.Alignment = taCenter
        Title.Caption = 'Importe Redondeo'
        Width = 112
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 196
    Top = 68
    Width = 375
    Height = 325
    BorderStyle = bsSingle
    DesignSize = (
      375
      325)
    inherited BevelAbm: TBevel
      Top = 289
      Width = 367
    end
    inherited btnAceptar: TButton
      Left = 210
      Top = 295
    end
    inherited btnCancelar: TButton
      Left = 288
      Top = 295
    end
    object GridRecepCarpeta: TDBGrid
      Left = 7
      Top = 6
      Width = 361
      Height = 172
      DataSource = dsRedondeos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'RO_DESDE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe Desde'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RO_HASTA'
          Title.Alignment = taCenter
          Title.Caption = 'Importe Hasta'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RO_REDONDEO'
          Title.Alignment = taCenter
          Title.Caption = 'Importe Redondeo'
          Width = 121
          Visible = True
        end>
    end
    object gbRedondeos: TGroupBox
      Left = 7
      Top = 182
      Width = 361
      Height = 102
      Caption = 'Redondeos'
      TabOrder = 3
      DesignSize = (
        361
        102)
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Importe Hasta'
      end
      object Label2: TLabel
        Left = 8
        Top = 49
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Importe Redondeo'
      end
      object Label3: TLabel
        Left = 8
        Top = 75
        Width = 90
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vigencia Desde'
      end
      object edImporteHasta: TCurrencyEdit
        Left = 103
        Top = 21
        Width = 92
        Height = 21
        AutoSize = False
        MaxLength = 12
        MaxValue = 99999999.000000000000000000
        TabOrder = 0
      end
      object chkRangoInicial: TCheckBox
        Left = 241
        Top = 24
        Width = 91
        Height = 17
        Caption = 'Rango Inicial'
        TabOrder = 2
      end
      object edImporteRedondeo: TCurrencyEdit
        Left = 103
        Top = 46
        Width = 92
        Height = 21
        AutoSize = False
        MaxLength = 12
        MaxValue = 99999999.000000000000000000
        TabOrder = 1
      end
      object chkRangoFinal: TCheckBox
        Left = 241
        Top = 44
        Width = 91
        Height = 17
        Caption = 'Rango Final'
        TabOrder = 3
        OnClick = chkRangoFinalClick
      end
      object btnInsertar: TButton
        Left = 203
        Top = 71
        Width = 152
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Insertar'
        TabOrder = 5
        OnClick = btnInsertarClick
      end
      object edVigenciaDesde: TDateComboBox
        Left = 103
        Top = 71
        Width = 93
        Height = 21
        TabOrder = 4
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT RO_DESDE, RO_HASTA, RO_REDONDEO, RO_VIGENCIADESDE'
      'FROM ZRO_REDONDEOEMISION'
      'WHERE 1 = 2')
  end
  inherited QueryPrint: TQueryPrint
    DataSource = nil
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
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
    Left = 110
    Top = 200
  end
  object dsRedondeos: TDataSource
    DataSet = cdsRedondeos
    Left = 52
    Top = 328
  end
  object cdsRedondeos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRedondeos'
    AfterOpen = cdsRedondeosAfterOpen
    Left = 80
    Top = 328
    object cdsRedondeosRO_DESDE: TFloatField
      FieldName = 'RO_DESDE'
      Required = True
    end
    object cdsRedondeosRO_HASTA: TFloatField
      FieldName = 'RO_HASTA'
    end
    object cdsRedondeosRO_REDONDEO: TFloatField
      FieldName = 'RO_REDONDEO'
      Required = True
    end
  end
  object dspRedondeos: TDataSetProvider
    DataSet = sdqRedondeos
    Left = 108
    Top = 328
  end
  object sdqRedondeos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT RO_DESDE, RO_HASTA, RO_REDONDEO'
      '  FROM ZRO_REDONDEOEMISION'
      ' WHERE 1=2'
      '')
    Left = 24
    Top = 328
    object sdqRedondeosRO_DESDE: TFloatField
      FieldName = 'RO_DESDE'
      Required = True
    end
    object sdqRedondeosRO_HASTA: TFloatField
      FieldName = 'RO_HASTA'
    end
    object sdqRedondeosRO_REDONDEO: TFloatField
      FieldName = 'RO_REDONDEO'
      Required = True
    end
  end
end
